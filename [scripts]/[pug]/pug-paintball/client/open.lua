print'Pug Paintball 3.3.3'

function PaintBallNotify(msg, type, length)
    if Framework == "ESX" then
		FWork.ShowNotification(tostring(msg))
	elseif Framework == "QBCore" then
    	FWork.Functions.Notify(tostring(msg), type, length)
	end
end

function DrawTextOptiopnForSpectate()
    if GetResourceState('cd_drawtextui') == 'started' then
        TriggerEvent('cd_drawtextui:ShowUI', 'show', "[E] To open menu")
	elseif Framework == "QBCore" then
		exports[Config.CoreName]:DrawText('[E] To open menu', 'left')
	else
		FWork.TextUI('[E] To open menu', "error")
	end
end

function HideTextOptiopnForSpectate()
    if GetResourceState('cd_drawtextui') == 'started' then
        TriggerEvent('cd_drawtextui:HideUI')
	elseif Framework == "QBCore" then
		exports[Config.CoreName]:HideText()
	else
		FWork.HideUI()
	end
end

function PugCreateMenu(menuId, menuTitle, options, parentId)
    if Config.Menu == "ox_lib" then
        local oxOptions = {}
        for _, item in ipairs(options) do
            table.insert(oxOptions, {
                title = item.title,
                description = item.description or "",
                icon = item.icon,
                event = item.event,
                image = item.image,
                iconColor = item.iconColor,
                disabled = item.disabled,
                progress = item.progress,
                colorScheme = item.colorScheme,
                arrow = item.arrow,
                args = item.args,
            })
        end

        local data = {
            id = menuId,
            title = menuTitle,
            options = oxOptions
        }

        if parentId then
            data.menu = parentId -- enables back button
        end

        lib.registerContext(data)
        lib.showContext(menuId)
    else
        local qbOptions = {}
        for _, item in ipairs(options) do
            table.insert(qbOptions, {
                header = item.title,
                txt = item.description or "",
                icon = item.icon,
                image = item.image,
                iconColor = item.iconColor,
                disabled = item.disabled,
                progress = item.progress,
                params = {
                    event = item.event,
                    args = item.args
                }
            })
        end

        exports[Config.Menu]:openMenu(qbOptions)
    end
end


local OriginalPlayersArmor
function HandleStartingSetup() -- When you spawn into the match this function is called
    OriginalPlayersArmor = GetPedArmour(PlayerPedId())
    if Config.RemoveAllItemsForPlayer then
        TriggerServerEvent("Pug:server:SavePaintballItems")
    end
    DoScreenFadeOut(500)
    Wait(500)
    inMatch()
    if Config.UseVrHeadSet and Config.MakeCloneOfPlayer then
        CreateClone()
    end
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "startround", 0.03)
    TriggerEvent('Pug:client:InPaintBallMatchWL')
    SetEntityHealth(PlayerPedId(), 200)
    TriggerEvent("Pug:client:PaintballReviveEvent")
    if Config.Debug then
        print(ClosedInfo().weapon, 'weapon chosen')
    end
    if ClosedInfo().mode == Config.GameModes[4].name then
    elseif ClosedInfo().mode == Config.GameModes[6].name then
        GiveWeaponToPed(PlayerPedId(), GetHashKey(Config.OneInTheChamberWeapon), 0, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(Config.OneInTheChamberWeapon), 1)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(Config.OneInTheChamberWeapon), true)
        SetEntityHealth(PlayerPedId(), 110)
    else
        GiveWeaponToPed(PlayerPedId(), GetHashKey(ClosedInfo().weapon), 0, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(ClosedInfo().weapon), 1000)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(ClosedInfo().weapon), true)
    end
    FreezeEntityPosition(PlayerPedId(),true)
end

-- HandleEndingSetup
RegisterNetEvent('Pug:client:RemoveGameItems', function() -- removes items when the match ends
    TriggerEvent("Pug:Anticheat:FixRemovedGun")
    RemoveAllPedWeapons(PlayerPedId(), false)
    SetEntityHealth(PlayerPedId(), 200)
    if OriginalPlayersArmor then
        SetPedArmour(PlayerPedId(), OriginalPlayersArmor)
    end
end)

local function LoadModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

-- This is some bs thing a customer wanted me to add to detect some cheater flying into the arena or something, idk it made no sense. No one needs this......
-- local function createPaintBallZone(zones, name)
--     if GetResourceState('ox_lib') == 'started' then
--         Wait(1000)
--         lib.zones.poly({
--             thickness = zones['Zone'].maxZ - zones['Zone'].minZ,
--             debug = Config.Debug,
--             points = {
--                 table.unpack(zones['Zone']['Shape'])
--             },
--             onEnter = function()
--                 if name == 'ArenaMain' and ClosedInfo().ingame and ClosedInfo().map ~= 'gabz' then
--                     SetEntityCoords(PlayerPedId(), Config.PedLocation)
--                     if Framework == "QBCore" then
--                         local player = Config.FrameworkFunctions.GetPlayer(true, false, true)
--                         TriggerEvent('qb-log:server:CreateLog', 'paintballcheater', ("Player: %s %s somehow left the arena, was teleported back and may be cheating"):format(
--                             player.PlayerData.charinfo.firstname,
--                             player.PlayerData.charinfo.lastname
--                         ))
--                     end
--                 end
--             end,
--             onExit = function() end,
--         })
--     else
--         local zone = PolyZone:Create(zones['Zone']['Shape'], {
--             name = name,
--             minZ = zones.minZ,
--             maxZ = zones.maxZ,
--             debugPoly = Config.Debug
--         })
--         zone:onPlayerInOut(function(isPointInside)
--             if not isPointInside and name == 'ArenaMain' then
--                 if ClosedInfo().ingame and ClosedInfo().map ~= 'gabz' then
--                     SetEntityCoords(PlayerPedId(), Config.PedLocation)
--                     if Framework == "QBCore" then
--                         local player = Config.FrameworkFunctions.GetPlayer(true, false, true)
--                         TriggerEvent('qb-log:server:CreateLog', 'paintballcheater', ("Player: %s %s somehow left the arena, was teleported back and may be cheating"):format(
--                             player.PlayerData.charinfo.firstname,
--                             player.PlayerData.charinfo.lastname
--                         ))
--                     end
--                 end
--             end
--         end)
--     end
-- end
-- for k, v in pairs(Config.ArenaZone) do
--     createPaintBallZone(v, k)
-- end

local function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 90)
    ClearDrawOrigin()
end


CreateThread(function()
    if not Config.UseVrHeadSet then
        -- PedCreation
		ArenaPed = Config.ArenaPed
		LoadModel(ArenaPed)
		ArenaPedMan = CreatePed(2, ArenaPed, Config.PedLocation, false, false)
		SetPedFleeAttributes(ArenaPedMan, 0, 0)
		SetPedDiesWhenInjured(ArenaPedMan, false)
		SetPedKeepTask(ArenaPedMan, true)
		SetBlockingOfNonTemporaryEvents(ArenaPedMan, true)
		SetEntityInvincible(ArenaPedMan, true)
		FreezeEntityPosition(ArenaPedMan, true)
        TaskStartScenarioInPlace(ArenaPedMan, "WORLD_HUMAN_CLIPBOARD", 0, true)
        -- End
        blip = AddBlipForCoord(Config.PedLocation)
        SetBlipSprite(blip, 110)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.75)
        SetBlipColour(blip, 5)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Paint Ball")
        EndTextCommandSetBlipName(blip)
        if Config.Target then
            if Config.Target == "ox_target" then
                exports.ox_target:addLocalEntity(ArenaPedMan, {
                    {
                        name = 'ViewLobby',
                        event = 'Pug:client:ViewLobby',
                        icon = 'fas fa-clipboard',
                        label = "View Arena",
                        distance = 2.0,
                    }
                })
            else
                exports[Config.Target]:AddTargetEntity(ArenaPedMan, {
                    options = {
                        {
                            event = 'Pug:client:ViewLobby',
                            icon = "fas fa-clipboard",
                            label = "View Arena",
                        },
                    },
                    distance = 2.0
                })
            end
        else
            while true do
                Wait(1)
                if #(GetEntityCoords(PlayerPedId()) - vector3(Config.PedLocation.x, Config.PedLocation.y,Config.PedLocation.z)) <= 3 then
                    DrawText3Ds(Config.PedLocation.x, Config.PedLocation.y,Config.PedLocation.z+1, "~b~[E] ~w~View Arena")
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent("Pug:client:ViewLobby")
                        Wait(500)
                    end
                else
                    Wait(2000)
                end
            end
        end
    end
end)

RegisterNetEvent('Pug:client:ResetPlayerHealth', function()
    SetEntityHealth(PlayerPedId(), 200)
end)

RegisterNetEvent('Pug:client:ChooseMap', function()
    Config.FrameworkFunctions.TriggerCallback('Pug:serverCB:Checkongoinggame', function(gamestatus)
        if gamestatus then
            PaintBallNotify(Translations.error.active_game, 'error')
            TriggerEvent("Pug:client:ViewLobby")
            return
        end

        local options = {}

        table.insert(options, {
            title = Translations.menu.random,
            description = "Randomly chosen maps",
            event = "Pug:client:SelectChosenMap",
            args = "random",
            icon = "fa-dice",
            iconColor = "#e91e63", -- pink
        })


        local keys = {}
        for k in pairs(Config.Arenas) do
            table.insert(keys, k)
        end
        table.sort(keys)

        for _, k in ipairs(keys) do
            local v = Config.Arenas[k]
            table.insert(options, {
                title = v.name,
                description = v.description,
                icon = "fas fa "..v.icon,
                iconColor = v.iconColor,
                image = v.url,
                event = "Pug:client:SelectChosenMap",
                args = k
            })
        end
        if Config.Menu ~= "ox_lib" then
            table.insert(options, {
                title = " ",
                description = Translations.menu.go_back,
                event = "Pug:client:ViewLobby"
            })
        end

        PugCreateMenu("choose_map_menu", Translations.menu.map, options, Translations.menu.arenalobby)
    end)
end)

-- This is the selecting a map event (i dont remember why i placed it in open.lua?)
RegisterNetEvent("Pug:client:SelectChosenMap", function(arenaMap)
    if Config.HostOnlyCanControllGame then
        if LobbyHost then
            if LobbyHost == GetPlayerServerId(PlayerId()) then
            else
                TriggerEvent("Pug:client:ViewLobby")
                PaintBallNotify(Translations.error.need_to_be_lobby_host, 'error')
                return
            end
        else
            TriggerEvent("Pug:client:ViewLobby")
            PaintBallNotify(Translations.error.need_to_be_lobby_host, 'error')
            return
        end
    end
    if arenaMap == nil then
        TriggerServerEvent("Pug:SV:SetArenaMap",'random')
    else
        TriggerServerEvent("Pug:SV:SetArenaMap",arenaMap)
    end
    if not ClosedInfo().ingame then
        TriggerEvent("Pug:client:ViewLobby")
    end
end)

-- Blip System --
-- local Blips = {}
-- RegisterNetEvent('Pug:client:UpdatePaintballBlips', function(data)
--     if ClosedInfo().ingame then
--         for k, v in pairs(data) do
--             if v.src == GetPlayerServerId(PlayerId()) then
--             else
--                 if tostring(v.team).."team" == ClosedInfo().team then
--                     if DoesBlipExist(Blips[k]) then
--                     else
--                         Blips[k] = AddBlipForCoord(v.coords)
--                         return
--                     end
--                     BeginTextCommandSetBlipName('STRING')
--                     AddTextComponentString(v.name)
--                     EndTextCommandSetBlipName(Blips[k])
--                     SetBlipCoords(Blips[k], v.coords.x, v.coords.y, v.coords.z)
--                     if v.team == "red" then
--                         SetBlipColour(Blips[k], 1)
--                     else
--                         SetBlipColour(Blips[k], 3)
--                     end
--                     SetBlipAsShortRange(Blips[k], false)
--                     ShowHeadingIndicatorOnBlip(Blips[k], true)
--                     SetBlipRotation(Blips[k], math.ceil(v.coords.w))
--                 end
--             end
--         end
--     end
-- end)

-- RegisterNetEvent('Pug:client:PaintballRemoveAllBlips', function()
--     for k, v in pairs(Blips) do
--         if DoesBlipExist(Blips[k]) then
--             RemoveBlip(Blips[k])
--             Blips[k] = nil
--         end
--     end
-- end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    local center = vector3(2802.15, -3782.96, 96.95)
    local length, width, heading = 300.0, 400.0, 0.0
    local minZ, maxZ = 90.95, 101.15
    local DEBUG = Config.Debug

    local h = math.rad(heading)
    local cH, sH = math.cos(h), math.sin(h)
    local halfL, halfW = length * 0.5, width * 0.5

    local function rot2(xo, yo)
        return vector3(
            center.x + xo * cH - yo * sH,
            center.y + xo * sH + yo * cH,
            0.0
        )
    end

    local function corners()
        local p1 = rot2( halfL,  halfW)
        local p2 = rot2(-halfL,  halfW)
        local p3 = rot2(-halfL, -halfW)
        local p4 = rot2( halfL, -halfW)
        local b1 = vector3(p1.x, p1.y, minZ)
        local b2 = vector3(p2.x, p2.y, minZ)
        local b3 = vector3(p3.x, p3.y, minZ)
        local b4 = vector3(p4.x, p4.y, minZ)
        local t1 = vector3(p1.x, p1.y, maxZ)
        local t2 = vector3(p2.x, p2.y, maxZ)
        local t3 = vector3(p3.x, p3.y, maxZ)
        local t4 = vector3(p4.x, p4.y, maxZ)
        return b1,b2,b3,b4,t1,t2,t3,t4
    end

    local function isInsideBox(pos)
        if pos.z < minZ or pos.z > maxZ then return false end
        local dx, dy = pos.x - center.x, pos.y - center.y
        local rx =  dx * cH + dy * sH
        local ry = -dx * sH + dy * cH
        return math.abs(rx) <= halfL and math.abs(ry) <= halfW
    end

    local function tri(a,b,c,r,g,bl,a_) DrawPoly(a, b, c, r, g, bl, a_) end
    local function quad(a,b,c,d,r,g,bl,a_)
        tri(a,b,c,r,g,bl,a_); tri(a,c,d,r,g,bl,a_)
    end

    local function drawDebug()
        local b1,b2,b3,b4,t1,t2,t3,t4 = corners()
        DrawLine(b1,b2,255,0,0,220); DrawLine(b2,b3,255,0,0,220)
        DrawLine(b3,b4,255,0,0,220); DrawLine(b4,b1,255,0,0,220)
        DrawLine(t1,t2,0,255,0,220); DrawLine(t2,t3,0,255,0,220)
        DrawLine(t3,t4,0,255,0,220); DrawLine(t4,t1,0,255,0,220)
        DrawLine(b1,t1,0,150,255,220); DrawLine(b2,t2,0,150,255,220)
        DrawLine(b3,t3,0,150,255,220); DrawLine(b4,t4,0,150,255,220)
        quad(b1,b2,t2,t1,0,255,0,60)
        quad(b2,b3,t3,t2,0,255,0,60)
        quad(b3,b4,t4,t3,0,255,0,60)
        quad(b4,b1,t1,t4,0,255,0,60)
        quad(t1,t2,t3,t4,0,255,0,40)
        quad(b1,b2,b3,b4,255,0,0,30)
    end

    local function handleInBounds()
        if ClosedInfo().ingame then
            if ClosedInfo().team == 'redteam' then
                SetEntityCoords(PlayerPedId(), Config.RedTeamSpawns[ClosedInfo().map][placement])
                Wait(500); TriggerEvent("Pug:client:PaintballReviveEvent")
                PaintBallNotify(Config.Translations.success.savedfrinfall, 'success')
            elseif ClosedInfo().team == 'blueteam' then
                SetEntityCoords(PlayerPedId(), Config.BlueTeamSpawns[ClosedInfo().map][placement])
                Wait(500); TriggerEvent("Pug:client:PaintballReviveEvent")
                PaintBallNotify(Config.Translations.success.savedfrinfall, 'success')
            else
                SetEntityCoords(PlayerPedId(), Config.BlueTeamSpawns[ClosedInfo().map][2])
                Wait(500); TriggerEvent("Pug:client:PaintballReviveEvent")
                PaintBallNotify(Config.Translations.success.savedfrinfall, 'success')
            end
        else
            if not IsPedInAnyVehicle(PlayerPedId()) then
                SetEntityCoords(PlayerPedId(), Config.PedLocation)
                Wait(500); TriggerEvent("Pug:client:PaintballReviveEvent")
                PaintBallNotify(Config.Translations.success.savedfrinfall, 'success')
            end
        end
    end

    local lastInside = false
    CreateThread(function()
        while true do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local inside = isInsideBox(pos)
            if inside and not lastInside then handleInBounds() end
            lastInside = inside
            if DEBUG then drawDebug(); Wait(0) else Wait(500) end
        end
    end)
end)

RegisterNetEvent("Pug:client:PaintballNotifyEvent", function(msg, type, length)
	PaintBallNotify(msg, type, length)
end)

if Framework == "QBCore" then
    -- On player load to give items back to the player if the crashed or logged out during a match.
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        Wait(1000)
        if #(GetEntityCoords(PlayerPedId()) - vector3(2945.65, -3796.44, 143.26)) <= 1000 or #(GetEntityCoords(PlayerPedId()) -  vector3(-3234.46, 7045.22, 637.62)) <= 100 or 
        #(GetEntityCoords(PlayerPedId()) -  vector3(1376.41, -784.41, 67.64)) <= 100 and GetResourceState('nuketown-mirrorpark') == 'started' then
            SetEntityCoords(PlayerPedId(), Config.PedLocation)
            PaintBallNotify("You have been removed from the arena area.", 'success')
        end
        if not Config.HasBattleRoyaleScript then
            if Config.RemoveAllItemsForPlayer then
                GivePaintballItems()
            end
        end
    end)
elseif Framework == "ESX" then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
        Wait(1000)
        if #(GetEntityCoords(PlayerPedId()) - vector3(2945.65, -3796.44, 143.26)) <= 1000 or #(GetEntityCoords(PlayerPedId()) -  vector3(-3234.46, 7045.22, 637.62)) <= 100 or 
        #(GetEntityCoords(PlayerPedId()) -  vector3(1376.41, -784.41, 67.64)) <= 100 and GetResourceState('nuketown-mirrorpark') == 'started' then
            SetEntityCoords(PlayerPedId(), Config.PedLocation)
            PaintBallNotify("You have been removed from the arena area.", 'success')
        end
        if not Config.HasBattleRoyaleScript then
            if Config.RemoveAllItemsForPlayer then
                GivePaintballItems()
            end
        end
    end)
end

-- Outffi for red and blue team (THIS CAN ALL BE ADJUSTED IN THE CONFIG. DONT TOUCH THIS HERE.)
function OutFitRed()
    local GenderType = 'mp_m_freemode_01'
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        GenderType =  'mp_m_freemode_01'
    else
        GenderType = 'mp_f_freemode_01'
    end 
    local Info = {
        Gender = GenderType,
        Team = "redteam",
    }
    Config.FrameworkFunctions.TriggerCallback('Pug:SVCB:GetTeamOutfits', function(Data)
        if Data then
            for clothingPiece, _ in pairs(Data) do
                if clothingPiece == 'hat' then -- 'hat' is a prop, not a component
                    SetPedPropIndex(PlayerPedId(), 0, Data.hat, Data.that)
                else
                    local componentId
                    if clothingPiece == 'torso' then
                        componentId = 3
                    elseif clothingPiece == 'mask' then
                        componentId = 1
                    elseif clothingPiece == 'pants' then
                        componentId = 4
                    elseif clothingPiece == 'jacket' then
                        componentId = 11
                    elseif clothingPiece == 'shoes' then
                        componentId = 6
                    elseif clothingPiece == 'undershirt' then
                        componentId = 8
                    elseif clothingPiece == 'bag' then
                        componentId = 5
                    end
                    if componentId then
                        SetPedComponentVariation(PlayerPedId(), componentId, Data[clothingPiece], Data['t'..clothingPiece])
                    end
                end
            end
        end
    end, Info)
end

function OutFitBlue()
    local GenderType = 'mp_m_freemode_01'
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        GenderType =  'mp_m_freemode_01'
    else
        GenderType = 'mp_f_freemode_01'
    end 
    local Info = {
        Gender = GenderType,
        Team = "blueteam",
    }
    Config.FrameworkFunctions.TriggerCallback('Pug:SVCB:GetTeamOutfits', function(Data)
        if Data then
            for clothingPiece, _ in pairs(Data) do
                if clothingPiece == 'hat' then -- 'hat' is a prop, not a component
                    SetPedPropIndex(PlayerPedId(), 0, Data.hat, Data.that)
                else
                    local componentId
                    if clothingPiece == 'torso' then
                        componentId = 3
                    elseif clothingPiece == 'mask' then
                        componentId = 1
                    elseif clothingPiece == 'pants' then
                        componentId = 4
                    elseif clothingPiece == 'jacket' then
                        componentId = 11
                    elseif clothingPiece == 'shoes' then
                        componentId = 6
                    elseif clothingPiece == 'undershirt' then
                        componentId = 8
                    elseif clothingPiece == 'bag' then
                        componentId = 5
                    end
                    if componentId then
                        SetPedComponentVariation(PlayerPedId(), componentId, Data[clothingPiece], Data['t'..clothingPiece])
                    end
                end
            end
        end
    end, Info)
end
RegisterNetEvent('Pug:client:CloseAllPaintballMenuWhenStart',function()
    if #(GetEntityCoords(PlayerPedId()) - vector3(Config.PedLocation.x,Config.PedLocation.y,Config.PedLocation.z)) <= 50.0 then
        if Config.Menu == "ox_lib" then
            lib.hideContext(false)
        else
            exports[Config.Menu]:closeMenu()
        end
    end
end)

RegisterNetEvent('Pug:client:AcivateUavPaintball',function(coords,id)
    if ClosedInfo().ingame then
        if tonumber(GetPlayerServerId(PlayerId())) == tonumber(id) then return end
        local uavblip = {}
        local alpha = 250
        uavblip[id] = AddBlipForRadius(coords.x,coords.y,coords.z, 7.0)
        SetBlipSprite(uavblip[id],9)
        SetBlipColour(uavblip[id],49)
        SetBlipAlpha(uavblip[id],alpha)
        SetBlipAsShortRange(uavblip[id], false)

        while alpha ~= 0 do
            Wait(100)
            alpha = alpha - 5
            SetBlipAlpha(uavblip[id], alpha)
            if alpha == 0 then
                RemoveBlip(uavblip[id])
                uavblip[id] = nil
                return
            end
        end
    end
end)

RegisterNetEvent("Pug:client:StoreRedTeamClothes", function()
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        PlayersGender = "mp_m_freemode_01"
    else
        PlayersGender = "mp_f_freemode_01"
    end
    local Data = {
        torso = GetPedDrawableVariation(PlayerPedId(),3),
        ttorso = GetPedTextureVariation(PlayerPedId(),3),
        mask = GetPedDrawableVariation(PlayerPedId(),1),
        tmask = GetPedTextureVariation(PlayerPedId(),1),
        pants = GetPedDrawableVariation(PlayerPedId(),4),
        tpants = GetPedTextureVariation(PlayerPedId(),4),
        jacket = GetPedDrawableVariation(PlayerPedId(),11),
        tjacket = GetPedTextureVariation(PlayerPedId(),11),
        shoes = GetPedDrawableVariation(PlayerPedId(),6),
        tshoes = GetPedTextureVariation(PlayerPedId(),6),
        undershirt = GetPedDrawableVariation(PlayerPedId(),8),
        tundershirt = GetPedTextureVariation(PlayerPedId(),8),
        bag = GetPedDrawableVariation(PlayerPedId(),5),
        tbag = GetPedTextureVariation(PlayerPedId(),5),
        hat = GetPedPropIndex(PlayerPedId(),0),
        that = GetPedPropTextureIndex(PlayerPedId(), 0),
        Gender = PlayersGender,
    }
    TriggerServerEvent("Pug:server:UpdateRedTeamsClothes", Data)
end)

RegisterNetEvent("Pug:client:StoreBlueTeamClothes", function()
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        PlayersGender = "mp_m_freemode_01"
    else
        PlayersGender = "mp_f_freemode_01"
    end
    local Data = {
        torso = GetPedDrawableVariation(PlayerPedId(),3),
        ttorso = GetPedTextureVariation(PlayerPedId(),3),
        mask = GetPedDrawableVariation(PlayerPedId(),1),
        tmask = GetPedTextureVariation(PlayerPedId(),1),
        pants = GetPedDrawableVariation(PlayerPedId(),4),
        tpants = GetPedTextureVariation(PlayerPedId(),4),
        jacket = GetPedDrawableVariation(PlayerPedId(),11),
        tjacket = GetPedTextureVariation(PlayerPedId(),11),
        shoes = GetPedDrawableVariation(PlayerPedId(),6),
        tshoes = GetPedTextureVariation(PlayerPedId(),6),
        undershirt = GetPedDrawableVariation(PlayerPedId(),8),
        tundershirt = GetPedTextureVariation(PlayerPedId(),8),
        bag = GetPedDrawableVariation(PlayerPedId(),5),
        tbag = GetPedTextureVariation(PlayerPedId(),5),
        hat = GetPedPropIndex(PlayerPedId(),0),
        that = GetPedPropTextureIndex(PlayerPedId(), 0),
        Gender = PlayersGender,
    }
    TriggerServerEvent("Pug:server:UpdateBlueTeamsClothes", Data)
end)

function SetupOxLibRadial()
    lib.addRadialItem({
        id = 'paintballsurrender',
        label = "Surrender \n Paintball",
        icon = 'skull-crossbones',
        onSelect = function ()
            if isInMatch then
                if not DeathCooldown then
                    if not IsPlayerDead then
                        TriggerServerEvent('Pug:paintball:RemovePlayer',playerTeam)
                        TriggerEvent('Pug:client:InPaintBallMatchWLFalse')
                    else
                        PaintBallNotify(Translations.error.cant_do_this, 'error')
                    end
                else
                    PaintBallNotify(Translations.error.cant_do_this, 'error')
                end
            end
            lib.hideRadial()
        end
    })
end

local function IsInPaintball()
    return ClosedInfo().ingame
end
exports("IsInPaintball", IsInPaintball)

function CheckingIfDeadFunction() -- NEVER CHANGE THIS UNLESS I HAVE DIRECTED YOU TO.
    return IsPedFatallyInjured(PlayerPedId())
end

RegisterNetEvent("Pug:client:PaintballReviveEvent", function()
    if GetResourceState('ambulancejob') == 'started' then
        TriggerEvent('ambulancejob:healPlayer', {revive = true}) -- to heal player
    elseif GetResourceState('ak47_qb_ambulancejob') == 'started' then
        TriggerEvent('ak47_qb_ambulancejob:revive')
        TriggerEvent('ak47_qb_ambulancejob:skellyfix')
    elseif GetResourceState('ak47_ambulancejob') == 'started' then
        TriggerEvent('ak47_ambulancejob:revive') 
        TriggerEvent('ak47_ambulancejob:skellyfix') 
    elseif GetResourceState('wasabi_ambulance') == 'started' then
        TriggerEvent('wasabi_ambulance:revive') -- Wasabi ambulance was updated and added support for "hospital:client:Revive"
    elseif GetResourceState('ars_ambulancejob') == 'started' then
        TriggerEvent('ars_ambulancejob:healPlayer', {revive = true}) -- to revive player
        TriggerEvent('ars_ambulancejob:healPlayer', {heal = true}) -- to heal player
    elseif GetResourceState('visn_are') == 'started' then
        TriggerEvent('hospital:client:Revive')
        TriggerEvent('esx_ambulancejob:revive')
        TriggerEvent('visn_are:resetHealthBuffer')
    elseif Framework == "QBCore" then
        TriggerEvent('hospital:client:Revive')
        TriggerEvent("qbx_medical:client:playerRevived")
    else
        TriggerEvent('esx_ambulancejob:revive')
    end
end)

RegisterNetEvent('Pug:client:ResetPlayerHealth', function()
    SetEntityHealth(PlayerPedId(), 200)
end)