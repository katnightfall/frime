Core = nil
CoreName = nil
CoreReady = false
Citizen.CreateThread(function()
    for k, v in pairs(Cores) do
        if GetResourceState(v.ResourceName) == "starting" or GetResourceState(v.ResourceName) == "started" then
            CoreName = v.ResourceName
            Core = v.GetFramework()
            CoreReady = true
        end
    end
end)

Config.ServerCallbacks = {}
function TriggerCallback(name, cb, ...)
    Config.ServerCallbacks[name] = cb
    TriggerServerEvent('nation-pedscale:server:triggerCallback', name, ...)
end

RegisterNetEvent('nation-pedscale:client:triggerCallback', function(name, ...)
    if Config.ServerCallbacks[name] then
        Config.ServerCallbacks[name](...)
        Config.ServerCallbacks[name] = nil
    end
end)

function Notify(text, length, type)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        Core.Functions.Notify(text, type, length)
    elseif CoreName == "es_extended" then
        Core.ShowNotification(text)
    end
end

function GetPlayerData()
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayerData()
        return player
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerData()
        return player
    end
end

Citizen.CreateThread(function()
    while not CoreReady do Citizen.Wait(100) end
    if CoreName == "es_extended" then
        RegisterNetEvent('esx:playerLoaded', function(player, xPlayer, isNew)
            TriggerCallback('nation-pedscale:getPlayerScale:server', function(scaleVal)
                if tonumber(scaleVal) ~= 1.0 and tonumber(scaleVal) ~= 1 then
                    setScale(tonumber(scaleVal))
                end
            end)
            Citizen.Wait(500)
            TriggerCallback('nation-pedscale:getScales:server', function(data)
                playerScales = data
            end)
        end)
    else
        while not next(GetPlayerData()) do Citizen.Wait(0) end
        TriggerCallback('nation-pedscale:getPlayerScale:server', function(scaleVal)
            if tonumber(scaleVal) ~= 1.0 and tonumber(scaleVal) ~= 1 then
                setScale(tonumber(scaleVal))
            end
        end)
        Citizen.Wait(500)
        TriggerCallback('nation-pedscale:getScales:server', function(data)
            playerScales = data
        end)
    end
end)