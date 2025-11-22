local RequestId = 0
local serverRequests = {}

TriggerServerCallback = function(eventName, ...)
    local prom = promise.new()

    local requestId = RequestId
    serverRequests[requestId] = function(...)
        prom:resolve(...)
    end
    TriggerServerEvent("tworst-fashion:triggerServerCallback", eventName, requestId, GetInvokingResource() or "unknown",
        ...)
    RequestId = RequestId + 1


    return Citizen.Await(prom)
end


RegisterNetEvent("tworst-fashion:serverCallback", function(requestId, invoker, ...)
    if not serverRequests[requestId] then
        return print(("[^1ERROR^7] Server Callback with requestId ^5%s^7 Was Called by ^5%s^7 but does not exist.")
            :format(requestId, invoker))
    end

    serverRequests[requestId](...)
    serverRequests[requestId] = nil
end)



jobData = {
    jobname = nil,
    job_grade_name = nil,
    job_grade = nil,
    job_label = nil
}

local Player = {}
local Loaded = false

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    Wait(1000)
    TriggerServerEvent('tworst-fashion:loadData')
    Player = {
        Group = {
            [xPlayer.job.name] = xPlayer.job.grade,
        },
    }

    Loaded = true

    TriggerEvent('interact:groupsChanged', Player.Group)
end)


RegisterNetEvent('esx:onPlayerLogout', function()
    Player = table.wipe(Player)

    TriggerEvent('interact:groupsChanged', {})
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    TriggerServerEvent('tworst-fashion:loadData')
end)

AddEventHandler("vRP:Active", function()
    Wait(1000)
    TriggerServerEvent('tworst-fashion:loadData')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Player = table.wipe(Player)

    TriggerEvent('interact:groupsChanged', {})
end)


RegisterNetEvent("tworst-fashion:RefreshInventory")
AddEventHandler("tworst-fashion:RefreshInventory", function()
    local inventory = TriggerServerCallback('tworst-fashion:server:GetPlayerInventory')
    NuiMessage('SET_INVENTORY', inventory)
end)



RegisterNetEvent("esx:addInventoryItem")
AddEventHandler("esx:addInventoryItem", function()
    local inventory = TriggerServerCallback('tworst-fashion:server:GetPlayerInventory')
    NuiMessage('SET_INVENTORY', inventory)
end)

function ChecklistItem(item)
    for _, v in pairs(Config.InventoryAccess.allowedItems) do
        if item == v then
            return true
        end
    end
    return false
end

function FormatItems(items)
    local data = {}
    for _, v in pairs(items) do
        local amount = v.count or v.amount
        if amount > 0 and ChecklistItem(v.name) then
            local formattedData = v
            formattedData.name = v.name
            formattedData.label = v.label
            formattedData.amount = amount
            formattedData.metadata = v.metadata or v.info
            formattedData.image = v.image or (v.name .. '.png')
            if formattedData.metadata and next(formattedData.metadata) == nil then
                formattedData.metadata = false
            end
            table.insert(data, formattedData)
        end
    end
    return data
end

RegisterNetEvent('esx:setPlayerData', function(key, value)
    if not Loaded or GetInvokingResource() ~= 'es_extended' then return end

    if key ~= 'job' then return end

    Player.Group = { [value.name] = value.grade }


    TriggerEvent('interact:groupsChanged', Player.Group)
end)

RegisterNetEvent("QBCore:Player:SetPlayerData")
AddEventHandler("QBCore:Player:SetPlayerData", function(PlayerData)
    local startjob = getStartJob() or false
    if startjob then
        local items = PlayerData.items
        local formattedItems = FormatItems(items)
        NuiMessage('SET_INVENTORY', formattedItems)
    end
end)

RegisterNetEvent("esx:removeInventoryItem")
AddEventHandler("esx:removeInventoryItem", function()
    local inventory = TriggerServerCallback('tworst-fashion:server:GetPlayerInventory')
    NuiMessage('SET_INVENTORY', inventory)
end)


CreateThread(function()
    Core, Config.Framework = GetCore()
    spawnPed()
    createBlips()
    SetPlayerJob()
end)
AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentServerEndpoint() == nil) then
        return
    end
    if (resource == GetCurrentResourceName()) then
        TriggerServerEvent('tworst-fashion:loadData')
        ClearPedTasks(PlayerPedId())
    end
end)

function SetPlayerJob()
    while Core == nil do
        Wait(0)
    end
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()

    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local PlayerData = Core.GetPlayerData()
        jobData.jobname = PlayerData.job.name
        jobData.job_grade_name = PlayerData.job.label
        jobData.job_grade = tonumber(PlayerData.job.grade)
        Player = {
            Group = {},
        }

        TriggerEvent('interact:groupsChanged', Player.Group)
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local PlayerData = Core.Functions.GetPlayerData()
        jobData.jobname = PlayerData["job"].name
        jobData.job_grade_name = PlayerData["job"].label
        jobData.job_grade = PlayerData["job"].grade.level
        Player = {
            Group = {
                [PlayerData.job.name] = PlayerData.job.grade.level,
                [PlayerData.gang.name] = PlayerData.gang.grade.level
            },
            job = PlayerData.job.name,
            gang = PlayerData.gang.name,
        }
        TriggerEvent('interact:groupsChanged', Player.Group)
    elseif Config.Framework == 'vrp' then
        jobData.jobname = "fashion"
        jobData.job_grade_name = "Fashion Employee"
        jobData.job_grade = 0
    end
end

function WaitPlayer()
    if Config.Framework == "esx" or Config.Framework == 'oldesx' then
        while Core == nil do Wait(0) end
        while Core.GetPlayerData() == nil do Wait(0) end
        while Core.GetPlayerData().job == nil do Wait(0) end
    elseif Config.Framework == "qb" or Config.Framework == "oldqb" then
        while Core == nil do Wait(0) end
        while Core.Functions.GetPlayerData() == nil do Wait(0) end
        while Core.Functions.GetPlayerData().metadata == nil do Wait(0) end
    elseif Config.Framework == "vrp" then
        while Core == nil do Wait(0) end
        Wait(1000)
    end
end

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    Wait(1000)
    SetPlayerJob()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(data)
    Wait(1000)
    SetPlayerJob()
end)


local blips = {}

function createBlips()
    if Config.Fashion['blip']['show'] then
        blips = AddBlipForCoord(tonumber(Config.Fashion['coords'].intreactionCoords.x),
            tonumber(Config.Fashion['coords'].intreactionCoords.y),
            tonumber(Config.Fashion['coords'].intreactionCoords.z))
        SetBlipSprite(blips, Config.Fashion['blip'].blipType)
        SetBlipDisplay(blips, 4)
        SetBlipScale(blips, Config.Fashion['blip'].blipScale)
        SetBlipColour(blips, Config.Fashion['blip'].blipColor)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(Config.Fashion['blip'].blipName))
        EndTextCommandSetBlipName(blips)
    end

    if Config.Fashion['marketBlip']['show'] then
        blips = AddBlipForCoord(tonumber(Config.Fashion['market']['intreactionCoords'].x),
            tonumber(Config.Fashion['market']['intreactionCoords'].y),
            tonumber(Config.Fashion['market']['intreactionCoords'].z))
        SetBlipSprite(blips, Config.Fashion['marketBlip'].blipType)
        SetBlipDisplay(blips, 4)
        SetBlipScale(blips, Config.Fashion['marketBlip'].blipScale)
        SetBlipColour(blips, Config.Fashion['marketBlip'].blipColor)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(Config.Fashion['marketBlip'].blipName))
        EndTextCommandSetBlipName(blips)
    end
end

function canOpen()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        return false
    end
    if Config.Fashion['job'] then
        if Config.Fashion['job'] ~= 'all' and Config.Fashion['job'] ~= jobData.jobname then
            Config.sendNotification(Config.NotificationText['wrongjob'].text, Config.NotificationText['wrongjob'].type)
            return false
        end
    end
    return true
end

function spawnPed()
    if Config.Fashion.coords.ped then
        WaitForModel(Config.Fashion.coords.pedHash)
        local createNpc = CreatePed("PED_TYPE_PROSTITUTE", Config.Fashion.coords.pedHash,
            Config.Fashion.coords.pedCoords.x, Config.Fashion.coords.pedCoords.y,
            Config.Fashion.coords.pedCoords.z - 0.98, Config.Fashion.coords.pedHeading, false, false)
        FreezeEntityPosition(createNpc, true)
        SetEntityInvincible(createNpc, true)
        SetBlockingOfNonTemporaryEvents(createNpc, true)
    end

    if Config.Fashion.market.ped then
        WaitForModel(Config.Fashion.market.pedHash)
        local createNpc = CreatePed("PED_TYPE_PROSTITUTE", Config.Fashion.market.pedHash,
            Config.Fashion.market.pedCoords.x, Config.Fashion.market.pedCoords.y,
            Config.Fashion.market.pedCoords.z - 0.98, Config.Fashion.market.pedHeading, false, false)
        FreezeEntityPosition(createNpc, true)
        SetEntityInvincible(createNpc, true)
        SetBlockingOfNonTemporaryEvents(createNpc, true)
    end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 250
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function SetBlipAttributes(blip, id)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 26)
    ShowNumberOnBlip(blip, id)
    SetBlipShowCone(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Fashion : " .. id)
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent('tworst-fashion:openMenu', function()
    if canOpen() then
        openFashionMenu()
    end
end)

RegisterNetEvent('tworst-fashion:openMarketMenu', function()
    if canOpen() then
        openMarketMenu()
    end
end)

function WaitForModel(model)
    if not IsModelValid(model) then
        return
    end

    if not HasModelLoaded(model) then
        RequestModel(model)
    end

    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function()
    Config.OpenTrigger = function()
        if Config.InteractionHandler == "qb-target" then
            exports['qb-target']:AddBoxZone("tw-fashion_1" .. 1,
                vector3(Config.Fashion.coords.intreactionCoords.x,
                    Config.Fashion.coords.intreactionCoords.y,
                    Config.Fashion.coords.intreactionCoords.z), 1.5,
                1.5,
                {
                    name = "tw-fashion_1" .. 1,
                    debugPoly = false,
                    heading = -20,
                    minZ = Config.Fashion.coords.intreactionCoords.z - 2,
                    maxZ = Config.Fashion.coords.intreactionCoords.z + 2,
                }, {
                    options = {
                        {
                            type = "client",
                            event = "tworst-fashion:openMenu",
                            icon = 'fas fa-credit-card',
                            label = "Open Fashion Menu",


                        },
                    },
                    distance = 2
                })

            exports['qb-target']:AddBoxZone("tw-fashion_2" .. 1,
                vector3(Config.Fashion.market.intreactionCoords.x,
                    Config.Fashion.market.intreactionCoords.y,
                    Config.Fashion.market.intreactionCoords.z), 1.5,
                1.5,
                {
                    name = "tw-fashion_2" .. 1,
                    debugPoly = false,
                    heading = -20,
                    minZ = Config.Fashion.market.intreactionCoords.z - 2,
                    maxZ = Config.Fashion.market.intreactionCoords.z + 2,
                }, {
                    options = {
                        {
                            type = "client",
                            event = "tworst-fashion:openMarketMenu",
                            icon = 'fas fa-credit-card',
                            label = "Open Market Menu",

                        },
                    },
                    distance = 2
                })
        elseif Config.InteractionHandler == "ox-target" then
            exports['ox_target']:addBoxZone({
                coords = vector3(Config.Fashion.coords.intreactionCoords.x,
                    Config.Fashion.coords.intreactionCoords.y,
                    Config.Fashion.coords.intreactionCoords.z),
                minZ = Config.Fashion.coords.intreactionCoords.z - 2,
                maxZ = Config.Fashion.coords.intreactionCoords.z + 2,
                heading = -20,
                name = "tw-fashion_1" .. 1,
                id = "tw-fashion_1" .. 1,
                options = {
                    {
                        type = "client",
                        event = "tworst-fashion:openMenu",
                        icon = 'fas fa-credit-card',
                        label = "Open Fashion Menu",
                    },
                },
                distance = 2
            })

            exports['ox_target']:addBoxZone({
                coords = vector3(Config.Fashion.market.intreactionCoords.x,
                    Config.Fashion.market.intreactionCoords.y,
                    Config.Fashion.market.intreactionCoords.z),
                minZ = Config.Fashion.market.intreactionCoords.z - 2,
                maxZ = Config.Fashion.market.intreactionCoords.z + 2,
                heading = -20,
                name = "tw-fashion_2" .. 1,
                id = "tw-fashion_2" .. 1,
                options = {
                    {
                        type = "client",
                        event = "tworst-fashion:openMarketMenu",
                        icon = 'fas fa-credit-card',
                        label = "Open Market Menu",
                    },
                },
                distance = 2
            })
        elseif Config.InteractionHandler == "drawtext" then
            Citizen.CreateThread(function()
                while true do
                    local wait = 1500
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local distance = #(coords - Config.Fashion.coords.intreactionCoords)
                    local distance2 = #(coords - Config.Fashion.market.intreactionCoords)
                    if distance < 1.5 then
                        wait = 0
                        DrawText3D(Config.Fashion.coords.intreactionCoords.x,
                            Config.Fashion.coords.intreactionCoords.y,
                            Config.Fashion.coords.intreactionCoords.z + 1.0,
                            Config.Fashion['drawtext']['text'])
                        if IsControlJustReleased(0, 38) then
                            if canOpen() then
                                openFashionMenu()
                            end
                        end
                    end
                    if distance2 < 1.5 then
                        wait = 0
                        DrawText3D(Config.Fashion.market.intreactionCoords.x,
                            Config.Fashion.market.intreactionCoords.y,
                            Config.Fashion.market.intreactionCoords.z + 1.0,
                            Config.Fashion['drawtext']['marketText'])
                        if IsControlJustReleased(0, 38) then
                            if canOpen() then
                                openMarketMenu()
                            end
                        end
                    end
                    Citizen.Wait(wait)
                end
            end)
        end
    end
end)

function PlayAnim(dataName)
    local playerPed = PlayerPedId()
    if dataName == 'PickUpVehicle' then
        LoadAnimation('anim@scripted@player@fix_chop_resting@heeled@')
        TaskPlayAnim(playerPed, 'anim@scripted@player@fix_chop_resting@heeled@', 'petting', 6.0, -6.0, 1400, 49, 0, 0, 0,
            0)
        NuiMessage('showProgressBar', { label = Config.Fashion['progressBarText']['openboxLoading'], time = 1.3 })
        FreezeEntityPosition(playerPed, true)
        Citizen.Wait(1400)
        FreezeEntityPosition(playerPed, false)
        ClearPedTasksImmediately(playerPed)
        return true
    elseif dataName == 'giveVehicle' then
        LoadAnimation('anim@scripted@player@fix_chop_resting@heeled@')
        TaskPlayAnim(playerPed, 'anim@scripted@player@fix_chop_resting@heeled@', 'petting', 6.0, -6.0, 2000, 49, 0, 0, 0,
            0)
        NuiMessage('showProgressBar', { label = Config.Fashion['progressBarText']['giveVehicle'], time = 1.8 })
        FreezeEntityPosition(playerPed, true)
        Citizen.Wait(2000)
        FreezeEntityPosition(playerPed, false)
        ClearPedTasksImmediately(playerPed)
        return true
    elseif dataName == 'pickupWaiting' then
        LoadAnimation('anim@heists@load_box')
        TaskPlayAnim(playerPed, 'anim@heists@load_box', 'lift_box', 6.0, -6.0, 2000, 49, 0, 0, 0, 0)
        NuiMessage('showProgressBar', { label = Config.Fashion['progressBarText']['pickupWaiting'], time = 1.8 })
        FreezeEntityPosition(playerPed, true)
        Citizen.Wait(2000)

        FreezeEntityPosition(playerPed, false)
        ClearPedTasksImmediately(playerPed)
        return true
    elseif dataName == 'pickupDelivery' then
        LoadAnimation('anim@heists@load_box')
        TaskPlayAnim(playerPed, 'anim@heists@load_box', 'lift_box', 6.0, -6.0, 2000, 49, 0, 0, 0, 0)
        NuiMessage('showProgressBar', { label = Config.Fashion['progressBarText']['pickupDelivery'], time = 1.8 })
        FreezeEntityPosition(playerPed, true)
        Citizen.Wait(2000)

        FreezeEntityPosition(playerPed, false)
        ClearPedTasksImmediately(playerPed)
        return true
    elseif dataName == 'giveWaiting' then
        LoadAnimation('anim@heists@load_box')
        TaskPlayAnim(playerPed, 'anim@heists@load_box', 'lift_box', 6.0, -6.0, 1400, 49, 0, 0, 0, 0)
        NuiMessage('showProgressBar', { label = Config.Fashion['progressBarText']['giveWaiting'], time = 1.3 })
        FreezeEntityPosition(playerPed, true)
        Citizen.Wait(1400)
        FreezeEntityPosition(playerPed, false)
        ClearPedTasksImmediately(playerPed)
        return true
    end
end

function carryBox(object)
    if object then
        SetEntityAsMissionEntity(object, true, true)
        AttachEntityToEntity(object, PlayerPedId(), -1, 0.019697455903838, 0.47330197325337, 0.068196162511645, 0, 0, 0,
            true, true, false, true, 1, true)
    end

    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        RequestAnimDict("anim@heists@box_carry@")
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 4.0, 4.0, -1, 51, 0, false, false, false)
end

function LoadAnimation(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
end

function PlayEffect(dict, particleName, entity, off, rot, time, cb)
    CreateThread(function()
        RequestNamedPtfxAsset(dict)
        while not HasNamedPtfxAssetLoaded(dict) do
            Wait(0)
        end
        UseParticleFxAssetNextCall(dict)
        Wait(10)
        local particleHandle = StartParticleFxLoopedOnEntity(particleName, entity, off.x, off.y, off.z, rot.x, rot.y,
            rot.z, 1.0)
        SetParticleFxLoopedColour(particleHandle, 0, 255, 0, 0)
        Wait(time)
        StopParticleFxLooped(particleHandle, false)
        cb()
    end)
end

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function GetVehicles()
    return GetGamePool('CVehicle')
end

function GetVehiclesInArea(coords, maxDistance)
    return EnumerateEntitiesWithinDistance(GetVehicles(), false, coords, maxDistance)
end

function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
    local nearbyEntities = {}

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end
    for k, entity in pairs(entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if distance <= maxDistance then
            nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
        end
    end
    return nearbyEntities
end

function v2(coords) return vec3(coords.x, coords.y, 0.0) end

function CreateProp(modelHash, ...)
    if not IsModelInCdimage(modelHash) then
        return
    end
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(0) end
    local obj = CreateObject(modelHash, ...)
    SetModelAsNoLongerNeeded(modelHash)
    return obj
end

local lastCoords = {}

GetRandomCoordInCircle = function(coord, radiusNumber, count)
    local coordstable = {}
    local minDistance = 2.0
    for i = 1, tonumber(count) do
        local radius = tonumber(radiusNumber) or 75.0
        local coords = vector3(coord.x, coord.y, coord.z + 0.8)
        local x, y, z = GenerateRandomCoords(coords, radius, minDistance, i, coordstable)
        if x ~= nil and y ~= nil and z ~= nil then
            table.insert(coordstable, vector3(x, y, z))
        end
    end
    lastCoords = coordstable
    return coordstable
end

function GenerateRandomCoords(coords, radius, minDistance, attempt, coordstable)
    local x, y, z
    repeat
        x = coords.x + math.random(-radius, radius)
        y = coords.y + math.random(-radius, radius)
        z = FindZForCoords(x, y)
    until not IsTooCloseToLastCoords(x, y, minDistance)
    return x, y, z
end

function IsTooCloseToLastCoords(x, y, minDistance)
    for _, existingCoord in ipairs(lastCoords) do
        local distance = GetDistanceBetweenCoords2(existingCoord.x, existingCoord.y, x, y)
        if distance < minDistance then
            return true
        end
    end
    return false
end

function FindZForCoords(x, y)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local object = CreateProp(GetHashKey("prop_anim_cash_note"), x, y, playerCoords.z, true, true, false)
    PlaceObjectOnGroundProperly(object)
    local objectCoords = GetEntityCoords(object)
    DeleteEntity(object)
    return objectCoords.z - 0.2
end

function GetDistanceBetweenCoords2(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function GiveJobClothing()
    if Config.ChangeClothesSystem then
        local gender
        if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
            gender = 'male'
        elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
            gender = 'female'
        else
            return
        end
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerEvent("esx_skin:setLastSkin", skin)
        end)

        local clothes = Config.JobClothes[gender]
        if clothes then
            for _, cloth in ipairs(clothes) do
                for part, id in pairs(cloth) do
                    if part ~= "texture" then
                        ChangeClothes(part, id, cloth.texture)
                    end
                end
            end
        end

    end
end

function ChangeClothes(key, value, texture)
    local playerPed = PlayerPedId()
    value = tonumber(value)
    texture = tonumber(texture)

    if key == 'jacket' then
        SetPedComponentVariation(playerPed, 11, value, texture, 2)
    end
    if key == 'shirt' then
        SetPedComponentVariation(playerPed, 8, value, texture, 2)
    end
    if key == 'arms' then
        SetPedComponentVariation(playerPed, 3, value, texture, 2)
    end
    if key == 'legs' then
        SetPedComponentVariation(playerPed, 4, value, texture, 2)
    end
    if key == 'shoes' then
        SetPedComponentVariation(playerPed, 6, value, texture, 2)
    end
    if key == 'mask' then
        SetPedComponentVariation(playerPed, 1, value, texture, 2)
    end
    if key == 'chain' then
        SetPedComponentVariation(playerPed, 7, value, texture, 2)
    end
    if key == 'decals' then
        SetPedComponentVariation(playerPed, 10, value, texture, 2)
    end
    if key == 'helmet' then
        SetPedPropIndex(playerPed, 0, value, texture, 2)
    end
    if key == 'glasses' then
        SetPedPropIndex(playerPed, 1, value, texture, 2)
    end
    if key == 'watches' then
        SetPedPropIndex(playerPed, 6, value, texture, 2)
    end
    if key == 'bracelets' then
        SetPedPropIndex(playerPed, 7, value, texture, 2)
    end
end

function RefreshSkin()
    if Config.ChangeClothesSystem then
        if Config.ClothingScript == 'fivem-appearance' then
            -- wasabi-fivem-appearance
            Core.TriggerServerCallback('esx_skin:getPlayerSkin', function(appearance)
                exports['fivem-appearance']:setPlayerAppearance(appearance)
            end)

            --normal fivem-appearance
            -- TriggerEvent("fivem-appearance:client:reloadSkin")
        end
        if Config.ClothingScript == 'illenium-appearance' then
            TriggerEvent("illenium-appearance:client:reloadSkin")
        end
        if Config.ClothingScript == 'esx_skin' then
            TriggerEvent("esx_skin:getLastSkin", function(lastSkin)
                TriggerEvent('skinchanger:loadSkin', lastSkin)
            end)
        end
        if Config.ClothingScript == 'qb-clothing' then
            TriggerEvent("qb-clothing:reloadSkin")
            --[[
                // Add this code in qb-clothing client/main.lua

                RegisterNetEvent("qb-clothing:reloadSkin")
                AddEventHandler("qb-clothing:reloadSkin", function()
                    local playerPed = PlayerPedId()
                    local health = GetEntityHealth(playerPed)
                    reloadSkin(health)
                end)
            --]]
            ExecuteCommand('refreshskin')
        end
    end
end

function distributeDeliveriesByRegionType(regionBoxDelivery, deliveryCount, missionCount, regionBoxDeliveryCount)
    if deliveryCount == nil or missionCount == nil or regionBoxDeliveryCount == nil then
        return
    end

    local selectedRegions = {} -- Seçilen bölgeler
    local deliveries = {}      -- Teslimatları tutan tablo

    -- Görev sayısına göre ağırlık ayarları
    local weights = {}
    if missionCount == 1 then
        weights = { poor = 0.5, mid = 0.2, rich = 0.1 } -- Fakir bölgeler ağırlıklı
    elseif missionCount == 2 then
        weights = { poor = 0.3, mid = 0.5, rich = 0.1 } -- Orta bölgeler ağırlıklı
    elseif missionCount >= 3 then
        weights = { poor = 0.1, mid = 0.4, rich = 0.5 } -- Zengin bölgeler ağırlıklı
    end

    -- Bölgelere göre bölge türlerini ayır
    local regionTypes = { poor = {}, mid = {}, rich = {} }
    for _, region in ipairs(regionBoxDelivery) do
        table.insert(regionTypes[region.regionType], region)
    end

    -- **Bölge seçiminde teslimat sayısını aşmamak için düzeltme**
    local totalRegions = math.min(regionBoxDeliveryCount, deliveryCount) -- En fazla deliveryCount kadar bölge seç

    while #selectedRegions < totalRegions do
        local randomValue = math.random()
        local selectedType = nil

        -- Ağırlıklara göre bölge türü seçimi
        if randomValue < weights.poor then
            selectedType = "poor"
        elseif randomValue < weights.poor + weights.mid then
            selectedType = "mid"
        else
            selectedType = "rich"
        end

        -- Seçilen türden rastgele bir bölge al
        if #regionTypes[selectedType] > 0 then
            local region = regionTypes[selectedType][math.random(#regionTypes[selectedType])]

            -- Bölge zaten seçilmediyse ekle
            local alreadySelected = false
            for _, selectedRegion in ipairs(selectedRegions) do
                if selectedRegion == region then
                    alreadySelected = true
                    break
                end
            end

            if not alreadySelected then
                table.insert(selectedRegions, region)
            end
        end
    end

    -- **Teslimatları daha az bölgeye yoğunlaştırarak dağıt**
    local remainingDeliveryCount = deliveryCount
    local tempDeliveries = {}

    for _, region in ipairs(selectedRegions) do
        local regionDeliveryCount = math.max(1, math.floor(remainingDeliveryCount / #selectedRegions)) -- Daha az bölgeye daha fazla teslimat ver
        remainingDeliveryCount = remainingDeliveryCount - regionDeliveryCount

        tempDeliveries[region] = {
            coords = region.boxDeliveryAreaCoords,
            radius = region.boxDeliveryAreaRadius,
            regionType = region.regionType,
            zCoords = region.zCoords,
            count = regionDeliveryCount,
        }
    end

    -- **Kalan teslimatları rastgele ekle (her bölgeye en az 1 verildiği için problem çıkmaz)**
    while remainingDeliveryCount > 0 do
        for _, region in ipairs(selectedRegions) do
            if remainingDeliveryCount > 0 then
                tempDeliveries[region].count = tempDeliveries[region].count + 1
                remainingDeliveryCount = remainingDeliveryCount - 1
            else
                break
            end
        end
    end

    deliveries = tempDeliveries


    for region, data in pairs(deliveries) do
        local blipsLabel = data.count .. " " .. Locales[Config.Locale]['boxdeliveryBlips']
        --addBlipsFunctions(data.coords, blipsLabel, 'boxdelivery')
        TriggerServerEvent('tworst-fashion:server:syncBlips', data.coords, blipsLabel, 'boxdelivery',
            CoopDataClient.roomSetting.owneridentifier)
    end


    return deliveries
end

--- Yields the current thread until a non-nil value is returned by the function.
---@generic T
---@param cb fun(): T?
---@param errMessage string?
---@param timeout? number | false Error out after `~x` ms. Defaults to 1000, unless set to `false`.
---@return T
---@async
function waitForClient(cb, errMessage, timeout)
    local value = cb()
    if value ~= nil then return value end

    if timeout or timeout == nil then
        if type(timeout) ~= 'number' then timeout = 1000 end
    end

    local startTime = timeout and GetGameTimer()

    while value == nil do
        Wait(0) -- Client-side'da daha akıcı çalışması için 0 bekleme süresi

        if timeout then
            local elapsed = GetGameTimer() - startTime
            if elapsed > timeout then
                return error(('%s (waited %.1fms)'):format(errMessage or 'failed to resolve callback', elapsed), 2)
            end
        end

        value = cb()
    end

    return value
end

function Controls(value)
    disableControls = value
end

Citizen.CreateThread(function()
    while true do
        if disableControls then
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 32, true)
            DisableControlAction(0, 33, true)
            DisableControlAction(0, 34, true)
            DisableControlAction(0, 35, true)
            DisableControlAction(0, 102, true)
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 44, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 73, true)
            DisableControlAction(0, 210, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 37, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 288, true)
            DisableControlAction(0, 289, true)
            DisableControlAction(0, 170, true)
            DisableControlAction(0, 167, true)
            DisableControlAction(0, 26, true)
            DisableControlAction(2, 199, true)
            DisableControlAction(0, 59, true)
            DisableControlAction(0, 71, true)
            DisableControlAction(0, 72, true)
            DisableControlAction(2, 36, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 177, true)
            DisableControlAction(0, 202, true)
            EnableControlAction(0, 322, true)
            EnableControlAction(0, 249, true)
            EnableControlAction(0, 46, true)
            SetPauseMenuActive(false)

            if selectedEntity and DoesEntityExist(selectedEntity) then
                SetEntityDrawOutline(selectedEntity, 1)
                SetEntityDrawOutlineColor(255, 255, 255, 255)
                SetEntityDrawOutlineShader(1)
            end

            Citizen.Wait(0)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if isPlacingObject then
            if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
                carryBox(nil)
            end
        end
    end
end)


function TriggerCallback(name, data)
    local incomingData = false
    local status = 'UNKOWN'
    local counter = 0
    while Core == nil do
        Wait(0)
    end
    if Config.Framework == 'esx' then
        Core.TriggerServerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    else
        Core.Functions.TriggerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    end
    CreateThread(function()
        while incomingData == 'UNKOWN' do
            Wait(1000)
            if counter == 4 then
                status = 'FAILED'
                incomingData = false
                break
            end
            counter = counter + 1
        end
    end)

    while status == 'UNKOWN' do
        Wait(0)
    end
    return incomingData
end

local jobDeliverCoordsInteraction = nil
local fashionDeliveryThread = nil

function ToggleVehicleDeliveryInteraction(state)
    if state then
        local function setupDeliveryCoords()
            if CoopDataClient and CoopDataClient.roomSetting then
                if CoopDataClient.roomSetting.jobDeliverCoords then
                    return vector3(CoopDataClient.roomSetting.jobDeliverCoords.x,
                        CoopDataClient.roomSetting.jobDeliverCoords.y,
                        CoopDataClient.roomSetting.jobDeliverCoords.z)
                elseif CoopDataClient.roomSetting.Mission and CoopDataClient.roomSetting.Mission.jobDeliverCoords then
                    return vector3(CoopDataClient.roomSetting.Mission.jobDeliverCoords.x,
                        CoopDataClient.roomSetting.Mission.jobDeliverCoords.y,
                        CoopDataClient.roomSetting.Mission.jobDeliverCoords.z)
                elseif jobDeliverCoords then
                    return jobDeliverCoords
                end
            end
            return nil
        end

        jobDeliverCoordsInteraction = setupDeliveryCoords()

        if not jobDeliverCoordsInteraction then
            local attempts = 0
            while not jobDeliverCoordsInteraction and attempts < 10 do
                Wait(1000)
                attempts += 1
                jobDeliverCoordsInteraction = setupDeliveryCoords()

                if attempts >= 5 and not jobDeliverCoordsInteraction and CoopDataClient.roomSetting.intreactionCoords then
                    jobDeliverCoordsInteraction = vector3(
                        Config.Fashion.coords.intreactionCoords.x,
                        Config.Fashion.coords.intreactionCoords.y,
                        Config.Fashion.coords.intreactionCoords.z
                    )
                    break
                end
            end

            if not jobDeliverCoordsInteraction then
                if Config.Debug then
                    print("[FASHION] Araç teslim noktası belirlenemedi.")
                end
                return false
            end
        end

        VehicleDeliveryInteraction = true

        if not fashionDeliveryThread then
            fashionDeliveryThread = true

            Citizen.CreateThread(function()
                while fashionDeliveryThread do
                    Wait(0)

                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, false)

                    if not IsPedInAnyVehicle(playerPed, false) then goto continue end
                    if GetPedInVehicleSeat(vehicle, -1) ~= playerPed then goto continue end
                    if isInteracting then goto continue end

                    local dist = #(GetEntityCoords(playerPed) - jobDeliverCoordsInteraction)
                    if dist < 10.0 then
                        DrawText3D(jobDeliverCoordsInteraction.x, jobDeliverCoordsInteraction.y,
                            jobDeliverCoordsInteraction.z + 1.5, '[E] - ' .. Locales[Config.Locale]['deliverVehicle'])

                        if IsControlJustReleased(0, 38) then
                            StartInteraction()
                            TriggerServerEvent('tworst-fashion:server:LeaveVehicle',
                                CoopDataClient.roomSetting.owneridentifier)
                            clearMissionData()
                            Citizen.SetTimeout(1000, function()
                                EndInteraction()
                            end)
                        end
                    end

                    ::continue::
                end
            end)
        end
    elseif not state and VehicleDeliveryInteraction then
        fashionDeliveryThread = false
        VehicleDeliveryInteraction = false
    end
end
