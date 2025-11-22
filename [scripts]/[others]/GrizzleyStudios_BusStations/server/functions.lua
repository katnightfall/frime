-- Enhanced notification function that handles multiple notification systems
function notify(source, type, message)
    -- Handle notifications based on Config.Notify setting
    if Config.Notify == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = type, text = message })
    elseif Config.Notify == 'dlrms' then
        TriggerClientEvent('dlrms_notify', source, type, message)
    elseif Config.OxLib or Config.Notify == 'ox_lib' then
        -- Fixed the ox_lib notification call
        TriggerClientEvent('ox_lib:notify', source, { type = type, description = message })
    -- Framework-specific default notifications as fallback
    elseif Config.Notify == 'other' then
        if Config.Framework == 'qb' or Config.Framework == 'qbox' then
            TriggerClientEvent('QBCore:Notify', source, message, type)
        elseif Config.Framework == 'esx' then
            if type == 'error' then
                TriggerClientEvent('esx:showNotification', source, message, 'error')
            elseif type == 'success' then
                TriggerClientEvent('esx:showNotification', source, message, 'success')
            else
                TriggerClientEvent('esx:showNotification', source, message)
            end
        end
    end
end

-- Export the notify function for external use
exports('grizzleystudios_notify', function(source, type, message)
    notify(source, type, message)
end)

-- Export function to get current framework
exports('grizzleystudios_getFramework', function()
    return Config.Framework
end)

-- Export function to check if ox_lib is enabled
exports('grizzleystudios_isOxLibEnabled', function()
    return Config.OxLib
end)

-- Export function to get bus price
exports('grizzleystudios_getBusPrice', function()
    return Config.BusPrice
end)

-- Export function to get bus wait time
exports('grizzleystudios_getBusWaitTime', function()
    return Config.BusWaitTime
end)

-- Export function to log bus travel for administrative purposes
exports('grizzleystudios_logBusTravel', function(source, location, cost)
    local timestamp = os.date('%Y-%m-%d %H:%M:%S')
    local playerName = GetPlayerName(source)
    local identifier = nil
    
    if Config.Framework == 'qb' or Config.Framework == 'qbox' then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            identifier = Player.PlayerData.citizenid
        end
    elseif Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            identifier = xPlayer.identifier
        end
    end
    
    print(string.format('[Grizzley Studios Bus] %s - Player: %s (%s) traveled to %s for $%d', 
        timestamp, playerName, identifier or 'unknown', location, cost or Config.BusPrice))
end)