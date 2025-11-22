-- You can now assign required ingredient items that won't get removed from theplayer when crafting by setting it's amount to 0.
-- example: ['lc_campcookpot'] = 0,
-- It will still show in the menu as 1 required, but won't get removed!
return {
    ["Grill Recipes"] = {
        { lccookedsteak     = { ['lccampmeat'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ['amount'] = 2, },
        { lccookedcorn      = { ['lccampcorn'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ['amount'] = 2, },
        { lccookedfish      = { ['lccampfish'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ['amount'] = 2, },
        { lccookedbeans     = { ['lccampbeans'] = 1,    ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lc_campcookpot'] = 0, },  ['amount'] = 2, }, 
        { lccookedstew      = { ['lccampmeat'] = 1,     ['lccampbeans'] = 1,  ['lccampherbs'] = 1,  ['lccampveggies'] = 1,  ['lc_campcookpot'] = 0, },  ['amount'] = 2, },
        { lccookedsoup      = { ['lccamppotato'] = 1,   ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampveggies'] = 1,   ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
        
        { lcfishnchips      = { ['lccamppotato'] = 1,   ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampfish'] = 1,   ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
        { lcsteakveggies    = { ['lccampmeat'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampveggies'] = 1,   ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
        { lcmeatpotato      = { ['lccamppotato'] = 1,   ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampmeat'] = 1,   ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
                 
        { lcherbtea         = { ['lcfullcanteen'] = 1,  ['lccampherbs'] = 1,   },  ['amount'] = 2, }, 
        { lccampcoffee      = { ['lcfullcanteen'] = 1,  ['lccoffeebeans'] = 1, },  ['amount'] = 2, },          
    },
    ["Fire Recipes"] = {
        { lccookedsteak     = { ['lccampmeat'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1,   ['lc_campcookpot'] = 0  },  ['amount'] = 2, },
        { lccookedcorn      = { ['lccampcorn'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1, },  ['amount'] = 2, },
        { lccookedfish      = { ['lccampfish'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1,   ['lc_campcookpot'] = 0 },  ['amount'] = 2, },
        { lccookedbeans     = { ['lccampbeans'] = 1,    ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lc_campcookpot'] = 0, },  ['amount'] = 2, }, 
        { lccookedstew      = { ['lccampmeat'] = 1,     ['lccampbeans'] = 1,  ['lccampherbs'] = 1,  ['lccampveggies'] = 1,  ['lc_campcookpot'] = 0, },  ['amount'] = 2, },
        { lccookedsoup      = { ['lccamppotato'] = 1,   ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampveggies'] = 1,   ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
        
        { lcfishnchips      = { ['lccamppotato'] = 1,   ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampfish'] = 1,    ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
        { lcsteakveggies    = { ['lccampmeat'] = 1,     ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampveggies'] = 1, ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
        { lcmeatpotato      = { ['lccamppotato'] = 1,   ['lccampbutta'] = 1,  ['lccampherbs'] = 1,  ['lccampmeat'] = 1,    ['lc_campcookpot'] = 0 },  ['amount'] = 2, },  
                 
        { lcherbtea         = { ['lcfullcanteen'] = 1,  ['lccampherbs'] = 1,   ['lc_campcookpot'] = 0    },  ['amount'] = 2, }, 
        { lccampcoffee      = { ['lcfullcanteen'] = 1,  ['lccoffeebeans'] = 1,   ['lc_campcookpot'] = 0  },  ['amount'] = 2, },  
    }, 
    ["Work Bench"] = {
        -- Fires:
        { lc_campfire_a    = { ['lc_camplog_a'] = 1, ['lc_campaxe'] = 0, ['lcferrorrod'] = 1, },  ['amount'] = 1, },
        { lc_campfire_b    = { ['lc_camplog_b'] = 1, ['lc_campaxe'] = 0, ['lcferrorrod'] = 1, },  ['amount'] = 1, },
        { lc_campfire_c    = { ['lc_camplog_c'] = 1, ['lc_campcookpot'] = 1, ['lc_campaxe'] = 0, ['lcferrorrod'] = 1 },  ['amount'] = 1, },

        -- Tents:
        { lc_camptent_a     = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_camptent_b     = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_camptent_c     = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_camptent_d     = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_camptent_e     = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },

        -- Chairs:
        { lc_campchair_a    = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campchair_b    = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campchair_c    = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campchair_d    = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campchair_e    = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },

        -- Beds:
        { lc_campbed_a      = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, }, -- 
        { lc_campbed_b      = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lccampstones'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campbed_c      = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },

        -- Tables:
        { lc_camppicnic     = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_camptable_a    = { ['lc_campwood_a'] = 1, ['lcnylonrope'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },

        -- Fencing:
        { lc_campfence      = { ['lc_campwood_a'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campfence_a    = { ['lc_campwood_a'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campfence_b    = { ['lc_campwood_a'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campfence_c    = { ['lc_campwood_a'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campfence_d    = { ['lc_campwood_a'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },
        { lc_campdoor_a     = { ['lc_campwood_a'] = 1, ['lcburlapscrap'] = 1, ['lc_campaxe'] = 0, },  ['amount'] = 1, },

    }, 
    ["Ice Box"] = { 
        -- Only use the lccampcooler if your money is an item!!
        -- add your money item and amount believe as an ingredient!
        { lcmarshmellow     = { ['money'] = 10 },  ['amount'] = 1, },
        { lcchocolate       = { ['money'] = 10 },  ['amount'] = 1, },
        { lcgramcrkrs       = { ['money'] = 10 },  ['amount'] = 1, },
        { lccampmeat        = { ['money'] = 10 },  ['amount'] = 1, },
        { lccampherbs       = { ['money'] = 10 },  ['amount'] = 1, },
        { lccampbeans       = { ['money'] = 10 },  ['amount'] = 1, },
        { lccampcorn        = { ['money'] = 10 },  ['amount'] = 1, },
        { lccamppotato      = { ['money'] = 10 },  ['amount'] = 1, },
        { lccampbutta       = { ['money'] = 10 },  ['amount'] = 1, },
        { lccampfish        = { ['money'] = 10 },  ['amount'] = 1, },
        { lccampveggies     = { ['money'] = 10 },  ['amount'] = 1, },
        { lccoffeebeans     = { ['money'] = 100 }, ['amount'] = 1, },
        { lcemptycanteen    = { ['money'] = 100 }, ['amount'] = 1, },
    }
}