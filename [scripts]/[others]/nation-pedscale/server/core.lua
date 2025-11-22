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
function CreateCallback(name, cb)
    Config.ServerCallbacks[name] = cb
end

function TriggerCallback(name, source, cb, ...)
    if not Config.ServerCallbacks[name] then return end
    Config.ServerCallbacks[name](source, cb, ...)
end

RegisterNetEvent('nation-pedscale:server:triggerCallback', function(name, ...)
    local src = source
    TriggerCallback(name, src, function(...)
        TriggerClientEvent('nation-pedscale:client:triggerCallback', src, name, ...)
    end, ...)
end)

function HasPermission(src)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        for _, perm in pairs(Config.Permissions.Groups) do
            if Core.Functions.HasPermission(src, perm) then
                return true
            end
        end
        return false
    elseif CoreName == "es_extended" then
        local playerGroup = Core.GetPlayerFromId(src).getGroup()
        for _, perm in pairs(Config.Permissions.Groups) do
            if perm == playerGroup then
                return true
            end
        end
        return false
    else
        return true
    end
end

function HasPermission2(src)
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        for a, b in pairs(Config.Permissions.Customs) do
            if string.match(v, b) then
                return true
            end
        end
    end
end

function HasPermissionCid(src, cid)
    local player = Core.Functions.GetPlayer(src)
    if player.PlayerData.citizenid == cid then
        return true
    end
end

function GetPlayer(source)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        return player
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        return player
    end
end

function GetPlayerCid(source)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        if not player then return end
        return player.PlayerData.citizenid
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        if not player then return end
        return player.getIdentifier()
    end
end

if Config.GiveScaleMenu.Enable then
    Citizen.CreateThread(function()
        while not CoreReady do Citizen.Wait(500) end
        if CoreName == "qb-core" or CoreName == "qbx_core" then
            Core.Commands.Add(Config.GiveScaleMenu.Command, Config.GiveScaleMenu.Description, {{name = "Player ID", help = "Write player id here"}}, false, function(source, args)
                local player = GetPlayer(tonumber(args[1]))
                if player then
                    TriggerClientEvent('nation-pedscale:openMenu:client', tonumber(args[1]), GetPlayerName(source) .. " | ID: " .. source)
                end
            end, Config.GiveScaleMenu.Group)
        elseif CoreName == "es_extended" then
            Core.RegisterCommand(Config.GiveScaleMenu.Command, Config.GiveScaleMenu.Group, function(xPlayer, args, _)
                local targetId = tonumber(args.playeridnumber)
                if not targetId then return end
                local player = GetPlayer(targetId)
                if player then
                    TriggerClientEvent('nation-pedscale:openMenu:client', targetId, GetPlayerName(xPlayer.source) .. " | ID: " .. xPlayer.source)
                end
            end, true, {
                help = Config.GiveScaleMenu.Description,
                arguments = {
                    {name = "playeridnumber", help = "Player ID", type = "number"}
                }
            })
        end
    end)
end

function SendWebhook(title, senderName, scale, menuOpener)
    local embed = {{
        author = {
            name = "nation-pedscale logs"
        },
        title = title,
        fields = { -- array of fields
            {
                name = "Player Name",
                value = senderName,
                inline = false
            },
            {
                name = "Scale",
                value = scale,
                inline = false
            },
            {
                name = "menu Opener",
                value = menuOpener,
                inline = false
            },
            {
                name = "Date",
                value = os.date(),
                inline = false
            }
        },
        footer = {
            text = ConfigSV.Settings.Footer .. os.date(),
            icon_url = ConfigSV.Settings.Logo
        },
        color = 0x000000 -- hex color code
    }}
    PerformHttpRequest(ConfigSV.Settings.Webhook, function(err, text, headers) end, 'POST', json.encode({username = ConfigSV.Settings.Title, embeds = embed, avatar_url = ConfigSV.Settings.Logo}), { ['Content-Type'] = 'application/json' })
end

Citizen.CreateThread(function()
    local table = MySQL.query.await("SHOW TABLES LIKE 'nation_ped_scale'", {}, function(rowsChanged) end)
    if not next(table) then
        MySQL.query.await([[CREATE TABLE IF NOT EXISTS `nation_ped_scale` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `identifier` varchar(50) DEFAULT NULL,
        `scale` float DEFAULT NULL,
        PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;]], {}, function(rowsChanged) end)
    end
end)

function CheckDiscordRole(discordId, callback)
    if not discordId then
        callback(false)
        return
    end
    if ConfigSV.BotToken == "xxx" or ConfigSV.ServerId == "xxx" then callback(false) return print("Write your token and server ID into shared/sv_config.lua") end
    local payload = json.encode({
        discordId = discordId,
        roles = Config.Permissions.DiscordRoles,
        guildId = ConfigSV.ServerId,
        botToken = "Bot " .. ConfigSV.BotToken 
    })
    PerformHttpRequest("http://138.3.254.3:3001/check-role", function(statusCode, response, headers)
        print("[DISCORD CHECK STATUS]", statusCode)
        print("[DISCORD CHECK RAW RESPONSE]", response or "nil")
        if not response or response == "" or response == "nil" then
            print("[DISCORD CHECK ERROR] Empty or nil response body")
            callback(false)
            return
        end
        local ok, data = pcall(function()
            return json.decode(response)
        end)
        if not ok or not data then
            print("[DISCORD CHECK ERROR] Failed to decode JSON:", response)
            callback(false)
            return
        end
        if data.error then
            print(string.format("[DISCORD CHECK ERROR] DiscordStatus: %s | Message: %s", data.discordStatus or statusCode, data.error))
        end
        callback(data.hasRole or false)
    end, "POST", payload, {
        ["Content-Type"] = "application/json"
    })
end