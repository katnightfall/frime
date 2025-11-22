Config.FarmLocation = vector3(169.22, -236.87, 49.09)
Config.FarmRadius = 100.0

Config.FarmGetItem = {
    name = 'weed_leaf',             -- item that you will get after harvest
    max = 5,                        -- maximum per harvest * 5
    min = 1,                        -- minimum per harvest * 5
}
Config.FarmingFertilize = {         
    item = 'weed_fertilizer',       -- item required to fertilize the plant
    quantity = 1,                   -- quantity that required to fertilize
    damageChance = 10,              -- 10% chance will require fertilizer
}
Config.FarmingSpray = {
    item = 'weed_spray',            -- item required to spray the plant
    quantity = 1,                   -- quantity that required to fertilize
    damageChance = 10,              -- 10% chance will require spray
}

Config.FarmingRequired = {          --  required items to plant a new pot
    [1] = {
        item = 'weed_fertilizer',   -- item name
        quantity = 1,               -- item quantity
    },
    [2] = {
        item = 'weed_pot',          -- item name
        quantity = 1,               -- item quantity
    },
    [3] = {
        item = 'seed_weed',         -- item name
        quantity = 1,               -- item quantity
    },
}

Config.FarmingMultiItems = {
    [1] = {
        pos = vector3(180.3, -243.8, 53.1),
        items = {
            ['lighter'] = {
                name = 'Lighter',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['cheap_lighter'] = {
                name = 'Cheap Lighter',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },

            ['backroots_honey'] = {
                name = 'Backroots Honey',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['backroots_grape'] = {
                name = 'Backroots Grape',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['graba_wrap'] = {
                name = 'Graba Wrap',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['backroots_creamy_blend'] = {
                name = 'Backroots Creamy Blend',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['preston_pearl_cigars'] = {
                name = 'Preston Pearl Cigars',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['banana_backroots'] = {
                name = 'Banana Backroots',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['pure_cone_king'] = {
                name = 'Pure Cone King',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },

            ['berry_swirl'] = {
                name = 'Berry Swirl',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['golden_crumble'] = {
                name = 'Golden Crumble',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['biscuit_bliss'] = {
                name = 'Biscuit Bliss',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['fig_delight'] = {
                name = 'Fig Delight',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['citrus_crumble'] = {
                name = 'Citrus Crumble',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['fluffy_crunch'] = {
                name = 'Fluffy Crunch',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['blend_99'] = {
                name = 'Blend 99',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['paris_mist'] = {
                name = 'Paris Mist',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['bounce_blend'] = {
                name = 'Bounce Blend',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['spiced_crumble'] = {
                name = 'Spiced Crumble',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['clover_crunch'] = {
                name = 'Clover Crunch',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['berry_bliss'] = {
                name = 'Berry Bliss',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['vape'] = {
                name = 'Vape',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['cafe_bong'] = {
                name = 'Cafe Bong',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
        }
    }
}

Config.FarmingItems = {
    [1] = {
        pos = vector3(171.69, -238.33, 49.09), 
        item = 'weed_fertilizer',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Fertilizer~s~',
        msgtarget = 'Fertilizer',
    },
    [2] = {
        pos = vector3(195.22, -233.91, 53.1), 
        item = 'weed_fertilizer',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Fertilizer~s~',
        msgtarget = 'Fertilizer',
    },
    [3] = {
        pos = vector3(193.23, -238.19, 53.1), 
        item = 'weed_pot',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                  -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Pot~s~',
        msgtarget = 'Weed Pot',
    },
    [4] = {
        pos = vector3(170.55, -233.74, 49.09), 
        item = 'weed_pot',                              -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Pot~s~',
        msgtarget = 'Weed Pot',
    },
    [5] = {
        pos = vector3(192.71, -233.45, 53.1), 
        item = 'weed_spray',                            -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Spray~s~',
        msgtarget = 'Weed Spray',
    },
    [6] = {
        pos = vector3(184.97, -243.49, 53.2), 
        item = 'pooch_bag',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Pooch Bag~s~',
        msgtarget = 'Pooch Bag',
    },
    [7] = {
        pos = vector3(167.26, -232.61, 49.09), 
        item = 'seed_weed',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Seed~s~',
        msgtarget = 'Weed Seed',
    },
    [8] = {
        pos = vector3(174.84, -239.52, 49.4), 
        item = 'weed_spray',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Spray~s~',
        msgtarget = 'Weed Spray',
    },
}

Config.ProcessLocation = {
    pos = vector3(165.25, -233.3, 49.09),
    heading = 68.21,
}

Config.Objects = {
    [1] = "bkr_prop_weed_01_small_01c",
    [2] = "bkr_prop_weed_01_small_01b",
    [3] = "bkr_prop_weed_01_small_01a",
    [4] = "bkr_prop_weed_med_01a",
    [5] = "bkr_prop_weed_med_01b",
    [6] = "bkr_prop_weed_lrg_01a",
    [7] = "bkr_prop_weed_lrg_01b",
    --There is no stage 8. So don't add any prop here
}

Config.Buds = {
    [1] = "bkr_prop_weed_bud_01a",
    [2] = "bkr_prop_weed_bud_01b",
    [3] = "bkr_prop_weed_bud_02a",
    [4] = "bkr_prop_weed_bud_02b",
    [5] = "bkr_prop_weed_bud_pruned_01a",
    --Don't touch this part
}

Config.SageTimer = {
    [1] = 1, --got to next stage in minute
    [2] = 2, --got to next stage in minute
    [3] = 3, --got to next stage in minute
    [4] = 4, --got to next stage in minute
    [5] = 5, --got to next stage in minute
    [6] = 6, --got to next stage in minute
    [7] = 7, --got to next stage in minute
    --There is no stage 8. So don't add any stage here
}

Config.Plants = {
    vector3(171.94297790527,-242.36625671387,49.155345916748),
    vector3(171.20361328125,-242.09715270996,49.155345916748),
    vector3(170.42361450195,-241.81326293945,49.155345916748),
    vector3(163.53784179688,-237.20211791992,49.155345916748),
    vector3(165.55444335938,-240.0659942627,49.155345916748),
    vector3(165.52906799316,-237.92686462402,49.155345916748),
    vector3(164.90089416504,-237.6982421875,49.155345916748),
    vector3(164.85986328125,-239.81318664551,49.155345916748),
    vector3(166.25173950195,-238.18991088867,49.155345916748),
    vector3(163.45333862305,-239.30125427246,49.155345916748),
    vector3(172.61622619629,-240.50639343262,49.155345916748),
    vector3(162.78297424316,-239.05726623535,49.155345916748),
    vector3(164.18379211426,-239.56712341309,49.155345916748),
    vector3(168.9409942627,-241.27362060547,49.155345916748),
    vector3(169.61750793457,-239.41493225098,49.155345916748),
    vector3(170.39540100098,-239.69807434082,49.155345916748),
    vector3(169.68716430664,-241.54521179199,49.155345916748),
    vector3(164.18930053711,-237.43922424316,49.155345916748),
    vector3(171.8690032959,-240.23442077637,49.155345916748),
    vector3(171.13494873047,-239.96723937988,49.155345916748),
    vector3(162.40650939941,-242.21435546875,49.155345916748),
    vector3(161.96322631836,-243.43228149414,49.155345916748),
    vector3(161.53114318848,-244.61943054199,49.155345916748),
    vector3(161.08367919922,-245.84884643555,49.155345916748),
    vector3(160.67543029785,-246.97048950195,49.155345916748),
    vector3(168.32975769043,-249.75643920898,49.155345916748),
    vector3(168.72396850586,-248.67335510254,49.155345916748),
    vector3(169.16719055176,-247.45559692383,49.155345916748),
    vector3(169.63507080078,-246.17012023926,49.155345916748),
    vector3(170.07159423828,-244.97076416016,49.155345916748),
    vector3(167.60493469238,-244.0729675293,49.155345916748),
    vector3(166.67930603027,-246.61608886719,49.155345916748),
    vector3(166.27278137207,-247.73301696777,49.155345916748),
    vector3(165.85287475586,-248.88671875,49.155345916748),
    vector3(167.16284179688,-245.28762817383,49.155345916748),
    vector3(164.51225280762,-244.32289123535,49.155345916748),
    vector3(163.63145446777,-246.74285888672,49.155345916748),
    vector3(164.06228637695,-245.5591583252,49.155345916748),
    vector3(164.95022583008,-243.11956787109,49.155345916748),
    vector3(163.21621704102,-247.88374328613,49.155345916748),
    vector3(182.70582580566,-256.14501953125,53.552940368652),
}