RegisterNetEvent("0r-apartment:Server:HandleCallback", function(key, ...)
    local src = source
    if Server.Callbacks[key] then
        Server.Callbacks[key](src, function(...)
            TriggerClientEvent("0r-apartment:Client:HandleCallback", src, key, ...)
        end, ...)
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for _, apartment in pairs(Server.Apartments) do
            if apartment.elevator then
                local netId = apartment.elevator.netId
                if netId then
                    local object = NetworkGetEntityFromNetworkId(netId)
                    if DoesEntityExist(object) then
                        DeleteEntity(object)
                    end
                end
                apartment.elevator.netId = nil
            end
        end
    end
end)

AddEventHandler("playerDropped", function()
    local src = source
    Server.Functions.OnPlayerLogout(src)
end)

RegisterNetEvent("0r-apartment:Server:LeaveApartmentRoom", function(apartmentId, roomId)
    local src = source
    Server.Functions.LeaveApartmentRoom(src, apartmentId, roomId)
end)

RegisterNetEvent("0r-apartment:Server:LeaveApartment", function(apartmentId)
    local src = source
    Server.Functions.LeaveApartment(src, apartmentId)
end)

RegisterNetEvent(_e("Server:OpenStash"), function(stashId, options)
    local src = source
    if not Utils.Functions.CustomInventory.OpenInventory("stash", stashId, {
            maxWeight = options.maxWeight,
            slots = options.slots
        }, src)
    then
        if Utils.Functions.HasResource("qb-inventory") then
            if Config.NewInventoryQB then
                exports["qb-inventory"]:OpenInventory(src, stashId, {
                    maxweight = options.maxWeight,
                    slots = options.slots
                })
            else
                exports["qb-inventory"]:OpenInventory("stash", stashId, {
                    maxweight = options.maxWeight,
                    slots = options.slots
                }, src)
            end
        elseif Utils.Functions.HasResource("qs-inventory") then
            exports["qs-inventory"]:OpenInventory("stash", stashId, {
                maxweight = options.maxWeight,
                slots = options.slots
            }, src)
        elseif Utils.Functions.HasResource("origen_inventory") then
            exports.origen_inventory:OpenInventory(src, "stash", stashId)
        end
    end
end)

RegisterNetEvent("0r-apartment:Server:UnauthorizedEntry", function(apartmentId, roomId)
    local src = source
    local room = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if room then
        local xTargetSource = Resmon.Lib.GetPlayerByIdentifier(room.owner)
        if xTargetSource then
            local apartment = Server.Apartments[apartmentId]
            Server.Functions.SendNotify(xTargetSource, locale("game.unauthorized_entry", apartment.label, roomId),
                "info", 5000)
        end
    end
end)

RegisterNetEvent("0r-apartment:Server:PlayerRemoveItem", function(item, amount)
    local src = source
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    Utils.Functions.PlayerRemoveItem(xPlayer, item, amount)
end)

RegisterNetEvent("0r-apartment:Server:OnCreatedElevator", function(apartmentId, netId)
    local src = source
    local apartment = Server.Apartments[apartmentId]
    if apartment then
        local object = NetworkGetEntityFromNetworkId(netId)
        local bucketId = tonumber("11" .. apartmentId)
        SetEntityRoutingBucket(object, bucketId)
        if apartment.elevator.created then
            local oldNet = apartment.elevator.netId
            local oldObject = NetworkGetEntityFromNetworkId(oldNet)
            if DoesEntityExist(oldObject) then
                SetEntityCoords(object, GetEntityCoords(oldObject))
                DeleteEntity(oldObject)
            end
            for _, source in pairs(apartment.players or {}) do
                if Server.Functions.IsPlayerOnline(source) then
                    TriggerClientEvent("0r-apartment:Client:SetElevatorState", source, {
                        netId = netId, onMove = apartment.elevator.onMove, floor = apartment.elevator.floor
                    })
                end
            end
            apartment.elevator.netId = netId
        else
            apartment.elevator.netId = netId
            apartment.elevator.created = true
            apartment.elevator.creating = false
            apartment.elevator.onMove = false
            apartment.elevator.floor = 0
            for _, source in pairs(apartment.players or {}) do
                if Server.Functions.IsPlayerOnline(source) then
                    TriggerClientEvent("0r-apartment:Client:OnCreatedElevator", source, {
                        netId = netId, onMove = false, floor = 0
                    })
                end
            end
        end
    end
end)

RegisterNetEvent("0r-apartment:Server:SetElevatorState", function(apartmentId, m, f)
    local apartment = Server.Apartments[apartmentId]
    if apartment then
        local netId = apartment.elevator.netId
        apartment.elevator.onMove = m
        apartment.elevator.floor = f or apartment.elevator.floor
        if not m then
            apartment.elevator._lastMoved = nil
        end
        for _, source in pairs(apartment.players or {}) do
            if Server.Functions.IsPlayerOnline(source) then
                TriggerClientEvent("0r-apartment:Client:SetElevatorState", source, {
                    netId = netId, onMove = apartment.elevator.onMove, floor = apartment.elevator.floor
                })
            end
        end
    end
end)

RegisterNetEvent("0r-apartment:Server:OnPlayerLogout", function()
    local src = source
    local player = Server.Players[src]
    if player then
        local apartmentId = player.apartmentId
        local roomId = player.roomId
        if apartmentId and apartmentId ~= -1 then
            if roomId then
                for key, room in pairs(Server.SoldRooms[apartmentId] or {}) do
                    if room and room.room_id == roomId then
                        Server.SoldRooms[apartmentId][key].players[src] = nil
                        break
                    end
                end
            end
            local apartment = Server.Apartments[apartmentId]
            if apartment then
                local elevator = apartment.elevator
                if elevator.onMove and source == elevator._lastMoved then
                    elevator.onMove = false
                end
                for key, value in pairs(apartment.players or {}) do
                    if value == src then
                        Server.Apartments[apartmentId].players[key] = nil
                        break
                    end
                end
                for key, room in pairs(Server.SoldRooms[apartmentId] or {}) do
                    if room and room.room_id == roomId then
                        Server.SoldRooms[apartmentId][key].players[src] = nil
                        break
                    end
                end
            end
        end
        Server.Players[src] = nil
    end
end)

RegisterNetEvent("0r-apartment:Server:clearmeta", function()
    local src = source
    Server.Functions.ClearMetaApartment(src)
end)

RegisterNetEvent("0r-apartment:Server:SetPlayerRoutingBucket", function(apartmentId, coords, bucket)
    local src = source
    SetEntityCoords(GetPlayerPed(src), coords.x, coords.y, coords.z)
    SetEntityHeading(GetPlayerPed(src), coords.w)
    SetPlayerRoutingBucket(src, bucket or 0)
end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:LoadPlayerData", function(source, cb)
    local src = source
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    local PlayerData = {
        rooms = {},
        characterName = "unknown",
    }
    if xPlayer then
        PlayerData.characterName = Server.Functions.GetPlayerCharacterName(src)
        PlayerData.rooms = Server.Functions.GetPlayerRooms(src)
        CreateThread(function()
            Server.Functions.CheckDueDateOfRooms(src, PlayerData.rooms)
        end)
    end
    cb(PlayerData)
end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:GetPlayerRooms", function(source, cb)
    local src = source
    cb(Server.Functions.GetPlayerRooms(src))
end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:GetSoldRooms", function(source, cb, apartmentId)
    local src = source
    if apartmentId then
        cb(Server.SoldRooms[apartmentId] or {})
        return
    end
    cb(nil)
end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:GetIntoApartmentCorridor",
    function(source, cb, apartmentId)
        local src = source
        Server.Functions.GetIntoApartmentCorridor(src, apartmentId)
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:GetIntoApartmentRoom",
    function(source, cb, apartmentId, roomId, unauthorized)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            cb({ error = locale("game.room_not_found") })
            return
        end
        Server.Functions.GetIntoApartmentRoom(src, apartmentId, roomId, unauthorized)
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:PurchaseRoom",
    function(source, cb, apartmentId, roomId, rentDay)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room then
            cb({ error = locale("game.room_not_found") })
            return
        end
        if Server.Functions.IsRoomSold(apartmentId, roomId) then
            cb({ error = locale("game.room_already_sold") })
            return
        end
        if #Server.Functions.GetPlayerRooms(src, apartmentId) >= Config.MaxRoomLimitPerPlayer then
            cb({ error = locale("game.max_room_limit", price) })
            return
        end
        if rentDay == 0 and not Config.CanRoomsBePurchased then
            cb({ error = locale("game.room_can_only_be_rented") })
            return
        end
        local price = rentDay > 0 and room.daily_price * rentDay or room.price
        if not Server.Functions.DoesPlayerHaveMoney(src, price) then
            cb({ error = locale("game.dont_have_enough_money", price) })
            return
        end
        local result = Server.Functions.ReceiptNewSale(src, apartmentId, roomId, rentDay, price)
        if not result then
            cb({ error = locale("game.fail_receipt") })
            return
        end
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:ExitRoom",
    function(source, cb, apartmentId, roomId)
        local src = source
        if apartmentId ~= -1 then
            local room = apartmentId == -1 and
                Config.MloRooms[roomId] or
                Server.Functions.GetConfigRoomById(roomId)
            if not room or
                not Server.Functions.IsRoomSold(apartmentId, roomId)
            then
                cb({ error = locale("game.room_not_found") })
                return
            end
        else
            if not Config.MloRooms[roomId] then
                cb({ error = locale("game.room_not_found") })
                return
            end
        end
        if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
            cb({ error = locale("game.not_own_room") })
            return
        end
        Server.Functions.PutTheRoomOnSale(src, apartmentId, roomId)
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:GivePermUser",
    function(source, cb, target, apartmentId, roomId)
        local src = source
        local xTarget = Server.Functions.GetPlayerBySource(target)
        if not xTarget then
            cb({ error = locale("game.player_not_found") })
            return
        end
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            cb({ error = locale("game.room_not_found") })
            return
        end
        if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
            cb({ error = locale("game.not_own_room") })
            return
        end
        local xTargetIdentity = Server.Functions.GetPlayerIdentity(target)
        if Server.Functions.PlayerIsGuestInRoom(xTargetIdentity, apartmentId, roomId) then
            cb({ error = locale("game.already_guest_room") })
            return
        end
        local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
        if #soldRoom.permissions >= Config.MaxGuestCanBeAddedToRoom then
            cb({ error = "You can not add more players" })
            return
        end
        Server.Functions.GivePermToTarget(src, target, apartmentId, roomId)
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:DeletePermUser",
    function(source, cb, targetIdentity, apartmentId, roomId)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            cb({ error = locale("game.room_not_found") })
            return
        end
        if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
            cb({ error = locale("game.not_own_room") })
            return
        end
        if not Server.Functions.PlayerIsGuestInRoom(targetIdentity, apartmentId, roomId) then
            cb({ error = locale("game.already_not_guest_room") })
            return
        end
        Server.Functions.DeletePermToTarget(src, targetIdentity, apartmentId, roomId)
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:UpdateRoomLights",
    function(source, cb, lights, apartmentId, roomId)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            cb({ error = locale("game.room_not_found") })
            return
        end
        if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
            cb({ error = locale("game.not_own_room") })
            return
        end
        Server.Functions.UpdateRoomLights(lights, apartmentId, roomId)
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:ChangeRoomWallColor",
    function(source, cb, color, apartmentId, roomId)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            cb({ error = locale("game.room_not_found") })
            return
        end
        local xPlayerIdentity = Server.Functions.GetPlayerIdentity(src)
        if not Server.Functions.PlayerIsGuestInRoom(xPlayerIdentity, apartmentId, roomId) then
            cb({ error = locale("game.not_own_room") })
            return
        end
        Server.Functions.ChangeRoomWallColor(color, apartmentId, roomId)
        cb({})
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:GetSoldRoomDetail",
    function(source, cb, apartmentId, roomId)
        cb(Server.Functions.GetSoldRoomDetail(source, apartmentId, roomId))
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:PlayerIsGuestInRoom",
    function(source, cb, apartmentId, roomId)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            cb(false)
            return
        end
        local xPlayerIdentity = Server.Functions.GetPlayerIdentity(src)
        if not Server.Functions.PlayerIsGuestInRoom(xPlayerIdentity, apartmentId, roomId) then
            cb(false)
            return
        end
        cb(true)
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:GetElevatorState",
    function(source, cb, apartmentId)
        local apartment = Server.Apartments[apartmentId]
        local onMove = false
        local floor = 0
        local created = false
        local creating = false
        local netId = nil
        if apartment then
            created = apartment.elevator.created
            creating = apartment.elevator.creating
            onMove = apartment.elevator.onMove
            floor = apartment.elevator.floor
            netId = apartment.elevator.netId
            cb({ created = created, creating = creating, onMove = onMove, floor = floor, netId = netId })
            if not apartment.elevator.created and not apartment.elevator.creating then
                apartment.elevator.creating = true
            end
            return
        end
        cb({ noap = true })
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:MoveElevator",
    function(source, cb, apartmentId, targetFloor)
        local apartment = Server.Apartments[apartmentId]
        if apartment then
            local elevator = apartment.elevator
            local onMove = elevator.onMove
            local floor = elevator.floor
            local netId = elevator.netId
            local objId = NetworkGetEntityFromNetworkId(netId)
            if DoesEntityExist(objId) then
                if not onMove then
                    apartment.elevator.onMove = true
                    apartment.elevator.targetFloor = targetFloor
                    apartment.elevator._lastMoved = source
                    TriggerClientEvent("0r-apartment:Client:MoveElevator", source, targetFloor)
                end
            end
            cb({ onMove = onMove, floor = floor })
            return
        end
        cb({ onMove = false, floor = targetFloor })
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:ToggleCameras",
    function(source, cb, state, apartmentId, roomId, teleport)
        local apartment = Server.Apartments[apartmentId]
        if apartment then
            if apartmentId ~= -1 then
                SetEntityCoords(GetPlayerPed(source), vec3(teleport.x, teleport.y, teleport.z))
                if state then
                    SetPlayerRoutingBucket(source, tonumber("11" .. apartmentId))
                else
                    SetPlayerRoutingBucket(source, tonumber(apartmentId .. "" .. roomId))
                end
            end
            cb(true)
            return
        end
        cb(false)
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:PlayerHasItem",
    function(source, cb, item)
        local xPlayer = Server.Functions.GetPlayerBySource(source)
        if xPlayer then
            cb(Utils.Functions.PlayerHasItem(xPlayer, item))
            return
        end
        cb(false)
    end)

Server.Functions.RegisterServerCallback("0r-apartment:Server:TakeAnEmptyRoom", function(source, cb, apartId, rentDay)
    local src = source
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if xPlayer then
        local foundApartmentId = nil
        local foundRoomId = nil
        local aparts = {}
        for key, _ in pairs(Config.Apartments) do
            if key ~= apartId then
                table.insert(aparts, key)
            end
        end
        if apartId then
            table.insert(aparts, 1, apartId)
        end
        for _, apartmentId in pairs(aparts) do
            for _, room in pairs(Config.Rooms) do
                if not Server.Functions.IsRoomSold(apartmentId, room.room_id) then
                    foundApartmentId = apartmentId
                    foundRoomId = room.room_id
                    break
                end
            end
            if foundApartmentId and foundRoomId then
                break
            end
        end
        if foundApartmentId and foundRoomId then
            rentDay = rentDay or 1
            if rentDay < 1 then
                rentDay = 1
            end
            local owner = Server.Functions.GetPlayerIdentity(src)
            local owner_name = Server.Functions.GetPlayerCharacterName(src)
            Server.Functions.GetIntoApartmentCorridor(src, foundApartmentId)
            Server.Functions.OnNewRoomSold(src, foundApartmentId, foundRoomId, owner, owner_name, rentDay, false)
            cb(foundApartmentId, foundRoomId)
            return
        else
            local startCoords = Config.NewPlayerStartCoords
            SetEntityCoords(GetPlayerPed(src), startCoords)
            cb(false, false)
            return
        end
    end
    cb(false, false)
end)


Server.Functions.RegisterServerCallback(_e("Server:BuyIndicator"), function(source, cb, type, apartmentId, roomId)
    local src = source
    local room = apartmentId == -1 and
        Config.MloRooms[roomId] or
        Server.Functions.GetConfigRoomById(roomId)
    if not room or
        not Server.Functions.IsRoomSold(apartmentId, roomId)
    then
        cb({ error = locale("game.room_not_found") })
        return
    end
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if not xPlayer then
        return cb({ error = locale("game.player_not_found") })
    end
    if not Server.Functions.PlayerIsGuestInRoom(Server.Functions.GetPlayerIdentity(src), apartmentId, roomId) then
        cb({ error = locale("game.not_own_room") })
        return
    end
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    if not xPlayer then
        return cb({ error = locale("game.player_not_found") })
    end
    if not Config.Indicators[type] then
        return cb({ error = "Not found Indicator type" })
    end
    local Room = Server.Functions.GetSoldRoom(apartmentId, roomId)
    local indicator = Config.Indicators[type]
    local unit = 100
    if Room?.indicators[type] and Room.indicators[type] + unit > indicator.maxValue then
        unit = indicator.maxValue - Room.indicators[type]
        if unit <= 0 then
            return cb({ error = locale("game.have_enough") })
        end
    end
    local price = unit * indicator.unitPrice
    if not Server.Functions.DoesPlayerHaveMoney(src, price) then
        return cb({ error = locale("game.dont_have_enough_money", price) })
    end
    if Server.Functions.PlayerRemoveMoney(xPlayer, "bank", price) then
        Server.Functions.UpdateRoomIndicator(type, unit, apartmentId, roomId)
    end
    return cb({})
end)

Server.Functions.RegisterServerCallback(_e("Server:UpdateIndicator"),
    function(source, cb, indicator, value, apartmentId, roomId)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            cb({ error = locale("game.room_not_found") })
            return
        end
        local xPlayer = Server.Functions.GetPlayerBySource(src)
        if not xPlayer then
            return cb({ error = locale("game.player_not_found") })
        end
        if not Config.Indicators[indicator] then
            return cb({ error = "Not found Indicator type" })
        end
        local Room = Server.Functions.GetSoldRoom(apartmentId, roomId)
        if Room?.indicators[indicator] and Room.indicators[indicator] + value < 0 then
            return cb({ error = locale("not_have_enough") })
        end
        Server.Functions.UpdateRoomIndicator(indicator, value, apartmentId, roomId)
        return cb({})
    end)
