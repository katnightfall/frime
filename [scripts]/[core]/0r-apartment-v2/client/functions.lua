--[[ Koci ]]
Client = {
    Callbacks = {},
    Functions = {},
    Player = {
        rooms = {},
        characterName = nil,
        inApartment = nil,
        inRoom = nil,
        fixedUI = false,
        -- @ --
        inCameraMode = false,
        Furniture = {
            inDecorationMode = false,
            createdFurnitures = {}
        },
    },
    CreatedTargets = {},
    SoldRooms = {},
    ApartmentElevator = {
        netId = nil,
        onMove = false,
        floor = 0,
    }
}

--[[ Core Functions ]]

function Client.Functions.TriggerServerCallback(key, callback, ...)
    if not callback then
        callback = function() end
    end
    Client.Callbacks[key] = callback
    local event = "0r-apartment:Server:HandleCallback"
    TriggerServerEvent(event, key, ...)
end

function Client.Functions.SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

function Client.Functions.SendNotify(title, type, duration, icon, text)
    if not Utils.Functions.CustomNotify(title, type, text, duration, icon) then
        if Utils.Functions.HasResource("ox_lib") then
            lib.notify({
                title = title,
                description = text,
                type = type,
            })
        elseif Utils.Framework == "qb" then
            type = type == "info" and "primary" or type
            Client.Framework.Functions.Notify(title, type, duration)
        elseif Utils.Framework == "esx" then
            Client.Framework.ShowNotification(title, type, duration)
        end
    end
end

function Client.Functions.GetPlayerData()
    return Resmon.Lib.GetPlayerData()
end

function Client.Functions.IsPlayerLoaded()
    return Resmon.Lib.IsPlayerLoaded()
end

function Client.Functions.GetPlayerIdentifier()
    return Client.Functions.GetPlayerData().identifier
end

function Client.Functions.GetPlayerApartMeta()
    if not Config.MetaKeys then
        return nil, nil
    end
    local xPlayer = Client.Functions.GetPlayerData()
    local apartmentId = xPlayer.metadata?.inapartment
    local roomId = xPlayer.metadata?.inapartmentroom
    return apartmentId, roomId
end

--[[ Apartment Functions ]]
function Client.Functions.AddZoneTarget(key, type, zoneName, zone, options, onSelect)
    local targetId = nil
    local coords = zone
    local icon = options.icon
    local label = options.label
    if not Utils.Functions.CustomTarget.AddTargetCoords(coords, 1.5, {
            icon = icon,
            label = label,
        }, onSelect)
    then
        if Utils.Functions.HasResource("ox_target") then
            targetId = exports.ox_target:addBoxZone({
                coords = coords,
                size = vec3(1.5, 1.5, 1.5),
                options = {
                    {
                        icon = icon,
                        label = label,
                        onSelect = onSelect,
                        distance = 1.5,
                    },
                }
            })
        elseif Utils.Functions.HasResource("qb-target") then
            exports["qb-target"]:AddBoxZone(zoneName, coords, 1.5, 3.0, {
                name = zoneName,
                heading = -19.78,
                debugPoly = false,
                minZ = coords.z - 1.0,
                maxZ = coords.z + 1.0,
            }, {
                options = {
                    {
                        icon = icon,
                        label = label,
                        action = onSelect,
                    },
                },
                distance = 1.5,
            })
            targetId = zoneName
        end
    end
    table.insert(Client.CreatedTargets, {
        id = targetId,
        key = key,
        type = type
    })
end

function Client.Functions.AddTargetModel(key, type, models, options, onSelect)
    local targetId = models
    local icon = options.icon
    local label = options.label
    if not Utils.Functions.CustomTarget.AddTargetModel(models, {
            icon = icon,
            label = label,
        }, onSelect)
    then
        if Utils.Functions.HasResource("ox_target") then
            exports.ox_target:addModel(models, { {
                icon = icon,
                label = label,
                onSelect = onSelect,
                distance = 2.0,
            } })
        elseif Utils.Functions.HasResource("qb-target") then
            exports["qb-target"]:AddTargetModel(models,
                {
                    options = {
                        {
                            icon = icon,
                            label = label,
                            action = onSelect,
                        },
                    },
                    distance = 2.0,
                })
        end
    end
    table.insert(Client.CreatedTargets, {
        id = targetId,
        key = key,
        type = type
    })
end

function Client.Functions.AddTargetEntity(type, entities, options)
    if not Utils.Functions.CustomTarget.AddTargetEntity(entities, options) then
        local opt = {}
        if Utils.Functions.HasResource("ox_target") then
            for _, option in pairs(options) do
                table.insert(opt, {
                    icon = option.icon,
                    label = option.label,
                    onSelect = option.onSelect,
                    distance = 2.0
                })
            end
            exports.ox_target:addLocalEntity(entities, opt)
        elseif Utils.Functions.HasResource("qb-target") then
            for _, option in pairs(options) do
                table.insert(opt, {
                    icon = option.icon,
                    label = option.label,
                    action = option.onSelect,
                })
            end
            exports["qb-target"]:AddTargetEntity(entities,
                { options = opt, distance = 2.0, })
        end
    end
    table.insert(Client.CreatedTargets, {
        id = entities,
        type = type
    })
end

function Client.Functions.RemoveTarget(id, type)
    if not Utils.Functions.CustomTarget.RemoveTarget(id, type) then
        if Utils.Functions.HasResource("ox_target") then
            if type == "model" then
                exports.ox_target:removeModel(id)
            elseif type == "box" then
                exports.ox_target:removeZone(id)
            end
        elseif Utils.Functions.HasResource("qb-target") then
            if type == "model" then
                exports["qb-target"]:RemoveTargetModel(id)
            elseif type == "box" then
                exports["qb-target"]:RemoveZone(id)
            end
        end
    end
end

function Client.Functions.OpenDoorAnim()
    Utils.Functions.LoadAnimDict("anim@heists@keycard@")
    TaskPlayAnim(cache.ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
    Wait(500)
    ClearPedTasks(cache.ped)
end

function Client.Functions.AddBlipForCoord(coords, blip)
    local createdBlip = AddBlipForCoord(coords)
    SetBlipSprite(createdBlip, blip.sprite)
    SetBlipColour(createdBlip, blip.color)
    SetBlipScale(createdBlip, blip.scale)
    SetBlipAsShortRange(createdBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blip.title)
    EndTextCommandSetBlipName(createdBlip)
end

function Client.Functions.LoadPlayerData()
    Client.Functions.TriggerServerCallback("0r-apartment:Server:LoadPlayerData", function(data)
        Client.Player.rooms = data.rooms
        Citizen.SetTimeout(2000, function()
            Client.Functions.SendReactMessage("ui:setOwnedRooms", data.rooms)
        end)
    end)
end

function Client.Functions.GetSoldRooms(apartmentId)
    local apartmentId = apartmentId or Client.Player.inApartment
    Client.Functions.TriggerServerCallback("0r-apartment:Server:GetSoldRooms", function(rooms)
        if rooms then
            Client.SoldRooms = rooms
        end
    end, apartmentId)
end

function Client.Functions.SendSoldRooms(key, cb)
    local apartmentId = key or Client.Player.inApartment
    if apartmentId == nil then
        if cb then cb(false) end
        return
    end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:GetSoldRooms", function(rooms)
        if rooms then
            Client.SoldRooms = rooms
            Client.Functions.SendReactMessage("ui:setSoldRooms", rooms)
            if cb then cb(true) end
        else
            if cb then cb(false) end
        end
    end, apartmentId)
end

function Client.Functions.SetupUI()
    Client.Functions.SendReactMessage("ui:setFurnitureItems", Config.FurnitureItems)
    Client.Functions.SendReactMessage("ui:setWallColors", Config.WallColors)
    Client.Functions.SendReactMessage("ui:setDefaultRooms", Config.Rooms)
    Client.Functions.SendReactMessage("ui:setMlo", {
        defaultRooms = Config.MloRooms
    })
    Client.Functions.SendReactMessage("ui:setIndicatorSettings", Config.Indicators)
    Client.Functions.SendReactMessage("ui:setLocale", {
        locale = Config.Locale,
        languages = locales.ui
    })
    Client.Functions.SendReactMessage("ui:setHasDlc", {
        [1] = {
            dlc = "weed",
            value = Utils.Functions.HasResource("0r-weed")
        },
    })
end

function Client.Functions.DeleteTargets()
    local entities = Client.CreatedTargets
    for _, value in pairs(entities) do
        Client.Functions.RemoveTarget(value.id, value.type)
    end
    Client.CreatedTargets = {}
end

function Client.Functions.DeleteRoomModifyTargets()
    local models = { "hei_prop_hei_keypad_01", "vw_prop_vw_key_cabinet_01a" }
    Client.Functions.RemoveTarget(models, "model")
    local entities = Client.CreatedTargets
    for i = #entities, 1, -1 do
        local value = entities[i]
        if value.key == "modify_zone" then
            table.remove(entities, i)
        end
    end
end

function Client.Functions.DeleteObjects()
    for _, value in pairs(Client.Player.Furniture.createdFurnitures) do
        if value.objectId and DoesEntityExist(value.objectId) then
            DeleteEntity(value.objectId)
        end
    end
    Client.Player.Furniture.createdFurnitures = {}
end

function Client.Functions.DeleteElevator()
    local netId = Client.ApartmentElevator.netId
    if netId and NetworkDoesEntityExistWithNetworkId(netId) then
        local object = NetToEnt(netId)
        NetworkRequestControlOfEntity(object)
        SetEntityAsMissionEntity(object, true, true)
        while DoesEntityExist(object) do
            NetworkRequestControlOfEntity(object)
            DeleteEntity(object)
            Wait(1)
        end
    end
    return true
end

function Client.Functions.DeleteCorridorDoorTargets()
    for i = #Client.CreatedTargets, 1, -1 do
        local value = Client.CreatedTargets[i]
        if value.key == "corridor_door" then
            Client.Functions.RemoveTarget(value.id, value.type)
            table.remove(Client.CreatedTargets, i)
        end
    end
end

function Client.Functions.OpenTablet(apartmentId, cb)
    if Client.Player.inCameraMode then return end
    Client.Functions.SetupUI()
    Client.Functions.SendSoldRooms(apartmentId, function(result)
        if not result then
            return Client.Functions.SendNotify(locale("game.not_in_any_apartment"), "error")
        end
        Client.Functions.SendReactMessage("ui:setVisible", true)
        SetNuiFocus(true, true)
    end)
end

function Client.Functions.CloseTablet()
    Client.Functions.SendReactMessage("ui:setVisible", false)
    SetNuiFocus(false, false)
end

function Client.Functions.OpenTabletInRoom()
    if not Client.Player.inApartment then
        return Client.Functions.SendNotify(locale("game.not_in_any_apartment"), "error")
    end
    Client.Functions.SetupUI()
    Client.Functions.TriggerServerCallback("0r-apartment:Server:GetSoldRoomDetail", function(result)
        if result then
            if not result.guest then
                Client.Functions.SendSoldRooms(Client.Player.inApartment)
            end
            Client.Functions.SendReactMessage("ui:setInRoom", result)
            Client.Functions.SendReactMessage("ui:setRouter", "in-room")
            Client.Functions.SendReactMessage("ui:setVisible", true)
            SetNuiFocus(true, true)
        end
    end, Client.Player.inApartment, Client.Player.inRoom.room_id)
end

function Client.Functions.PurchaseRoom(roomId, rentDay)
    if not Client.Player.inApartment then return end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:PurchaseRoom", function(response)
        if not response.error then
            Client.Functions.SendNotify(locale("game.room_purchased", roomId), "success")
        else
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
        end
    end, Client.Player.inApartment, roomId, rentDay)
end

function Client.Functions.SetCorridorTint(apartmentId)
    if Config.Apartments[apartmentId] then
        ExecuteCommand("tint_apart_corridor " .. (Config.Apartments[apartmentId].tint or 55))
    end
end

function Client.Functions.GetIntoApartmentCorridor(apartmentId)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(100) end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:GetIntoApartmentCorridor", function(response)
        if response.error then
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
        end
        Wait(500)
        DoScreenFadeIn(500)
    end, apartmentId)
end

function Client.Functions.GetIntoApartmentRoom(apartmentId, roomId, goOut, unauthorized)
    Client.Functions.OpenDoorAnim()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(100) end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:GetIntoApartmentRoom", function(response)
        if response.error then
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
            if goOut then
                if apartmentId == -1 then return end
                if not Config.Apartments[apartmentId] then return end
                local coords = Config.Apartments[apartmentId].coords.enter
                TriggerServerEvent("0r-apartment:Server:SetPlayerRoutingBucket", apartmentId, coords)
            end
        end
        DoScreenFadeIn(500)
    end, apartmentId, roomId, unauthorized)
end

function Client.Functions.LeaveApartmentRoom(apartmentId, roomId)
    Client.Functions.OpenDoorAnim()
    SetRainLevel(-1)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(100) end
    Client.Functions.DeleteObjects()
    TriggerServerEvent("0r-apartment:Server:LeaveApartmentRoom", apartmentId, roomId)
    Wait(1000)
    DoScreenFadeIn(500)
end

function Client.Functions.UnauthorizedEntry(apartmentId, roomId)
    local item = Config.UnauthorizedEntryIntoRooms.item
    Client.Functions.TriggerServerCallback("0r-apartment:Server:PlayerHasItem", function(hasItem)
        if not hasItem then
            return Client.Functions.SendNotify(locale("game.donot_have_enough_items", item), "error")
        end
        TriggerServerEvent("0r-apartment:Server:UnauthorizedEntry", apartmentId, roomId)
        local apartmentId = apartmentId
        local roomId = roomId
        Utils.Functions.LockPickGame(function(state)
            if state == nil then
                return Client.Functions.SendNotify(locale("game.error", "Lock pick..."), "error")
            end
            TriggerServerEvent("0r-apartment:Server:PlayerRemoveItem", item, 1)
            if state then
                Client.Functions.GetIntoApartmentRoom(apartmentId, roomId, false, true)
            end
        end)
    end, item)
end

function Client.Functions.CreateRoomModifyTargets()
    local models = { "hei_prop_hei_keypad_01", "vw_prop_vw_key_cabinet_01a" }
    Client.Functions.AddTargetModel("modify_zone", "model", models, {
        icon = "fa-regular fa-pen-to-square",
        label = locale("game.open_room_detail"),
    }, function()
        Client.Functions.OpenTabletInRoom()
    end)
end

function Client.Functions.ExitRoom()
    Client.Functions.CloseTablet()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(100) end
    if Client.Player.inApartment and Client.Player.inRoom then
        Client.Functions.TriggerServerCallback("0r-apartment:Server:ExitRoom", function(response)
            if not response.error then
                Client.Functions.SendNotify(locale("game.room_been_returned"), "success")
            else
                Client.Functions.SendNotify(locale("game.error", response.error), "error")
            end
            Wait(1000)
            DoScreenFadeIn(500)
        end, Client.Player.inApartment, Client.Player.inRoom.room_id)
    end
end

function Client.Functions.ExitRoomRemote(apartmentId, roomId)
    Client.Functions.TriggerServerCallback("0r-apartment:Server:ExitRoom", function(response)
        if not response.error then
            Client.Functions.SendNotify(locale("game.room_been_returned"), "success")
        else
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
        end
    end, apartmentId, roomId)
end

function Client.Functions.GivePermUser(target)
    if not Client.Player.inRoom then return end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:GivePermUser", function(response)
        if response.error then
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
        end
    end, tonumber(target), Client.Player.inApartment, Client.Player.inRoom.room_id)
end

function Client.Functions.DeletePermUser(targetIdentity)
    if not Client.Player.inRoom then return end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:DeletePermUser", function(response)
        if response.error then
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
        end
    end, targetIdentity, Client.Player.inApartment, Client.Player.inRoom.room_id)
end

function Client.Functions.OpenWardrobe()
    if not Client.Player.inRoom then return end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:PlayerIsGuestInRoom", function(result)
        if result then
            if Config.ClothMenuEventName then
                TriggerEvent(Config.ClothMenuEventName)
            elseif Utils.Functions.HasResource("qb-clothing") then
                TriggerEvent("qb-clothing:client:openOutfitMenu")
            elseif Utils.Functions.HasResource("esx_skin") then
                TriggerEvent("esx_skin:openSaveableRestrictedMenu", nil, nil,
                    {
                        "tshirt_1", "tshirt_2",
                        "torso_1", "torso_2",
                        "decals_1", "decals_2",
                        "arms", "arms_2",
                        "pants_1", "pants_2",
                        "shoes_1", "shoes_2",
                        "bags_1", "bags_2",
                        "chain_1", "chain_2",
                        "helmet_1", "helmet_2",
                        "glasses_1", "glasses_2",
                        "watches_1", "watches_2"
                    }
                )
            elseif Utils.Functions.HasResource("illenium-appearance") then
                TriggerEvent("illenium-appearance:client:openOutfitMenu")
            end
        end
    end, Client.Player.inApartment, Client.Player.inRoom.room_id)
end

function Client.Functions.OpenStash(key)
    if not Client.Player.inRoom then return end
    local stashId = key
    local slots = Config.StashOptions.slots
    local maxWeight = Config.StashOptions.maxWeight
    if not Utils.Functions.CustomInventory.OpenInventory("stash", stashId, {
            maxWeight = maxWeight,
            slots = slots
        })
    then
        if Utils.Functions.HasResource("ox_inventory") then
            exports.ox_inventory:openInventory("stash", stashId)
        elseif Utils.Functions.HasResource("qb-inventory") then
            TriggerServerEvent(_e("Server:OpenStash"), stashId, {
                maxWeight = maxWeight,
                slots = slots
            })
            TriggerEvent("inventory:client:SetCurrentStash", stashId)
        elseif Utils.Functions.HasResource("qs-inventory") then
            TriggerServerEvent(_e("Server:OpenStash"), stashId, {
                maxWeight = maxWeight,
                slots = slots
            })
            TriggerEvent("inventory:client:SetCurrentStash", stashId)
        elseif Utils.Functions.HasResource("codem-inventory") then
            TriggerServerEvent("codem-inventory:server:openstash", stashId, slots, maxWeight, stashId)
            TriggerEvent("inventory:client:SetCurrentStash", stashId)
        elseif Utils.Functions.HasResource("origen_inventory") then
            TriggerServerEvent(_e("Server:OpenStash"), stashId, {
                maxWeight = maxWeight,
                slots = slots
            })
            TriggerEvent("inventory:client:SetCurrentStash", stashId)
        end
    end
end

function Client.Functions.SetRoomLights(state, wait)
    SetTimeout(wait or 100, function()
        SetArtificialLightsState(state)
    end)
end

function Client.Functions.UpdateRoomLights(state)
    if not Client.Player.inRoom then return end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:UpdateRoomLights", function(response)
        if response.error then
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
        end
    end, state, Client.Player.inApartment, Client.Player.inRoom.room_id)
end

function Client.Functions.CreateStashTarget(entity, model, pass)
    if not Config.StashOptions.active then return end
    local inRoom = Client.Player.inRoom
    if inRoom then
        Client.Functions.RemoveTarget(entity, "entity")
        local openStash = function(stashId)
            Client.Functions.OpenStash(stashId)
        end
        local options = {
            [1] = {
                icon = "fa-solid fa-boxes-stacked",
                label = locale("game.open_stash"),
                onSelect = function()
                    local key = Client.Player.inApartment == -1 and "Mlo" or Client.Player.inApartment
                    local stashId = string.format("apartment_%s_%s_%s", key, inRoom.room_id, pass)
                    openStash(stashId)
                end
            },
        }
        Client.Functions.AddTargetEntity("entity", entity, options)
    end
end

function Client.Functions.CreateWardrobeTargets()
    if not Config.WardrobeOptions.active then return end
    local inRoom = Client.Player.inRoom
    if inRoom then
        local models = {}
        for _, item in pairs(Config.FurnitureItems["wardrobe"].items) do
            table.insert(models, item.model)
        end
        Client.Functions.RemoveTarget(models, 'model')
        Client.Functions.AddTargetModel("apartment_wardrobe", "model", models, {
            icon = "fa-solid fa-shirt",
            label = locale("game.open_cloth"),
        }, function()
            Client.Functions.OpenWardrobe()
        end)
    end
end

function Client.Functions.SpawnRoomFurnitures(unauthorized)
    local furnitures = Client.Player.inRoom.furnitures
    local function createFurnitures()
        for _, furniture in pairs(furnitures or {}) do
            if furniture.isPlaced then
                local model = furniture.model
                local pos = furniture.pos
                local rot = furniture.rot
                local index = furniture.index
                if not Utils.Functions.RequestModel(model) then return end
                local createdObject = CreateObject(model, pos.x, pos.y, pos.z, false, false, false)
                if createdObject ~= 0 then
                    SetEntityCoords(createdObject, pos.x, pos.y, pos.z)
                    SetEntityRotation(createdObject, rot.x, rot.y, rot.z)
                    SetEntityAsMissionEntity(createdObject, true, true)
                    FreezeEntityPosition(createdObject, true)
                    SetEntityInvincible(createdObject, true)
                    SetModelAsNoLongerNeeded(model)
                    table.insert(Client.Player.Furniture.createdFurnitures, {
                        index = index,
                        isPlaced = true,
                        objectId = createdObject,
                        model = model,
                        pos = pos,
                        rot = rot,
                        meta = {
                            dry_pass = furniture?.dry_pass,
                            stash_pass = furniture?.stash_pass,
                        }
                    })
                    if isModelStash(model) then
                        local isCreate = not unauthorized
                        if not isCreate then
                            isCreate = Config.UnauthorizedEntryIntoRooms.canUseStash
                        end
                        if isCreate then
                            Client.Functions.CreateStashTarget(createdObject, model, furniture.stash_pass)
                        end
                    end
                end
            end
        end
    end
    -- # --
    createFurnitures()
    if not unauthorized then
        Client.Functions.CreateWardrobeTargets()
    end
    Client.Functions.Dlc_Weed_LoadZone()
end

function Client.Functions.OpenCameraMode()
    local PlayerPedId = cache.ped
    Client.Player.position = GetEntityCoords(PlayerPedId)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(100) end
    Client.Functions.TriggerServerCallback("0r-apartment:Server:ToggleCameras", function(state)
        if state then
            Client.Player.inCameraMode = true
            FreezeEntityPosition(PlayerPedId, true)
            SetEntityCollision(PlayerPedId, false, false)
            SetEntityVisible(PlayerPedId, false)
            Utils.Functions.HideHud()
            Client.Functions.__Thread_Cameras()
        end
    end, true, Client.Player.inApartment, Client.Player.inRoom.room_id, Config.InteriorHotelCorridor.coords.cameras[1])
end

function Client.Functions.CloseCameraMode(noq)
    if noq then
        Client.Player.inCameraMode = false
        local PlayerPedId = cache.ped
        ClearFocus()
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()
        RenderScriptCams(false, false, 0, true, false)
        SetFocusEntity(PlayerPedId)
        FreezeEntityPosition(PlayerPedId, false)
        SetEntityCollision(PlayerPedId, true, true)
        SetEntityVisible(PlayerPedId, true)
        SetEntityCoords(PlayerPedId, Client.Player.position)
        EnableAllControlActions(0)
        Utils.Functions.VisibleHud()
        return
    end
    local PlayerPedId = cache.ped
    Client.Functions.TriggerServerCallback("0r-apartment:Server:ToggleCameras", function(state)
        if state then
            Client.Player.inCameraMode = false
            ClearFocus()
            ClearTimecycleModifier()
            ClearExtraTimecycleModifier()
            RenderScriptCams(false, false, 0, true, false)
            SetFocusEntity(PlayerPedId)
            FreezeEntityPosition(PlayerPedId, false)
            SetEntityCollision(PlayerPedId, true, true)
            SetEntityVisible(PlayerPedId, true)
            EnableAllControlActions(0)
            Utils.Functions.VisibleHud()
        end
    end, false, Client.Player.inApartment, Client.Player.inRoom.room_id, Client.Player.position)
end

function Client.Functions.CreateCorridorDoorTargets()
    Client.Functions.DeleteCorridorDoorTargets()
    local zoneName = "0r-apartment:DoorTarget:MainDoor"
    local coords = Config.InteriorHotelCorridor.coords.mainDoor + vec4(0.15, 0.15, 0.0, 0.0)
    Client.Functions.AddZoneTarget("corridor_door", "box", zoneName, coords, {
        icon = "fa-solid fa-door-open",
        label = locale("game.leave_apartment"),
    }, function()
        Client.Functions.LeaveApartmentCorridor(Client.Player.inApartment)
    end)
    --
    local xPlayerIdentity = Client.Functions.GetPlayerIdentifier()
    for key, room in pairs(Config.Rooms) do
        local roomId = room.room_id
        local func = function(_roomId)
            local function checkRoomStatus(rId)
                for _, value in pairs(Client.Player.rooms) do
                    if value.room_id == rId and value.apartment_id == Client.Player.inApartment then
                        return true
                    end
                end
                for _, value in pairs(Client.SoldRooms) do
                    if value.room_id == rId and value.apartment_id == Client.Player.inApartment then
                        if value.owner == xPlayerIdentity then
                            return true
                        end
                        for _, permission in pairs(value.permissions) do
                            if permission.user == xPlayerIdentity then
                                return true
                            end
                        end
                    end
                end
                return false
            end
            if checkRoomStatus(_roomId) then
                Client.Functions.GetIntoApartmentRoom(Client.Player.inApartment, _roomId)
            else
                Client.Functions.UnauthorizedEntry(Client.Player.inApartment, _roomId)
            end
        end
        local zoneName = "0r-apartment:DoorTarget:" .. key
        local coords = room.coords.door
        Client.Functions.AddZoneTarget("corridor_door", "box", zoneName, coords, {
            icon = "fa-solid fa-door-open",
            label = locale("game.get_in_the_room", roomId),
        }, function()
            func(roomId)
        end)
    end
end

function Client.Functions.CreateElevator(floor)
    Client.Functions.DeleteElevator()
    local coords = Config.Elevator.coords.stops[floor or 0]
    local model = "qua_nmotel_corridor_asansor"
    Utils.Functions.RequestModel(model)
    local object = CreateObjectNoOffset(model, coords.x, coords.y, -170.47, true, true)
    SetEntityCoords(object, coords.x, coords.y, coords.z)
    SetEntityRotation(object, 0.0, 0.0, -19.78)
    SetEntityAsMissionEntity(object, true, true)
    SetEntityCollision(object, false, true)
    SetEntityCompletelyDisableCollision(object, true)
    FreezeEntityPosition(object, true)
    while not NetworkGetEntityIsNetworked(object) do
        NetworkRegisterEntityAsNetworked(object)
        Wait(1)
    end
    local netId = ObjToNet(object)
    SetNetworkIdCanMigrate(netId, true)
    NetworkUseHighPrecisionBlending(netId, true)
    SetModelAsNoLongerNeeded(model)
    return netId
end

function Client.Functions.CheckElevator()
    Client.Functions.__Thread_Elevator()
    if Config.NoElevator then return end
    local function _createElevator(apartmentId)
        local netId = Client.Functions.CreateElevator(Client.ApartmentElevator.floor or 0)
        Client.ApartmentElevator.netId = netId
        TriggerServerEvent("0r-apartment:Server:OnCreatedElevator", apartmentId, netId)
    end
    local apartmentId = Client.Player.inApartment
    Client.Functions.TriggerServerCallback("0r-apartment:Server:GetElevatorState", function(state)
        if state.noap then return end
        if not state.created and not state.creating then
            _createElevator(apartmentId)
        else
            Client.ApartmentElevator.netId = state.netId
            Client.ApartmentElevator.onMove = state.onMove
            Client.ApartmentElevator.floor = state.floor
            local count = 0
            local created = false
            while not NetworkDoesEntityExistWithNetworkId(state.netId) do
                if count > 100 then
                    created = true
                    _createElevator(apartmentId)
                    break
                end
                count = count + 1
                Wait(16)
            end
            if not created then
                count = 0
                while NetworkDoesEntityExistWithNetworkId(state.netId) and not DoesEntityExist(NetToEnt(state.netId)) do
                    if count > 100 then
                        created = true
                        _createElevator(apartmentId)
                        break
                    end
                    count = count + 1
                    Wait(16)
                end
            end
            Client.Functions.DeleteElevatorTargets()
            Client.Functions.CreateElevatorCallTargets()
            Client.Functions.CreateElevatorInTargets()
        end
    end, apartmentId)
end

function Client.Functions.DeleteElevatorTargets()
    local models = { "v_ilev_garageliftdoor", -1239650571 }
    Client.Functions.RemoveTarget(models, "model")
end

function Client.Functions.CallElevator()
    local function _getPlayerFloor(playerCoords)
        for key, value in pairs(Config.Elevator.coords.stops) do
            if #(vec2(playerCoords) - vec2(value)) < 2.5 and (math.abs(playerCoords.z - value.z) < 2.5) then
                return key
            end
        end
        return nil
    end
    local targetFloor = _getPlayerFloor(GetEntityCoords(cache.ped))
    if targetFloor then
        Client.Functions.TriggerServerCallback("0r-apartment:Server:MoveElevator", function(state)
            if state.onMove then
                Client.Functions.SendNotify(locale("game.elevator_already_move"), "info")
            else
                Client.Functions.SendNotify(locale("game.elevator_on_move"), "success", 2500)
            end
        end, Client.Player.inApartment, targetFloor)
    end
end

function Client.Functions.CreateElevatorCallTargets()
    local models = "v_ilev_garageliftdoor"
    Client.Functions.AddTargetModel("elevator", "model", models, {
        icon = "fa-solid fa-elevator",
        label = locale("game.call_elevator"),
    }, function()
        Client.Functions.CallElevator()
    end)
end

function Client.Functions.CreateElevatorInTargets()
    local models = -1239650571
    local func   = function()
        local function playerInElevator(playerCoords)
            for key, value in pairs(Config.Elevator.coords.stops) do
                if #(vec2(playerCoords) - vec2(value)) < 1.0 and (math.abs(playerCoords.z - value.z) < 1.0) then
                    return key
                end
            end
            return nil
        end
        local playerInElevator = playerInElevator(GetEntityCoords(cache.ped))
        if Client.Player.inApartment and playerInElevator then
            Client.Functions.SendReactMessage("ui:setRouter", "elevator")
            Client.Functions.SendReactMessage("ui:setVisible", true)
            SetNuiFocus(true, true)
        end
    end
    Client.Functions.AddTargetModel("elevator", "model", models, {
        icon = "fa-solid fa-elevator",
        label = locale("game.select_floor"),
    }, func)
end

function Client.Functions.LeaveApartmentCorridor(apartmentId)
    Client.Functions.DeleteElevatorTargets()
    Client.Functions.DeleteCorridorDoorTargets()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(100) end
    TriggerServerEvent("0r-apartment:Server:LeaveApartment", apartmentId)
    Wait(1000)
    DoScreenFadeIn(500)
end

function Client.Functions.OnPlayerLogout()
    TriggerServerEvent("0r-apartment:Server:OnPlayerLogout")
end

function IsPlayerMetaInsideRoom()
    if Client.Player.inApartment or Client.Player.inRoom then
        return nil, nil
    end
    local apartmentId, roomId = Client.Functions.GetPlayerApartMeta()
    return apartmentId, roomId
end

function Client.Functions.CheckLastRoom()
    local apartmentId, roomId = IsPlayerMetaInsideRoom()

    local playerCoords = GetEntityCoords(cache.ped)
    local roomCoords = vec3(-361.94000000, -835.73000000, -164.81000000)
    local apartmentCoords = vec3(-419.10950000, -814.12890000, -164.65000000)
    local interiorApartDist = #(playerCoords - apartmentCoords)

    if apartmentId and apartmentId ~= -1 then
        Client.Player.inApartment = apartmentId
        if roomId then
            local interiorRoomDist = #(playerCoords - roomCoords)
            if interiorRoomDist < 15.0 then
                Client.Functions.GetIntoApartmentRoom(apartmentId, roomId, true)
                return
            end
        end
    end

    if apartmentId and apartmentId ~= -1 then
        if not apartmentId or apartmentId == -1 then
            apartmentId = 1
        end
        if not Config.Apartments[apartmentId] then return end
        local coords = Config.Apartments[apartmentId].coords.enter
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do Wait(100) end
        TriggerServerEvent("0r-apartment:Server:clearmeta")
        TriggerServerEvent("0r-apartment:Server:SetPlayerRoutingBucket", apartmentId, coords)
        Wait(500)
        DoScreenFadeIn(500)
    end
end

function Client.Functions.RoomFrameworkSync(entry)
    if Utils.Functions.HasResource("cd_easytime") then
        TriggerEvent("cd_easytime:PauseSync", entry)
    elseif Utils.Functions.HasResource("qb-weathersync") then
        if entry then
            TriggerEvent("qb-weathersync:client:DisableSync")
        else
            TriggerEvent("qb-weathersync:client:EnableSync")
        end
    elseif Utils.Functions.HasResource("vSync") then
        TriggerEvent("vSync:toggle", entry)
    else
        Utils.Functions.CustomWeatherSync(entry)
    end
    CreateThread(function()
        while Client?.Player?.inApartment or Client?.Player?.inRoom do
            if Client.Player.inRoom then
                local state = Client?.Player?.inRoom?.options?.lights
                if state or state == nil then
                    NetworkOverrideClockTime(12, 0, 0)
                else
                    NetworkOverrideClockTime(4, 55, 0)
                end
            else
                NetworkOverrideClockTime(23, 0, 0)
            end
            Wait(0)
        end
    end)
end

--[[ DLC WEED ]]

function Client.Functions.Dlc_Weed_ClearZone()
    if Utils.Functions.HasResource("0r-weed") then
        TriggerEvent("0r-weed:Client:ClearZonePlants")
    end
end

function Client.Functions.Dlc_Weed_LoadZone()
    if Client.Player.inApartment and Client.Player?.inRoom?.room_id then
        if Utils.Functions.HasResource("0r-weed") then
            local key = Client.Player.inApartment == -1 and "Mlo" or Client.Player.inApartment
            local zoneId = string.format("apartment_%s_%s", key, Client.Player.inRoom.room_id)
            TriggerEvent("0r-weed:Client:LoadZonePlants", zoneId)
        end
    end
end

function Client.Functions.DLC_Weed_AnyFurnitureUpdated(model, objectId, removed, dry_pass)
    if Utils.Functions.HasResource("0r-weed") then
        local lastCoords = GetEntityCoords(objectId)
        TriggerEvent("0r-weed:Client:OnWeedPropsUpdated", objectId, lastCoords, model, removed, dry_pass)
    end
end

function Client.Functions.ClearRoomInside()
    Client.Functions.DeleteTargets()
    Client.Functions.DeleteObjects()
    Client.Functions.Dlc_Weed_ClearZone()
end

-- Mlo
polyMloLoby = nil
polyMloRooms = {}

local function StartMlo()
    if Config.InteriorMloApart.active then
        CreateMloLobyZone()
        StartMloIntegration()
    end
end

local function StopMlo()
    if polyMloLoby then
        polyMloLoby:remove()
    end
    for key, zone in pairs(polyMloRooms) do
        if zone then
            zone:remove()
        end
    end
end

function CreateMloLobyZone()
    local points = Config.InteriorMloApart.lobby.poly
    if not points then return end
    StopMlo()
    polyMloLoby = lib.zones.poly({
        points = points,
        debug = false,
        onEnter = function()
            Client.Player.inApartment = -1
            Client.Functions.SendReactMessage("ui:setInMlo", true)
        end,
        onExit = function()
            Client.Player.inApartment = nil
            Client.Functions.SendReactMessage("ui:setInMlo", false)
        end
    })
end

-- @ --

function Client.Functions.StartCore()
    local frozen = false
    local apartmentId, roomId = IsPlayerMetaInsideRoom()
    if (apartmentId and apartmentId ~= -1) or roomId then
        frozen = true
        -- FreezeEntityPosition(cache.ped, true)
    end
    Wait(1000)
    Client.Functions.LoadPlayerData()
    Client.Functions.CheckLastRoom()
    FreezeEntityPosition(cache.ped, false)
    StartMlo()
end

function Client.Functions.StopCore()
    FreezeEntityPosition(cache.ped, false)
    DoScreenFadeIn(0)
    Utils.Functions.HideTextUI()
    Client.Functions.SetRoomLights(false)
    Client.Functions.RoomFrameworkSync(false)
    Client.Functions.ClearRoomInside()
    if Client.Player.Furniture.inDecorationMode then
        Client.Functions.CloseFurnitureMode()
    end
    if Client.Player.inCameraMode then
        Client.Functions.CloseCameraMode(true)
    end
    -- @ --
    Client.Player = {
        rooms = {},
        characterName = nil,
        inApartment = nil,
        inRoom = nil,
        fixedUI = false,
        inCameraMode = false,
        Furniture = {
            inDecorationMode = false,
            createdFurnitures = {}
        },
    }
    StopMlo()
end
