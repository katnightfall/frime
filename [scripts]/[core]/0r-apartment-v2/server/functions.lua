--[[ Koci ]]
Server = {
    Callbacks = {},
    Functions = {},
    SoldRooms = {},
    Players = {},
    Apartments = {},
    Framework = nil,
}

--[[ Core Functions ]]
function Server.Functions.RegisterServerCallback(key, func)
    Server.Callbacks[key] = func
end

function Server.Functions.TriggerCallback(key, source, cb, ...)
    if not cb then
        cb = function() end
    end
    if Server.Callbacks[key] then
        Server.Callbacks[key](source, cb, ...)
    end
end

--- Function that executes database queries
---
--- @param query: The SQL query to execute
--- @param params: Parameters for the SQL query (in table form)
--- @param type ("insert" | "update" | "query" | "scalar" | "single" | "prepare"): Parameters for the SQL query (in table form)
--- @return query any Results of the SQL query
function Server.Functions.ExecuteSQLQuery(query, params, type)
    type = type or "query"
    return MySQL[type].await(query, params)
end

function Server.Functions.SendNotify(source, title, type, duration, icon, text)
    if not duration then duration = 1000 end
    if not Utils.Functions.CustomNotify(title, type, text, duration, icon) then
        if Utils.Functions.HasResource("ox_lib") then
            TriggerClientEvent("ox_lib:notify", source, {
                title = title,
                description = text,
                type = type,
                icon = icon,
                duration = duration
            })
        elseif Utils.Framework == "qb" then
            TriggerClientEvent("QBCore:Notify", source, title, type)
        elseif Utils.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", source, title, type, duration)
        end
    end
end

function Server.Functions.GetPlayerBySource(source)
    return Resmon.Lib.GetPlayerBySource(source)
end

function Server.Functions.GetPlayerByIdentifier(identifier)
    return Resmon.Lib.GetPlayerByIdentifier(identifier)
end

function Server.Functions.GetPlayerIdentity(source)
    return Resmon.Lib.GetIdentifier(source)
end

function Server.Functions.GetPlayerCharacterName(source)
    return Resmon.Lib.GetPlayerCharacterName(source)
end

function Server.Functions.GetPlayerBalance(type, source)
    return Resmon.Lib.GetPlayerBalance(source, type)
end

function Server.Functions.PlayerRemoveMoney(Player, type, amount)
    if Utils.Framework == "qb" then
        local result = Player.Functions.RemoveMoney(type, tonumber(amount), "apartment")
        return result
    elseif Utils.Framework == "esx" then
        type = type == "cash" and "money" or type
        Player.removeAccountMoney(type, tonumber(amount))
        return true
    end
end

function Server.Functions.PlayerAddMoney(Player, type, amount)
    if Utils.Framework == "qb" then
        local result = Player.Functions.AddMoney(type, tonumber(amount), "apartment")
        return result
    elseif Utils.Framework == "esx" then
        type = type == "cash" and "money" or type
        Player.addAccountMoney(type, tonumber(amount))
        return true
    end
end

function Server.Functions.IsPlayerOnline(source)
    if Utils.Framework == "qb" then
        return Server.Framework.Functions.GetPlayer(source)
    elseif Utils.Framework == "esx" then
        return Server.Framework.GetPlayerFromId(source)
    end
end

function Server.Functions.SetPlayerMetaApartment(src, value)
    if not Config.MetaKeys then return end
    local key = "inapartment"
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if Utils.Framework == "qb" then
        return xPlayer.Functions.SetMetaData(key, value)
    else
        return xPlayer.setMeta(key, value)
    end
end

function Server.Functions.SetPlayerMetaRoom(src, value)
    if not Config.MetaKeys then return end
    local key = "inapartmentroom"
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if Utils.Framework == "qb" then
        return xPlayer.Functions.SetMetaData(key, value)
    else
        return xPlayer.setMeta(key, value)
    end
end

function Server.Functions.ClearMetaApartment(src)
    if not Config.MetaKeys then return end
    local key = "inapartment"
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if Utils.Framework == "qb" then
        return xPlayer.Functions.SetMetaData(key, nil)
    else
        return xPlayer.clearMeta(key)
    end
end

function Server.Functions.ClearMetaRoom(src)
    if not Config.MetaKeys then return end
    local key = "inapartmentroom"
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if Utils.Framework == "qb" then
        return xPlayer.Functions.SetMetaData(key, nil)
    else
        return xPlayer.clearMeta(key)
    end
end

--[[ Apartment Functions ]]
function Server.Functions.SetUpApartments()
    Server.Apartments = {}
    for key, value in pairs(Config.Apartments) do
        Server.Apartments[key] = {
            label = value.label,
            players = {},
            elevator = {
                created = false,
                creating = false,
                netId = nil,
                floor = 0,
                onMove = false,
                targetFloor = 0,
                _lastMoved = nil,
            }
        }
    end
    Server.Apartments[-1] = { label = Config.InteriorMloApart.label, players = {}, }
    return Server.Apartments
end

function Server.Functions.GetSoldRooms()
    local result = Resmon.Lib.Apartment.GetSoldRooms()
    Server.SoldRooms = {}
    if result then
        for _, row in pairs(result) do
            if not Server.SoldRooms[row.apartment_id] then
                Server.SoldRooms[row.apartment_id] = {}
            end
            table.insert(Server.SoldRooms[row.apartment_id], row)
        end
    end
    return Server.SoldRooms
end

function Server.Functions.GetSoldRoom(apartmentId, roomId)
    local soldRoomsOfApartment = Server.SoldRooms[apartmentId]
    if not soldRoomsOfApartment then
        return false
    end
    for key, room in pairs(soldRoomsOfApartment) do
        if room.room_id == roomId then
            return Server.SoldRooms[apartmentId][key]
        end
    end
    return false
end

function Server.Functions.GetPlayerRooms(source, _apId)
    local soldRooms = Server.SoldRooms
    local identity = Server.Functions.GetPlayerIdentity(source)
    local playerRooms = {}
    for apartmentId, rooms in pairs(soldRooms) do
        if not _apId or apartmentId == _apId then
            for _, room in pairs(rooms) do
                if room.owner == identity then
                    table.insert(playerRooms, room)
                end
            end
        end
    end
    return playerRooms
end

function Server.Functions.GetConfigRoomById(roomId)
    return Config.Rooms[roomId]
end

function Server.Functions.GetSoldRoomDetail(src, apartmentId, roomId)
    local xPlayerIdentity  = Server.Functions.GetPlayerIdentity(src)
    local inRoom           = Utils.Functions.deepCopy(Server.Functions.GetSoldRoom(apartmentId, roomId))
    inRoom.owner           = inRoom.owner == xPlayerIdentity
    inRoom.guest           = Server.Functions.PlayerIsGuestInRoom(xPlayerIdentity, apartmentId, roomId)
    inRoom.apartment_label = apartmentId == -1 and Config.InteriorMloApart.label or Config.Apartments[apartmentId].label
    return inRoom
end

function Server.Functions.IsRoomSold(apartmentId, roomId)
    local soldRoomsOfApartment = Server.SoldRooms[apartmentId]
    if not soldRoomsOfApartment then
        return false
    end
    for _, room in pairs(soldRoomsOfApartment) do
        if room.room_id == roomId then
            return true
        end
    end
    return false
end

function Server.Functions.DoesPlayerHaveMoney(source, amount)
    local balance = Server.Functions.GetPlayerBalance("bank", source)
    return balance >= amount
end

function Server.Functions.RegisterStash(src, stashId)
    local slots = Config.StashOptions.slots
    local maxWeight = Config.StashOptions.maxWeight
    if not Utils.Functions.CustomInventory.RegisterStash(src, stashId, {
            maxWeight = maxWeight,
            slots = slots,
        })
    then
        if Utils.Functions.HasResource("ox_inventory") then
            exports.ox_inventory:RegisterStash(stashId, stashId,
                slots, maxWeight,
                nil, false
            )
        elseif Utils.Functions.HasResource("qs-inventory") then
            exports["qs-inventory"]:RegisterStash(src, stashId, slots, maxWeight)
        elseif Utils.Functions.HasResource("origen_inventory") then
            exports.origen_inventory:RegisterStash(stashId, {
                label = stashId,
                slots = slots,
                weight = maxWeight
            })
        end
    end
end

function Server.Functions.RegisterFurnituresToStash(src, apartmentId, roomId)
    local Room = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if Room.furnitures then
        local function CreateStashPass()
            return generateRandomString(6)
        end
        for _, value in pairs(Room.furnitures or {}) do
            if isModelStash(value.model) then
                value.stash_pass = value.stash_pass or CreateStashPass()
                local key = apartmentId == -1 and "Mlo" or apartmentId
                local stashId = string.format("apartment_%s_%s_%s", key, roomId, value.stash_pass)
                Server.Functions.RegisterStash(src, stashId)
            end
        end
    end
end

function Server.Functions.OnNewRoomSold(src, apartmentId, roomId, owner, owner_name, rentDay, lifeTime)
    if not Server.SoldRooms[apartmentId] then
        Server.SoldRooms[apartmentId] = {}
    end
    local result = Resmon.Lib.Apartment.OnNewRoomSold(apartmentId, roomId, owner, owner_name, rentDay, lifeTime)
    table.insert(Server.SoldRooms[apartmentId], result)
    TriggerClientEvent("0r-apartment:Client:OnUpdateSoldRooms", src, Server.SoldRooms[apartmentId])
    TriggerClientEvent("0r-apartment:Client:SetPlayerRooms", src, Server.Functions.GetPlayerRooms(src))
end

function Server.Functions.ReceiptNewSale(src, apartmentId, roomId, rentDay, price)
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if xPlayer then
        if Server.Functions.PlayerRemoveMoney(xPlayer, "bank", price) then
            local owner = Server.Functions.GetPlayerIdentity(src)
            local owner_name = Server.Functions.GetPlayerCharacterName(src)
            Server.Functions.OnNewRoomSold(src, apartmentId, roomId, owner, owner_name, rentDay, rentDay == 0)
            return true
        end
    end
    return false
end

function Server.Functions.PlayerIsGuestInRoom(identity, apartmentId, roomId)
    local xPlayerIdentity = identity
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if soldRoom.owner == xPlayerIdentity then
        return true
    end
    for _, value in pairs(soldRoom.permissions) do
        if value.user == xPlayerIdentity then
            return true
        end
    end
    return false
end

function Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    local identity = Server.Functions.GetPlayerIdentity(src)
    return identity == soldRoom.owner
end

function Server.Functions.AddPlayerToRoom(src, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if soldRoom then
        if not soldRoom.players then
            soldRoom.players = {}
        end
        table.insert(soldRoom.players, src)
    end
    Server.Functions.SetPlayerMetaApartment(src, apartmentId)
    Server.Functions.SetPlayerMetaRoom(src, roomId)
    Server.Players[src] = { apartmentId = apartmentId, roomId = roomId }
    for key, value in pairs(Server.Apartments[apartmentId].players or {}) do
        if value == src then
            Server.Apartments[apartmentId].players[key] = nil
            break
        end
    end
end

function Server.Functions.RemovePlayerToRoom(src, apartmentId, roomId)
    local soldRooms = Server.SoldRooms[apartmentId]
    if soldRooms then
        local soldRoom = soldRooms[roomId]
        if soldRoom then
            for key, source in pairs(soldRoom.players) do
                if source == src then
                    table.remove(soldRoom.players, key)
                    break
                end
            end
        end
    end
    Server.Functions.ClearMetaRoom(src)
    if Server.Players[src] then
        Server.Players[src].roomId = nil
    end
end

function Server.Functions.GetIntoApartmentCorridor(src, apartmentId)
    if not Server.Apartments[apartmentId] then
        Server.Functions.SetUpApartments()
    end
    Server.Functions.SetPlayerMetaApartment(src, apartmentId)
    Server.Players[src] = { apartmentId = apartmentId }
    table.insert(Server.Apartments[apartmentId].players, src)
    local coords = Config.InteriorHotelCorridor.coords.mainDoor
    local bucketId = tonumber("11" .. apartmentId)
    SetEntityCoords(GetPlayerPed(src), coords.x, coords.y, coords.z)
    SetEntityHeading(GetPlayerPed(src), coords.w)
    SetPlayerRoutingBucket(src, bucketId)
    TriggerClientEvent("0r-apartment:Client:OnPlayerIntoApartmentCorridor", src, apartmentId)
end

function Server.Functions.GetIntoApartmentRoom(src, apartmentId, roomId, unauthorized)
    local xPlayerIdentity  = Server.Functions.GetPlayerIdentity(src)
    local roomSQL          = Utils.Functions.deepCopy(Server.Functions.GetSoldRoom(apartmentId, roomId))
    local room             = Utils.Functions.deepCopy(Server.Functions.GetConfigRoomById(roomId))
    local apartment        = Config.Apartments[apartmentId]

    local inRoom           = room
    inRoom.room_id         = roomId
    inRoom.life_time       = roomSQL.life_time
    inRoom.owner_name      = roomSQL.owner_name
    inRoom.owner           = roomSQL.owner == xPlayerIdentity
    inRoom.guest           = Server.Functions.PlayerIsGuestInRoom(xPlayerIdentity, apartmentId, roomId)
    inRoom.options         = roomSQL.options
    inRoom.permissions     = roomSQL.permissions
    inRoom.furnitures      = roomSQL.furnitures
    inRoom.indicators      = roomSQL.indicators
    inRoom.due_date        = roomSQL.due_date
    inRoom.apartment_id    = apartmentId
    inRoom.apartment_label = apartment?.label
    local coords           = Config.InteriorHotelRoom.coords.enter
    Server.Functions.AddPlayerToRoom(src, apartmentId, roomId)
    Server.Functions.RegisterFurnituresToStash(src, apartmentId, roomId)
    SetEntityCoords(GetPlayerPed(src), coords.x, coords.y, coords.z)
    SetEntityHeading(GetPlayerPed(src), coords.w)
    SetPlayerRoutingBucket(src, tonumber(apartmentId .. "" .. roomId))
    TriggerClientEvent("0r-apartment:Client:OnPlayerIntoRoom", src, inRoom, unauthorized)
end

function Server.Functions.PutTheRoomOnSale(src, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if not soldRoom then return end
    if Server.SoldRooms[apartmentId] then
        for i, room in pairs(Server.SoldRooms[apartmentId]) do
            if room.room_id == roomId then
                table.remove(Server.SoldRooms[apartmentId], i)
                break
            end
        end
    end
    Server.Functions.ExecuteSQLQuery(
        "DELETE FROM `0resmon_apartment_rooms` WHERE apartment_id = ? AND room_id = ?",
        { apartmentId, roomId },
        "query"
    )
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            if apartmentId == -1 then
                Server.Functions.RemovePlayerToRoom(source, apartmentId, roomId)
                Server.Functions.SetPlayerMetaApartment(source, apartmentId)
                Server.Players[source] = { apartmentId = apartmentId }
                table.insert(Server.Apartments[apartmentId].players, source)
                TriggerClientEvent(_e("Client:OnPlayerLeaveMloRoom"), source, apartmentId, roomId)
            else
                Server.Functions.LeaveApartmentRoom(source, apartmentId, roomId)
            end
        end
    end
    TriggerClientEvent("0r-apartment:Client:OnUpdateSoldRooms", src, Server.SoldRooms[apartmentId])
    TriggerClientEvent("0r-apartment:Client:SetPlayerRooms", src, Server.Functions.GetPlayerRooms(src))
    --[[ WEED DLC ]]
    if Utils.Functions.HasResource("0r-weed") then
        local key = apartmentId == -1 and "Mlo" or apartmentId
        local zoneId = string.format("apartment_%s_%s", key, roomId)
        Server.Functions.ExecuteSQLQuery(
            "DELETE FROM `0resmon_weed_plants` WHERE zoneId = ?",
            { zoneId },
            "query"
        )
        Server.Functions.ExecuteSQLQuery(
            "DELETE FROM `0resmon_weed_dryers` WHERE zoneId = ?",
            { zoneId },
            "query"
        )
    end
end

function Server.Functions.UpdateRoomPermissions(permissions, apartmentId, roomId, soldRoom)
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            local inRoom = Server.Functions.GetSoldRoomDetail(source, apartmentId, roomId)
            TriggerClientEvent("0r-apartment:Client:OnUpdateRoomOptions", source, inRoom)
        end
    end
    local permissions = Utils.Functions.deepCopy(permissions)
    permissions = json.encode(permissions) or "{}"
    Server.Functions.ExecuteSQLQuery(
        "UPDATE `0resmon_apartment_rooms` SET permissions = ? WHERE apartment_id = ? AND room_id = ? ",
        { permissions, apartmentId, roomId },
        "update"
    )
end

function Server.Functions.UpdateRoomOptions(options, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            local inRoom = Server.Functions.GetSoldRoomDetail(source, apartmentId, roomId)
            TriggerClientEvent("0r-apartment:Client:OnUpdateRoomOptions", source, inRoom)
        end
    end
    local options = Utils.Functions.deepCopy(options)
    options = json.encode(options) or "{}"
    Server.Functions.ExecuteSQLQuery(
        "UPDATE `0resmon_apartment_rooms` SET options = ? WHERE apartment_id = ? AND room_id = ? ",
        { options, apartmentId, roomId },
        "update"
    )
end

function Server.Functions.UpdateRoomFurnitures(furnitures, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            local inRoom = Server.Functions.GetSoldRoomDetail(source, apartmentId, roomId)
            TriggerClientEvent("0r-apartment:Client:OnUpdateRoomOptions", source, inRoom)
        end
    end
    local furnitures = Utils.Functions.deepCopy(furnitures)
    if #furnitures > 0 then
        for key, value in pairs(furnitures) do
            if value.objectId then
                furnitures[key].objectId = nil
            end
            if value.index then
                furnitures[key].index = nil
            end
        end
    end
    furnitures = json.encode(furnitures) or "{}"
    Server.Functions.ExecuteSQLQuery(
        "UPDATE `0resmon_apartment_rooms` SET furnitures = ? WHERE apartment_id = ? AND room_id = ? ",
        { furnitures, apartmentId, roomId },
        "update"
    )
end

function Server.Functions.UpdateRoomDueDate(src, day, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            local inRoom = Server.Functions.GetSoldRoomDetail(source, apartmentId, roomId)
            TriggerClientEvent("0r-apartment:Client:OnUpdateRoomOptions", source, inRoom)
        end
    end
    Server.Functions.ExecuteSQLQuery(
        "UPDATE `0resmon_apartment_rooms` SET due_date = DATE_ADD(due_date, INTERVAL ? DAY) WHERE apartment_id = ? AND room_id = ? ",
        { day, apartmentId, roomId },
        "update"
    )
end

function Server.Functions.UpdateRoomLights(lights, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if not soldRoom.options then
        soldRoom.options = {}
    end
    soldRoom.options.lights = lights
    Server.Functions.UpdateRoomOptions(soldRoom.options, apartmentId, roomId)
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            TriggerClientEvent("0r-apartment:Client:SetRoomLights", source, lights)
        end
    end
end

function Server.Functions.UpdateRoomTint(color, apartmentId, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if not soldRoom.options then
        soldRoom.options = {}
    end
    soldRoom.options.tint = color
    Server.Functions.UpdateRoomOptions(soldRoom.options, apartmentId, roomId)
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            TriggerClientEvent("0r-apartment:Client:SetRoomWallColor", source, color)
        end
    end
end

function Server.Functions.ChangeRoomWallColor(color, apartmentId, roomId)
    Server.Functions.UpdateRoomTint(color, apartmentId, roomId)
end

function Server.Functions.GivePermToTarget(src, target, apartmentId, roomId)
    local xTargetIdentity = Server.Functions.GetPlayerIdentity(target)
    local xTargetName = Server.Functions.GetPlayerCharacterName(target)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    local newPerm = {
        user = xTargetIdentity,
        playerName = xTargetName,
    }
    table.insert(soldRoom.permissions, newPerm)
    Server.Functions.UpdateRoomPermissions(soldRoom.permissions, apartmentId, roomId, soldRoom)
    TriggerClientEvent("0r-apartment:Client:OnGivedPermToPlayer", src)
    TriggerClientEvent("0r-apartment:Client:OnUpdateSoldRooms", target, Server.SoldRooms[apartmentId])
end

function Server.Functions.DeletePermToTarget(src, targetIdentity, apartmentId, roomId)
    local xTargetIdentity = targetIdentity
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    for key, perm in pairs(soldRoom.permissions) do
        if perm.user == xTargetIdentity then
            table.remove(soldRoom.permissions, key)
            break
        end
    end
    Server.Functions.UpdateRoomPermissions(soldRoom.permissions, apartmentId, roomId, soldRoom)
    TriggerClientEvent("0r-apartment:Client:OnDeletedPermToPlayer", src)
    local xTargetSource = Server.Functions.GetPlayerByIdentifier(xTargetIdentity)
    if xTargetSource then
        TriggerClientEvent("0r-apartment:Client:OnUpdateSoldRooms", xTargetSource, Server.SoldRooms[apartmentId])
    end
end

function Server.Functions.LeaveApartmentRoom(src, apartmentId, roomId)
    Server.Functions.RemovePlayerToRoom(src, apartmentId, roomId)
    Server.Functions.SetPlayerMetaApartment(src, apartmentId)
    Server.Players[src] = { apartmentId = apartmentId }
    table.insert(Server.Apartments[apartmentId].players, src)
    local room = apartmentId == -1 and
        Config.MloRooms[roomId] or
        Server.Functions.GetConfigRoomById(roomId)
    local coords = room.coords.door
    local bucketId = tonumber("11" .. apartmentId)
    SetEntityCoords(GetPlayerPed(src), coords.x, coords.y, coords.z)
    SetEntityHeading(GetPlayerPed(src), coords.w)
    SetPlayerRoutingBucket(src, bucketId)
    TriggerClientEvent("0r-apartment:Client:OnPlayerLeaveRoom", src)
end

function Server.Functions.LeaveApartment(src, apartmentId)
    Server.Functions.ClearMetaApartment(src)
    Server.Players[src] = nil
    for key, value in pairs(Server.Apartments[apartmentId].players or {}) do
        if value == src then
            Server.Apartments[apartmentId].players[key] = nil
            break
        end
    end
    Server.Functions.CheckElevatorDeletable(apartmentId)
    local coords = Config.Apartments[apartmentId].coords.enter
    SetEntityCoords(GetPlayerPed(src), coords.x, coords.y, coords.z)
    SetEntityHeading(GetPlayerPed(src), coords.w)
    SetPlayerRoutingBucket(src, 0)
    TriggerClientEvent("0r-apartment:Client:OnPlayerLeaveApartment", src)
end

function Server.Functions.ExtendRoomRental(src, apartmentId, roomId, day)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    local xPlayerMoney = Server.Functions.GetPlayerBalance("bank", src)
    local room = apartmentId == -1 and
        Config.MloRooms[roomId] or
        Server.Functions.GetConfigRoomById(roomId)
    local price = day * room.daily_price
    if xPlayerMoney < price then
        return Server.Functions.SendNotify(src, locale("game.dont_have_enough_money", price), "error")
    end
    Server.Functions.PlayerRemoveMoney(xPlayer, "bank", price)
    local newDueTimestamp = soldRoom.due_date + (day * 24 * 60 * 60 * 1000)
    soldRoom.due_date = newDueTimestamp
    Server.Functions.UpdateRoomDueDate(src, day, apartmentId, roomId)
    Server.Functions.SendNotify(src, locale("game.success_extend", day), "success")
end

function Server.Functions.ElevatorFix(src, apartmentId)
    if Config.NoElevator then return end
    if not apartmentId then
        if Server.Players[src] then
            apartmentId = Server.Players[src].apartmentId
            if not apartmentId then
                print("Apartment not found...")
                return
            end
        end
    end
    local apartment = Server.Apartments[apartmentId]
    if not apartment then
        print("Apartment not found...")
        return
    end
    local function playerInElevator(playerCoords)
        for _, value in pairs(Config.Elevator.coords.stops) do
            if #(vec2(playerCoords) - vec2(value)) < 1.0 and (math.abs(playerCoords.z - value.z) < 1.0) then
                return true
            end
        end
        return false
    end
    for _, source in pairs(apartment.players) do
        if Server.Functions.IsPlayerOnline(source) then
            local coords = GetEntityCoords(GetPlayerPed(source))
            if playerInElevator(coords) then
                SetEntityCoords(GetPlayerPed(source), Config.InteriorHotelCorridor.coords.mainDoor)
            end
        end
    end
    local elevator = apartment.elevator
    local netId = elevator.netId
    apartment.elevator.created = false
    while DoesEntityExist(NetworkGetEntityFromNetworkId(netId)) do
        DeleteEntity(NetworkGetEntityFromNetworkId(netId))
        Wait(1)
    end
    TriggerClientEvent("0r-apartment:Client:Admin:FixElevator", src, apartmentId, netId)
end

function Server.Functions.CheckElevatorDeletable(apartmentId)
    local apartment = Server.Apartments[apartmentId]
    if apartment then
        if not next(apartment.players) then
            local netId = apartment.elevator.netId
            while DoesEntityExist(NetworkGetEntityFromNetworkId(netId)) do
                DeleteEntity(NetworkGetEntityFromNetworkId(netId))
                Wait(1)
            end
            if netId then
                apartment.elevator = {
                    created = false,
                    creating = false,
                    netId = nil,
                    floor = 0,
                    onMove = false,
                    targetFloor = 0,
                    _lastMoved = nil,
                }
            end
        end
    end
end

function Server.Functions.CheckDueDateOfRooms(src, rooms)
    local today = os.time() * 1000

    local function getApartmentLabel(apartmentId)
        if apartmentId ~= -1 then
            return Config.Apartments[apartmentId].label
        end
        return Config.InteriorMloApart.label
    end

    local due_soon_rooms = {}
    for _, room in ipairs(rooms) do
        if not room.life_time then
            local due_date = room.due_date
            if due_date and (due_date - today) < (24 * 60 * 60 * 1000) then
                table.insert(due_soon_rooms, {
                    apartmentId = room.apartment_id,
                    roomId = room.room_id,
                    apartmentLabel = getApartmentLabel(room.apartment_id),
                })
            end
        end
    end
    if #due_soon_rooms == 0 then return end
    local messageText = ""
    for _, value in pairs(due_soon_rooms) do
        messageText = messageText .. " " .. "Apartment: " .. value.apartmentLabel .. ", Room: " .. value.roomId .. " |\n"
    end
    local identifier = Server.Functions.GetPlayerIdentity(src)
    if Utils.Functions.HasResource("qb-phone") then
        local mailData = {
            sender = locale("game.rentalPeriodWarningMail.sender"),
            subject = locale("game.rentalPeriodWarningMail.subject"),
            message = locale("game.rentalPeriodWarningMail.message", messageText),
            button = {}
        }
        exports["qb-phone"]:sendNewMailToOffline(identifier, mailData)
    elseif Utils.Functions.HasResource("stache-phone") then
        exports["stache-phone"]:GetPlayerMail(function(Mail)
            exports["stache-phone"]:SendMail(
                "apartment@0resmon.com",
                locale("game.rentalPeriodWarningMail.title"),
                Mail,
                locale("game.rentalPeriodWarningMail.subject"),
                locale("game.rentalPeriodWarningMail.message", messageText),
                os.time())
        end, identifier)
    elseif Utils.Functions.HasResource("lb-phone") then
        local userPhoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(src)
        if userPhoneNumber then
            local userMail = exports["lb-phone"]:GetEmailAddress(userPhoneNumber)
            exports["lb-phone"]:SendMail({
                to = userMail,
                sender = "apartment@0resmon.com",
                subject = locale("game.rentalPeriodWarningMail.subject"),
                message = locale("game.rentalPeriodWarningMail.message", messageText),
            })
        end
    elseif Utils.Functions.HasResource("ls-phone") then
        exports["ls-phone"]:SendOfflineMail(identifier, {
            sender = "apartment@0resmon.com",
            subject = locale("game.rentalPeriodWarningMail.subject"),
            message = locale("game.rentalPeriodWarningMail.message", messageText),
        })
    else
        Utils.Functions.CustomPhone.SendMailToPhone(src, identifier, messageText)
    end
end

function Server.Functions.OnPlayerLogout(source)
    local src = source
    local player = Server.Players[src]
    if player then
        local apartmentId = player.apartmentId
        local roomId = player.roomId
        if apartmentId then
            if roomId then
                local soldRoom = Server.SoldRooms[apartmentId]
                for key, room in pairs(soldRoom or {}) do
                    if room.room_id == roomId then
                        soldRoom[key].players[src] = nil
                        break
                    end
                end
            end
            local apartment = Server.Apartments[apartmentId]
            if apartment then
                local elevator = apartment.elevator
                if elevator and elevator.onMove and src == elevator._lastMoved then
                    elevator.onMove = false
                end
                for key, value in pairs(apartment.players or {}) do
                    if value == src then
                        apartment.players[key] = nil
                        break
                    end
                end
                if apartment.elevator then
                    Server.Functions.CheckElevatorDeletable(apartmentId)
                end
            end
        end
        Server.Players[src] = nil
    end
end

--[[ Indicators ]]

function Server.Functions.UpdateRoomIndicator(type, unit, apartmentId, roomId)
    local Room = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if not Room then return end
    if not Room.indicators then
        Room.indicators = {}
    end
    if not Room.indicators[type] then
        Room.indicators[type] = 0
    end
    Room.indicators[type] = Room.indicators[type] + unit
    -- [[ Update ]]
    CreateThread(function()
        for _, source in pairs(Room.players) do
            if Server.Functions.IsPlayerOnline(source) then
                local inRoom = Server.Functions.GetSoldRoomDetail(source, apartmentId, roomId)
                TriggerClientEvent(_e("Client:OnUpdateRoomOptions"), source, inRoom)
            end
        end
        local indicators = Utils.Functions.deepCopy(Room.indicators)
        indicators = json.encode(indicators) or "{}"
        Server.Functions.ExecuteSQLQuery(
            "UPDATE `0resmon_apartment_rooms` SET indicators = ? WHERE apartment_id = ? AND room_id = ?",
            { indicators, apartmentId, roomId },
            "update"
        )
    end)
    return Room.indicators[type]
end

--[[ Core Thread]]
CreateThread(function()
    while Resmon == nil do
        Wait(100)
    end
    if not Resmon then return end
    while Server.Framework == nil do
        Server.Framework = Utils.Functions.GetFramework()
        Wait(100)
    end
    Server.Functions.GetSoldRooms()
    Server.Functions.SetUpApartments()
    Server.Functions.SetUpAdminCommands()
end)
