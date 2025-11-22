-- The math.random(min, max) is the min and max amount of hunger and thirst that is filled when a player consumes an item. 
-- You can set a whole number and remove the math.random, otherwise a random value will be chosen. Adjust to your preference.

if GetResourceState("qb-core") == "started" or GetResourceState("qbx_core") == "started" then 
    EatsMeta = {
        ["lcsmores"]            = math.random(35, 50),
        ["lccookedsteak"]       = math.random(35, 50),
        ["lccookedbeans"]       = math.random(35, 50),
        ["lccookedcorn"]        = math.random(35, 50),
        ["lccookedfish"]        = math.random(35, 50),
        ["lccookedpotato"]      = math.random(35, 50),
        ["lccookedsoup"]        = math.random(35, 50),
        ["lccookedstew"]        = math.random(35, 50),
        
        ["lcfishnchips"]        = math.random(35, 50),
        ["lcsteakveggies"]      = math.random(35, 50),
        ["lcmeatpotato"]        = math.random(35, 50),
    }

    DrinksMeta = {
        ["lcherbtea"]           = math.random(35, 50),
        ["lcfullcanteen"]       = math.random(35, 50),
        ["lccampcoffee"]        = math.random(35, 50), 
    }

elseif GetResourceState("es_extended") == "started" then 
    EatsMeta = {
        ["lcsmores"]            = math.random(200000, 300000),
        ["lccookedsteak"]       = math.random(200000, 300000),
        ["lccookedbeans"]       = math.random(200000, 300000),
        ["lccookedcorn"]        = math.random(200000, 300000),
        ["lccookedfish"]        = math.random(200000, 300000),
        ["lccookedpotato"]      = math.random(200000, 300000),
        ["lccookedsoup"]        = math.random(200000, 300000),
        ["lccookedstew"]        = math.random(200000, 300000),

        ["lcfishnchips"]        = math.random(200000, 300000),
        ["lcsteakveggies"]      = math.random(200000, 300000),
        ["lcmeatpotato"]        = math.random(200000, 300000),
    }

    DrinksMeta = {
        ["lcherbtea"]           = math.random(200000, 300000),
        ["lcfullcanteen"]       = math.random(200000, 300000),
        ["lccampcoffee"]        = math.random(200000, 300000),  
    }
end