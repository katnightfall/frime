--[[ Core Events ]]
AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Client.Functions.StartCore()
    end
end)
AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        Client.Functions.StopCore()
    end
end)

--[[ Custom Events ]]
RegisterNetEvent("0r-apartment:Client:HandleCallback", function(key, ...)
    if Client.Callbacks[key] then
        Client.Callbacks[key](...)
        Client.Callbacks[key] = nil
    end
end)

RegisterNetEvent("0r-apartment:Client:OpenTablet", function()
    if Client.Player.inRoom then
        Client.Functions.OpenTabletInRoom()
    else
        Client.Functions.OpenTablet()
    end
end)

RegisterNetEvent("0r-apartment:Client:OnPlayerIntoApartmentCorridor", function(apartmentId)
    Client.Player.inApartment = apartmentId
    Client.Functions.SetRoomLights(false)
    Client.Functions.RoomFrameworkSync(true)
    Client.Functions.SetCorridorTint(apartmentId)
    if Config.LibertyCity then
        SetWaterQuadBounds(
            GetWaterQuadAtCoords(Config.InteriorHotelCorridor.coords.mainDoor.x,
                Config.InteriorHotelCorridor.coords.mainDoor.y), -5000.0, -5000.0, 5000.0, 5000.0)
    end
    Client.Functions.Thread_IntoCorridor()
end)

RegisterNetEvent("0r-apartment:Client:OnPlayerIntoRoom", function(inRoom, unauthorized)
    Client.Player.inRoom = inRoom
    Client.Functions.DeleteCorridorDoorTargets()
    Client.Functions.SendReactMessage("ui:setInRoom", inRoom)
    Client.Functions.SendReactMessage("ui:setRouter", "in-room")
    Client.Functions.SpawnRoomFurnitures(unauthorized)
    local lights = inRoom?.options?.lights
    local tint = inRoom?.options?.tint
    if lights == nil then
        lights = true
    end
    if tint then
        ExecuteCommand("tint_apart_room " .. tint)
    end
    Client.Functions.RoomFrameworkSync(true)
    if Config.InteriorHotelRoom.dynamicLightsEnteringRoom then
        Client.Functions.SetRoomLights(not inRoom.options.lights)
    else
        Client.Functions.SetRoomLights(false)
    end
    Client.Functions.Thread_IntoRoom()
    DoScreenFadeIn(0)
end)

RegisterNetEvent("0r-apartment:Client:OnPlayerLeaveRoom", function()
    Client.Player.inRoom = nil
    Client.Functions.RoomFrameworkSync(false)
    Client.Functions.SendReactMessage("ui:setRouter", "catalog")
    Client.Functions.SendReactMessage("ui:setInRoom", false)
    Client.Functions.DeleteObjects()
    Client.Functions.SetRoomLights(false)
    Client.Functions.Thread_IntoCorridor()
end)

RegisterNetEvent("0r-apartment:Client:OnPlayerLeaveApartment", function()
    Client.Player.inApartment = nil
    Client.Player.inRoom = nil
    Client.Functions.RoomFrameworkSync(false)
    if Config.LibertyCity then ResetWater() end
end)

RegisterNetEvent("0r-apartment:Client:OnCreatedElevator", function(state)
    Client.ApartmentElevator.netId = state.netId
    Client.ApartmentElevator.onMove = state.onMove
    Client.ApartmentElevator.floor = state.floor
    Client.Functions.DeleteElevatorTargets()
    Client.Functions.CreateElevatorCallTargets()
    Client.Functions.CreateElevatorInTargets()
end)

RegisterNetEvent("0r-apartment:Client:SetElevatorState", function(state)
    Client.ApartmentElevator.netId = state.netId
    Client.ApartmentElevator.onMove = state.onMove
    Client.ApartmentElevator.floor = state.floor
end)

RegisterNetEvent("0r-apartment:Client:OnGivedPermToPlayer", function()
    Client.Functions.SendNotify(locale("game.gived_perm_to_player"), "success")
end)

RegisterNetEvent("0r-apartment:Client:OnDeletedPermToPlayer", function()
    Client.Functions.SendNotify(locale("game.deleted_perm_to_player"), "success")
end)

RegisterNetEvent("0r-apartment:Client:OnUpdateRoomOptions", function(inRoom)
    Client.Player.inRoom = inRoom
    Client.Functions.SendReactMessage("ui:setInRoom", inRoom)
end)

RegisterNetEvent("0r-apartment:Client:OnUpdateSoldRooms", function(soldRooms)
    Client.SoldRooms = soldRooms
    Client.Functions.SendReactMessage("ui:setSoldRooms", soldRooms)
end)

RegisterNetEvent("0r-apartment:Client:SetPlayerRooms", function(rooms)
    Client.Player.rooms = rooms
    Client.Functions.SendReactMessage("ui:setOwnedRooms", rooms)
end)

RegisterNetEvent("0r-apartment:Client:SetRoomLights", function(state)
    Client.Functions.SetRoomLights(not state)
end)

RegisterNetEvent("0r-apartment:Client:SetRoomWallColor", function(color)
    ExecuteCommand("tint_apart_room " .. color)
end)

RegisterNetEvent("0r-apartment:Client:MoveElevator", function(floor)
    if NetworkDoesEntityExistWithNetworkId(Client.ApartmentElevator.netId) then
        TriggerServerEvent("0r-apartment:Server:SetElevatorState", Client.Player.inApartment, true, nil)
        CreateThread(function()
            local object = NetToEnt(Client.ApartmentElevator.netId)
            NetworkRequestControlOfEntity(object)
            local entityCoords = GetEntityCoords(object)
            local targetCoords = Config.Elevator.coords.stops[floor]
            local attemptCount = 0
            while Client.Player.inApartment and not Client.Player.inRoom and #(entityCoords - targetCoords) > 0.02 do
                if NetworkDoesEntityExistWithNetworkId(Client.ApartmentElevator.netId) then
                    object = NetToEnt(Client.ApartmentElevator.netId)
                    NetworkRequestControlOfEntity(object)
                    if entityCoords.z < targetCoords.z then
                        SetEntityCoords(object, GetOffsetFromEntityInWorldCoords(object, 0.0, 0.0, 0.02))
                    else
                        SetEntityCoords(object, GetOffsetFromEntityInWorldCoords(object, 0.0, 0.0, -0.02))
                    end
                    entityCoords = GetEntityCoords(object)
                    Wait(16)
                else
                    attemptCount = attemptCount + 1
                    if attemptCount >= 20 then
                        break
                    end
                    Wait(500)
                end
            end
            if Client.Player.inApartment and not Client.Player.inRoom then
                SetEntityCoords(object, targetCoords)
                Wait(2000)
            end
            TriggerServerEvent("0r-apartment:Server:SetElevatorState", Client.Player.inApartment, false, floor)
        end)
    end
end)

RegisterNetEvent("0r-apartment:Client:Admin:FixElevator", function(apartmentId, oldNetId)
    if Config.NoElevator then return end
    Wait(500)
    if Client.Functions.DeleteElevator() then
        print("FixElevator")
    end
    local netId = Client.Functions.CreateElevator(0)
    TriggerServerEvent("0r-apartment:Server:OnCreatedElevator", apartmentId, netId)
    Client.Functions.SendNotify("Elevator respawn", "success", 2500)
end)
