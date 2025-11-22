return {

--     _   _  _ ___ __  __   _ _____ ___ ___  _  _ ___   _ 
--    /_\ | \| |_ _|  \/  | /_\_   _|_ _/ _ \| \| / __| (_)
--   / _ \| .` || || |\/| |/ _ \| |  | | (_) | .` \__ \  _ 
--  /_/ \_\_|\_|___|_|  |_/_/ \_\_| |___\___/|_|\_|___/ (_)
    InTentAnim = {
        Position    = "left-center", -- position of the TextUI.
        ZoomKey     = 0,   -- Z, https://docs.fivem.net/docs/game-references/controls/
        CancelKey   = 73,   -- X,
        Dict        = "timetable@tracy@sleep@",
        Clip        = "idle_c",
        Flag        = 1,
        OffSets = {
            ["ba_prop_battle_tent_02"]  = { x = 0.0,  y = 0.0,  z = 1.25,  w = 40.0,  heal = false }, -- if heal is false then stress thread only.
            ["ba_prop_battle_tent_01"]  = { x = -0.1, y = -0.1, z = 1.07,  w = 40.0,  heal = false },
            ["bzzz_survival_tent_a"]    = { x = -0.1, y = -0.1, z = 1.07,  w = 180.0, heal = false },
            ["bzzz_survival_tent_b"]    = { x = -0.1, y = -0.1, z = 1.07,  w = 180.0, heal = false },
            ["bzzz_survival_tent_c"]    = { x = -0.1, y = -0.1, z = 1.07,  w = 180.0, heal = true  }, -- if heal is true, player is slowly healed if injured.
            
        },
    }, 
    ChairSitAnim = {
        Position    = "right-center", -- position of the TextUI.
        CancelKey   = 73,
        Scenario    = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
        OffSets = {
            ["prop_skid_chair_01"]  = { x = 0.0, y = -0.035, z = 0.075, w = 180.0 },
            ["prop_table_02_chr"]   = { x = 0.0, y = 0.015, z = 0.5, w = 180.0 },            
            ["prop_clown_chair"]    = { x = -0.035, y = 0.425, z = 0.5, w = 180.0 },
            ["prop_old_wood_chair"] = { x = 0.0, y = 0.05, z = 0.125, w = 180.0 },
            ["prop_table_08_chr"]   = { x = 0.15, y = -0.15, z = 0.315, w = 0.0 },
        },
    },
    BedLayAnim = {
        Position    = "right-center", -- position of the TextUI.
        CancelKey   = 73,
        Dict        = "misslamar1dead_body",
        Clip        = "dead_idle",
        OffSets = {
            ["bkr_prop_biker_campbed_01"] = { x = 0.0, y = 0.0, z = 0.75,  w = 85.0  },
            ["prop_skid_sleepbag_1"]      = { x = 0.0, y = 0.0, z = 0.05,  w = 265.0 },
            ["bzzz_survival_stone_a"]     = { x = 0.0, y = 0.0, z = 0.05,  w = 265.0 },
        },        
    },
    CanteenAnim = {
        Dict    = "missfbi_s4mop",
        Clip    = "pickup_bucket_0",
        Flag    = 49,
        Time    = 3000,
        Prop    = "bzzz_prop_military_canteen_b",
        Bone    = 57005, 
        Coord   = vector3(0.109000, 0.008000, -0.024000), 
        Rot     = vector3(-54.670071, 3.869965, 1.319965),
        Prog    = "Filling Canteen(s) . . .",
    },
    Hiking = {
        EnableBag   = true,
        EnableAnim  = true,
        IdleCheck   = 5000,
        ActiveCheck = 1000,
        Dict    = "move_m@hiking",
        Clip    = "idle",
        Flag    = 49,
        Items = {
            "lc_camptent_a",
            "lc_camptent_b",
            "lc_camptent_c",
            "lc_camptent_d",
            "lc_camptent_e",
        },
        Cloth   = {
            Component = 8, -- tshirt
            ["Male"] = {
                ["backpack"]  = { slot = 5,  texture = 1 },
            },
            ["Female"] = {
                ["backpack"]  = { slot = 5,  texture = 1 },
            }
        }
    },
    BathingAnim = {
        Dict    = "mp_safehouseshower@male@",
        Clip    = "male_shower_idle_a",
        Flag    = 1,
        Time    = 8000,
        Prog    = "Taking A Bath . . .",
        Move    = true, -- disable movement when in progress?
        Nude    = true,
        Cloth   = {
            ["Male"] = {
                ["arms"]    = { slot = 5,   texture = 0 },
                ["jacket"]  = { slot = 15,  texture = 0 },
                ["tshirt"]  = { slot = 15,  texture = 0 },
                ["pants"]   = { slot = 173, texture = 9 },
                ["shoes"]   = { slot = 15,  texture = 0 },
            },
            ["Female"] = {
                ["arms"]    = { slot = 5,   texture = 0 },
                ["jacket"]  = { slot = 15,  texture = 0 },
                ["tshirt"]  = { slot = 15,  texture = 0 },
                ["pants"]   = { slot = 173, texture = 9 },
                ["shoes"]   = { slot = 15,  texture = 0 },
            }
        }
    },   
    GrillCookAnim = {
        Dict    = "amb@prop_human_bbq@male@idle_a",
        Clip    = "idle_b",
        Flag    = 49,
        Time    = 5000,
        Prop    = "prop_fish_slice_01",
        Bone    = 28422,
        Coord   = vec3(0.0, 0.0, 0.0),
        Rot     = vec3(0.0, 0.0, 0.0),
        Prog    = "Grilling ",
        Move    = true, -- disable movement when in progress?
        Type    = "grill", 
        Minigame = true, -- enable the minigame?
        game    = "keys",
    },
    FireCookAnim = {
        Dict    = "bzzz_survival",
        Clip    = "bzzz_survival",
        Flag    = 1,
        Time    = 5000,
        Prop    = "bzzz_survival_stick_a",
        Bone    = 57005,
        Coord   = vec3(0.117000, -0.071000, -0.090000),
        Rot     = vec3(-73.650368, -63.750267, -27.449957),
        Prog    = "Roasting ",
        Move    = true, -- disable movement when in progress?
        Type    = "fire",
        Minigame = true, -- enable the minigame?
        game    = "keys",
    },
    CoolerAnim = {
        Dict    = "amb@world_human_bum_wash@male@low@idle_a",
        Clip    = "idle_a",
        Flag    = 1,
        Time    = 3000,
        Prop    = nil,
        Bone    = nil,
        Coord   = vec3(0.0, 0.0, 0.0),
        Rot     = vec3(0.0, 0.0, 0.0),
        Prog    = "Buying ",
        Move    = true, -- disable movement when in progress?
        Type    = "cooler",
    },
    CraftBenchAnim = {
        Dict    = "mini@repair",
        Clip    = "fixing_a_ped",
        Flag    = 49,
        Time    = 5000,
        Prop    = nil,
        Bone    = nil,
        Coord   = vec3(0.0, 0.0, 0.0),
        Rot     = vec3(0.0, 0.0, 0.0),
        Prog    = "Crafting ",
        Move    = true, -- disable movement when in progress?
        Type    = "bench",
        Minigame = true, -- enable the minigame?
        game    = "keys",
    },
    TreeChopAnim = {
        Dict    = "melee@large_wpn@streamed_core",
        Clip    = "ground_attack_on_spot",
        Flag    = 49,
        Time    = 5000,
        Prop    = "bzzz_survival_axe_a",
        Bone    = 57005, -- r_hand
        Coord   = vec3(0.239001, 0.071000, -0.022000), 
        Rot     = vec3(0.000000, 183.057953, -65.520088),
        ProgTree = "Chopping ",
        ProgLog    = "Chopping Tree",
        Move    = true, -- disable movement when in progress?
        Type    = "bench", 
        Minigame = true, -- enable the minigame?
        game    = "circles",
    },




--   ___ ___  ___  ___    ___   _   ___ _____   __  _ 
--  | _ \ _ \/ _ \| _ \  / __| /_\ | _ \ _ \ \ / / (_)
--  |  _/   / (_) |  _/ | (__ / _ \|   /   /\ V /   _ 
--  |_| |_|_\\___/|_|    \___/_/ \_\_|_\_|_\ |_|   (_)
-- The carry items function only works if the players inventory items are stored in the players metadata. 
    CarryEnabled = true, -- Enable the carry props functions?
    NetworkProps = true, -- should the props be networked for all players to see. If false, only the player will see their object.   
    CarryModel = {
        {
            name = "lc_camplog_a",
            Dict = "anim@heists@box_carry@",
            Clip = "idle",
            Flag = 49,
            Model = "bzzz_lumberjack_wood_pack_1a_dynamic",
            Bone = 18905,
            x  = 0.060000,
            y  = 0.222000,
            z  = 0.279000,
            xr = 127.650917,
            yr = 50.250130,
            zr = -81.750450,
            Attack = true,
            Car = true,
            Sprint = true
        },
        {
            name = "lc_camplog_b",
            Dict = "anim@heists@box_carry@",
            Clip = "idle",
            Flag = 49,
            Model = "bzzz_lumberjack_wood_pack_2a_dynamic",
            Bone = 18905,
            x = 0.060000,
            y = 0.222000,
            z = 0.279000,
            xr = 127.650917,
            yr = 50.250130,
            zr = -81.750450,
            Attack = true,
            Sprint = true,
            Car = true,
        },
        {
            name = "lc_camplog_c",
            Dict = "anim@heists@box_carry@",
            Clip = "idle",
            Flag = 49,
            Model = "bzzz_lumberjack_wood_pack_3a_dynamic",
            Bone = 18905,
            x = 0.185000, 
            y = 0.065000, 
            z = 0.239000,
            xr = 5.400002, 
            yr = -62.850258, 
            zr = -96.000595,
            Attack = true, 
            Sprint = true,
            Car = true,
        },
        {
            name = "lc_campwood_a",
            Dict = "anim@heists@box_carry@",
            Clip = "idle",
            Flag = 49,
            Model = "bzzz_lumberjack_wood_pack_1d",
            Bone = 18905,
            x  = 0.284000,
            y  = 0.080000,
            z  = 0.227000,
            xr = -74.400375,
            yr = 2.399997,
            zr = 40.800034,
            Attack = true,
            Sprint = false,
            Car = true,
            
        },
        {
            name = "lc_campwood_b",
            Dict = "anim@heists@box_carry@",
            Clip = "idle",
            Flag = 49,
            Model = "bzzz_lumberjack_wood_pack_2d",
            Bone = 18905,
            x  = 0.282000, 
            y  = 0.012000, 
            z  = 0.249000,
            xr = -79.500427, 
            yr = 11.099998, 
            zr = 30.749945,
            Attack = true,
            Sprint = false,
            Car = true,
        },
        {
            name = "lc_campwood_c",
            Dict = "anim@heists@box_carry@",
            Clip = "idle",
            Flag = 49,
            Model = "bzzz_lumberjack_wood_pack_3d",
            Bone = 18905,
            x  = 0.188000, 
            y  = 0.007000, 
            z  = 0.282000,
            xr = -3.450001, 
            yr = -73.650368, 
            zr = -93.300568,
            Attack = true,
            Sprint = false,
            Car = true,
        },
    },




--   _____ ___ ___ ___   ___ ___ _____ _____ ___ _  _  ___ ___   _ 
--  |_   _| _ \ __| __| / __| __|_   _|_   _|_ _| \| |/ __/ __| (_)
--    | | |   / _|| _|  \__ \ _|  | |   | |  | || .` | (_ \__ \  _ 
--    |_| |_|_\___|___| |___/___| |_|   |_| |___|_|\_|\___|___/ (_)
    Blips = {
        grouped     = false,                    -- grouping blip names reduce the number of blips in the pause map legend.
        groupName   = "Tree",                   -- the name that will show for blips instead of the tree label.
        blipSprite  = 836,
        blipDisplay = 6,
        blipScale   = 0.6,
        blipColor   = 25,
    },

    StumpModel      = "prop_tree_stump_01",     -- the stump model displayed when a tree is chopped.
    RegrowTree      = 10,                       -- time in minutes after a tree is chopped for it to respawn.
    TreeTargetDist  = 1.5,

    LogChopAmt      = math.random(1, 2),        -- amt given when chopping a log item (not the tree itself).
    TreeModels = {
        ["prop_tree_cedar_s_01"] = { 
            blip = true,
            label = "Small Cedar Tree",    
            item = "lc_camplog_c",
            amount = 1,
            difficulty = "easy", 
            coords = {
                vec4(-943.150, 4401.460, 15.177, 29.64),
                vec4(-967.960, 4407.800, 16.441, 337.12),
                vec4(-987.966, 4396.140, 14.324, 169.31),
                vec4(-1002.940, 4398.030, 12.007, 181.57),
                vec4(-1012.020, 4400.260, 13.105, 166.51),
                vec4(-1045.800, 4410.250, 14.687, 93.3),
            }  
        },
        ["prop_w_r_cedar_01"] = { 
            blip = true,
            label = "Medium Cedar Tree",    
            item = "lc_camplog_b",
            amount = 1,
            difficulty = "medium", 
            coords = { -- 
                vec4(-800.130, 4462.530, 15.356, 181.24),
                vec4(-718.920, 4464.470, 15.495, 172.06),
                vec4(-779.760, 4458.940, 15.095, 160.58),
                vec4(-833.670, 4455.100, 20.341, 217.45),
                vec4(-862.060, 4452.880, 17.678, 200.28),
                vec4(-876.680, 4434.890, 15.033, 215.17),
            } 
        },        
        ["prop_tree_pine_02"] = { 
            blip = true,
            label = "Pine Tree",      
            item = "lc_camplog_a",
            amount = 1,
            difficulty = "easy", 
            coords = {
                vec4(-1498.76, 4405.05, 20.22, 214.24),
                vec4(-1381.71, 4413.23, 28.01, 323.19),
                vec4(-1341.96, 4411.45, 29.79, 37.82),
                vec4(-1322.04, 4459.55, 19.67, 70.94),
                vec4(-1513.36, 4437.89, 10.6, 131.91),
                vec4(-1528.53, 4420.28, 10.25, 278.78),
                vec4(-1475.94, 4434.51, 19.98, 263.85),
                vec4(-1448.6, 4451.63, 20.75, 253.87),
                vec4(-1416.18, 4448.25, 27.29, 258.57), 
                vec4(-1385.93, 4444.93, 25.55, 14.88),
                vec4(-1360.4, 4438.29, 27.01, 178.47),
                vec4(-1351.21, 4453.54, 23.06, 31.95),
                vec4(-1425.07, 4406.36, 46.05, 117.05),
                vec4(-1461.25, 4395.18, 26.04, 135.11),
            }  
        },
        ["prop_tree_lficus_05"] = { 
            blip = true,
            label = "Large Ficus Tree",     
            item = "lc_camplog_b",
            amount = 1, 
            difficulty = "easy", 
            coords = { 
                vec4(-792.370, 4068.342, 163.722, 357.69),
                vec4(-818.780, 4075.028, 168.140, 185.99),
                vec4(-827.470, 4158.808, 211.819, 224.7),
                vec4(-806.030, 4132.450, 205.927, 254.87),
                vec4(-728.320, 4096.290, 175.126, 239.04),
                vec4(-1011.282, 4236.000, 108.530, 126.41),
                vec4(-957.326, 4166.910, 135.249, 43.94), 
            } 
        },
        ["prop_tree_eng_oak_01"] = { 
            blip = true,
            label = "English Oak Tree",    
            item = "lc_camplog_b", 
            amount = 1,
            difficulty = "medium", 
            coords = {
                vec4(-1539.45, 4731.01, 52.24, 86.69),
                vec4(-1509.55, 4685.75, 37.12, 22.95),
                vec4(-1476.19, 4711.34, 38.5, 190.26),
                vec4(-1396.75, 4723.0, 44.04, 22.78),
                vec4(-1431.52, 4668.92, 54.205, 30.67),
                vec4(-1413.980, 4638.050, 65.506, 303.94),
                vec4(-1444.420, 4633.010, 54.210, 34.14),
                vec4(-1481.610, 4645.250, 45.332, 87.34),
                vec4(-1446.230, 4604.020, 51.509, 22.43),
                vec4(-1409.130, 4611.410, 64.033, 122.04),
                vec4(-1484.800, 4613.390, 45.730, 56.35),
                vec4(-1442.930, 4725.560, 43.156, 202.66)
            } 
        },
        ["prop_tree_cedar_03"] = { 
            blip = true,
            label = "Large Cedar Tree",    
            item = "lc_camplog_a", 
            amount = 1,
            difficulty = "medium", 
            coords = {
                vec4(-854.080, 4799.260, 293.920, 349.01),
                vec4(-843.060, 4800.180, 296.794, 25.45),
                vec4(-881.310, 4819.700, 299.826, 274.18),
                vec4(-901.160, 4796.320, 301.445, 150.02),
                vec4(-922.270, 4773.000, 291.696, 206.63),
                vec4(-891.510, 4750.620, 287.887, 329.36),
                vec4(-872.150, 4783.520, 298.858, 65.55)
            } 
        },
        -- Add more tree configs here:
    }
}