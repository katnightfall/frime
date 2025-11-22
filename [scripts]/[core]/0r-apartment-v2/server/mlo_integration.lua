MloDoors = {}

local function isAuthorized(source, roomId)
    local soldRoom = Server.Functions.GetSoldRoom(-1, roomId)
    if not soldRoom or not Server.Functions.IsRoomSold(-1, roomId) then
        return false
    end
    local identity = Server.Functions.GetPlayerIdentity(source)
    return Server.Functions.PlayerIsGuestInRoom(identity, -1, roomId)
end

local function GetIntoMloRoom(source, apartmentId, roomId, unauthorized)
    local xPlayerIdentity  = Server.Functions.GetPlayerIdentity(source)
    local roomSQL          = Utils.Functions.deepCopy(Server.Functions.GetSoldRoom(apartmentId, roomId))
    local room             = Utils.Functions.deepCopy(Config.MloRooms[roomId])

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
    inRoom.apartment_id    = -1
    inRoom.apartment_label = Config.InteriorMloApart.label
    Server.Functions.AddPlayerToRoom(source, apartmentId, roomId)
    Server.Functions.RegisterFurnituresToStash(source, apartmentId, roomId)
    TriggerClientEvent(_e("Client:OnPlayerIntoMloRoom"), source, inRoom, unauthorized)
end
RegisterNetEvent(_e("Server:GetIntoMloRoom"), function(roomId)
    local src = source
    if Server.Functions.IsRoomSold(-1, roomId) then
        GetIntoMloRoom(src, -1, roomId, not isAuthorized(src, roomId))
    end
end)

local function LeaveMloRoom(source, apartmentId, roomId)
    Server.Functions.RemovePlayerToRoom(source, apartmentId, roomId)
    Server.Functions.SetPlayerMetaApartment(source, apartmentId)
    Server.Players[source] = { apartmentId = apartmentId }
    table.insert(Server.Apartments[apartmentId].players, source)
    TriggerClientEvent(_e("Client:OnPlayerLeaveMloRoom"), source, apartmentId, roomId)
end
RegisterNetEvent(_e("Server:LeaveMloRoom"), function(roomId)
    local src = source
    LeaveMloRoom(src, -1, roomId)
end)

lib.callback.register(_e("Server:Mlo:UpdateDoorState"), function(source, roomId)
    local oldState = MloDoors[roomId]
    if oldState == nil then
        oldState = true
    end
    local newState = not oldState
    MloDoors[roomId] = newState
    TriggerClientEvent(_e("Client:Mlo:UpdateDoorState"), -1, roomId, newState)
    return true
end)

lib.callback.register(_e("Server:Mlo:isAuthorized"), function(source, roomId)
    return isAuthorized(source, roomId)
end)

lib.callback.register(_e("Server:Mlo:GetDoors"), function(source)
    return MloDoors
end)
