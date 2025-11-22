Citizen.CreateThread(function()
	if Config.Inventory.script == 'auto' then
		if GetResourceState('ak47_qb_inventory') == 'started' or GetResourceState('ak47_qb_inventory') == 'starting' then
			Config.Inventory.script = 'ak47_qb_inventory'
			return
		end
		if GetResourceState('qb-inventory') == 'started' or GetResourceState('qb-inventory') == 'starting' then
			Config.Inventory.script = 'qb-inventory'
			return
		end
		if GetResourceState('lj-inventory') == 'started' or GetResourceState('lj-inventory') == 'starting' then
			Config.Inventory.script = 'qb-inventory-old'
			return
		end
		if GetResourceState('ps-inventory') == 'started' or GetResourceState('ps-inventory') == 'starting' then
			Config.Inventory.script = 'ps-inventory'
			return
		end
		if GetResourceState('ox_inventory') == 'started' or GetResourceState('ox_inventory') == 'starting' then
			Config.Inventory.script = 'ox_inventory'
			return
		end
		if GetResourceState('qs-inventory') == 'started' or GetResourceState('qs-inventory') == 'starting' then
			Config.Inventory.script = 'qs-inventory'
			return
		end
		if GetResourceState('mf-inventory') == 'started' or GetResourceState('mf-inventory') == 'starting' then
			Config.Inventory.script = 'mf-inventory'
			return
		end
		if GetResourceState('cheeza_inventory') == 'started' or GetResourceState('cheeza_inventory') == 'starting' then
			Config.Inventory.script = 'cheeza_inventory'
			return
		end
		if GetResourceState('core_inventory') == 'started' or GetResourceState('core_inventory') == 'starting' then
			Config.Inventory.script = 'core_inventory'
			return
		end
		if GetResourceState('codem-inventory') == 'started' or GetResourceState('codem-inventory') == 'starting' then
			Config.Inventory.script = 'codem-inventory'
			return
		end
	end
end)

AddEventHandler('ak47_qb_housing:openinventory', function(hid, uid, weight, slots)
	local identifier = 'housing:'..hid..':'..uid
	if Config.Inventory.script == 'ak47_qb_inventory' then
		exports["ak47_qb_inventory"]:OpenInventory({identifier = identifier, type = 'stash', label = identifier:upper(), maxWeight = weight * 1000, slots = slots})
	elseif Config.Inventory.script == 'qb-inventory-old' then
		TriggerServerEvent("inventory:server:OpenInventory", "stash", identifier, {maxweight = weight * 1000, slots = slots})
        TriggerEvent("inventory:client:SetCurrentStash", identifier)
    elseif Config.Inventory.script == 'ps-inventory' then
		TriggerServerEvent("ps-inventory:server:OpenInventory", "stash", identifier, {maxweight = weight * 1000, slots = slots})
        TriggerEvent("ps-inventory:client:SetCurrentStash", identifier)
    elseif Config.Inventory.script == 'qb-inventory' then
		TriggerServerEvent("ak47_qb_housing:OpenQbInventory", identifier, {maxweight = weight * 1000, slots = slots, label = 'Housing:'..hid})
	elseif Config.Inventory.script == 'ox_inventory' then
		TriggerServerEvent('ak47_qb_housing:registeroxinventory', hid, {weight = weight, slots = slots}, uid)
		exports["ox_inventory"]:openInventory('stash', identifier)
	elseif Config.Inventory.script == 'qs-inventory' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", identifier, {maxweight = weight, slots = slots})
        TriggerEvent("inventory:client:SetCurrentStash", identifier)
    elseif Config.Inventory.script == 'mf-inventory' then
        exports["mf-inventory"]:openOtherInventory(identifier)
    elseif Config.Inventory.script == 'cheeza_inventory' then
        TriggerEvent('inventory:openHouse', 'HousingStash', identifier, "Stash", weight)
    elseif Config.Inventory.script == 'core_inventory' then
        TriggerServerEvent('core_inventory:server:openInventory', identifier, 'stash')
    elseif Config.Inventory.script == 'codem-inventory' then
        TriggerServerEvent('codem-inventory:server:openstash', identifier, slots, weight, identifier)
	end
end)