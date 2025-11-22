-- Add your Discord webhook here if you have enabled logging
logging.webhook = ""

-- These setup the foundations for ESX / vRP / QBCore permissions
QBCore = nil
vRP = nil
ESX = nil

if Permissions.ESX.Enabled or Inventory.ESX then
    ESX = exports["es_extended"]:getSharedObject()
end

if Permissions.vRP.Enabled or Inventory.vRP then
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
end

if Permissions.QBCore.Enabled or Inventory.qbCore then
    QBCore = exports["qb-core"]:GetCoreObject()
end

-- End of permissions setup

function HandleInventoryItems(source, itemName, give)
    if Inventory.vRP then
        local userID = vRP.getUserId({source})
        if give then
            vRP.giveInventoryItem({userId, itemName, 1, false})
        else
            if vRP.tryGetInventoryItem({userID, itemName, 1, false}) then
                return true
            else
                return false
            end
        end
    elseif Inventory.qbCore then
        if give then
            exports['qb-inventory']:AddItem(source, itemName, 1, false, false, GetCurrentResourceName())
        else
            local successful = exports['qb-inventory']:RemoveItem(source, itemName, 1, false, GetCurrentResourceName())

            return successful
        end
    elseif Inventory.ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if give then
            xPlayer.addInventoryItem(itemName, 1)
        else
            local returnedItem = xPlayer.getInventoryItem(itemName)

            if returnedItem.canRemove then
                xPlayer.removeInventoryItem(itemName, 1)
                return true
            else
                return false
            end
        end
    elseif Inventory.oxInventory then
        if give then
            exports.ox_inventory:AddItem(source, itemName, 1)
        else
            local successful = exports.ox_inventory:RemoveItem(source, itemName, 1)

            return successful
        end
    elseif Inventory.quasarInventory then
        if give then
            exports['qs-inventory']:AddItem(source, itemName, 1)
        else
            local quantity = exports['qs-inventory']:GetItemTotalAmount(source, itemName)
            if quantity > 0 then
                exports['qs-inventory']:RemoveItem(source, itemName, 1)

                return true
            else
                return false
            end
        end
    elseif Inventory.coreInventory then
        if give then
            exports.core_Inventory:addItem(source, itemName, 1)
        else
            local successful = exports.core_Inventory:removeItem(source, itemName, 1)

            return successful
        end
    end
end

function UserHasPermission(source, location)

    if not location.EnablePermissions then
        return true
    end

    if location.AcePermissions.Enabled then
        return true
    end

    -- ESX Permissions
    if location.ESX.Enabled then
        local xPlayer = ESX.GetPlayerFromId(source)
        if location.ESX.CheckJob.Enabled then
            for k, v in pairs(location.ESX.CheckJob.Jobs) do
                if xPlayer.job.name == v then
                    return true
                end
            end
        end
    end

    -- vRP Permission
    if location.vRP.Enabled then
        if location.vRP.CheckPermission.Enabled then
            for k, v in pairs(location.vRP.CheckPermission.Permissions) do
                if vRP.hasPermission({vRP.getUserId({source}),v}) then
                    return true
                end
            end
        end

        if location.vRP.CheckGroup.Enabled then
            for k, v in pairs(location.vRP.CheckGroup.Groups) do
                if vRP.hasGroup({vRP.getUserId({source}),v}) then
                    return true
                end
            end
        end
    end

    -- QBCore Permission
    if location.QBCore.Enabled then
        local player = QBCore.Functions.GetPlayer(source)
        if location.QBCore.CheckJob.Enabled then
            for k, v in pairs(location.QBCore.CheckJob.Jobs) do
                if player.PlayerData.job.name == v then
                    return true
                end
            end
        end
        if location.QBCore.CheckPermission.Enabled then
            for k, v in pairs(location.QBCore.CheckPermission.Permissions) do
                if QBCore.Functions.HasPermission(source, v) then
                    return true
                end
            end
        end
    end

    if location.QBX.Enabled then
        local player = exports.qbx_core:GetPlayer(source)
        if location.QBX.CheckJob.Enabled then
            for k, v in pairs(location.QBX.CheckJob.Jobs) do
                if player.PlayerData.job.name == v then
                    return true
                end
            end
        end
    end

    return false
end

-- This handles the Discord logging system
function normalLog(source, action, data)
    if not logging.enabled then return nil end
    local embed = {
        {
            ["fields"] = {
              {
                  ["name"] = "**Player:**",
                  ["value"] = GetPlayerName(source).." ("..source..")",
                  ["inline"] = true
              },
              {
                  ["name"] = "**Action:**",
                  ["value"] = action,
                  ["inline"] = false
              },
              {
                  ["name"] = "**Data:**",
                  ["value"] = tostring(data),
                  ["inline"] = false
              },
            },
            ["color"] = logging.colour,
            ["title"] = logging.title,
            ["description"] = "",
            ["footer"] = {
                ["text"] = "Timestamp: "..os.date(logging.dateFormat),
                ["icon_url"] = logging.footerIcon,
            },
            ["thumbnail"] = {
                ["url"] = logging.icon,
            },
        }
    }
    PerformHttpRequest(logging.webhook, function(err, text, headers) end, 'POST', json.encode({username = logging.displayName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end