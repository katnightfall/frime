Webhook = 'https://discord.com/api/webhooks/1181716468296073296/e9QX4Lk-O2jnHervqwGGPghdl3dmdATS2fbY6rwFwL_iz61Z8lbJIt7kOgXiv7eSF3n7' -- Add webhook here to log shop purchases.

GetCampingIdentifier = function(src)
    if GetResourceState('qb-core') == "started" then
        local QBCore = exports['qb-core']:GetCoreObject()
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end
        return Player.PlayerData.citizenid
    elseif GetResourceState('qbx_core') == "started" then
        local Player = exports.qbx_core:GetPlayer(src)
        if not Player then return end
        return Player.citizenid
    elseif GetResourceState('es_extended') == "started" then
        local ESX = exports['es_extended']:getSharedObject()
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then return end
        return xPlayer.getIdentifier()
    end
end

local CreateUsableItems = function(itemName, propModel, triggerFunction)
    if GetResourceState('qb-core') == "started" then
        local QBCore = exports['qb-core']:GetCoreObject()
        QBCore.Functions.CreateUseableItem(itemName, function(source, item)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            if not player then return end
            triggerFunction(src, propModel, itemName)
        end)
    elseif GetResourceState('qbx_core') == "started" then
        exports.qbx_core:CreateUseableItem(itemName, function(source, item)
            local src = source
            local player = exports.qbx_core:GetPlayer(src)
            if not player then return end
            triggerFunction(src, propModel, itemName)
        end)
    elseif GetResourceState('es_extended') == "started" then
        local ESX = exports['es_extended']:getSharedObject()
        ESX.RegisterUsableItem(itemName, function(source)
            local src = source
            local xPlayer = ESX.GetPlayerFromId(source)
            if not xPlayer then return end
            triggerFunction(src, propModel, itemName)
        end)
    end

    if Config.UseConsumables then
        -- Drinks
        for k, _ in pairs(DrinksMeta) do
            XM.RegisterItemUseable(k, "xmmx_letscampplus:consumable:Drink")
        end
        -- Eats
        for k, _ in pairs(EatsMeta) do
            XM.RegisterItemUseable(k, "xmmx_letscampplus:consumable:Eat")
        end
    end
end

local registerUsableItems = function()
    for _, item in ipairs(Config.CampProps) do
        CreateUsableItems(item.name, item.model, function(source, propModel, itemName)
            TriggerClientEvent('xmmx_letscampplus:client:spawnProp', source, propModel, itemName)
        end)
    end
end

RegisterNetEvent("xmmx_letscampplus:server:toggleItem", function(playerId, give, item, amount)
    local src = source

    if not XM.ValidateCaller(tonumber(playerId), src, "xmmx_letscampplus:server:toggleItem") then return end
    
    XM.ToggleItem(src, give, item, amount)
end)

CreateThread(function()
    registerUsableItems()
end)