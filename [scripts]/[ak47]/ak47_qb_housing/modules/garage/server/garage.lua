QBCore.Functions.CreateCallback('ak47_qb_housing:garage:isowner', function(source, cb, plate)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    MySQL.query('SELECT COUNT(*) as count FROM `player_vehicles` WHERE `citizenid` = @identifier AND `plate` = @plate',
    {
        ['@identifier']     = xPlayer.PlayerData.citizenid,
        ['@plate']          = plate
    }, function(result)
        if tonumber(result[1].count) > 0 then
            return cb(true)
        else
            return cb(false)
        end
    end)
end)

RegisterNetEvent('ak47_qb_housing:garage:store', function(hid, prop, nid)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local garagevehicles = Houses[hid].garagevehicles
    garagevehicles[prop.plate] = prop
    garagevehicles[prop.plate].owner = xPlayer.PlayerData.citizenid
    MySQL.Async.execute('UPDATE `ak47_qb_housing` SET garagevehicles = ? WHERE id = ?', {json.encode(garagevehicles), tonumber(hid)})
    TriggerClientEvent('ak47_qb_housing:sync:garage', -1, hid, garagevehicles)
    local vehicle = NetworkGetEntityFromNetworkId(nid)
    for i = -1, 6, 1 do
        local ped = GetPedInVehicleSeat(vehicle, i)
        TaskLeaveVehicle(ped, vehicle, 0)
    end
    Citizen.Wait(1800)
    DeleteEntity(vehicle)
end)

RegisterNetEvent('ak47_qb_housing:garage:out', function(hid, plate)
    local garagevehicles = Houses[hid].garagevehicles
    garagevehicles[plate] = nil
    MySQL.Async.execute('UPDATE `ak47_qb_housing` SET garagevehicles = ? WHERE id = ?', {json.encode(garagevehicles), tonumber(hid)})
    TriggerClientEvent('ak47_qb_housing:sync:garage', -1, hid, garagevehicles)
end)

function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_qb-houses_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

function hasKey()
    return true
end

exportHandler('hasKey', hasKey)