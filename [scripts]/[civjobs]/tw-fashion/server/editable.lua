bot_Token = ""
bot_logo = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
bot_name = "Tworst Store"


discord_webhook = {
    ['jobfinish'] =
    "https://discord.com/api/webhooks/1280951284303790202/4FQfo9joahB6e5n6c_KXYJA4wTG00G1CKj4OQBeranMAQKczGl-vuOR6x8UbqV-oZ4kO",
}

local Caches = {
    Avatars = {}
}

function discordloghistoryData(source, data)
    return {
        identifier = GetIdentifier(source),
        avatar = GetDiscordAvatar(source) or Config.ExampleProfilePicture,
        name = GetName(source),
        id = source,
        money = data.money,
        owneridentifier = data.owneridentifier,
    }
end

local FormattedToken = "Bot " .. bot_Token
function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest(
        "https://discordapp.com/api/" .. endpoint,
        function(errorCode, resultData, resultHeaders)
            data = { data = resultData, code = errorCode, headers = resultHeaders }
        end,
        method,
        #jsondata > 0 and json.encode(jsondata) or "",
        { ["Content-Type"] = "application/json", ["Authorization"] = FormattedToken }
    )

    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

function GetDiscordAvatar(user)
    local discordId = nil
    local imgURL = nil
    for _, id in ipairs(GetPlayerIdentifiers(user)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
            break
        end
    end

    if discordId then
        if Caches.Avatars[discordId] == nil then
            local endpoint = ("users/%s"):format(discordId)
            local member = DiscordRequest("GET", endpoint, {})

            if member.code == 200 then
                local data = json.decode(member.data)
                if data ~= nil and data.avatar ~= nil then
                    if (data.avatar:sub(1, 1) and data.avatar:sub(2, 2) == "_") then
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".gif"
                    else
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".png"
                    end
                end
            end
            Caches.Avatars[discordId] = imgURL
        else
            imgURL = Caches.Avatars[discordId]
        end
    end
    return imgURL
end

function sendDiscordLogHistory(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Tworst  Fashion - JOB FINISH',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false,            inline = true },
                    { name = "Player ID",   value = data.id or false,              inline = true },
                    { name = "Owner ID",    value = data.owneridentifier or false, inline = true },
                    {
                        name = "──────────Job Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Job Price", value = string.format("%s%d", Config.MoneyType, tonumber(data.money) or 'undefined'), inline = true },

                },
                footer = {
                    text = "Tworst Store - https://discord.gg/tworst",
                    icon_url =
                    "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['jobfinish'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

AddEventHandler('playerDropped', function(reason)
    local src = source
    local owneridentifier = GetIdentifier(src)
    local lobby = coopData[owneridentifier]
    if not lobby then return end
    if lobby.roomSetting then
        for _, player in ipairs(lobby.players) do
            if player.source == src then
                if lobby.roomSetting.Vehicle then
                    for k, v in pairs(lobby.roomSetting.Vehicle) do
                        local vehicle = v
                        if DoesEntityExist(vehicle) then
                            DeleteEntity(vehicle)
                        end
                    end
                end

                if lobby.roomSetting.Clothes then
                    for k, v in pairs(lobby.roomSetting.Clothes) do
                        Clothes[k] = nil
                        updateClothes(k)
                        for _, zone in ipairs(zonePlayers) do
                            TriggerClientEvent('tworst-fashion:client:deleteClothes', tonumber(zone), k)
                        end
                    end
                end

                if lobby.roomSetting.DeletedClothesBox then
                    for k, v in pairs(lobby.roomSetting.DeletedClothesBox) do
                        local object = NetworkGetEntityFromNetworkId(v.objectNetId)
                        if DoesEntityExist(object) then
                            DeleteEntity(object)
                        end
                    end
                end

                local emptyIndex = lobby.roomSetting and lobby.roomSetting.machineID or false
                if emptyIndex then
                    activeMactine[emptyIndex] = nil
                    MachineTable[emptyIndex] = false
                end

                if lobby.roomSetting.VehicleNetId then
                    for k, v in pairs(lobby.roomSetting.VehicleNetId) do
                        local vehicle = v
                        if DoesEntityExist(vehicle) then
                            DeleteEntity(vehicle)
                        end
                    end
                end

                if objectCountList[owneridentifier] then
                    for i = 1, objectCountList[owneridentifier] do
                        if objectTempData[owneridentifier] then
                            local objectData = objectTempData[owneridentifier][i]
                            if objectData then
                                local object = NetworkGetEntityFromNetworkId(objectData.objectNetId)
                                if DoesEntityExist(object) then
                                    DeleteEntity(object)
                                    objectCountList[owneridentifier] = objectCountList[owneridentifier] - 1
                                end
                            end
                        end
                    end
                end


                coopData[owneridentifier] = nil
                JoobTask[owneridentifier] = nil
                for _, remainingPlayer in ipairs(lobby.players) do
                    if remainingPlayer.source ~= src then
                        TriggerClientEvent('tworst-fashion:client:resetjob', remainingPlayer.source)
                        TriggerClientEvent('tworst-fashion:client:sendNotification', remainingPlayer.source,
                            Config.NotificationText['playerleftlobby'].text,
                            Config.NotificationText['playerleftlobby'].type)
                    else
                        TriggerClientEvent('tworst-fashion:client:resetjob', remainingPlayer.source)
                    end
                end
                break
            end
        end
    end
end)

function coordinatesMatch(coord1, coord2, tolerance)
    tolerance = tolerance or 0.1
    return math.abs(coord1.x - coord2.x) < tolerance and
        math.abs(coord1.y - coord2.y) < tolerance and
        math.abs(coord1.z - coord2.z) < tolerance
end

RegisterCommand('addexpfashion', function(source, args)
    if source > 0 then
        return
    end
    local xpCount = tonumber(args[2])
    if not xpCount then
        print("Error: xpCount must be a number.")
        return
    end
    ExecuteSql(string.format("INSERT INTO `fashion_tbx` (tbx, active, xpCount) VALUES (%q, '%s', %d)", args[1], 0,
        xpCount))
end)


local entityStates = {}

RegisterNetEvent('interact:setEntityHasOptions', function(netId)
    local entity = Entity(NetworkGetEntityFromNetworkId(netId))

    entity.state.hasInteractOptions = true
    entityStates[netId] = entity
end)

CreateThread(function()
    local arr = {}
    local num = 0

    while true do
        Wait(10000)

        for netId, entity in pairs(entityStates) do
            if not DoesEntityExist(entity.__data) or not entity.state.hasInteractOptions then
                entityStates[netId] = nil
                num += 1
                arr[num] = netId
            end
        end

        if num > 0 then
            TriggerClientEvent('interact:removeEntity', -1, arr)
            table.wipe(arr)

            num = 0
        end
    end
end)


RegisterNetEvent('tworst-fashion:server:OtherNuiClose', function(bool)
    local src = source
    local identifier = GetIdentifier(src)
    if Config.Inventory == 'qb_inventory' then
        if bool then
            exports['qb-inventory']:CloseInventory(src, identifier)
            local player = Player(source)
            if player then
                player.state.inv_busy = true
            end
        else
            local player = Player(source)
            if player then
                player.state.inv_busy = false
            end
        end
    end
end)
