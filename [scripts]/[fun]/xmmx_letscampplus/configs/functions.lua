-- The events inside the functions are an EXAMPLE! 
-- This may not work for every server as some stress events are triggered differently. 
-- Same with healing, and player metadata. You must add your own custom events in the functions.
-- Or delete the functions you do not need or use!
-- THESE ARE COMPLETELY OPTIONAL!!! 

local tentStressThread = nil
local tentHealThread = nil
local bedStressThread = nil
local inTent = false
local inBed = false

return {
--   ___ _   _ _  _  ___ _____ ___ ___  _  _ ___   _ 
--  | __| | | | \| |/ __|_   _|_ _/ _ \| \| / __| (_)
--  | _|| |_| | .` | (__  | |  | | (_) | .` \__ \  _ 
--  |_|  \___/|_|\_|\___| |_| |___\___/|_|\_|___/ (_)
    CampTent = function(bool, heal)
        -- EXAMPLE:
        inTent = bool
        Wait(5000)

        -- Terminate both threads if tent is exited
        if not bool then
            if tentStressThread then
                TerminateThread(tentStressThread)
                tentStressThread = nil
            end
            if tentHealThread then
                TerminateThread(tentHealThread)
                tentHealThread = nil
            end
            return
        end

        -- Stress relief
        if not heal and bool and not tentStressThread then
            tentStressThread = CreateThread(function()
                while inTent do
                    local data = XM.GetPlayerData()
                    local stress = data.metadata and data.metadata.stress or 0

                    if stress > 0 then
                        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 10))
                    else
                        -- Stop the thread if stress is zero
                        break
                    end

                    Wait(15000)
                end
                tentStressThread = nil
            end)
        end

        -- Slow healing
        if heal and bool and not tentHealThread then
            tentHealThread = CreateThread(function()
                while inTent do
                    local ped = PlayerPedId()
                    local health = GetEntityHealth(ped)
                    if health < 200 then
                        SetEntityHealth(ped, math.min(health + 5, 200))
                        XM.Notification(false, nil, "You are healing!", "success", 3000)
                    end
                    
                    if health > 180 and health < 200 then 
                        -- Bleeding remove event for randol_medical or implement your own.
                        if GetResourceState("randol_medical") == "started" then
                            exports.randol_medical:ClearBleeding()
                        end
                    end
                    Wait(10000)
                end
                tentHealThread = nil
            end)
        end --]]
    end,

    CampChair = function(bool)
        -- Example
        inChair = bool
        if not bool and chairStressThread then
            TerminateThread(chairStressThread)
            chairStressThread = nil
            return
        end

        if bool and not chairStressThread then
            chairStressThread = CreateThread(function()
                while inTent do
                    local data = XM.GetPlayerData()
                    local stress = data.metadata and data.metadata.stress or 0

                    if stress > 0 then
                        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 10))
                    else                        
                        break
                    end

                    Wait(15000)
                end
                chairStressThread = nil
            end)
        end --]]
    end,

    CampBed = function(bool)
        -- Example
        inBed = bool
        if not bool and bedStressThread then
            TerminateThread(bedStressThread)
            bedStressThread = nil
            return
        end

        if bool and not bedStressThread then
            bedStressThread = CreateThread(function()
                while inTent do
                    local data = XM.GetPlayerData()
                    local stress = data.metadata and data.metadata.stress or 0

                    if stress > 0 then
                        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 10))
                    else                        
                        break
                    end

                    Wait(15000)
                end
                bedStressThread = nil
            end)
        end --]]
    end,



--   __  __ ___ _  _ ___ ___   _   __  __ ___ ___   _ 
--  |  \/  |_ _| \| |_ _/ __| /_\ |  \/  | __/ __| (_)
--  | |\/| || || .` || | (_ |/ _ \| |\/| | _|\__ \  _ 
--  |_|  |_|___|_|\_|___\___/_/ \_\_|  |_|___|___/ (_)
    MiniGame = function(game)
        if game == "circles" then 

            XM.ShowHud(false)
            local success = exports.xmmx_circlesgame:StartCircleGame("easy", 20, "letters", "Crafting:")
            XM.ShowHud(true)

            return success
        elseif game == "keys" then 

            XM.ShowHud(false)
            local success = exports.xmmx_keysgame:StartKeyGame("arrows", 7, 4, "Crafting:", "#666c1c", "#868f24")
            XM.ShowHud(true)

            return success

        elseif game == "beans" then -- Minigame for the Beans Diarrhea Effect.
            local rand = math.random(1, 2)
            if rand == 1 then
                XM.ShowHud(false)
                local success = exports.xmmx_circlesgame:StartCircleGame("easy", 20, "letters", "Shitting:")
                XM.ShowHud(true)

                return success
            else
                XM.ShowHud(false)
                local success = exports.xmmx_keysgame:StartKeyGame("arrows", 7, 4, "Shitting:", "#666c1c", "#868f24")
                XM.ShowHud(true)

                return success
            end
        end
    end,

    -- Tree Chopping Minigame:
    TreeMiniGame = function(game, level, label)
        if game == "circles" then 
            if level == "easy" then

                XM.ShowHud(false)
                local success = exports.xmmx_circlesgame:StartCircleGame("easy", 20, "letters", "Chopping " .. label)
                XM.ShowHud(true)

                -- print(success)
                return success
            elseif level == "medium" then

                XM.ShowHud(false)
                local success = exports.xmmx_circlesgame:StartCircleGame("medium", 30, "numbers", "Chopping " .. label)
                XM.ShowHud(true)

                -- print(success)
                return success
            elseif level == "hard" then

                XM.ShowHud(false)
                local success = exports.xmmx_circlesgame:StartCircleGame("hard", 45, "mixed", "Chopping " .. label)
                XM.ShowHud(true)

                -- print(success)
                return success
            end
        elseif game == "keys" then 
            if level == "easy" then

                XM.ShowHud(false)
                local success = exports.xmmx_keysgame:StartKeyGame("arrows", 7, 4, "Chopping " .. label, "#666c1c", "#868f24")
                XM.ShowHud(true)

                -- print(success)
                return success
            elseif level == "medium" then

                XM.ShowHud(false)
                local success = exports.xmmx_keysgame:StartKeyGame("numbers", 8, 4, "Chopping ", "#666c1c", "#868f24")
                XM.ShowHud(true)

                -- print(success)
                return success
            elseif level == "hard" then

                XM.ShowHud(false)
                local success = exports.xmmx_keysgame:StartKeyGame("letters", 9, 5, "Chopping ", "#666c1c", "#868f24")
                XM.ShowHud(true)

                -- print(success)
                return success
            end
        end
    end,
}