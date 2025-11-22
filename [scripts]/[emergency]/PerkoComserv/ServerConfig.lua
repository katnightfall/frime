-- config_server

ServerConfig = {}


-- Webhook URLs
ServerConfig.Webhook = { 
    Comserv = "Comserv Webhook",
    EndComserv = "EndComms Webhook",
    AddComms = "Add Comms Webhook",
    ChangeComms = "Change Comms Webhook"
}

-- Permissions
ServerConfig.Permission = {
    Comserv = "pdcomserv",
    EndComserv = "pdcomserv",
    AddComms = "pdcomserv",
    ChangeComms = "pdcomserv"
}

-- Max Amount Of comms a admin can give
ServerConfig.ComservMaxAmount = 100

-- Notification settings
ServerConfig.Notification = {
    IncorrectUsage = 'This is not the correct usage. /comserv [id] [amount] [reason]',
    MaxActions = 'The max actions is 100.'
}

-- Commands
ServerConfig.Commands = {
    Comserv = "comserv",
    EndComserv = "endcomserv",
    AddComms = "addcomms",
    ChangeComms = "changecomms"
}

ServerConfig.NotificationType = 'mxo-notify:alert'

-- Chat Template with Background Color
ServerConfig.NotificationTemplate = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0,120,0,0.5); border: 1px solid rgba(0,140,0); border-radius: 5px;"><i class="fas fa-exclamation-circle"></i></i> {0}</div>'
