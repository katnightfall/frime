QBCore = exports['qb-core']:GetCoreObject()

GetMoney = function(source, account)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if account == 'coin' then
        return GetCoin(xPlayer.PlayerData.citizenid)
    end
    return xPlayer.PlayerData.money[account]
end

AddMoney = function(source, account, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if account == 'coin' then
        return AddCoin(xPlayer.PlayerData.citizenid, amount)
    end
    xPlayer.Functions.AddMoney(account, amount)
end

RemoveMoney = function(source, account, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if account == 'coin' then
        return RemoveCoin(xPlayer.PlayerData.citizenid, amount)
    end
    xPlayer.Functions.RemoveMoney(account, amount)
end

GetCoin = function(identifier)
    local result = MySQL.Sync.fetchAll('SELECT * FROM '..Config.SpecialCoin.tablename..' WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {identifier})
    return result and result[1] and result[1][Config.SpecialCoin.coincolumname] or 0
end

AddCoin = function(identifier, amount)
    MySQL.Async.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' + ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
end

RemoveCoin = function(identifier, amount)
    MySQL.Async.execute('UPDATE '..Config.SpecialCoin.tablename..' SET '..Config.SpecialCoin.coincolumname..' = '..Config.SpecialCoin.coincolumname..' - ? WHERE `'..Config.SpecialCoin.identifiercolumname..'` = ?', {amount, identifier})
end

function hasEnoughItem(source, item, quantity)
    local quantity = quantity or 1
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local inv = xPlayer.Functions.GetItemByName(item)
    if inv and ((inv.amount and inv.amount >= quantity) or (inv.count and inv.count >= quantity)) then
        return true
    end
    return false
end

function GetItemLabel(item)
    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[item] then
	   return QBCore.Shared.Items[item].label
    else
        print('^1Item: ^3['..item..']^1 missing in qb-core/shared/items.lua^0')
        return item
    end
end

function addSocietyMoney(money)
    if GetResourceState('okokBanking') == 'started' then
        exports['okokBanking']:AddMoney(Config.Realestate.Job, money)
        return
    end
    if Config.SocietyInManagement then
        exports['qb-management']:AddMoney(Config.Realestate.Job, money)
    else
        exports['qb-banking']:AddMoney(Config.Realestate.Job, money)
    end
end