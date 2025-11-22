InsideGarage = false

Citizen.CreateThread(function()
    if Config.Garage.script == 'auto' then
        if GetResourceState('ak47_qb_garage') == 'started' or GetResourceState('ak47_qb_garage') == 'starting' then
            Config.Garage.script = 'ak47_qb_garage'
            return
        end
        if GetResourceState('cd_garage') == 'started' or GetResourceState('cd_garage') == 'starting' then
            Config.Garage.script = 'cd_garage'
            return
        end
        if GetResourceState('okokGarage') == 'started' or GetResourceState('okokGarage') == 'starting' then
            Config.Garage.script = 'okokGarage'
            return
        end
        if GetResourceState('qb-garages') == 'started' or GetResourceState('qb-garages') == 'starting' then
            Config.Garage.script = 'qb-garages'
            return
        end
        if GetResourceState('jg-advancedgarages') == 'started' or GetResourceState('jg-advancedgarages') == 'starting' then
            Config.Garage.script = 'jg-advancedgarages'
            return
        end
        if GetResourceState('loaf_garage') == 'started' or GetResourceState('loaf_garage') == 'starting' then
            Config.Garage.script = 'loaf_garage'
            return
        end
    end
end)

function SetGarage(hid)
    if Config.Garage.script == 'qb-garages' then
        if Houses[hid].garage.x then
            TriggerEvent('qb-garages:client:addHouseGarage', 'H:'..hid, {
                label = 'H:'..hid,
                takeVehicle = Houses[hid].garage,
                category = 'car',
            })
            Wait(100)
            TriggerEvent('qb-garages:client:setHouseGarage', 'H:'..hid, true)
        end
    end
end

function StoreVehicle(hid, vehicle)
    if Config.Garage.script == 'cd_garage' then
        TriggerEvent('cd_garage:StoreVehicle_Main', 1, false)
    elseif Config.Garage.script == 'okokGarage' then
        TriggerEvent("okokGarage:StoreVehiclePrivate")
    elseif Config.Garage.script == 'jg-advancedgarages' then
        TriggerEvent('jg-advancedgarages:client:store-vehicle', 'housing:'..hid, "car")
    elseif Config.Garage.script == 'ak47_qb_garage' then
        TriggerEvent("ak47_qb_garage:housing:storevehicle", "Housing "..hid, 'car')
    elseif Config.Garage.script == 'loaf_garage' then
        exports.loaf_garage:StoreVehicle("property", vehicle)
    else
        local prop = QBCore.Functions.GetVehicleProperties(vehicle)
        QBCore.Functions.TriggerCallback('ak47_qb_housing:garage:isowner', function(owner)
            if owner then
                TriggerEvent('ak47_qb_housing:garage:addvehicle', vehicle, prop.plate, prop)
                TriggerServerEvent('ak47_qb_housing:garage:store', hid, prop, NetworkGetNetworkIdFromEntity(vehicle))
            end
        end, prop.plate)
    end
end

function OpenGarage(hid)
    if Config.Garage.script == 'cd_garage' then
        TriggerEvent('cd_garage:PropertyGarage', 'quick', nil)
    elseif Config.Garage.script == 'okokGarage' then
        TriggerEvent("okokGarage:OpenPrivateGarageMenu", GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()))
    elseif Config.Garage.script == 'jg-advancedgarages' then
        local garage = Houses[hid].garage
        TriggerEvent('jg-advancedgarages:client:open-garage', 'housing:'..hid, "car", vec4(garage.x, garage.y, garage.z, garage.w))
    elseif Config.Garage.script == 'ak47_qb_garage' then
        TriggerEvent("ak47_qb_garage:housing:takevehicle", "Housing "..hid, 'car')
    elseif Config.Garage.script == 'loaf_garage' then
        local garage = Houses[hid].garage
        exports.loaf_garage:BrowseVehicles("property", vec4(garage.x, garage.y, garage.z, garage.w))
    else
        local options = {}
        if Houses[hid].garagevehicles and next(Houses[hid].garagevehicles) then
            for i, v in pairs(Houses[hid].garagevehicles) do
                if v.owner == Identifier then
                    local label = GetDisplayNameFromVehicleModel(v.model) or 'NULL'
                    table.insert(options,{label = label..'['..v.plate..']', data = v})
                end
            end
            if next(options) then
                InsideGarage = true
                inVLoop()
                local vehicle = nil
                local garage = Houses[hid].garage
                SetEntityVisible(PlayerPedId(), false)
                FreezeEntityPosition(PlayerPedId(), true)
                lib.registerMenu({
                    id = 'garagemenu',
                    title = _U('garage'),
                    position = 'bottom-right',
                    onSelected = function(selected, secondary, args)
                        DeleteEntity(vehicle)
                        local data = options[selected].data
                        RequestModel(data.model)
                        while not HasModelLoaded(data.model) do Citizen.Wait(0) end
                        vehicle = CreateVehicle(data.model, garage.x, garage.y, garage.z, garage.w, false, true)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                        QBCore.Functions.SetVehicleProperties(vehicle, data)
                        FreezeEntityPosition(vehicle, true)
                    end,
                    onClose = function(keyPressed)
                        DeleteEntity(vehicle)
                        SetEntityVisible(PlayerPedId(), true)
                        FreezeEntityPosition(PlayerPedId(), false)
                        InsideGarage = false
                    end,
                    options = options
                }, function(selected, scrollIndex, args)
                    local data = options[selected].data
                    DeleteEntity(vehicle)
                    SetEntityVisible(PlayerPedId(), true)
                    FreezeEntityPosition(PlayerPedId(), false)
                    local vehicle = CreateVehicle(data.model, garage.x, garage.y, garage.z, garage.w, true, true)
                    QBCore.Functions.SetVehicleProperties(vehicle, data)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    TriggerEvent('ak47_qb_housing:garage:removevehicle', vehicle, data.plate, data)
                    TriggerServerEvent('ak47_qb_housing:garage:out', tostring(hid), data.plate)
                    InsideGarage = false
                end)
                lib.showMenu('garagemenu')
            end
        end
    end
end

function inVLoop()
    Citizen.CreateThread(function()
        while InsideGarage do
            Citizen.Wait(0)
            DisableControlAction(0, 75,  true) -- Disable exit vehicle
            DisableControlAction(0, 24,  true) -- Disable attack
            DisableControlAction(0, 25,  true) -- Disable aim
            DisableControlAction(0, 68,  true) -- Disable vehicle aim
            DisableControlAction(0, 69,  true) -- Disable vehicle attack
            DisableControlAction(27, 75, true) -- Disable exit vehicle
        end
    end)
end

RegisterNetEvent('ak47_qb_housing:sync:garage', function(hid, garagevehicles)
    Houses[hid].garagevehicles = garagevehicles
end)

RegisterNetEvent('ak47_qb_housing:sync:movegarage', function(hid, data)
    Houses[hid].garage = data
end)