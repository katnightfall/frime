Config.PurchaseSupplyCurrency = 'bank' -- cash, bank

Config.RentDays = 5 -- days

Config.Labs = {
    ['Weed'] = {
        exit = vector4(1066.4, -3183.45, -39.16, 90.0),
        ipldata = {
            int = 247297, 
            ipl = 'bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo',
            props = {
                "weed_upgrade_equip",
                "weed_security_upgrade",

                "weed_growtha_stage1",
                "light_growtha_stage23_upgrade",
                "weed_hosea",

                "weed_growthb_stage2",
                "light_growthb_stage23_upgrade",
                "weed_hoseb",

                "weed_growthc_stage3",
                "light_growthc_stage23_upgrade",
                "weed_hosec",

                "weed_growthd_stage1",
                "light_growthd_stage23_upgrade",
                "weed_hosed",

                "weed_growthe_stage2",
                "light_growthe_stage23_upgrade",
                "weed_hosee",

                "weed_growthf_stage3",
                "light_growthf_stage23_upgrade",
                "weed_hosef",

                "weed_growthg_stage1",
                "light_growthg_stage23_upgrade",
                "weed_hoseg",

                "weed_growthh_stage2",
                "light_growthh_stage23_upgrade",
                "weed_hoseh",

                "weed_growthi_stage3",
                "light_growthi_stage23_upgrade",
                "weed_hosei",
                
                "weed_production",
                "weed_set_up",
                "weed_drying",
                "weed_chairs",
            },
        },
        laptop = vector4(1045.19, -3194.84, -38.36, 0.0),
        peds = {
            {
                model = `mp_m_weed_01`,
                position = vector4(1040.4, -3202.37, -39.16, 98.42),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_high_dry@', anim = 'weed_inspecting_high_idle_01_inspector'},
            },
            {
                model = `mp_m_weed_01`,
                position = vector4(1035.76, -3207.62, -39.17, 96.36),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_high_dry@', anim = 'weed_inspecting_high_idle_02_inspector'},
            },
            {
                model = `mp_f_weed_01`,
                position = vector4(1059.66, -3199.82, -40.14, 79.4),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', anim = 'weed_crouch_checkingleaves_idle_01_inspectorfemale'},
            },
            {
                model = `mp_f_weed_01`,
                position = vector4(1051.48, -3191.94, -40.13, 337.52),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', anim = 'weed_crouch_checkingleaves_idle_01_inspectorfemale'},
            },
            {
                model = `mp_f_weed_01`,
                position = vector4(1052.01, -3195.93, -40.13, 69.82),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', anim = 'weed_crouch_checkingleaves_idle_01_inspectorfemale'},
            },
            {
                model = `mp_f_weed_01`,
                position = vector4(1057.32, -3205.95, -40.13, 252.12),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', anim = 'weed_crouch_checkingleaves_idle_01_inspectorfemale'},
            },
            {
                model = `mp_m_weed_01`,
                position = vector4(1060.93, -3203.18, -40.15, 273.84),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', anim = 'weed_stand_checkingleaves_idle_01_inspector'},
            },{
                model = `mp_m_weed_01`,
                position = vector4(1056.35, -3192.64, -40.16, 2.7),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', anim = 'weed_stand_checkingleaves_idle_02_inspector'},
            },{
                model = `mp_m_weed_01`,
                position = vector4(1051.58, -3201.62, -40.12, 2.82),
                anim = {dir = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', anim = 'weed_stand_checkingleaves_idle_03_inspector'},
            },

            {
                model = `mp_m_weed_01`,
                position = vector4(1039.37, -3205.87, -39.17, 89.08),
                anim = {dir = 'anim@amb@business@weed@weed_sorting_seated@', anim = 'sorter_right_sort_v3_sorter02'},
            },{
                model = `mp_m_weed_01`,
                position = vector4(1037.32, -3206.01, -39.17, 273.69),
                anim = {dir = 'anim@amb@business@weed@weed_sorting_seated@', anim = 'sorter_right_sort_v2_sorter02'},
            },
            {
                model = `mp_f_weed_01`,
                position = vector4(1034.81, -3206.08, -39.18, 89.84),
                anim = {dir = 'anim@amb@business@weed@weed_sorting_seated@', anim = 'sorter_right_sort_v1_sorter02'},
            },{
                model = `mp_f_weed_01`,
                position = vector4(1032.7, -3206.18, -39.18, 272.07),
                anim = {dir = 'anim@amb@business@weed@weed_sorting_seated@', anim = 'sorter_right_sort_v2_sorter02'},
            },
        },
    },
    ['Cocaine'] = {
        exit = vector4(1088.68, -3187.47, -38.99, 182.24),
        ipldata = {
            int = 247553, 
            ipl = 'bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo',
            props = {"set_up", "equipment_upgrade", "coke_press_upgrade", "production_upgrade", "table_equipment_upgrade", "security_high", "coke_cut_01", "coke_cut_02", "coke_cut_03", "coke_cut_04", "coke_cut_05"},
        },
        laptop = vector4(1086.57, -3194.3, -39.2, 0.0),
        peds = {
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1093.08, -3196.60, -40.0, 0.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'coke_cut_v1_coccutter'},
            },
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1090.34, -3196.67, -40.0, 0.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'coke_cut_v2_coccutter'},
            },
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1095.28, -3196.57, -40.0, 0.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'coke_cut_v3_coccutter'},
            },
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1095.28, -3194.82, -40.0, 180.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'coke_cut_v4_coccutter'},
            },
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1093.00, -3194.92, -40.0, 180.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'coke_cut_v5_coccutter'},
            },
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1090.31, -3194.92, -40.0, 180.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'cut_cough_coccutter'},
            },
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1099.54, -3194.23, -40.0, 90.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'coke_cut_v3_coccutter'},
            },
            {
                model = `mp_f_cocaine_01`,
                position = vector4(1101.92, -3193.68, -40.0, 0.0),
                anim = {dir = 'anim@amb@business@coc@coc_unpack_cut_left@', anim = 'coke_cut_v4_coccutter'},
            },
            {
                model = `mp_m_cocaine_01`,
                position = vector4(1101.27, -3198.76, -40.0, 178.12),
                anim = {dir = 'anim@amb@business@coc@coc_packing@', anim = 'operate_press_basicmould_v3_pressoperator'},
                props = {[2] = 0, [3] = 0, [4] = 0, [6] = 0, [8] = 0}
            },
            {
                model = `mp_m_cocaine_01`,
                position = vector4(1088.77, -3195.89, -40.0, 270.0),
                anim = {dir = 'anim@amb@business@coc@coc_packing@', anim = 'unload_press_basicmould_v1_pressoperator'},
                props = {[2] = 0, [3] = 0, [4] = 0, [6] = 0, [8] = 2}
            },
            {
                model = `mp_m_cocaine_01`,
                position = vector4(1096.98, -3195.63, -40.0, 90.0),
                anim = {dir = 'anim@amb@business@coc@coc_packing@', anim = 'unload_press_basicmould_v1_pressoperator'},
                props = {[2] = 0, [3] = 0, [4] = 0, [6] = 0, [8] = 2}
            },
            {
                model = `mp_m_cocaine_01`,
                position = vector4(1089.04, -3194.48, -40.0, 216.98),
                scenerio = 'WORLD_HUMAN_CLIPBOARD_FACILITY',
                props = {[3] = 1, [4] = 1, [6] = 1, [8] = 1}
            },
        },
    },
    ['Meth'] = {
        exit = vector4(996.87, -3200.66, -36.39, 271.78),
        ipldata = {
            int = 247041, 
            ipl = 'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo',
            props = {"meth_lab_upgrade", "meth_lab_setup", "meth_lab_security_high", "meth_lab_production"},
        },
        laptop = vector4(1001.95, -3194.27, -39.19, 0.0),
        peds = {
            {
                model = `mp_f_meth_01`,
                position = vector4(1005.72, -3200.39, -39.52, 180.0),
                anim = {dir = 'anim@amb@business@meth@meth_monitoring_cooking@cooking@', anim = 'chemical_pour_long_cooker'},
            },{
                model = `mp_m_meth_01`,
                position = vector4(1011.55, -3200.07, -39.99, 350.0),
                anim = {dir = 'anim@amb@business@meth@meth_monitoring_cooking@monitoring@', anim = 'button_press_monitor'},
            },{
                model = `mp_m_meth_01`,
                position = vector4(1007.81, -3200.94, -39.99, 180.0),
                anim = {dir = 'anim@amb@business@meth@meth_monitoring_cooking@monitoring@', anim = 'check_guages_monitor'},
            },{
                model = `mp_f_meth_01`,
                position = vector4(1010.9, -3196.85, -39.99, 180.0),
                anim = {dir = 'anim@amb@business@meth@meth_monitoring_cooking@monitoring@', anim = 'check_guages_v2_monitor'},
            },{
                model = `mp_m_meth_01`,
                position = vector4(1006.32, -3197.7, -39.99, 268.23),
                anim = {dir = 'anim@amb@business@meth@meth_monitoring_cooking@monitoring@', anim = 'look_around_v5_monitor'},
            },
            
        },
    },
}

   