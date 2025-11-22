--[[ Events ]]

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Client.Functions.StartCore()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Client.Functions.OnPlayerLogout()
    Client.Functions.StopCore()
end)

RegisterNetEvent("qb-apartments:client:LastLocationHouse", function()
    local apartmentId, roomId = Client.Functions.GetPlayerApartMeta()
    if apartmentId and apartmentId ~= -1 then
        Client.Player.inApartment = apartmentId
        if roomId then
            Client.Functions.GetIntoApartmentRoom(apartmentId, roomId)
        else
            local ap = Config.Apartments[apartmentId]
            if ap then
                local coords = ap.coords.enter
                TriggerServerEvent("0r-apartment:Server:SetPlayerRoutingBucket", apartmentId, coords)
            end
        end
    end
end)

RegisterNetEvent("apartments:client:setupSpawnUI", function(cData, firstSpawn, isNew)
    if not cData then return end
    if GetResourceState('qbx_core') == 'started' then
        local Locations = Config.Apartments

        local upLocations = {}

        for key, value in pairs(Locations) do
            upLocations[#upLocations + 1] = {
                label = value.label,
                coords = value.coords.enter,
                propertyId = key,
            }
        end

        TriggerEvent("qb-spawn:client:setupSpawns", cData, true, upLocations)
    else
        Client.Functions.TriggerServerCallback("0r-apartment:Server:GetPlayerRooms", function(result)
            if #result > 0 then
                TriggerEvent("qb-spawn:client:setupSpawns", cData, false, nil)
                TriggerEvent("qb-spawn:client:openUI", true)
            else
                if isNew and Config.ApartmentStarting then
                    local Locations = Config.Apartments
                    TriggerEvent("qb-spawn:client:setupSpawns", cData, true, Locations)
                    TriggerEvent("qb-spawn:client:openUI", true)
                else
                    TriggerEvent("qb-spawn:client:setupSpawns", cData, false, nil)
                    TriggerEvent("qb-spawn:client:openUI", true)
                end
            end
        end, cData.citizenid or cData.cid)
    end
end)
