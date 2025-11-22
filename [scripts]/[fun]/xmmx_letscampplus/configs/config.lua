-- __  ____  __ __  ____  __   ___  _____   _____ _    ___  ___ __  __ ___ _  _ _____   _ 
-- \ \/ /  \/  |  \/  \ \/ /  |   \| __\ \ / / __| |  / _ \| _ \  \/  | __| \| |_   _| (_)
--  >  <| |\/| | |\/| |>  <   | |) | _| \ V /| _|| |_| (_) |  _/ |\/| | _|| .` | | |    _ 
-- /_/\_\_|  |_|_|  |_/_/\_\  |___/|___| \_/ |___|____\___/|_| |_|  |_|___|_|\_| |_|   (_)
---@param WARNING: Do NOT rename this resource or it will NOT work!!!

return {    
    FirstInstall    = true,                             -- This must be true for the first install and start of the script to insert the proper database.    
    Version         = true,                             -- Enable or Disable Version Checks.
    Debug           = false,                            -- Be sure to turn false before running on live server. 

    Images          = "qb-inventory/html/images/",       -- inventory images folder location.
    UseConsumables  = true,                             -- true to make crafted food and drink items useable? false if using your own.

    Menu            = "ui",                             -- "xm" for xm_menu, "ui" for my built-in UI, "qb" for qb-menu, "ox" for ox_lib context menu. https://github.com/xMaddMackx/xm_menu
    MenuBlur        = true,                             -- Enable or Disable Screen Blur while the Crafting Menu UI is Open.
    ToggleHud       = true,
    MenuTxt         = "",                               -- some text description if you want in the xm_menu header, otherwise set MenuTxt = "",
    MenuScheme      = "#e07f16",                        -- Sets the color scheme of xm_menu. (can use color, hex, or rgb) Example - QBCore Color: #dc143c
    iconColor       = "#e07f16",                        -- set's the icon color for xm_menu, ox_lib menu, and ox_target. (can use color, hex, or rgb)
    iconAnims  = {                                      -- random icon animation if Menu = "ox", above.
        'spin', 
        'spinPulse', 
        'spinReverse', 
        'pulse', 
        'beat', 
        'fade', 
        'beatFade', 
        'bounce', 
        'shake'
    },

    qbImgSize       = "100",                            -- for qb-menu only
    notItem         = "❌ ",                            -- Show ❌ when all of an item needed is not in player inventory, set "" for no ❌.
    hasItem         = "✔️ ",                            -- Show ✔️ when all of an item needed is present in player inventory, set "" for no ✔️.
     
    PersistentProps = true,                             -- Save Props so they persist through server restarts and New Logons? (Saves to Database)
    UseInstance     = true,                             -- Should props be saved in the routing bucket in which it was placed? Good if placing in interiors.
    CastDist        = 15,                               -- Ray casting distance
    MoveSpeed       = 0.003,                            -- Speed at which the keypress will raise or lower the prop. (0.005 minimum, 0.05 max)
    MaxHeight       = 1.5,                              -- potentially prevents players from placing props too high to access/remove.
    TextUI          = "ox",                             -- "ox", or "qb". (Must also match in xmmx_bridge)

    RayCastKeys = {
        rotateLeft      = 14,                           -- Mouse Scroll Wheel Down
        rotateRight     = 15,                           -- Mouse Scroll Wheel Up

        rotatePitchUp   = 68,                           -- Right Mouse Button
        rotatePitchDown = 69,                           -- Left Mouse Button
        rotateRollLeft  = 174,                          -- Arrow Left
        rotateRollRight = 175,                          -- Arrow Right
    
        SnapGrnd        = 19,                           -- LEFT ALT
        heightUp        = 172,                          -- Arrow Up
        heightDown      = 173,                          -- Arrow Down
    
        cancel          = 202,                          -- BACKSPACE
        place           = 215,                          -- ENTER
    },


    UseProgress         = true,                         -- use progressbar and animation when placing or removing?
    AllRemove           = false,                        -- is everyone allowed to remove the prop or only the player who placed it?
    AlertRemove         = false,

    PropPlace = {                                       -- The animation and progressbar that plays when placing a prop.
        Dict            = "mp_arresting",                      
        Clip            = "a_uncuff",                 
        Flag            = 49,                    
        Time            = 3500,               
        Prog            = "Setting Up Item . . .",  
    },

    PropRemove = {                                      -- The animation and progressbar that plays when removing a prop.
        Dict            = "random@domestic", 
        Clip            = "pickup_low",             
        Flag            = 8,    
        Time            = 1500,
        Prog            = "Picking Up Item",
    },

    ZoneChecks          = true,                             -- If true, players can only place camping props in camp zones.
    CampZones = {                   
        ["Raton Canyon! Camp Zone"] = {                            -- Zone Name must be unique if using multiple zones.
            coords = vector3(-1080.23, 4371.21, 13.05), 
            radius = 650.0, 
            blip = true,
        },
        -- ["Lago Zancudo! Camp Zone"] = {                            -- Zone Name must be unique if using multiple zones.
        --     coords = vector3(-2252.49, 2534.87, 4.43), 
        --     radius = 200.0, 
        --     blip = true,
        -- },
        -- Add more zones here! 
    },
    ZoneBlip = {
        blipSprite  = 557,
        blipDisplay = 6,
        blipScale   = 0.7,
        blipColor   = 0,

        radiusColor = 5,
        radiusAlpha = 50, -- set to 0 for completely transparent
    },
    CampBlips = {
        enabled     = true,     -- enable blips for player camps where the models below are placed? 
        everyone    = false,    -- enable everyone to see player camp blips or only the player that owns the model?
        blipSprite  = 1,
        blipDisplay = 6,
        blipScale   = 0.5,
        blipColor   = 0,
        name        = "Camp",
        grouped     = false,
        models ={
            "bzzz_survival_sign_a",
            "bzzz_survival_sign_b",
        }  
    },

    
    -- The EnableTrees will spawn trees around the map that players can chop for wood.
    -- Tree coords, models, etc. are configured in the configs/settings.lua.
    -- Tree cutting minigame can be edited in the configs/functions.lua.
    -- Wood can be used to craft things on a Camp Work Bench.
    -- Different type of trees yield different wood rewards.
    EnableTrees     = true, -- should the tree props spawns be enable? Prop creation handled server-sided.
    EnableBathing   = true,
    SoapItemName    = "lccampsoap",
    AxeItemName     = "lc_campaxe",    -- The name of the axe item used to chop trees.



    ---@param Stash: This table defines the settings for stash items that can be placed at camps for storage.
    ---@param Slots: This determines how many slots a stash storage should have.
    ---@param Weight: This determines the max weight the stash can hold. Adjust to your inventory specifics.
    ---@param AllowAll: This determines if everyone should be able to access a stash, or only the owner.
    CampStash = {
        Slots       = 30,
        Weight      = 1000000,
        AllowAll    = false,
    },


    -- Available Actions: "Tent", "Chair", "Bed", "Cooler", "Grill", "Fire", "Prop", "Craft"
    -- NOTE: To remove the target action from the object, simply set it as "Prop". 
    -- This is incase you have another script that makes the object useable, like a sitting script.
    ---@param name: Name of the useable item.
    ---@param give: Does this item get returned to the player?
    ---@param model: The model of the prop to spawn.
    ---@param action: What action should be done for the prop? Note: "Prop" will only allow removal.
    ---@param within: The distance within the prop and the ped before starting placement.
    CampProps = {
        -- CAMP STASH:
        { name = "lc_campsafe_a",       give = true,      model = "xm_prop_vancrate_01a",       action = "Stash", within = 1.25  }, -- prop_mb_crate_01a

        -- TENTS:
        { name = "lc_camptent_a",       give = true,      model = "ba_prop_battle_tent_02",     action = "Tent", within = 3.5   },
        { name = "lc_camptent_b",       give = true,      model = "ba_prop_battle_tent_01",     action = "Tent", within = 2.5   },
        { name = "lc_camptent_c",       give = true,      model = "bzzz_survival_tent_a",       action = "Tent", within = 3.25  },
        { name = "lc_camptent_d",       give = true,      model = "bzzz_survival_tent_b",       action = "Tent", within = 3.25  },
        { name = "lc_camptent_e",       give = true,      model = "bzzz_survival_tent_c",       action = "Tent", within = 3.25  },

        -- BEDS:
        { name = "lc_campbed_a",        give = true,      model = "bkr_prop_biker_campbed_01",  action = "Bed",  within = 2.0   },
        { name = "lc_campbed_b",        give = true,      model = "bzzz_survival_stone_a",      action = "Bed",  within = 2.0   },
        { name = "lc_campbed_c",        give = true,      model = "prop_skid_sleepbag_1",       action = "Bed",  within = 1.25  },

        -- APPLIANCES:
        { name = "lc_campcooler",       give = true,      model = "v_ret_fh_coolbox",           action = "Cooler", within = 2.0 }, -- ("money" must be an item in your inventory!!!)
        { name = "lc_campgrill",        give = true,      model = "prop_bbq_4",                 action = "Grill",  within = 2.0 },

        -- FIRES:
        { name = "lc_campfire_a",       give = false,     model = "prop_beach_fire",            action = "Fire", within = 1.5   },
        { name = "lc_campfire_b",       give = true,      model = "bzzz_survival_fire_c",       action = "Fire", within = 1.5   },
        { name = "lc_campfire_c",       give = true,      model = "bzzz_survival_fire_b",       action = "Fire", within = 1.5   },
              
        -- FENCING/DOORS:
        { name = "lc_campdoor_a",       give = true,      model = "prop_fncwood_01gate",        action = "Prop",  within = 2.0  },
        { name = "lc_campfence",        give = true,      model = "prop_ch2_wdfence_01",        action = "Prop",  within = 2.0  },
        { name = "lc_campfence_a",      give = true,      model = "prop_fncwood_07a",           action = "Prop",  within = 2.0  },
        { name = "lc_campfence_b",      give = true,      model = "prop_fncwood_02b",           action = "Prop",  within = 2.0  },
        { name = "lc_campfence_c",      give = true,      model = "prop_fncwood_03a",           action = "Prop",  within = 2.0  },
        { name = "lc_campfence_d",      give = true,      model = "prop_fncwood_04a",           action = "Prop",  within = 2.0  },
        
        -- CHAIRS: (If you have a sit script, set the chair action = "Prop")
        { name = "lc_campchair_a",      give = true,      model = "prop_skid_chair_01",         action = "Chair",  within = 1.25 },
        { name = "lc_campchair_b",      give = true,      model = "prop_table_02_chr",          action = "Chair",  within = 1.25 },
        { name = "lc_campchair_c",      give = true,      model = "prop_clown_chair",           action = "Chair",  within = 1.25 },
        { name = "lc_campchair_d",      give = true,      model = "prop_old_wood_chair",        action = "Chair",  within = 1.25 },
        { name = "lc_campchair_e",      give = true,      model = "prop_table_08_chr",          action = "Chair",  within = 1.25 },
        
        -- TABLES:
        { name = "lc_camptable_a",      give = true,      model = "prop_table_08",              action = "Prop",  within = 1.25  },
        { name = "lc_camppicnic",       give = true,      model = "prop_picnictable_01",        action = "Prop",  within = 2.0   },
        { name = "lc_campworktable",    give = true,      model = "prop_tool_bench02",          action = "Craft", within = 2.0   },

        -- CAMP POSTS: (Adds a blip to player camps if enabled)
        { name = "lc_campsign_a",       give = true,      model = "bzzz_survival_sign_a",       action = "Prop",   within = 1.25 },       
        { name = "lc_campsign_b",       give = true,      model = "bzzz_survival_sign_b",       action = "Prop",   within = 1.25 },

        -- LIGHTS:
        { name = "lc_camplight_a",      give = true,      model = "prop_walllight_ld_01",       action = "Prop",   within = 1.0  },
        { name = "lc_camplight_b",      give = true,      model = "prop_worklight_03b",         action = "Prop",   within = 1.0  },
        
        -- COOKING POT:
        { name = "lc_campcookpot",      give = true,      model = "bzzz_survival_pot_a",        action = "Prop",   within = 1.25 },        
        
        -- TREE LOGS:
        { name = "lc_camplog_a",        give = true,      model = "bzzz_lumberjack_wood_pack_1a_dynamic", action = "Log", within = 1.25 },
        { name = "lc_camplog_b",        give = true,      model = "bzzz_lumberjack_wood_pack_2a_dynamic", action = "Log", within = 1.25 },
        { name = "lc_camplog_c",        give = true,      model = "bzzz_lumberjack_wood_pack_3a_dynamic", action = "Log", within = 1.25 },
        
        -- WOOD:
        { name = "lc_campwood_a",       give = true,      model = "bzzz_lumberjack_wood_pack_1d", action = "Prop", within = 1.25 },
        { name = "lc_campwood_b",       give = true,      model = "bzzz_lumberjack_wood_pack_2d", action = "Prop", within = 1.25 },
        { name = "lc_campwood_c",       give = true,      model = "bzzz_lumberjack_wood_pack_3d", action = "Prop", within = 1.25 },
        -- Create and add new items here:

    }
}