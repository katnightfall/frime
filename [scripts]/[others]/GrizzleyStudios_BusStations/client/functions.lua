-- Enhanced notification function that handles multiple notification systems
function notify(type, message)
    if Config.Notify == 'mythic' then
        exports['mythic_notify']:SendAlert(type, message)
    elseif Config.Notify == 'dlrms' then
        TriggerEvent('dlrms_notify', type, message)
    elseif Config.OxLib or Config.Notify == 'ox_lib' then
        lib.notify({
            title = 'Bus System',
            description = message,
            type = type
        })
    elseif Config.Notify == 'other' then
        -- Framework-specific notifications
        if Config.Framework == 'qb' or Config.Framework == 'qbox' then
            QBCore.Functions.Notify(message, type)
        elseif Config.Framework == 'esx' then
            ESX.ShowNotification(message)
        end
    end
end

-- Export the notify function for external use
exports('grizzleystudios_notify', function(type, message)
    notify(type, message)
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