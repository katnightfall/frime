local WeaponsRaw = {
    [`weapon_unarmed`]               = { name = 'weapon_unarmed', label = 'Fists'},
    [`weapon_dagger`]                = { name = 'weapon_dagger', label = 'Dagger'},
    [`weapon_bat`]                   = { name = 'weapon_bat', label = 'Bat'},
    [`weapon_bottle`]                = { name = 'weapon_bottle', label = 'Broken Bottle'},
    [`weapon_crowbar`]               = { name = 'weapon_crowbar', label = 'Crowbar'},
    [`weapon_flashlight`]            = { name = 'weapon_flashlight', label = 'Flashlight'},
    [`weapon_golfclub`]              = { name = 'weapon_golfclub', label = 'Golfclub'},
    [`weapon_hammer`]                = { name = 'weapon_hammer', label = 'Hammer'},
    [`weapon_hatchet`]               = { name = 'weapon_hatchet', label = 'Hatchet'},
    [`weapon_knuckle`]               = { name = 'weapon_knuckle', label = 'Knuckle'},
    [`weapon_knife`]                 = { name = 'weapon_knife', label = 'Knife'},
    [`weapon_machete`]               = { name = 'weapon_machete', label = 'Machete'},
    [`weapon_switchblade`]           = { name = 'weapon_switchblade', label = 'Switchblade'},
    [`weapon_nightstick`]            = { name = 'weapon_nightstick', label = 'Nightstick'},
    [`weapon_wrench`]                = { name = 'weapon_wrench', label = 'Wrench'},
    [`weapon_battleaxe`]             = { name = 'weapon_battleaxe', label = 'Battle Axe'},
    [`weapon_poolcue`]               = { name = 'weapon_poolcue', label = 'Poolcue'},
    [`weapon_briefcase`]             = { name = 'weapon_briefcase', label = 'Briefcase'},
    [`weapon_briefcase_02`]          = { name = 'weapon_briefcase_02', label = 'Briefcase'},
    [`weapon_garbagebag`]            = { name = 'weapon_garbagebag', label = 'Garbage Bag'},
    [`weapon_handcuffs`]             = { name = 'weapon_handcuffs', label = 'Handcuffs'},
    [`weapon_bread`]                 = { name = 'weapon_bread', label = 'Baquette'},
    [`weapon_stone_hatchet`]         = { name = 'weapon_stone_hatchet', label = 'Stone Hatchet'},
    [`weapon_candycane`]             = { name = 'weapon_candycane', label = 'Candy Cane' },

    -- Handguns
    [`weapon_pistol`]                = { name = 'weapon_pistol', label = 'Pistol'},
    [`weapon_pistol_mk2`]            = { name = 'weapon_pistol_mk2', label = 'Pistol Mk2'},
    [`weapon_combatpistol`]          = { name = 'weapon_combatpistol', label = 'Combat Pistol'},
    [`weapon_appistol`]              = { name = 'weapon_appistol', label = 'AP Pistol'},
    [`weapon_stungun`]               = { name = 'weapon_stungun', label = 'Taser'},
    [`weapon_pistol50`]              = { name = 'weapon_pistol50', label = 'Pistol .50 Cal'},
    [`weapon_snspistol`]             = { name = 'weapon_snspistol', label = 'SNS Pistol'},
    [`weapon_snspistol_mk2`]         = { name = 'weapon_snspistol_mk2', label = 'SNS Pistol MK2'},
    [`weapon_heavypistol`]           = { name = 'weapon_heavypistol', label = 'Heavy Pistol'},
    [`weapon_vintagepistol`]         = { name = 'weapon_vintagepistol', label = 'Vintage Pistol'},
    [`weapon_flaregun`]              = { name = 'weapon_flaregun', label = 'Flare Gun'},
    [`weapon_marksmanpistol`]        = { name = 'weapon_marksmanpistol', label = 'Marksman Pistol'},
    [`weapon_revolver`]              = { name = 'weapon_revolver', label = 'Revolver'},
    [`weapon_revolver_mk2`]          = { name = 'weapon_revolver_mk2', label = 'Revolver MK2'},
    [`weapon_doubleaction`]          = { name = 'weapon_doubleaction', label = 'Double Action Revolver'},
    [`weapon_raypistol`]             = { name = 'weapon_raypistol', label = 'Ray Pistol'},
    [`weapon_ceramicpistol`]         = { name = 'weapon_ceramicpistol', label = 'Ceramic Pistol'},
    [`weapon_navyrevolver`]          = { name = 'weapon_navyrevolver', label = 'Navy Revolver'},
    [`weapon_gadgetpistol`]          = { name = 'weapon_gadgetpistol', label = 'Gadget Pistol'},

    -- Submachine Guns
    [`weapon_microsmg`]              = { name = 'weapon_microsmg', label = 'Micro SMG'},
    [`weapon_smg`]                   = { name = 'weapon_smg', label = 'SMG'},
    [`weapon_smg_mk2`]               = { name = 'weapon_smg_mk2', label = 'SMG MK2'},
    [`weapon_assaultsmg`]            = { name = 'weapon_assaultsmg', label = 'Assault SMG'},
    [`weapon_combatpdw`]             = { name = 'weapon_combatpdw', label = 'Combat PDW'},
    [`weapon_machinepistol`]         = { name = 'weapon_machinepistol', label = 'Tec-9'},
    [`weapon_minismg`]               = { name = 'weapon_minismg', label = 'Mini SMG'},
    [`weapon_raycarbine`]            = { name = 'weapon_raycarbine', label = 'Raycarbine'},

    -- Shotguns
    [`weapon_pumpshotgun`]           = { name = 'weapon_pumpshotgun', label = 'Pump Shotgun'},
    [`weapon_pumpshotgun_mk2`]       = { name = 'weapon_pumpshotgun_mk2', label = 'Pump Shotgun MK2'},
    [`weapon_sawnoffshotgun`]        = { name = 'weapon_sawnoffshotgun', label = 'Sawn-off Shotgun'},
    [`weapon_assaultshotgun`]        = { name = 'weapon_assaultshotgun', label = 'Assault Shotgun'},
    [`weapon_bullpupshotgun`]        = { name = 'weapon_bullpupshotgun', label = 'Bullpup Shotgun'},
    [`weapon_musket`]                = { name = 'weapon_musket', label = 'Musket'},
    [`weapon_heavyshotgun`]          = { name = 'weapon_heavyshotgun', label = 'Heavy Shotgun'},
    [`weapon_dbshotgun`]             = { name = 'weapon_dbshotgun', label = 'Double-barrel Shotgun'},
    [`weapon_autoshotgun`]           = { name = 'weapon_autoshotgun', label = 'Auto Shotgun'},
    [`weapon_combatshotgun`]         = { name = 'weapon_combatshotgun', label = 'Combat Shotgun'},

    -- Assault Rifles
    [`weapon_assaultrifle`]          = { name = 'weapon_assaultrifle', label = 'Assault Rifle'},
    [`weapon_assaultrifle_mk2`]      = { name = 'weapon_assaultrifle_mk2', label = 'Assault Rifle MK2'},
    [`weapon_carbinerifle`]          = { name = 'weapon_carbinerifle', label = 'Carbine Rifle'},
    [`weapon_carbinerifle_mk2`]      = { name = 'weapon_carbinerifle_mk2', label = 'Carbine Rifle MK2'},
    [`weapon_advancedrifle`]         = { name = 'weapon_advancedrifle', label = 'Advanced Rifle'},
    [`weapon_specialcarbine`]        = { name = 'weapon_specialcarbine', label = 'Special Carbine'},
    [`weapon_specialcarbine_mk2`]    = { name = 'weapon_specialcarbine_mk2', label = 'Specialcarbine MK2'},
    [`weapon_bullpuprifle`]          = { name = 'weapon_bullpuprifle', label = 'Bullpup Rifle'},
    [`weapon_bullpuprifle_mk2`]      = { name = 'weapon_bullpuprifle_mk2', label = 'Bull Puprifle MK2'},
    [`weapon_compactrifle`]          = { name = 'weapon_compactrifle', label = 'Compact Rifle'},
    [`weapon_militaryrifle`]         = { name = 'weapon_militaryrifle', label = 'Military Rifle'},
    [`weapon_heavyrifle`]            = { name = 'weapon_heavyrifle', label = 'Heavy Rifle'},

    -- Light Machine Guns
    [`weapon_mg`]                    = { name = 'weapon_mg', label = 'Machinegun' },
    [`weapon_combatmg`]              = { name = 'weapon_combatmg', label = 'Combat MG' },
    [`weapon_combatmg_mk2`]          = { name = 'weapon_combatmg_mk2', label = 'Combat MG MK2' },
    [`weapon_gusenberg`]             = { name = 'weapon_gusenberg', label = 'Thompson SMG' },

    -- Sniper Rifles
    [`weapon_sniperrifle`]           = { name = 'weapon_sniperrifle', label = 'Sniper Rifle' },
    [`weapon_heavysniper`]           = { name = 'weapon_heavysniper', label = 'Heavy Sniper' },
    [`weapon_heavysniper_mk2`]       = { name = 'weapon_heavysniper_mk2', label = 'Heavysniper MK2' },
    [`weapon_marksmanrifle`]         = { name = 'weapon_marksmanrifle', label = 'Marksman Rifle' },
    [`weapon_marksmanrifle_mk2`]     = { name = 'weapon_marksmanrifle_mk2', label = 'Marksman Rifle MK2' },
    [`weapon_remotesniper`]          = { name = 'weapon_remotesniper', label = 'Remote Sniper' },

    -- Custom weapons goes here
    -- [`weapon_weaponname`]          = { name = 'weapon_weaponname', label = 'Weapon Display Name' },
}

-- Metatable ile hem hash hem de string erişimini destekle
Weapons = setmetatable({}, {
    __index = function(tbl, key)
        -- Eğer key zaten bir hash ise (number), direkt kullan
        if type(key) == 'number' then
            return WeaponsRaw[key]
        end

        -- Eğer key string ise, önce hash'e çevir
        if type(key) == 'string' then
            local hash = GetHashKey(key)
            return WeaponsRaw[hash]
        end

        return nil
    end,

    __newindex = function(tbl, key, value)
        -- Yeni silah eklenirken hem hash hem string ile erişilebilir
        if type(key) == 'string' then
            WeaponsRaw[GetHashKey(key)] = value
        else
            WeaponsRaw[key] = value
        end
    end,

    __pairs = function(tbl)
        -- pairs() ile iterasyon yaparken WeaponsRaw'ı kullan
        return pairs(WeaponsRaw)
    end
})