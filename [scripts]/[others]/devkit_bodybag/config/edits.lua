--#Notifications
Config.Notify = function(message, type)
    lib.notify({
        title = 'Bodybag',
        description = message,
        type = type,
        position = 'top',
        duration = 5000
    })
end


Config.NotificationMessages = {
    needcoffin = 'You need a coffin!',
    dumploc = 'You need to be in a dumping location to body bag someone!',
    nodeadnearby = 'No dead player nearby!',
    noplayernearby = 'No player nearby!',
    notBodyBagged = 'The player is not in a body bag.',
    needbodybag = "You need a body bag to dump.",
    BodybagRemove = 'Take out of Bodybag',
    MissingItem = 'You do not have the necessary item.',
}


--TEXT UI
Config.ShowTextUI = function(text)
    lib.showTextUI(text)
end

Config.HideTextUI = function()
    lib.hideTextUI()
end
