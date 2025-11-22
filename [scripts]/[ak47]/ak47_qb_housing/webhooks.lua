Config.AuthorTitle   = 'Ak47 Housing'
Config.AvatarUrl     = 'https://cdn.discordapp.com/attachments/732315339601477652/1097062937451040798/logo_small.png'
Config.Webhooks = {
    createhouse = {
        Webhook     = 'https://discord.com/api/webhooks/', --Discord webhook link
        Title       = "A new house has been created",
        PlayerData = {
            field       = "Player Data:",
            id          = "**ID: **",
            name        = "**Name: **",
            identifier  = "**Identifier: **",
        },
        HouseData = {
            field       = "House Data:",
            hid         = "**ID: **",
            type        = "**Type: **",
            shell       = "**Model: **",
            price       = "**Price: **",
            inventory   = "**Inventory: **",
            coords      = "**Coordinates: **",
        },
    },
    deletehouse = {
        Webhook     = 'https://discord.com/api/webhooks/', --Discord webhook link
        Title       = "A house has been deleted",
        PlayerData = {
            field       = "Player Data:",
            id          = "**ID: **",
            name        = "**Name: **",
            identifier  = "**Identifier: **",
        },
        HouseData = {
            field       = "House Data:",
            hid         = "**ID: **",
            type        = "**Type: **",
            shell       = "**Model: **",
            price       = "**Price: **",
            inventory   = "**Inventory: **",
            coords      = "**Coordinates: **",
        },
    },
    buyhouse = {
        Webhook     = 'https://discord.com/api/webhooks/', --Discord webhook link
        Title       = "House purchased",
        PlayerData = {
            field       = "Player Data:",
            id          = "**ID: **",
            name        = "**Name: **",
            identifier  = "**Identifier: **",
        },
        HouseData = {
            field       = "House Data:",
            hid         = "**ID: **",
            type        = "**Type: **",
            shell       = "**Model: **",
            price       = "**Price: **",
            inventory   = "**Inventory: **",
            coords      = "**Coordinates: **",
        },
    },
    renthouse = {
        Webhook     = 'https://discord.com/api/webhooks/', --Discord webhook link
        Title       = "House rent",
        PlayerData = {
            field       = "Player Data:",
            id          = "**ID: **",
            name        = "**Name: **",
            identifier  = "**Identifier: **",
        },
        HouseData = {
            field       = "House Data:",
            hid         = "**ID: **",
            type        = "**Type: **",
            shell       = "**Model: **",
            price       = "**Price: **",
            inventory   = "**Inventory: **",
            coords      = "**Coordinates: **",
        },
    },
    installmenthouse = {
        Webhook     = 'https://discord.com/api/webhooks/', --Discord webhook link
        Title       = "House Installment",
        PlayerData = {
            field       = "Player Data:",
            id          = "**ID: **",
            name        = "**Name: **",
            identifier  = "**Identifier: **",
        },
        HouseData = {
            field       = "House Data:",
            hid         = "**ID: **",
            type        = "**Type: **",
            shell       = "**Model: **",
            price       = "**Price: **",
            inventory   = "**Inventory: **",
            coords      = "**Coordinates: **",
        },
    },
    rentpayment = {
        Webhook     = 'https://discord.com/api/webhooks/', --Discord webhook link
        Title       = "Rent Payment",
        PlayerData = {
            field       = "Player Data:",
            identifier  = "**Identifier: **",
            paid        = "**Paid: **",
            bank        = "**Bank: **",
        },
        HouseData = {
            field       = "House Data:",
            hid         = "**ID: **",
        },
    },
    instpayment = {
        Webhook     = 'https://discord.com/api/webhooks/', --Discord webhook link
        Title       = "Installment Payment",
        PlayerData = {
            field       = "Player Data:",
            identifier  = "**Identifier: **",
            paid        = "**Paid: **",
            bank        = "**Bank: **",
        },
        HouseData = {
            field       = "House Data:",
            hid         = "**ID: **",
        },
    },
}

function CreateLog(type, playerid, playername, identifier, hid, htype, shell, price, inventory, coords)
    local msg = ''
    local data = {}
    if type == 'createhouse' then
        data = Config.Webhooks.createhouse
    elseif type == 'deletehouse' then
        data = Config.Webhooks.deletehouse
    elseif type == 'renthouse' then
        data = Config.Webhooks.renthouse
    elseif type == 'installmenthouse' then
        data = Config.Webhooks.installmenthouse
    else
        data = Config.Webhooks.buyhouse
    end
    message = {
        embeds = {{
            ["title"] = Config.AuthorTitle,
            ["description"] = '**'..data.Title..'**',
        }},
        avatar_url = Config.AvatarUrl
    }
    message['embeds'][1].fields = {
        {
            ["name"] = data.HouseData.field,
            ["value"] = data.HouseData.hid..hid..'\n'..data.HouseData.type..htype..'\n'..data.HouseData.shell..shell..'\n'..data.HouseData.price..price..'\n'..data.HouseData.inventory..inventory..'kg'..'\n'..data.HouseData.coords..coords,
            ["inline"] = true,
        },
        {
            ["name"] = data.PlayerData.field,
            ["value"] = data.PlayerData.id..playerid..'\n'..data.PlayerData.name..playername..'\n'..data.PlayerData.identifier..identifier,
            ["inline"] = true,
        }
    }

    PerformHttpRequest(data.Webhook, function(err, text, headers) 
    end, 'POST', json.encode(message), {
        ['Content-Type'] = 'application/json'
    })
end

function CreateLogPayment(type, identifier, hid, payment, available)
    local msg = ''
    local data = nil
    if type == 'rentpayment' then
        data = Config.Webhooks.rentpayment
    elseif type == 'instpayment' then
        data = Config.Webhooks.instpayment
    end
    if not data then return end
    message = {
        embeds = {{
            ["title"] = Config.AuthorTitle,
            ["description"] = '**'..data.Title..'**',
        }},
        avatar_url = Config.AvatarUrl
    }
    message['embeds'][1].fields = {
        {
            ["name"] = data.HouseData.field,
            ["value"] = data.HouseData.hid..hid,
            ["inline"] = true,
        },
        {
            ["name"] = data.PlayerData.field,
            ["value"] = data.PlayerData.identifier..identifier..'\n'..data.PlayerData.paid..payment..'\n'..data.PlayerData.bank..available,
            ["inline"] = true,
        }
    }

    PerformHttpRequest(data.Webhook, function(err, text, headers) 
    end, 'POST', json.encode(message), {
        ['Content-Type'] = 'application/json'
    })
end
