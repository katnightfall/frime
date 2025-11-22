return {
    Enabled = true,

    -- Configure the shop peds here.
    Peds = {                                   -- Now supports multiple locations.
        { model = "a_m_y_hiker_01", scenario = "WORLD_HUMAN_TOURIST_MAP",      coords = vector3(-1490.91, 4981.61, 63.33), heading = 83.96, blip = true },

    },
    Blips = {
        Enabled = true,  -- Can disable or enable individual location blips in the Peds table, or false her disables all.
        Label   = "Let's Camp! Shop",
        Sprite  = 557,
        Display = 6,
        Scale   = 0.8,
        Color   = 17,
    },   

    -- The empty canteen item to give when the player uses a full canteen.
    -- Empty canteens can be filled by standing in water and using the EmptyCanteen item.
    EmptyCanteen = 'lcemptycanteen',
    FullCanteen  = 'lcfullcanteen',
    
    -- CATEGORIES:  "Appliance","Beds","Chairs","Fencing","Fires","Grocery","Hardware","Lumber","Tables","Tents"
    Items = {       

        -- APPLIANCE
        { name = 'lc_campsafe_a',     cost = 50000, category = 'Appliance'  }, -- Camp Stash:
        { name = 'lc_campcooler',     cost = 1000,  category = 'Appliance'  },
        { name = 'lc_campgrill',      cost = 1000,  category = 'Appliance'  },

        -- BEDS:
        { name = 'lc_campbed_a',      cost = 1000,  category = 'Beds'       }, -- can craft
        { name = 'lc_campbed_b',      cost = 1000,  category = 'Beds'       }, -- can craft
        { name = 'lc_campbed_c',      cost = 1000,  category = 'Beds'       }, -- can craft 

        -- CHAIRS:
        { name = 'lc_campchair_a',    cost = 1000,  category = 'Chairs'     }, -- can craft
        { name = 'lc_campchair_b',    cost = 1000,  category = 'Chairs'     }, -- can craft
        { name = 'lc_campchair_c',    cost = 1000,  category = 'Chairs'     }, -- can craft
        { name = 'lc_campchair_d',    cost = 1000,  category = 'Chairs'     }, -- can craft
        { name = 'lc_campchair_e',    cost = 1000,  category = 'Chairs'     }, -- can craft
    
        -- FENCING:
        { name = 'lc_campfence',      cost = 5000,  category = 'Fencing'    }, -- can craft 
        { name = 'lc_campfence_a',    cost = 5000,  category = 'Fencing'    }, -- can craft 
        { name = 'lc_campfence_b',    cost = 5000,  category = 'Fencing'    }, -- can craft 
        { name = 'lc_campfence_c',    cost = 5000,  category = 'Fencing'    }, -- can craft
        { name = 'lc_campfence_d',    cost = 5000,  category = 'Fencing'    }, -- can craft
        { name = 'lc_campdoor_a',     cost = 5000,  category = 'Fencing'    }, -- can craft
    
        -- FIRE:
        { name = 'lc_campfire_a',     cost = 1000,  category = 'Fires'      }, -- can craft (does not return to players inventory)
        { name = 'lc_campfire_b',     cost = 1000,  category = 'Fires'      }, -- can craft
        { name = 'lc_campfire_c',     cost = 1000,  category = 'Fires'      }, -- can craft
        { name = 'lccampstones',      cost = 10,    category = 'Fires'      }, -- Gets removed when placing camp fire b or c.

        -- GROCERY:
        { name = 'lcmarshmellow',     cost = 10,   category = 'Grocery'     },
        { name = 'lcchocolate',       cost = 10,   category = 'Grocery'     },
        { name = 'lcgramcrkrs',       cost = 10,   category = 'Grocery'     },
        { name = 'lccampmeat',        cost = 10,   category = 'Grocery'     },
        { name = 'lccampherbs',       cost = 100,  category = 'Grocery'     },
        { name = 'lccampbeans',       cost = 10,   category = 'Grocery'     },
        { name = 'lccampcorn',        cost = 10,   category = 'Grocery'     },
        { name = 'lccamppotato',      cost = 10,   category = 'Grocery'     },
        { name = 'lccampveggies',     cost = 10,   category = 'Grocery'     },
        { name = 'lccampbutta',       cost = 10,   category = 'Grocery'     },
        { name = 'lccampfish',        cost = 10,   category = 'Grocery'     },
        { name = 'lcherbtea',         cost = 5000, category = 'Grocery'     },  -- Healing Tea           
        { name = 'lccampcoffee',      cost = 5000, category = 'Grocery'     },  -- Speed Booster
        { name = 'lcemptycanteen',    cost = 100,  category = 'Grocery'     },
        { name = 'lccoffeebeans',     cost = 100,  category = 'Grocery'     },

        -- HARDWARE:
        { name = 'lc_campaxe',        cost = 1000,  category = 'Hardware'   },
        { name = 'lc_campcookpot',    cost = 1000,  category = 'Hardware'   },        
        { name = 'lc_camplight_a',    cost = 1000,  category = 'Hardware'   },
        { name = 'lc_camplight_b',    cost = 1000,  category = 'Hardware'   },
        { name = 'lcburlapscrap',     cost = 25,    category = 'Hardware'   },
        { name = 'lcnylonrope',       cost = 25,    category = 'Hardware'   },
        { name = 'lcferrorrod',       cost = 25,    category = 'Hardware'   },

        -- LUMBER:
        { name = 'lc_camplog_a',      cost = 1000,  category = 'Lumber'     }, -- earned
        { name = 'lc_camplog_b',      cost = 1000,  category = 'Lumber'     }, -- earned
        { name = 'lc_camplog_c',      cost = 1000,  category = 'Lumber'     }, -- earned
        { name = 'lc_campwood_a',     cost = 1000,  category = 'Lumber'     }, -- earned
        { name = 'lc_campwood_b',     cost = 1000,  category = 'Lumber'     }, -- earned
        { name = 'lc_campwood_c',     cost = 1000,  category = 'Lumber'     }, -- earned
        { name = 'lc_campsign_a',     cost = 1000,  category = 'Lumber'     }, -- earned
        { name = 'lc_campsign_b',     cost = 1000,  category = 'Lumber'     }, -- earned

        -- TABLES:
        { name = 'lc_camptable_a',   cost = 1000,  category = 'Tables'      }, -- can craft
        { name = 'lc_camppicnic',    cost = 1000,  category = 'Tables'      }, -- can craft
        { name = 'lc_campworktable', cost = 5000,  category = 'Tables'      }, -- crafting table

        -- TENTS:
        { name = 'lc_camptent_a',    cost = 1000,  category = 'Tents'       }, -- can craft
        { name = 'lc_camptent_b',    cost = 1000,  category = 'Tents'       }, -- can craft
        { name = 'lc_camptent_c',    cost = 1000,  category = 'Tents'       }, -- can craft
        { name = 'lc_camptent_d',    cost = 1000,  category = 'Tents'       }, -- can craft
        { name = 'lc_camptent_e',    cost = 10000, category = 'Tents'       }, -- can craft
    }
}