Config = {}

-- General Settings
Config.Debug = true -- Enable debug mode to see debug messages in console

-- Framework Detection
-- 'auto' - Will attempt to detect automatically
-- 'esx' - Force ESX framework
-- 'qbcore' - Force QBCore framework
Config.Framework = 'auto'

-- Inventory System
-- 'auto' - Will attempt to detect automatically
-- 'ox' - Force ox_inventory
-- 'qb' - Force qb-inventory
-- 'qs' - Force qs-inventory
Config.Inventory = 'ox'

-- Command Settings
Config.Command = {
    enabled = true,
    name = 'scratchserial',
    help = 'Scratch the serial number from your current weapon'
}

-- Item Settings
Config.Item = {
    enabled = true,
    name = 'serial_scratcher', -- Item name in inventories
    label = 'Serial Number Scratcher' -- Display name for the item
}

-- Notification Settings
-- 'ox' - Use ox_lib notifications
-- 'framework' - Use framework-specific notifications
-- 'chat' - Use chat messages
-- 'all' - Use all notification types
Config.Notification = {
    type = 'ox',
    duration = 5000
}

-- Progress Bar Settings
Config.ProgressBar = {
    enabled = true,
    duration = 10000, -- Duration in milliseconds
    label = 'Scratching Serial Number',
    useWhileDead = false,
    canCancel = true,
    disable = {
        car = true,
        combat = true,
        sprint = true
    },
    animation = {
        dict = 'missmic4',
        clip = 'michael_tux_fidget'
    }
}

-- Locale Settings
Config.Locale = {
    serial_removed = 'Serial number removed',
    doesnt_have_weapon = 'You don\'t have a weapon equipped',
    scratching_gun_serial = 'Scratching serial number',
    scratched_serial = 'SCRATCHED',
    already_scratched = 'This weapon\'s serial number is already scratched!',
    no_serial_scratcher = 'You need a serial scratcher to remove weapon serial numbers!'
}