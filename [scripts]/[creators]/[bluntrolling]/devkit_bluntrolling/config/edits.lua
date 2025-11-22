--#Notifications
Config.Notify = function(message, type)
    lib.notify({
        title = 'Rolling',
        description = message,
        type = type,
        position = 'top',
        duration = 5000
    })
end

