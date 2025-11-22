Config = {}


Config.Framework = {
    qbx = {
        ResourceName = "qbx_core",
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
    qb = {
        ResourceName = "qb-core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
    },
}

-----------------------------------
-- BUTTONS
-----------------------------------
Config.DisableCombatButtons = true

Config.SmokeButton      = 144  -- "X"  by default
Config.ThrowButton      = 73   -- "X"  by default
Config.MouthButton      = 10   -- "PAGEUP"  by default
Config.HandButton       = 11   -- "PAGEDOWN" by default
Config.GiveButton       = 121  -- "INSERT"   by default
Config.ConfirmGiveButton = 38  -- "E"        by default
Config.CancelGiveButton  = 73  -- "X"        by default
Config.RefillVapeButton = 10 -- "PAGEUP"  by default

-----------------------------------
-- VAPE
-----------------------------------
Config.MaxLiquid       = 10     -- The maximum "size" that a vape can hold
Config.AddLiquidInVape = 3     -- How much "size" to add per refill
Config.VapeSizeRemove  = 0.5   -- How much "size" is removed on each vape puff


Config.VapeJuices = {
    'blueberry_jam_cookie',
    'butter_cookie',
    'cookie_craze',
    'get_figgy',
    'key_lime_cookie',
    'marshmallow_crisp',
    'no_99',
    'paris_fog',
    'pogo',
    'shamrock_cookie',
    'strawberry_jam_cookie',
}

-----------------------------------
-- EFFECTS SYSTEM
-----------------------------------
Config.InstantEffect = false

Config.ApplyForceFor = {
    min = 1,
    max = 3
}

Config.NextForceInterval = {
    min = 1,
    max = 5
}

Config.LooseGripFor = {
    min = 1,
    max = 3
}

Config.VehicleControl = {
    left_force = {-0.5, -0.7, -0.9},
    right_force = {0.5, 0.7, 0.9}
}


-----------------------------------
-- Smoking
-----------------------------------

Config.JointSmoke = 0.03 -- scale for the trailing joint smoke
Config.SizeRemove    = {min = 1, max = 3}     -- how much "size" is removed on each exhale for a joint
Config.ExhaleTime    = {min = 1000, max = 1500}

Config.CheapLighterItem = 'cheap_lighter'
Config.LighterItem = 'lighter'


Config.Smoke = {

    --#Vape
    {
        Item   = "vape",
        Prop   = 'ba_prop_battle_vape_01',
        Size = 0,
        Type = 'vape',
        Time = 0,
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.4, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 25, -- Add health over time
            addarmour = 25, -- Add armor over time
            stressrelieve = 25, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = false, -- Hard to drive
            passoutchance = 5, -- 10% chance to pass out
            vomitchance = 5, -- 15% chance to vomit
        }
    },

    --#Joints

    --#EXAMPLE 
--[[
    {
        Item   = "cake_mix_joint",
        Prop   = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 3,                    -- in MINUTES
            screeneffect = "spectator", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            walkstyle = "move_m@drunk@moderatedrunk",  -- optional, (can nil or remove)
            runspeed = 1.3, -- 30% speed increase
            stamina = true, -- Infinite stamina 
            addhealth = 30,  -- Add health over time (can nil or remove)
            addarmour = 20,  -- Add armor over time (can nil or remove)
            stressrelieve = 50,  -- Reduce stress (can nil or remove)
            screenshake = 0.5,  -- Camera shake intensity
            motionblur = true, -- Enable motion blur 
            vision = "night", -- Night vision (can nil or remove)
            drivingdifficulty = true,  -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out  (can nil or remove)
            vomitchance = 15, -- 15% chance to vomit (can nil or remove)
        }
    },
]]


    {
        Item   = "cake_mix_joint",
        Prop   = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item   = "cereal_milk_joint",
        Prop   = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
    },
    {
        Item   = "white_runtz_joint",
        Prop   = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "cheetah_piss_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "gary_payton_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "gelatti_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "georgia_pie_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "jefe_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "whitecherry_gelato_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "blueberry_cruffin_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "snow_man_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "fine_china_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "pink_sandy_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "zushi_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "apple_gelato_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "biscotti_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "collins_ave_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "marathon_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "oreoz_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "pirckly_pear_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "runtz_og_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "blue_tomyz_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "ether_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "froties_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "gmo_cookies_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "ice_cream_cake_pack_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "khalifa_kush_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "la_confidential_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "marshmallow_og_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "moon_rock_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "sour_diesel_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "tahoe_og_joint",
        Prop = 'prop_sh_joint_01',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },


    -- Woods

    {
        Item   = "cake_mix_wood",
        Prop   = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item   = "cereal_milk_wood",
        Prop   = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item   = "white_runtz_wood",
        Prop   = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "cheetah_piss_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "gary_payton_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "gelatti_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "georgia_pie_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "jefe_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "whitecherry_gelato_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "blueberry_cruffin_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "snow_man_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "fine_china_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "pink_sandy_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "zushi_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "apple_gelato_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "biscotti_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "collins_ave_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "marathon_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "oreoz_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "pirckly_pear_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "runtz_og_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "blue_tomyz_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "ether_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "froties_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "gmo_cookies_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "ice_cream_cake_pack_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "khalifa_kush_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "la_confidential_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "marshmallow_og_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "moon_rock_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "sour_diesel_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
    {
        Item = "tahoe_og_wood",
        Prop = 'devkit_rackwoodcigar',
        Size   = 20,
        Type   = 'joint',
        Effects = {
            effectduration = 2, -- in MINUTES
            screeneffect = "spectator5", -- Screen effect name
            screeneffectstrength = 0.7, -- Effect strength (0.0-1.0+)
            runspeed = 1.2, -- speed increase
            stamina = true, -- Infinite stamina
            addhealth = 30, -- Add health over time
            addarmour = 20, -- Add armor over time
            stressrelieve = 50, -- Reduce stress
            screenshake = 0.9, -- Camera shake intensity
            motionblur = true,  -- Enable motion blur
            drivingdifficulty = true, -- Hard to drive
            passoutchance = 10, -- 10% chance to pass out
            vomitchance = 15, -- 15% chance to vomit
        }
    },
}
