QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ak47_qb_smokingv2:notify')
AddEventHandler('ak47_qb_smokingv2:notify', function(msg, type)
    QBCore.Functions.Notify(msg, type)
end)

RegisterNetEvent('ak47_qb_smokingv2:progress')
AddEventHandler('ak47_qb_smokingv2:progress', function(msg, time)
    QBCore.Functions.Progressbar(msg, msg, time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done

    end, function()

    end)
end)

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

GetClosestPlayer = function(coords)
    return GetClosestEntity(GetPlayers(true, true), true, coords, nil)
end

GetClosestEntity = function(entities, isPlayerEntities, coords, modelFilter)
    local closestEntity, closestEntityDistance, filteredEntities = -1, -1, nil

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end

    if modelFilter then
        filteredEntities = {}

        for k,entity in pairs(entities) do
            if modelFilter[GetEntityModel(entity)] then
                table.insert(filteredEntities, entity)
            end
        end
    end

    for k,entity in pairs(filteredEntities or entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if closestEntityDistance == -1 or distance < closestEntityDistance then
            closestEntity, closestEntityDistance = isPlayerEntities and k or entity, distance
        end
    end

    return closestEntity, closestEntityDistance
end

GetPlayers = function(onlyOtherPlayers, returnKeyValue, returnPeds)
    local players, myPlayer = {}, PlayerId()

    for k,player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)

        if DoesEntityExist(ped) and ((onlyOtherPlayers and player ~= myPlayer) or not onlyOtherPlayers) then
            if returnKeyValue then
                players[player] = ped
            else
                table.insert(players, returnPeds and ped or player)
            end
        end
    end

    return players
end

function tofloat(value)
    return tonumber(string.format("%.2f", value))
end

--If you want to add some effect on smoke then make events like this and add your effect inside
function effectJoint()
    SetTimecycleModifierStrength(0.0)
    SetTimecycleModifier('spectator6')
    SetPedMotionBlur(PlayerPedId(), true)
    Citizen.Wait(5000)
    SetTimecycleModifierStrength(0.66)
    Citizen.Wait(3000)
    ShakeGameplayCam('DRUNK_SHAKE', 2.5)
    Citizen.Wait(3000)
    AddArmourToPed(PlayerPedId(), 25)
    RequestClipSet('MOVE_M@DRUNK@SLIGHTLYDRUNK')
    while not HasClipSetLoaded('MOVE_M@DRUNK@SLIGHTLYDRUNK') do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(PlayerPedId(), 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
    TriggerServerEvent('hud:server:RelieveStress', math.random(20, 25))
    while effectTime > 0 do
        Citizen.Wait(1000)
    end
    Citizen.Wait(15000)
    ClearTimecycleModifier()
    Citizen.Wait(15000)
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    SetPedMotionBlur(PlayerPedId(), false)
    Citizen.Wait(15000)
    ResetPedMovementClipset(PlayerPedId(), 0)
end

function effectVape()
    Citizen.Wait(5000)
    AddArmourToPed(PlayerPedId(), 10)
    TriggerServerEvent('hud:server:RelieveStress', math.random(15, 20))
    -- while vapeTime > 0 do
    --     Citizen.Wait(1000)

    -- end
end

--On Smoke Joint Events
AddEventHandler('ak47_qb_smokingv2:onsmoke:glacatti_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:hary_payton_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:grain_cream_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:wild_feline_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:frosty_phantom_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:peach_cobbler_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:boss_blend_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:pastry_blend_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:pure_runs_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:snowberry_gelato_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:berry_muffin_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:elegant_porcelain_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:rosy_dunes_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:zen_blend_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:crisp_gelato_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:golden_biscuit_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:collins_way_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:endurance_blend_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:choco_creme_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:spiky_pear_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:runs_elite_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:azure_tomyz_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:vapor_essence_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:frosties_blend_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:bio_crunch_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:frosted_delight_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:royal_haze_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:sunset_secret_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:fluffy_og_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:lunar_stone_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:tangy_fuel_joint', function()
    effectJoint()
end)
AddEventHandler('ak47_qb_smokingv2:onsmoke:summit_og_joint', function()
    effectJoint()
end)


--On Smoke Vape Events
AddEventHandler('ak47_qb_smokingv2:onvape:berry_swirl', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:golden_crumble', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:biscuit_bliss', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:fig_delight', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:citrus_crumble', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:fluffy_crunch', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:blend_99', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:paris_mist', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:bounce_blend', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:spiced_crumble', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:clover_crunch', function()
    effectVape()
end)
AddEventHandler('ak47_qb_smokingv2:onvape:berry_bliss', function()
    effectVape()
end)
