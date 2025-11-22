Config = {}
Config.Debug = false

Config.Framework = {
    qb = {
        ResourceName = "qb-core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
    },
    esx = {
        ResourceName = "es_extended",
        PlayerLoaded = "esx:playerLoaded",
        PlayerUnload = "esx:playerDropped",
        OnJobUpdate = "esx:setJob",
    },
    qbx = {
        ResourceName = "qbx_core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
    },
}

Config.System = 'textui' -- OPTIONS: 'ox_target, qb-target, textui'

Config.QboxHasItemFix = false -- Set to true if using QBox

Config.GulagScript = false
Config.GulagTime = 1440 -- in Minutes

Config.Distance = 2.5 -- Distance
Config.CheckDistance = 3.0 -- Distance to check for dead players

Config.BodyBagProp = 'xm_prop_body_bag' -- Prop for the body bag
Config.WeightedCoffinProp = 'hei_prop_carrier_crate_01a' -- Prop for the weighted coffin

--# Funeral Announcement
Config.FuneralAnnouncementTitle = "Funeral Announcement"
Config.FuneralAnnouncementMessage = "Unfortunately, we have lost another soul"
Config.FuneralAnnouncementBottomMessage = "Rest in peace"
Config.FuneralAnnouncementTime = 10 -- in seconds


Config.AdminGroups = { 'admin', 'leadadmin', 'management', 'superadmin', 'god' }
Config.CKCommand = 'ck' -- Command to character kill

--#
Config.BodyBagItem = {
    Enabled = true,
    ItemName = 'bodybag',
    item = 'bodybag', -- New field for consistency
    ItemAmount = 1,
    remove = true,
}

Config.CoffinItem = {
    required = true, -- true =  coffin is required | false = no coffin item is required
    remove = true,
    item = 'coffin', -- Item name for the coffin
}

--Bury
Config.Shovel = {
    required = true, -- true =  shovel is required to bury a body | false = no shovel item is required
    remove = true,
    ShovelItem = 'dkshovel', -- item name for shovel (legacy)
    item = 'dkshovel' -- item name for shovel (new field for consistency)
}

--Bodybag
Config.BodyBag = {
    time = 2000, -- Time in milliseconds
    label = 'Placing inside Body Bag...',
    useWhileDead = false,
    canCancel = false,
    anim = {
        dict = 'missexile3',
        clip = 'ex03_dingy_search_case_base_michael',
        flag = 1
    },
    disable = {
        move = true,
        car = true,
        combat = true,
    }
}

Config.RemoveBodyBag = {
    time = 2000, -- Time in milliseconds
    label = 'Removing Body Bag...',
    useWhileDead = false,
    canCancel = false,
    anim = {
        dict = 'missexile3',
        clip = 'ex03_dingy_search_case_base_michael',
        flag = 1
    },
    disable = {
        move = true,
        car = true,
        combat = true,
    }
}

-- Deletion Settings
Config.DeletePlayerOwnedVehicle = true                 -- Should player-owned vehicles be deleted?
Config.DeleteCharacter = true                          -- Should the character be deleted?


-- SQL Tables
Config.ESXUsersTable       = 'users'
Config.ESXVehiclesTable    = 'owned_vehicles'
Config.QBCorePlayersTable  = 'players'
Config.QBCoreVehiclesTable = 'player_vehicles'
