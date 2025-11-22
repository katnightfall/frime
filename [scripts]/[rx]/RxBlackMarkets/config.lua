--[[
BY RX Scripts © rxscripts.xyz
--]]

Config = {}

Config.Locale = 'en'
Config.ImgDirectory = 'ox_inventory/web/images/' -- The directory where the images are stored.

Config.TrackClosestMarket = {                    -- Tracks the most nearby black market the player has access to.
    enabled = true,
    item = 'tracker',                            -- Do not use the same item as other markets have as tracker.
    remove = true,
    time = 60,
}

Config.Commands = {
    resetStock = 'bm:resetstock' -- Command to reset the stock of all black markets as admin.
}

Config.BlackMarkets = {
    ['Criminal Market'] = {                -- The name of the black market must be unique.
        purchaseCooldown = 0,            -- The cooldown in seconds before the player can purchase again.
        openObject = {
            type = 'prop',                 -- 'prop' or 'npc'
            propModel = 'prop_laptop_01a', -- The model of the prop that will be spawned, only used if type is 'prop'.
            npcModel = 'a_m_y_hasjew_01',  -- The model of the ped that will be spawned, only used if type is 'npc'.
        },
        locations = {                      -- Every server restart the black market will be randomized to one of these locations.
            vector4(92.7370, 3754.4297, 40.5986, 70.0),
            vector4(92.8279, 3751.4629, 40.7711, 326.4801),
        },
        trackLocation = {
            enabled = true,
            item = 'phone', -- Unique item that will be used to track the location of the black market.
            remove = true,  -- If this is set to true, the item will be removed from the players inventory.
            time = 60,      -- The amount of time in seconds that the blip/route will be shown on the map.
        },
        requiredItem = {
            enabled = true,
            item = 'phone',
            remove = false, -- If this is set to true, the item will be removed on opening the black market.
        },
        jobsRequired = {
            enabled = false,
            jobs = {
                "dealer",
            }
        },
        pickupPurchase = {
            enabled = true,                -- If this is set to false, the pickup will be ignored and the item will be added to the players inventory directly.
            npcModel = 'g_m_m_chicold_01', -- The model of the ped that will be spawned.
            locations = {
                vector4(372.2360, 3409.7803, 35.4053, 66.8821),
                vector4(1349.6370, 4315.6445, 37.3671, 68.9693),
            },
        },
        randomizeItems = {
            enabled = false, -- If this is set to true, random items from the items list will be selected.
            amount = 3,      -- The amount of items that will be selected from the items list.
        },
        currency = {
            account = 'black_money', -- The account that will be used to pay for the items if item is disabled
            item = {
                enabled = false,     -- If this is set to true, the item will be used to pay for the items.
                name = 'coin',       -- The name of the item that will be used to pay for the items.
                label = 'Coin',      -- The label of the item that will be used to pay for the items.
            },
        },
        stockSystem = {
            enabled = true,      -- Enable/disable stock system for this market
            resetType = 'time',  -- 'time' for periodic reset, 'restart' for server restart reset
            resetInterval = 24,  -- Hours between stock resets (only used if resetType is 'time')
            resetTime = '00:00', -- Time of day to reset stock (24h format: 'HH:MM', only used if resetType is 'time')
            globalStock = true, -- If true, stock is shared across all players. If false, each player has individual stock limits
        },
        items = {
            ["Weapons"] = {
                {
                    item = "WEAPON_ASSAULTRIFLE",
                    label = 'Assault Rifle',
                    price = 150000,
                    stock = 10,  -- Maximum stock available (optional, if not set, unlimited stock)
                },
                {
                    item = "WEAPON_MINISMG",
                    label = 'Mini SMG',
                    price = 120000,
                    stock = 10,  -- Maximum stock available (optional, if not set, unlimited stock)
                },
                {
                    item = "WEAPON_PISTOL",
                    label = 'Pistol',
                    price = 85000,
                    stock = 10,  -- Maximum stock available (optional, if not set, unlimited stock)
                },
                {
                    item = "WEAPON_PISTOL50",
                    label = 'Pistol .50',
                    price = 97500,
                },
                {
                    item = "WEAPON_SAWNOFFSHOTGUN",
                    label = 'Sawed Off Shotgun',
                    price = 135000,
                },
            },
            ["Ammo"] = {
                {
                    item = "ammo-rifle",
                    label = 'Rifle Ammo',
                    price = 100,
                },
                {
                    item = "ammo-rifle2",
                    label = 'Rifle Ammo 2',
                    price = 100,
                },
            },
            ["Armor"] = {
                {
                    item = "armour",
                    label = 'Armour',
                    price = 3500,
                },
            },
            ["Attachments"] = {
                {
                    item = "at_flashlight",
                    label = 'Flashlight',
                    price = 100,
                },
            },
        }
    },
}

--[[
    ONLY CHANGE THIS PART IF YOU HAVE RENAMED SCRIPTS SUCH AS FRAMEWORK, TARGET, INVENTORY ETC
    RENAME THE SCRIPT NAME TO THE NEW NAME
--]]
---@type table Only change these if you have changed the name of a resource
Resources = {
    FM = { name = 'fmLib', export = 'new' },
    -- OXTarget = { name = 'ox_target', export = 'all' },
    -- QBTarget = { name = 'qb-target', export = 'all' },
}
IgnoreScriptFoundLogs = false
ShowDebugPrints = false
