QBCore = exports['qb-core']:GetCoreObject()

GetSource = function(xPlayer)
	return xPlayer.PlayerData.source
end

GetPlayer = function(source)
	return QBCore.Functions.GetPlayer(source)
end

GetSourceFromIdentifier = function(identifier)
	return GetPlayerFromIdentifier(identifier).PlayerData.source
end

GetPlayers = function()
	return QBCore.Functions.GetPlayers()
end

GetJob = function(source)
	local Player = GetPlayer(source)
	return Player and Player.PlayerData.job
end

GetPlayerFromIdentifier = function(cid)
	return QBCore.Functions.GetPlayerByCitizenId(cid)
end

AddItem = function(source, item, amount, meta)
	local xPlayer = GetPlayer(source)
	return xPlayer.Functions.AddItem(item, amount, meta)
end

RemoveItem = function(source, item, amount)
	local xPlayer = GetPlayer(source)
	return xPlayer.Functions.RemoveItem(item, amount)
end

GetMoney = function(source, account)
	local xPlayer = GetPlayer(source)
	return xPlayer.PlayerData.money[account]
end

AddMoney = function(source, account, amount)
	local xPlayer = GetPlayer(source)
	if account == Config.MarkedbillItem.item then
		if Config.MarkedbillItem.usemetavalue then
			for i, v in pairs(xPlayer.PlayerData.items) do
	            if v.name == Config.MarkedbillItem.item then
	                xPlayer.Functions.RemoveItem(Config.MarkedbillItem.item, 1)
	                if v.info and v.info.worth then
	                    amount = amount + v.info.worth
	                elseif v.metadata and v.metadata.worth then
	                    amount = amount + v.metadata.worth
	                end
	                break
	            end
	        end
	        xPlayer.Functions.AddItem(Config.MarkedbillItem.item, 1, nil, {worth = amount})
	    else
	    	xPlayer.Functions.AddItem(Config.MarkedbillItem.item, amount)
	    end
	else
		xPlayer.Functions.AddMoney(account, amount)
	end
end

RemoveMoney = function(source, account, amount)
	local xPlayer = GetPlayer(source)
	xPlayer.Functions.RemoveMoney(account, amount)
end

GetIdentifier = function(source)
	local xPlayer = GetPlayer(source)
	return xPlayer and xPlayer.PlayerData.citizenid
end

GetInventory = function(source)
	local xPlayer = GetPlayer(source)
	return xPlayer.PlayerData.items
end

GetInventoryItem = function(source, item)
	local xPlayer = GetPlayer(source)
	local inv = xPlayer.Functions.GetItemByName(item)
	return inv and (inv.amount or inv.count) or 0
end

HasEnoughItem = function(source, item, amount)
	local xPlayer = GetPlayer(source)
	local inv = xPlayer.Functions.GetItemByName(item)
	return inv and ((inv.amount and inv.amount >= amount) or (inv.count and inv.count >= amount)) or false
end

GetItems = function()
	if GetResourceState('qs-inventory') == 'started' then
		return exports['qs-inventory']:GetItemList()
	elseif GetResourceState('ox_inventory') == 'started' then
		return exports['ox_inventory']:Items()
	else
		return QBCore.Shared.Items
	end
end

GetItemLabel = function(item)
    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[item] then
	   return QBCore.Shared.Items[item].label
    else
        print('^1Item: ^3['..item..']^1 missing in qb-core/shared/items.lua^0')
        return item
    end
end

AddSocietyMoney = function(job, money)
	Citizen.CreateThread(function()
		exports['qb-banking']:AddMoney(job, money)
	end)
end

GetIdentifierByType = function(playerId, idtype)
    local src = source
    for _, identifier in pairs(GetPlayerIdentifiers(playerId)) do
        if string.find(identifier, idtype) then
            return identifier
        end
    end
    return nil
end

GetName = function(source)
	local xPlayer = GetPlayer(source)
    return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
end

CanCarryItem = function(source, item, amount)
	return true
end

IsAdmin = function(source)
	local xPlayer = GetPlayer(source)
	if (Config.AdminWithAce and IsPlayerAceAllowed(source, 'command')) then
		print("^3["..source.."] ^2Permission Granted With Ace^0")
		return true
	elseif  Config.AdminWithLicense[GetIdentifierByType(source, 'license')] then
		print("^3["..source.."] ^2Permission Granted With License^0")
		return true
	elseif Config.AdminWithIdentifier[GetIdentifier(source)] then
		print("^3["..source.."] ^2Permission Granted With Identifier^0")
		return true
	end
	return false
end

IsVehicleOwner = function(source, plate)
	local identifier = GetIdentifier(source)
    local found = MySQL.Sync.fetchScalar('SELECT 1 FROM '..Config.OwnedVehiclesTable..' WHERE `citizenid` = ? AND `plate` = ?', {identifier, plate})
    return found and found > 0
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

CreateUseableItem = QBCore.Functions.CreateUseableItem

CreateUseableItem('spraycan', function(source)
	TriggerClientEvent('ak47_qb_territories:tryspray', source)
end)

CreateUseableItem('paintremover', function(source)
	TriggerClientEvent('ak47_qb_territories:tryremovegraffiti', source)
end)

Notify = function(source, msg, type)
	TriggerClientEvent('ak47_qb_territories:notify', source, msg, type)
end

GetActiveCops = function()
	local xPlayers = GetPlayers()
	local count = 0
	for i, v in pairs(xPlayers) do
		local job = GetJob(v)
		if job and Config.Cops[job.name] and job.onduty then
			count += 1
		end
	end
	return count
end

GetActiveMaxGangMemberCount = function(except)
	local xPlayers = GetPlayers()
	local gangs = {}

	for i, v in pairs(xPlayers) do
	    local p = Player(v).state
	    if p.gangtag and Gangs[p.gangtag] and except ~= p.gangtag then
	        if not gangs[p.gangtag] then
	            gangs[p.gangtag] = {}
	        end
	        table.insert(gangs[p.gangtag], v)
	    end
	end

	local maxMembers = 0
	local maxGang = nil

	for gang, members in pairs(gangs) do
	    local count = #members
	    if count > maxMembers then
	        maxMembers = count
	        maxGang = gang
	    end
	end

	return maxMembers
end

GetActiveGangMembersIdByTag = function(tag)
	local xPlayers = GetPlayers()
	local members = {}
	for i, v in pairs(xPlayers) do
		if Player(v).state.gangtag and Player(v).state.gangtag == tag then
			table.insert(members, v)
		end
	end
	return members
end

GetGangList = function()
    local gangTable = {}
    if Gangs and next(Gangs) then
        for i, v in pairs(Gangs) do
            gangTable[v.tag] = {
                label = v.label,
                grades = {}
            }
            local ranks = json.decode(v.ranks)
            for j, k in pairs(ranks) do
                gangTable[v.tag].grades[k.id] = {
                    name = k.label
                }
            end
        end
    end
    return gangTable
end
exports('GetGangList', GetGangList)

GetPlayerGang = function(source)
    local identifier = GetIdentifier(source)
    local mygang = MySQL.Sync.fetchAll('SELECT * FROM ak47_qb_territory_gangmembers WHERE identifier = ?',
        { identifier })[1]

    if mygang then
    	return {
    		tag = mygang.tag,
            label = mygang.label,
            rankid = mygang.rankid,
            ranktag = mygang.ranktag,
            ranklabel = mygang.ranklabel,
    	}
    end
    return {}
end
exports('GetPlayerGang', GetPlayerGang)

GetPlayerGangName = function(source)
    local gang = GetPlayerGang(source)
    return gang and gang.tag
end
exports('GetPlayerGangName', GetPlayerGangName)

GetPlayerGangRank = function(source)
    local gang = GetPlayerGang(source)
    return gang and gang.rankid
end
exports('GetPlayerGangRank', GetPlayerGangRank)