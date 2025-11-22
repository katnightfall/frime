-- Mlo

MloDoors = {}

local function isAuthorized(roomId)
    local result = lib.callback.await(_e("Server:Mlo:isAuthorized"), false, roomId)
    return result
end

local function setDoorLock(roomId, newState)
    Client.Functions.OpenDoorAnim()
    local notify = newState and locale("game.door_locked") or locale("game.door_unlocked")
    Client.Functions.SendNotify(notify, "success")
    lib.callback.await(_e("Server:Mlo:UpdateDoorState"), false, roomId)
end

local function UnauthorizedMloEntry(roomId)
    local item = Config.UnauthorizedEntryIntoRooms.item
    Client.Functions.TriggerServerCallback("0r-apartment:Server:PlayerHasItem", function(hasItem)
        if not hasItem then
            return Client.Functions.SendNotify(locale("game.donot_have_enough_items", item), "error")
        end
        TriggerServerEvent("0r-apartment:Server:UnauthorizedEntry", -1, roomId)
        local roomId = roomId
        Utils.Functions.LockPickGame(function(state)
            if state == nil then
                return Client.Functions.SendNotify(locale("game.error", "Lock pick..."), "error")
            end
            TriggerServerEvent("0r-apartment:Server:PlayerRemoveItem", item, 1)
            if state then
                setDoorLock(roomId, false)
            end
        end)
    end, item)
end

local function saveDoorObject(roomId)
    local room = Config.MloRooms[roomId] or {}
    if room?.door then
        if room.door?.object and DoesEntityExist(room.door.object) then
            return room.door.object
        else
            room.door.object = GetClosestObjectOfType(
                room.door.coords,
                1.0,
                room.door.model,
                false,
                false,
                false)
            return room.door.object
        end
    end
    return nil
end

local function Create_RoomZones()
    local zones = Config.MloRooms
    for key, zone in pairs(zones) do
        local points = zone.poly
        if points then
            local zone = lib.zones.poly({
                points = points,
                debug = false,
                onEnter = function()
                    Client.Player.inApartment = -1
                    if not Client.Player.inRoom then
                        TriggerServerEvent(_e("Server:GetIntoMloRoom"), zone.room_id)
                    end
                end,
                onExit = function()
                    Client.Player.inApartment = nil
                    if Client.Player.inRoom then
                        TriggerServerEvent(_e("Server:LeaveMloRoom"), zone.room_id)
                    end
                end
            })
            table.insert(polyMloRooms, zone)
        end
    end
end

local function LoadDoors()
    local result = lib.callback.await(_e("Server:Mlo:GetDoors"))
    MloDoors = result
    return MloDoors
end

RegisterNetEvent(_e("Client:Mlo:UpdateDoorState"), function(roomId, newState)
    MloDoors[roomId] = newState
    local doorObject = saveDoorObject(roomId)
    local door = Config.MloRooms[roomId].door
    if doorObject and DoesEntityExist(doorObject) then
        FreezeEntityPosition(doorObject, newState)
        if newState then
            SetEntityRotation(doorObject, 0.0, 0.0, door.yaw, 2, true)
        end
    end
end)

RegisterNetEvent(_e("Client:OnPlayerIntoMloRoom"), function(inRoom, unauthorized)
    Client.Player.inRoom = inRoom
    Client.Functions.SendReactMessage("ui:setInMlo", true)
    Client.Functions.SendReactMessage("ui:setInRoom", inRoom)
    Client.Functions.SendReactMessage("ui:setRouter", "in-room")
    Client.Functions.DeleteObjects()
    Client.Functions.SpawnRoomFurnitures(unauthorized)
end)

RegisterNetEvent(_e("Client:OnPlayerLeaveMloRoom"), function(apartmentId, roomId)
    Client.Player.inRoom = nil
    Client.Functions.SendReactMessage("ui:setInMlo", false)
    Client.Functions.SendReactMessage("ui:setInRoom", nil)
    Client.Functions.SendReactMessage("ui:setRouter", "catalog")
    CreateThread(function()
        local door = Config.MloRooms[roomId].door
        local try = 0
        while true do
            local object = GetClosestObjectOfType(
                door.coords,
                1.0,
                door.model,
                false,
                false,
                false)
            if DoesEntityExist(object) then
                if GetEntityRotation(object).z - door.yaw <= 0.5 then
                    if not Client.Player.inRoom then
                        Client.Functions.DeleteObjects()
                    end
                    break
                end
            end
            if try >= 20 then
                if not Client.Player.inRoom then
                    Client.Functions.DeleteObjects()
                end
                break
            end
            try += 1
            Wait(500)
        end
    end)
end)

function StartMloIntegration()
    LoadDoors()
    Create_RoomZones()
end

CreateThread(function()
    local rooms = Config.MloRooms
    local ui_message = ""
    local isDrawTextUIOpen = false
    local playerAuthorized = false
    local currentRoomId = nil
    local isNearDoor = false

    local function showUI(message)
        if isDrawTextUIOpen then return end
        isDrawTextUIOpen = true
        Utils.Functions.showUI(message)
    end

    local function hideUI()
        Utils.Functions.HideTextUI()
        isDrawTextUIOpen = false
    end

    while true do
        Wait(5)
        local playerCoords = GetEntityCoords(cache.ped)
        if not isNearDoor then
            for _, room in pairs(rooms) do
                local door = room.door
                local doorDistance = #(playerCoords - door.coords)
                local zDistance = math.abs(playerCoords.z - door.coords.z)
                if zDistance <= 1.5 and doorDistance < 15 then
                    local doorObject = saveDoorObject(room.room_id)
                    local isLocked = MloDoors[room.room_id]
                    if isLocked == nil then
                        isLocked = true
                    end
                    if IsEntityPositionFrozen(doorObject) ~= isLocked then
                        FreezeEntityPosition(doorObject, isLocked)
                    end
                    if isLocked and GetEntityRotation(doorObject).z ~= door.yaw then
                        SetEntityRotation(doorObject, 0.0, 0.0, door.yaw, 2, true)
                    end
                    if doorDistance < 1.5 then
                        isNearDoor = true
                        playerAuthorized = isAuthorized(room.room_id)
                        currentRoomId = room.room_id
                        break
                    end
                end
            end
        else
            local door = rooms[currentRoomId].door
            local doorDistance = #(playerCoords - door.coords)
            if doorDistance > 1.5 then
                isNearDoor = false
                currentRoomId = nil
                if isDrawTextUIOpen then
                    hideUI()
                end
                Wait(500)
            else
                local isLocked = MloDoors[currentRoomId]
                if isLocked == nil then
                    isLocked = true
                end
                if playerAuthorized then
                    if isLocked then
                        ui_message = "[E] " .. locale("game.unlock_door")
                    else
                        ui_message = "[E] " .. locale("game.lock_door")
                    end
                    showUI(ui_message)
                    if IsControlJustPressed(0, 38) then -- [E]
                        setDoorLock(currentRoomId, not isLocked)
                        hideUI()
                        Wait(500)
                    end
                else
                    if Config.UnauthorizedEntryIntoRooms.active and isLocked then
                        showUI("[H] " .. locale("game.force_door", currentRoomId))
                        if IsControlJustPressed(0, 74) then -- force [H]
                            UnauthorizedMloEntry(currentRoomId)
                            Wait(1000)
                        end
                    end
                end
            end
        end
        if not isNearDoor then
            Wait(1000)
        end
    end
end)

CreateThread(function()
    local reception = Config.InteriorMloApart.lobby.reception
    local isDrawTextUIOpen = false
    local function showUI(message)
        Utils.Functions.showUI(message)
    end

    while true do
        local sleep = 2000
        if Client.Player.inApartment == -1 then
            local playerCoords = GetEntityCoords(cache.ped)
            local distance = #(playerCoords - reception)
            if distance < 10.0 then
                local heightDifference = math.abs(reception.z - playerCoords.z)
                if heightDifference <= 1.0 then
                    sleep = 5
                    if distance > 1.0 then
                        Utils.Functions.DrawMarker(reception, 2)
                        if isDrawTextUIOpen then
                            Utils.Functions.HideTextUI()
                            isDrawTextUIOpen = false
                        end
                    else
                        local message = "[E] " .. locale("game.openUI")
                        if not isDrawTextUIOpen then
                            showUI(message)
                            isDrawTextUIOpen = true
                        end
                        if IsControlJustPressed(0, 38) then -- [E]
                            isDrawTextUIOpen = false
                            Utils.Functions.HideTextUI()
                            Client.Player.inApartment = -1
                            Client.Functions.OpenTablet(-1)
                            Wait(500)
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
