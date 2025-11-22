-- ====================================================================================
--                                    RoadToSix
-- ====================================================================================


CreateThread(function()
    for i = 1, #Config.Items do
        QBCore.Functions.CreateUseableItem(Config.Items[i], function(source)
            TriggerClientEvent("roadcarplay:client:install", source)
        end)
    end

    for i = 1, #Config.RemoveItems do
        QBCore.Functions.CreateUseableItem(Config.RemoveItems[i], function(source)
            TriggerClientEvent("roadcarplay:client:remove", source)
        end)
    end
end)


-- WEBHOOKS

function discordLog(color, name, message, footer, image, webhook, username)
    if not message then
        message = ''
    end

    if not username then
        username = 'RoadCarplay'
    end

    local embed;

    if image then
        embed = { {
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["image"] = {
                url = image
            },
            ["footer"] = {
                ["text"] = footer
            }
        } }
    else
        embed = { {
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer
            }
        } }
    end

    if webhook == 'DISCORD WEBHOOK' then
        return
    end

    PerformHttpRequest(webhook, function(err, text, headers)
    end, 'POST', json.encode({
        username = username,
        embeds = embed
    }), {
        ['Content-Type'] = 'application/json'
    })
end

function getWeather()
    local weather = {
        ExtraSunny = { 90, 110 },
        Clear = { 80, 95 },
        Neutral = { 80, 95 },
        Smog = { 90, 95 },
        Foggy = { 80, 90 },
        Clouds = { 80, 90 },
        Overcast = { 80, 80 },
        Clearing = { 75, 85 },
        Raining = { 75, 90 },
        ThunderStorm = { 75, 90 },
        Blizzard = { -15, 10 },
        Snowing = { 0, 32 },
        Snowlight = { 0, 32 },
        Christmas = { -5, 15 },
        Halloween = { 50, 80 }
    }

    return weather
end

RegisterCommand('fixcarplay', function(source)
    TriggerEvent('roadcarplay:playerLoad', source)
end)

AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
    for i = 1, #Config.Items do
        if name == Config.Items[i] then
            TriggerClientEvent("roadcarplay:client:install", playerId)
            break
        end
    end

    
    for i = 1, #Config.RemoveItems do

        if name == Config.RemoveItems[i] then
            TriggerClientEvent("roadcarplay:client:remove", playerId)
            break
        end
    end
end)
