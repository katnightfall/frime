Config = {}

-- Framework detection (auto-detects ESX, QBCore, QBox)
Config.Framework = nil -- Will be auto-detected

-- Weapon recoil and shake configuration
Config.Weapons = {
    -- Pistols
    [GetHashKey('WEAPON_PISTOL')] = {
        recoil = 0.3, 
        shake = 0.06,
        name = "Pistol"
    },
    [GetHashKey('WEAPON_PISTOL_MK2')] = {
        recoil = 0.3, 
        shake = 0.03,
        name = "Pistol MK2"
    },
    [GetHashKey('WEAPON_COMBATPISTOL')] = {
        recoil = 0.2, 
        shake = 0.03,
        name = "Combat Pistol"
    },
    [GetHashKey('WEAPON_APPISTOL')] = {
        recoil = 0.1, 
        shake = 0.05,
        name = "AP Pistol"
    },
    [GetHashKey('WEAPON_PISTOL50')] = {
        recoil = 0.6, 
        shake = 0.05,
        name = "Pistol .50"
    },
    [GetHashKey('WEAPON_SNSPISTOL')] = {
        recoil = 0.2, 
        shake = 0.02,
        name = "SNS Pistol"
    },
    [GetHashKey('WEAPON_SNSPISTOL_MK2')] = {
        recoil = 0.25, 
        shake = 0.025,
        name = "SNS Pistol MK2"
    },
    [GetHashKey('WEAPON_HEAVYPISTOL')] = {
        recoil = 0.4, 
        shake = 0.04,
        name = "Heavy Pistol"
    },
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = {
        recoil = 0.4, 
        shake = 0.025,
        name = "Vintage Pistol"
    },
    [GetHashKey('WEAPON_MARKSMANPISTOL')] = {
        recoil = 0.9, 
        shake = 0.04,
        name = "Marksman Pistol"
    },
    [GetHashKey('WEAPON_REVOLVER')] = {
        recoil = 0.6, 
        shake = 0.05,
        name = "Revolver"
    },
    [GetHashKey('WEAPON_REVOLVER_MK2')] = {
        recoil = 0.65, 
        shake = 0.055,
        name = "Revolver MK2"
    },
    [GetHashKey('WEAPON_DOUBLEACTION')] = {
        recoil = 0.4, 
        shake = 0.025,
        name = "Double Action Revolver"
    },
    [GetHashKey('WEAPON_MACHINEPISTOL')] = {
        recoil = 0.3, 
        shake = 0.04,
        name = "Machine Pistol"
    },

    -- SMGs
    [GetHashKey('WEAPON_MICROSMG')] = {
        recoil = 0.2, 
        shake = 0.035,
        name = "Micro SMG"
    },
    [GetHashKey('WEAPON_SMG')] = {
        recoil = 0.1, 
        shake = 0.045,
        name = "SMG"
    },
    [GetHashKey('WEAPON_SMG_MK2')] = {
        recoil = 0.1, 
        shake = 0.055,
        name = "SMG MK2"
    },
    [GetHashKey('WEAPON_ASSAULTSMG')] = {
        recoil = 0.1, 
        shake = 0.050,
        name = "Assault SMG"
    },
    [GetHashKey('WEAPON_GUSENBERG')] = {
        recoil = 0.1, 
        shake = 0.05,
        name = "Gusenberg Sweeper"
    },
    [GetHashKey('WEAPON_COMBATPDW')] = {
        recoil = 0.2, 
        shake = 0.05,
        name = "Combat PDW"
    },
    [GetHashKey('WEAPON_MINISMG')] = {
        recoil = 0.1, 
        shake = 0.03,
        name = "Mini SMG"
    },

    -- Rifles
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = {
        recoil = 0.2, 
        shake = 0.07,
        name = "Assault Rifle"
    },
    [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = {
        recoil = 0.2, 
        shake = 0.072,
        name = "Assault Rifle MK2"
    },
    [GetHashKey('WEAPON_CARBINERIFLE')] = {
        recoil = 0.1, 
        shake = 0.06,
        name = "Carbine Rifle"
    },
    [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = {
        recoil = 0.1, 
        shake = 0.065,
        name = "Carbine Rifle MK2"
    },
    [GetHashKey('WEAPON_ADVANCED_RIFLE')] = {
        recoil = 0.1, 
        shake = 0.06,
        name = "Advanced Rifle"
    },
    [GetHashKey('WEAPON_SPECIALCARBINE')] = {
        recoil = 0.2, 
        shake = 0.06,
        name = "Special Carbine"
    },
    [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = {
        recoil = 0.25, 
        shake = 0.075,
        name = "Special Carbine MK2"
    },
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = {
        recoil = 0.2, 
        shake = 0.05,
        name = "Bullpup Rifle"
    },
    [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = {
        recoil = 0.25, 
        shake = 0.055,
        name = "Bullpup Rifle MK2"
    },
    [GetHashKey('WEAPON_COMPACTRIFLE')] = {
        recoil = 0.3, 
        shake = 0.03,
        name = "Compact Rifle"
    },

    -- Machine Guns
    [GetHashKey('WEAPON_MG')] = {
        recoil = 0.1, 
        shake = 0.07,
        name = "MG"
    },
    [GetHashKey('WEAPON_COMBATMG')] = {
        recoil = 0.1, 
        shake = 0.08,
        name = "Combat MG"
    },
    [GetHashKey('WEAPON_COMBATMG_MK2')] = {
        recoil = 0.1, 
        shake = 0.085,
        name = "Combat MG MK2"
    },

    -- Shotguns
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = {
        recoil = 0.4, 
        shake = 0.07,
        name = "Pump Shotgun"
    },
    [GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = {
        recoil = 0.4, 
        shake = 0.085,
        name = "Pump Shotgun MK2"
    },
    [GetHashKey('WEAPON_SAWNOFFSHOTGUN')] = {
        recoil = 0.7, 
        shake = 0.06,
        name = "Sawnoff Shotgun"
    },
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = {
        recoil = 0.4, 
        shake = 0.12,
        name = "Assault Shotgun"
    },
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = {
        recoil = 0.2, 
        shake = 0.08,
        name = "Bullpup Shotgun"
    },
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = {
        recoil = 0.2, 
        shake = 0.13,
        name = "Heavy Shotgun"
    },
    [GetHashKey('WEAPON_DBSHOTGUN')] = {
        recoil = 0.7, 
        shake = 0.04,
        name = "Double Barrel Shotgun"
    },
    [GetHashKey('WEAPON_AUTOSHOTGUN')] = {
        recoil = 0.2, 
        shake = 0.04,
        name = "Auto Shotgun"
    },

    -- Sniper Rifles
    [GetHashKey('WEAPON_SNIPERRIFLE')] = {
        recoil = 0.5, 
        shake = 0.2,
        name = "Sniper Rifle"
    },
    [GetHashKey('WEAPON_HEAVYSNIPER')] = {
        recoil = 0.7, 
        shake = 0.3,
        name = "Heavy Sniper"
    },
    [GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = {
        recoil = 0.7, 
        shake = 0.35,
        name = "Heavy Sniper MK2"
    },
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = {
        recoil = 0.3, 
        shake = 0.05,
        name = "Marksman Rifle"
    },
    [GetHashKey('WEAPON_MARKSMANRIFLE_MK2')] = {
        recoil = 0.35, 
        shake = 0.035,
        name = "Marksman Rifle MK2"
    },
    [GetHashKey('WEAPON_REMOTESNIPER')] = {
        recoil = 1.2, 
        shake = 0.1,
        name = "Remote Sniper"
    },

    -- Heavy Weapons
    [GetHashKey('WEAPON_RPG')] = {
        recoil = 0.0, 
        shake = 0.9,
        name = "RPG"
    },
    [GetHashKey('WEAPON_GRENADELAUNCHER')] = {
        recoil = 1.0, 
        shake = 0.08,
        name = "Grenade Launcher"
    },
    [GetHashKey('WEAPON_GRENADELAUCHER_SMOKE')] = {
        recoil = 1.0, 
        shake = 0.04,
        name = "Grenade Launcher Smoke"
    },
    [GetHashKey('WEAPON_MINIGUN')] = {
        recoil = 0.01, 
        shake = 0.25,
        name = "Minigun"
    },
    [GetHashKey('WEAPON_FIREWORK')] = {
        recoil = 0.2, 
        shake = 0.05,
        name = "Firework Launcher"
    },
    [GetHashKey('WEAPON_HOMINGLAUNCHER')] = {
        recoil = 0, 
        shake = 0.04,
        name = "Homing Launcher"
    },
    [GetHashKey('WEAPON_COMPACTLAUNCHER')] = {
        recoil = 0.5, 
        shake = 0.05,
        name = "Compact Launcher"
    },
    [GetHashKey('WEAPON_RAILGUN')] = {
        recoil = 2.4, 
        shake = 0.08,
        name = "Railgun"
    },

    -- Special Weapons
    [GetHashKey('WEAPON_STINGER')] = {
        recoil = 0.0, 
        shake = 0.3,
        name = "Stinger"
    },
    [GetHashKey('WEAPON_STUNGUN')] = {
        recoil = 0.1, 
        shake = 0.01,
        name = "Stun Gun"
    },
    [GetHashKey('WEAPON_FLAREGUN')] = {
        recoil = 0.9, 
        shake = 0.04,
        name = "Flare Gun"
    },
    [GetHashKey('WEAPON_MUSKET')] = {
        recoil = 0.7, 
        shake = 0.09,
        name = "Musket"
    },
}

-- Recoil settings
Config.RecoilSettings = {
    enabled = true,
    pitchIncrease = 0.1,    -- How much the camera pitch increases per frame
    smoothness = 0.2,       -- Camera smoothness (0.0 - 1.0)
    maxRecoil = 3.0,        -- Maximum recoil value
    disableInVehicle = true, -- Disable recoil when in vehicle
    disableInCover = false,  -- Disable recoil when in cover
}

-- Shake settings
Config.ShakeSettings = {
    enabled = true,
    shakeType = 'SMALL_EXPLOSION_SHAKE', -- Shake effect type
    maxShake = 1.0,         -- Maximum shake value
}

-- Debug mode
Config.Debug = false