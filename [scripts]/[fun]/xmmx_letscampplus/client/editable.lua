local animProps = {}

local BeanDiarrhea = true     -- Enable diarrhea effect from eating beans?
local EffectRandom = 100      -- the chance of having diarrhea from beans. Default 100% chance.
local UseStopMinigame = true  -- use the minigame to stop shitting?
local OnlyInZones = true      -- Only allow the player to consume the items in a camping zone?
local speedBoosting = false   -- set true to disable speed boost effect of coffee.

-- NOTE: Be sure to add the sound files to the interact-sound/client/html/sounds folder if using the BeanDiarrhea effect.
local InCampZone = function(playerPos)
    for k, v in pairs(Config.CampZones) do
        local zoneCenter = v.coords
        local radius = v.radius

        if #(playerPos - zoneCenter) <= radius then
            return true -- Player is inside this zone
        end
    end

    return false -- Player not in any defined zone
end

RegisterNetEvent('xmmx_letscampplus:consumable:Eat')
AddEventHandler('xmmx_letscampplus:consumable:Eat', function(itemName)
    local playerId  = GetPlayerServerId(PlayerId()) 

    inMenu = true 

    XM.CloseInv()

    local _type     = "eat"
    local Label     =  XM.ConsumedItem(itemName)
    local amount    = EatsMeta[itemName]

    local info = {
        -- Animation:
        Dict = animProps[itemName].Dict,
        Clip = animProps[itemName].Clip,        
        Flag = animProps[itemName].Flag,
        Time = 5000, 
        Move = false, -- disable movement?
        Veh  = false, -- disable vehicle?

        -- Prop 1:
        Prop = animProps[itemName].Prop,
        Bone = animProps[itemName].Bone,
        Coord = animProps[itemName].Coords,
        Rot = animProps[itemName].Rot,

        -- Prop 2:
        Prop2 = animProps[itemName].Prop2,
        Bone2 = animProps[itemName].Bone2,
        Coord2 = animProps[itemName].Coords2,
        Rot2 = animProps[itemName].Rot2,
    }
    
    if XM.Consume(_type, itemName, Label, info, amount, playerId) then 
        inMenu = false  
        if itemName == "lccookedbeans" then 
            if BeanDiarrhea then 
                local chance = math.random(1, 100)

                Wait(5000)         
                                
                if chance <= EffectRandom then
                    XM.Notification(false, nil, Locales.Notify.bean_warn, "success", 5000)
                    DiarrheaEffect(UseStopMinigame)
                end
            end
        end
    end
end)

RegisterNetEvent('xmmx_letscampplus:consumable:Drink')
AddEventHandler('xmmx_letscampplus:consumable:Drink', function(itemName)
    local playerId = GetPlayerServerId(PlayerId()) 

    inMenu = true
    XM.CloseInv()

    local _type     = "drink"
    local Label     = XM.ConsumedItem(itemName)
    local amount    = DrinksMeta[itemName]
    local info = {
        -- Animation:
        Dict = animProps[itemName].Dict,
        Clip = animProps[itemName].Clip,        
        Flag = animProps[itemName].Flag,
        Time = 5000, 
        Move = false, -- disable movement?
        Veh  = false, -- disable vehicle?

        -- Prop 1:
        Prop = animProps[itemName].Prop,
        Bone = animProps[itemName].Bone,
        Coord = animProps[itemName].Coords,
        Rot = animProps[itemName].Rot,

        -- Prop 2:
        Prop2 = animProps[itemName].Prop2,
        Bone2 = animProps[itemName].Bone2,
        Coord2 = animProps[itemName].Coords2,
        Rot2 = animProps[itemName].Rot2,
    }

    if XM.Consume(_type, itemName, Label, info, amount, playerId) then         
        inMenu = false 
        if itemName == "lcfullcanteen" then 
            TriggerServerEvent("xmmx_letscampplus:server:toggleItem", playerId, true, CampShops.EmptyCanteen, 1)
        end
        if itemName == "lcherbtea" then 
            local ped = PlayerPedId()
            local health = GetEntityHealth(ped)
            if health < 200 then
                SetEntityHealth(ped, math.min(health + 15, 200))
            end
            if health > 180 and health < 200 then 
                -- Bleeding remove event for randol_medical or implement your own.
                if GetResourceState("randol_medical") == "started" then
                    exports.randol_medical:ClearBleeding()
                end
            end
        end
        if itemName == "lccampcoffee" then 
            if not speedBoosting then
                speedBoosting = true

                SetPedMoveRateOverride(PlayerId(), 10.0)
                SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)

                Citizen.CreateThread(function()
                    while speedBoosting do
                        RestorePlayerStamina(PlayerId(), 1.0)
                        Citizen.Wait(100)
                    end
                end)

                Wait(15000) -- 15 second speed boost

                SetPedMoveRateOverride(PlayerId(), 1.0)
                SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                speedBoosting = false
            end
        end
    end
end)


--  ___ __  __  ___ _____ ___     _   _  _ ___ __  __   _ _____ ___ ___  _  _ ___   _ 
-- | __|  \/  |/ _ \_   _| __|   /_\ | \| |_ _|  \/  | /_\_   _|_ _/ _ \| \| / __| (_)
-- | _|| |\/| | (_) || | | _|   / _ \| .` || || |\/| |/ _ \| |  | | (_) | .` \__ \  _ 
-- |___|_|  |_|\___/ |_| |___| /_/ \_\_|\_|___|_|  |_/_/ \_\_| |___\___/|_|\_|___/ (_) 
animProps = {
    -- prop_cs_plate_01
    -- prop_cs_bowl_01

    ["lccookedsmores"]  = { Dict = "mp_player_inteat@burger", Clip = "mp_player_int_eat_burger", Flag = 49, Prop = "prop_cs_burger_01",  Bone = 60309, Coords = vector3(0.0000, 0.0000, -0.0200), Rot = vector3(30.0000, 0.0000, 0.0000) },
    ["lccookedsteak"]   = { Dict = "mp_player_inteat@burger", Clip = "mp_player_int_eat_burger", Flag = 49, Prop = "prop_cs_steak",      Bone = 60309, Coords = vector3(0.0000, 0.0000, -0.0200), Rot = vector3(30.0000, 0.0000, 0.0000) },
    ["lccookedcorn"]    = { Dict = "mp_player_inteat@burger", Clip = "mp_player_int_eat_burger", Flag = 49, Prop = "prop_cs_burger_01",  Bone = 60309, Coords = vector3(0.0000, 0.0000, -0.0200), Rot = vector3(30.0000, 0.0000, 0.0000) },
    ["lccookedfish"]    = { Dict = "mp_player_inteat@burger", Clip = "mp_player_int_eat_burger", Flag = 49, Prop = "prop_cs_steak",      Bone = 60309, Coords = vector3(0.0000, 0.0000, -0.0200), Rot = vector3(30.0000, 0.0000, 0.0000) },

    ["lcherbtea"]       = { Dict = "amb@world_human_drinking@coffee@male@idle_a", Clip = "idle_c", Flag = 49, Prop = "v_serv_bs_mug",  Bone = 28422, Coords = vector3(0.03, -0.02, 0.0), Rot = vector3(0.0, 0.0, 0.0) },
    ["lccampcoffee"]    = { Dict = "amb@world_human_drinking@coffee@male@idle_a", Clip = "idle_c", Flag = 49, Prop = "v_serv_bs_mug",  Bone = 28422, Coords = vector3(0.03, -0.02, 0.0), Rot = vector3(0.0, 0.0, 0.0) },

    ["lcfullcanteen"]         = { 
        Dict = "mp_player_intdrink", 
        Clip = "loop_bottle", 
        Flag = 49, 
        Prop = "bzzz_prop_military_canteen_b",  
        Bone = 18905, 
        Coords = vector3(0.120000, 0.008000, 0.030000), 
        Rot = vector3(240.000000, -60.000000, 0.000000) 
    },
    ["lccookedpotato"] = { 
        Dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", 
        Clip = "base_idle", 
        Flag = 49, 
        Prop = "prop_cs_plate_01",           
        Bone = 18905, 
        Coords = vector3(0.189000, 0.016000, 0.093000), 
        Rot = vector3(-51.150139, -31.649944, 9.000000),            
        Prop2 = "prop_cs_fork",
        Bone2 = 28422,
        Coords2 = vector3(-0.010304226881431, 0.031160255694439, 0.0056142832694485),
        Rot2 = vector3(11.34630527137, 2.5163187323639, -174.82598851279),
    },
    ["lccookedstew"] = { 
        Dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", 
        Clip = "base_idle", 
        Flag = 49, 
        Prop = "prop_cs_bowl_01",           
        Bone = 60309, 
        Coords = vector3(0.000000, 0.000000, 0.000000), 
        Rot = vector3(0.000000, 0.000000, 0.000000),            
        Prop2 = "h4_prop_h4_caviar_spoon_01a",
        Bone2 = 28422,
        Coords2 = vector3(0.000000, 0.000000, 0.000000),
        Rot2 = vector3(0.000000, 0.000000, 0.000000),
    },
    ["lccookedsoup"] = { 
        Dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", 
        Clip = "base_idle", 
        Flag = 49, 
        Prop = "prop_cs_bowl_01",           
        Bone = 60309, 
        Coords = vector3(0.000000, 0.000000, 0.000000), 
        Rot = vector3(0.000000, 0.000000, 0.000000),            
        Prop2 = "h4_prop_h4_caviar_spoon_01a",
        Bone2 = 28422,
        Coords2 = vector3(0.000000, 0.000000, 0.000000),
        Rot2 = vector3(0.000000, 0.000000, 0.000000),
    },
    ["lccookedbeans"] = { 
        Dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", 
        Clip = "base_idle", 
        Flag = 49, 
        Prop = "h4_prop_h4_caviar_tin_01a",           
        Bone = 60309, 
        Coords = vector3(0.000000, 0.030000, 0.010000), 
        Rot = vector3(0.000000, 0.000000, 0.000000),            
        Prop2 = "h4_prop_h4_caviar_spoon_01a",
        Bone2 = 28422,
        Coords2 = vector3(0.000000, 0.000000, 0.000000),
        Rot2 = vector3(0.000000, 0.000000, 0.000000),
    },
    ["lcfishnchips"] = { 
        Dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", 
        Clip = "base_idle", 
        Flag = 49, 
        Prop = "prop_cs_plate_01",           
        Bone = 18905, 
        Coords = vector3(0.189000, 0.016000, 0.093000), 
        Rot = vector3(-51.150139, -31.649944, 9.000000),            
        Prop2 = "prop_cs_fork",
        Bone2 = 28422,
        Coords2 = vector3(-0.010304226881431, 0.031160255694439, 0.0056142832694485),
        Rot2 = vector3(11.34630527137, 2.5163187323639, -174.82598851279),
    },
    ["lcsteakveggies"] = { 
        Dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", 
        Clip = "base_idle", 
        Flag = 49, 
        Prop = "prop_cs_plate_01",           
        Bone = 18905, 
        Coords = vector3(0.189000, 0.016000, 0.093000), 
        Rot = vector3(-51.150139, -31.649944, 9.000000),            
        Prop2 = "prop_cs_fork",
        Bone2 = 28422,
        Coords2 = vector3(-0.010304226881431, 0.031160255694439, 0.0056142832694485),
        Rot2 = vector3(11.34630527137, 2.5163187323639, -174.82598851279),
    },
    ["lcmeatpotato"] = { 
        Dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", 
        Clip = "base_idle", 
        Flag = 49, 
        Prop = "prop_cs_plate_01",           
        Bone = 18905, 
        Coords = vector3(0.189000, 0.016000, 0.093000), 
        Rot = vector3(-51.150139, -31.649944, 9.000000),            
        Prop2 = "prop_cs_fork",
        Bone2 = 28422,
        Coords2 = vector3(-0.010304226881431, 0.031160255694439, 0.0056142832694485),
        Rot2 = vector3(11.34630527137, 2.5163187323639, -174.82598851279),
    },
}


-- -- Syncs props and tree data with players after loaded.
if GetResourceState('qb-core') == "started" then

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()         
        Citizen.Wait(5000) 
        
        local QBCore = exports['qb-core']:GetCoreObject()        
        Identifier = QBCore.Functions.GetPlayerData().citizenid

        TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
        TriggerServerEvent("xmmx_letscampplus:requestTreeData")
    end)

elseif GetResourceState('qbx_core') == "started" then

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()         
        Citizen.Wait(5000) 
        
        Identifier = exports.qbx_core:GetPlayerData().citizenid 
        
        TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
        TriggerServerEvent("xmmx_letscampplus:requestTreeData")
    end)

elseif GetResourceState('es_extended') == "started" then 

    RegisterNetEvent('esx:onPlayerSpawn', function(xPlayer)        
        Citizen.Wait(5000) 
        
        local ESX = exports['es_extended']:getSharedObject() 
        Identifier = ESX.GetPlayerData().identifier 
        
        TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
        TriggerServerEvent("xmmx_letscampplus:requestTreeData")
    end)

elseif GetResourceState('your_framework') == "started" then --- add your custom framework name here
    
    -- RegisterNetEvent('your_playerloaded_event', function() -- add your player loaded event here        
    --     Citizen.Wait(5000) 
        
    --     Identifier = exports.qbx_core:GetPlayerData().citizenid 
        
    --     TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
    --     TriggerServerEvent("xmmx_letscampplus:requestTreeData")
    -- end)

end

AddEventHandler('onClientResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    while not NetworkIsPlayerActive(PlayerId()) do Wait(500) end
    if GetResourceState('qb-core') == "started" then
        local QBCore = exports['qb-core']:GetCoreObject()        
        Identifier = QBCore.Functions.GetPlayerData().citizenid
        TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
        TriggerServerEvent("xmmx_letscampplus:requestTreeData") 
    elseif GetResourceState('qbx_core') == "started" then            
        Identifier = exports.qbx_core:GetPlayerData().citizenid        
        TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
        TriggerServerEvent("xmmx_letscampplus:requestTreeData")
    elseif GetResourceState('es_extended') == "started" then             
        local ESX = exports['es_extended']:getSharedObject() 
        Identifier = ESX.GetPlayerData().identifier         
        TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
        TriggerServerEvent("xmmx_letscampplus:requestTreeData")
    elseif GetResourceState('your_framework') == "started" then --- add your custom framework name here
        
        TriggerServerEvent("xmmx_letscampplus:server:ClientSpawned")
        TriggerServerEvent("xmmx_letscampplus:requestTreeData")
    end
end)