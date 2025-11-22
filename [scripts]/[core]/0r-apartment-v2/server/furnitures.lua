--[[ Functions ]]

function PlaceFurniture(src, apartmentId, roomId, model, pos, rot, category)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    local index = nil
    for key, value in pairs(soldRoom.furnitures) do
        if not value.isPlaced and value.model == model then
            index = key
            value.index = key
            value.isPlaced = true
            value.pos = pos
            value.rot = rot
            soldRoom.furnitures[key] = value
            break
        end
    end
    if index then
        local function CreateStashPass(model)
            return generateRandomString(6)
        end
        if isModelStash(model) then
            soldRoom.furnitures[index].stash_pass = soldRoom.furnitures[index]?.stash_pass or CreateStashPass()
            local apartmentId = apartmentId == -1 and "Mlo" or apartmentId
            local stashId = string.format("apartment_%s_%s_%s", apartmentId, roomId,
                soldRoom.furnitures[index].stash_pass)
            Server.Functions.RegisterStash(src, stashId)
        elseif isModelWeedDry(model) then
            soldRoom.furnitures[index].dry_pass = soldRoom.furnitures[index]?.dry_pass or CreateStashPass()
        end
        Server.Functions.UpdateRoomFurnitures(soldRoom.furnitures, apartmentId, roomId)
        for _, source in pairs(soldRoom.players) do
            if Server.Functions.IsPlayerOnline(source) then
                TriggerClientEvent(_e("Client:Furniture:Place"), source,
                    index, model, pos, rot, category, {
                        stash_pass = soldRoom.furnitures[index]?.stash_pass,
                        dry_pass = soldRoom.furnitures[index]?.dry_pass
                    })
            end
        end
    end
end

function BuyFurniture(src, furniture, apartmentId, roomId)
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    Server.Functions.PlayerRemoveMoney(xPlayer, "bank", furniture.price)
    furniture.isPlaced = false
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    if not soldRoom.furnitures then
        soldRoom.furnitures = {}
    end
    table.insert(soldRoom.furnitures, furniture)
    Server.Functions.UpdateRoomFurnitures(soldRoom.furnitures, apartmentId, roomId)
end

function OwnedFurnitureReSell(src, furniture, apartmentId, roomId)
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    local founded = false
    for key, value in pairs(soldRoom.furnitures or {}) do
        if not value.isPlaced and value.model == furniture.model then
            founded = true
            table.remove(soldRoom.furnitures, key)
            break
        end
    end
    if founded then
        Server.Functions.PlayerAddMoney(xPlayer, "bank", furniture.price)
    end
    Server.Functions.UpdateRoomFurnitures(soldRoom.furnitures, apartmentId, roomId)
end

function OwnedFurniturePutInStorage(src, furniture, apartmentId, roomId)
    local xPlayer = Server.Functions.GetPlayerBySource(src)
    local soldRoom = Server.Functions.GetSoldRoom(apartmentId, roomId)
    for key, value in pairs(soldRoom.furnitures or {}) do
        if value.index == furniture.index then
            soldRoom.furnitures[key].isPlaced = false
            break
        end
    end
    Server.Functions.UpdateRoomFurnitures(soldRoom.furnitures, apartmentId, roomId)
    for _, source in pairs(soldRoom.players) do
        if Server.Functions.IsPlayerOnline(source) then
            TriggerClientEvent(_e("Client:Furniture:PutInStorage"), source, furniture.index)
        end
    end
end

--[[ Callbacks ]]

Server.Functions.RegisterServerCallback(_e("Server:PlaceFurniture"), function(source, cb, furniture, apartmentId, roomId)
    local src = source
    local room = apartmentId == -1 and
        Config.MloRooms[roomId] or
        Server.Functions.GetConfigRoomById(roomId)
    if not room or
        not Server.Functions.IsRoomSold(apartmentId, roomId)
    then
        return cb({ error = locale("game.room_not_found") })
    end
    if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
        return cb({ error = locale("game.not_own_room") })
    end

    local model = furniture.model
    local pos = furniture.pos
    local rot = furniture.rot
    local category = furniture.category
    PlaceFurniture(src, apartmentId, roomId, model, pos, rot, category)
    return cb({})
end)

Server.Functions.RegisterServerCallback(_e("Server:BuyFurniture"), function(source, cb, furniture, apartmentId, roomId)
    local src = source
    local room = apartmentId == -1 and
        Config.MloRooms[roomId] or
        Server.Functions.GetConfigRoomById(roomId)
    if not room or
        not Server.Functions.IsRoomSold(apartmentId, roomId)
    then
        return cb({ error = locale("game.room_not_found") })
    end
    if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
        return cb({ error = locale("game.not_own_room") })
    end
    local xPlayerBalance = Server.Functions.GetPlayerBalance("bank", src)
    if xPlayerBalance < tonumber(furniture.price) then
        return cb({ error = locale("game.dont_have_enough_money", furniture.price) })
    end
    BuyFurniture(src, furniture, apartmentId, roomId)
    return cb({})
end)

Server.Functions.RegisterServerCallback(_e("Server:OwnedFurnitureReSell"),
    function(source, cb, furniture, apartmentId, roomId)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            return cb({ error = locale("game.room_not_found") })
        end
        if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
            return cb({ error = locale("game.not_own_room") })
        end
        OwnedFurnitureReSell(src, furniture, apartmentId, roomId)
        return cb({})
    end)

Server.Functions.RegisterServerCallback(_e("Server:OwnedFurniturePutInStorage"),
    function(source, cb, furniture, apartmentId, roomId)
        local src = source
        local room = apartmentId == -1 and
            Config.MloRooms[roomId] or
            Server.Functions.GetConfigRoomById(roomId)
        if not room or
            not Server.Functions.IsRoomSold(apartmentId, roomId)
        then
            return cb({ error = locale("game.room_not_found") })
        end
        if not Server.Functions.PlayerIsOwnerInRoom(src, apartmentId, roomId) then
            return cb({ error = locale("game.not_own_room") })
        end
        OwnedFurniturePutInStorage(src, furniture, apartmentId, roomId)
        return cb({})
    end)
