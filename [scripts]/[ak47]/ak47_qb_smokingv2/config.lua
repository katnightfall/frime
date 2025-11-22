Config = {}
Config.Locale = 'en'

Config.TextUiPosition = 'left-center' -- 'right-center', 'left-center'

Config.Keys = {
    smoke = 38,
    pass = 47,
    stop = 74
}

Config.VapeProp = {
    ba_prop_battle_vape_01 = {
        bone = 18905,
        position = vector3(0.125, 0.0, 0.03),
        rotation = vector3(-160.0, 60.0, -30.0),
    },
    xm3_prop_xm3_vape_01a = {
        bone = 18905,
        position = vector3(0.125, 0.0, 0.03),
        rotation = vector3(0.0, 0.0, -30.0),
    },
    
}

Config.VapeVolume = 0.3
Config.VapeLiquid = {
    ['berry_swirl'] = {
        prop = 'xm3_prop_xm3_vape_01a',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['golden_crumble'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['biscuit_bliss'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['fig_delight'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['citrus_crumble'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['fluffy_crunch'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['blend_99'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['paris_mist'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['bounce_blend'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['spiced_crumble'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['clover_crunch'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
    ['berry_bliss'] = {
        prop = 'ba_prop_battle_vape_01',
        required_one_of_this = {
            ['vape'] = 1,
        },
        time = 300                          -- in second
    },
}

Config.Crafting = {
    ['glacatti'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['glacatti_joint'] = 5,
        },
    },
    ['hary_payton'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['hary_payton_joint'] = 5,
        },
    },
    ['grain_cream'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['grain_cream_joint'] = 5,
        },
    },
    ['wild_feline'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['wild_feline_joint'] = 5,
        },
    },
    ['frosty_phantom'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['frosty_phantom_joint'] = 5,
        },
    },
    ['peach_cobbler'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['peach_cobbler_joint'] = 5,
        },
    },
    ['boss_blend'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['boss_blend_joint'] = 5,
        },
    },
    ['pastry_blend'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['pastry_blend_joint'] = 5,
        },
    },
    ['pure_runs'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['pure_runs_joint'] = 5,
        },
    },
    ['snowberry_gelato'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['snowberry_gelato_joint'] = 5,
        },
    },
    ['berry_muffin'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['berry_muffin_joint'] = 5,
        },
    },
    ['elegant_porcelain'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['elegant_porcelain_joint'] = 5,
        },
    },
    ['rosy_dunes'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['rosy_dunes_joint'] = 5,
        },
    },
    ['zen_blend'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['zen_blend_joint'] = 5,
        },
    },
    ['crisp_gelato'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['crisp_gelato_joint'] = 5,
        },
    },
    ['golden_biscuit'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['golden_biscuit_joint'] = 5,
        },
    },
    ['collins_way'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['collins_way_joint'] = 5,
        },
    },
    ['endurance_blend'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['endurance_blend_joint'] = 5,
        },
    },
    ['choco_creme'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['choco_creme_joint'] = 5,
        },
    },
    ['spiky_pear'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['spiky_pear_joint'] = 5,
        },
    },
    ['runs_elite'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['runs_elite_joint'] = 5,
        },
    },
    ['azure_tomyz'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['azure_tomyz_joint'] = 5,
        },
    },
    ['vapor_essence'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['vapor_essence_joint'] = 5,
        },
    },
    ['frosties_blend'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['frosties_blend_joint'] = 5,
        },
    },
    ['bio_crunch'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['bio_crunch_joint'] = 5,
        },
    },
    ['frosted_delight'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['frosted_delight_joint'] = 5,
        },
    },
    ['royal_haze'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['royal_haze_joint'] = 5,
        },
    },
    ['sunset_secret'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['sunset_secret_joint'] = 5,
        },
    },
    ['fluffy_og'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['fluffy_og_joint'] = 5,
        },
    },
    ['lunar_stone'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['lunar_stone_joint'] = 5,
        },
    },
    ['tangy_fuel'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['tangy_fuel_joint'] = 5,
        },
    },
    ['summit_og'] = {
        required_one_of_this = {
            ['backroots_honey'] = 1,
            ['backroots_grape'] = 1,
            ['graba_wrap'] = 1,
            ['backroots_creamy_blend'] = 1,
            ['preston_pearl_cigars'] = 1,
            ['banana_backroots'] = 1,
            ['pure_cone_king'] = 1,
        },
        delay = 15,                         --in second
        rewards = {
            ['summit_og_joint'] = 5,
        },
    },
}

Config.BluntProp = {
    prop_cigar_01 = {
        lighting = {
            bone = 47419,
            position = vector3(0.0, 0.02, 0.01),
            rotation = vector3(0.0, 270.0, -90.0),
        },
        holdtype1 = {
            bone = 57005,
            position = vector3(0.15, 0.015, 0.00),
            rotation = vector3(0.0, -80.0, 0.0),
        },
        holdtype2 = {
            bone = 57005,
            position = vector3(0.13, 0.04, -0.05),
            rotation = vector3(90.0, -90.0, -100.0),
        }
    },
    prop_cigar_03 = {
        lighting = {
            bone = 47419,
            position = vector3(0.0, 0.02, 0.01),
            rotation = vector3(0.0, 270.0, -90.0),
        },
        holdtype1 = {
            bone = 57005,
            position = vector3(0.15, 0.015, 0.00),
            rotation = vector3(0.0, -80.0, 0.0),
        },
        holdtype2 = {
            bone = 57005,
            position = vector3(0.13, 0.04, -0.05),
            rotation = vector3(90.0, -90.0, -100.0),
        }
    },
    
}

Config.Usable = {
    ['glacatti_joint'] = {
        prop = 'prop_cigar_03',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['hary_payton_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['grain_cream_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['wild_feline_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['frosty_phantom_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['peach_cobbler_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['boss_blend_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['pastry_blend_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['pure_runs_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['snowberry_gelato_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['berry_muffin_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['elegant_porcelain_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['rosy_dunes_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['zen_blend_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['crisp_gelato_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['golden_biscuit_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['collins_way_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['endurance_blend_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['choco_creme_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['spiky_pear_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['runs_elite_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['azure_tomyz_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['vapor_essence_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['frosties_blend_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['bio_crunch_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['frosted_delight_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['royal_haze_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['sunset_secret_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['fluffy_og_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['lunar_stone_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['tangy_fuel_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    ['summit_og_joint'] = {
        prop = 'prop_cigar_01',
        required_one_of_this = {
            ['lighter'] = 1,
            ['cheap_lighter'] = 1,
        },
        time = 120,                         --in second
    },
    
}


