Config = {}

-- Framework
Config.Framework = "qbcore" -- Set you framework: "qbcore" for QBCore and QBox frameworks, and "esx" for ESX Legacy framework

-- QBCore Framework
Config.QBCoreName = 'qb-core' -- QBCore script name, default is "qb-core". Keep this to "qb-core" if your framework is QBox

-- ESX Legacy Framework
Config.ESXLegacyName = "es_extended" -- You ESX Legacy script name must be correct to work (only if you use ESX Legacy Framework)

------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Inventory Settings -------------------------------------------------

-- Note: The Trade script currently works only on QBCore and ESX Legacy Frameworks 
-- QBCore Framework works with both "qb-inventory" and "ox_inventory" inventories scripts
-- ESX Legacy Framework works with only "ox_inventory" inventory script

Config.InventoryType = 'qb' -- Inventory type "qb" or "ox"
Config.InventoryName = 'qb-inventory' -- Inventory script name - "qb-inventory" or "ox_inventory" for QBCore Framework | "ox_inventory" for ESX Legacy Framework

Config.InvImagesLocation = 'qb-inventory/html/images/' -- Inventory images location - "qb-inventory/html/images/" for qb-inventory | "ox_inventory/web/images/" for ox_inventory

Config.ItemsAmountType = 'amount' -- For custom inventory items amount/count - "amount" for qb-inventory | "count" for ox_inventory

-- Inventory Slots & Weight
Config.MaxInventorySlots = 41 -- Max inventory slots for a player - "41" for qb-inventory or "50" for ox_inventory
Config.MaxInventoryWeight = 120000 -- in grams, max weight a player can carry, please check your inventory settings - examples: "120000" for qb-inventory | "30000" for ox_inventory | "24000" for ESX Framework

------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- Admin --------------------------------------------------------

Config.MenuCommand = 'adminitems' -- Command to open items menu
Config.AdminRole = 'admin' -- Admin permission to access the menu, QBCore default: "mod" | "admin" | "god"

------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------- Spawn Settings ----------------------------------------------------

Config.PlayersCooldown = 200 -- in MS, 200ms cooldown time of giving items between each player, for server side optimization and prevent late respond

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- Package Item Settings ------------------------------------------------

Config.PackageItem = 'packaged_items' -- Package item spawn name
Config.PackageWeight = 1000 -- in Grams, The Package item (packaged items) weight (default 1kg)

------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- Blacklisted Items ---------------------------------------------------

Config.BlacklistedItems = { -- Those items will not be shown in the items list, admins cannot spawn them
	'weapon_rpg',
	'weapon_grenadelauncher',
	'weapon_railgun',
	
	'black_money',
	
	-- more examples here
}

------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- Translations -----------------------------------------------------

Config.NewLine = '<br>' -- It depends on you notification system | "<br>" or "\n"

Config.Translations = {
	-- UI Translations
	['search']						= 'Search...',
	['item_infos']					= 'Show item informations',
	['spawn_selected']				= 'Spawn selected',
	['clear_selected']				= 'Clear selected',
	['show_more']					= 'show more',
	
	['selected_items']				= 'Selected Items',
	['amount']						= 'amount',
	['spawn_as_package']			= 'Spawn selected items as a Package',
	['target_players']				= 'Target Players',
	['spawn_for_myself']			= 'Spawn for myself',
	['selected_players']			= 'Selected Players',
	['select_all_players']			= 'Select all players',
	['select_closest_players']		= 'Select closest players',
	['distance'] 					= 'distance',
	['spawn_items']					= 'Spawn Items',
	
	['search_player']				= 'Search for Player',
	['refresh_list']				= 'Refresh List',
	['id_name']						= 'id, name...',
	
	['spawn_list']					= 'Spawns progress list',
	['clear_list']					= 'Clear list',
	
	['items_spawned_successfully']	= 'Items spawned successfully',
	['player_offline']				= 'Player offline',
	['no_empty_slots']				= "Player doesn't have empty slots",
	['no_enough_weight']			= "Player doesn't have enough weight",
	
	['packaged_items']				= 'Packaged Items',
	['extract']						= 'Extract',
	['destroy_package']				= 'Destroy Package',
	['extracting']					= 'Extracting',
	['extracting_amout']			= 'extracting amout...',
	
	['destroy_confirmation']		= 'Destroy Package confirmation',
	['destroy_infos']				= 'Are you sure you want to destroy this package ?<br>All items inside the package will be permanently removed and are non-refundable.',
	
	['confirm']						= 'Confirm',
	['cancel']						= 'Cancel',
	
	-- Discord Logs
	['spawned']						= 'Spawned',
	['package']						= 'Package',
	['items']						= 'Items',
	['for_players']					= 'For Players',
	['extracted_item_package']		= 'Extracted item from package',
	['status']						= 'Status',
	['destroyed_package']			= 'Destroyed Package',
	['not_enough_weight']			= 'Not Enough Weight',
	['not_enough_slots']			= 'Not Enough Slots',
	['extracted_successfully']		= 'Extracted successfully',
	['dont_have_enough_space']		= 'Doesn\'t have enough space',
	
	-- Notifications
	['received_package']			= 'You have received a Package from admin',
	['you_received']				= 'You have received',
	['from_admin']					= 'from admin',
	['successfully_extracted']		= 'successfully extracted',
	['cant_extract_item']			= 'Can\'t extract selected item',
	['package_not_exist']			= 'Package doesn\'t exist',
	['successfully_destroyed']		= 'Package has been successfully destroyed',
	['cannot_be_destroyed']			= 'Package cannot be destroyed',
	['package_doesnt_exist']		= 'Package doesn\'t exist',
	
	-- Command Description
	['command_description']			= 'Advanced items spawner menu (admin only)',
}

