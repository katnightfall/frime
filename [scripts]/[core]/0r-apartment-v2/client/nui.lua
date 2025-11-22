RegisterNUICallback("nui:hideFrame", function(data, cb)
    SetNuiFocus(false, false)
    if not data then
        Client.Functions.SendReactMessage("ui:setVisible", false)
    end
    cb(true)
end)

RegisterNUICallback("nui:purchaseApartmentRoom", function(data, cb)
    local roomId = data.roomId
    local rentDay = data.rentDay
    Client.Functions.PurchaseRoom(roomId, rentDay)
    cb(true)
end)

RegisterNUICallback("nui:changeRoomWallColor", function(colorId, cb)
    Client.Functions.TriggerServerCallback("0r-apartment:Server:ChangeRoomWallColor", function(response)
        if response.error then
            Client.Functions.SendNotify(locale("game.error", response.error), "error")
        end
        cb(true)
    end, colorId, Client.Player.inApartment, Client.Player.inRoom.room_id)
end)

RegisterNUICallback("nui:leaveRoomPermanently", function(data, cb)
    Client.Functions.ExitRoom()
    cb(true)
end)

RegisterNUICallback("nui:exitRoomRemote", function(data, cb)
    Client.Functions.ExitRoomRemote(data.apartmentId, data.roomId)
    cb(true)
end)

RegisterNUICallback("nui:addPermission", function(target, cb)
    Client.Functions.GivePermUser(target)
    cb(true)
end)

RegisterNUICallback("nui:removePermission", function(targetIdentity, cb)
    Client.Functions.DeletePermUser(targetIdentity)
    cb(true)
end)

RegisterNUICallback("nui:updateRoomLights", function(state, cb)
    Client.Functions.UpdateRoomLights(state)
    cb(true)
end)

RegisterNUICallback("nui:openCCTV", function(_, cb)
    if Config.CCTV.Enabled then
        Client.Functions.SendReactMessage("ui:setVisible", false)
        if not Client.Player.inCameraMode then
            Client.Functions.OpenCameraMode()
        end
    end
    cb(true)
end)

RegisterNUICallback("nui:elevatorMove", function(floor, cb)
    Client.Functions.TriggerServerCallback("0r-apartment:Server:MoveElevator", function(result)
        if result.onMove then
            Client.Functions.SendNotify(locale("game.elevator_already_move"), "info")
        else
            Client.Functions.SendNotify(locale("game.elevator_on_move"), "success", 2500)
            Client.Functions.SendReactMessage("ui:setVisible", false)
            Client.Functions.SendReactMessage("ui:setRouter", "catalog")
            SetNuiFocus(false, false)
        end
        cb(true)
    end, Client.Player.inApartment, floor)
end)

---@param type "electricity" | "power" | "gas" | "water"
---@param resultCallback function
RegisterNUICallback("nui:buyIndicatorByType", function(type, resultCallback)
    if Client.Player.inRoom then
        Client.Functions.TriggerServerCallback(_e("Server:BuyIndicator"), function(response)
            if response.error then
                Client.Functions.SendNotify(locale("game.error", response.error), "error")
                return resultCallback({ result = false })
            end
            return resultCallback({ result = true })
        end, type, Client.Player.inApartment, Client.Player.inRoom.room_id)
    end
end)
