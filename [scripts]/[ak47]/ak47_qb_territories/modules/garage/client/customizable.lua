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

function setVehicleFuel(vehicle)
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, 100 + 0.0)
    elseif GetResourceState('ps-fuel') == 'started' then
        exports['ps-fuel']:SetFuel(vehicle, 100 + 0.0)
    else
        --custom fuel code here
        SetVehicleFuelLevel(vehicle, 100.0)
    end
end

function givekey(vehicle, plate)
    -- give vehicle key here
    if GetResourceState('ak47_qb_vehiclekeys') == 'started' then
        exports['ak47_qb_vehiclekeys']:GiveKey(plate)
    elseif GetResourceState('wasabi_carlock') == 'started' then
        exports['wasabi_carlock']:GiveKey(plate)
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:GiveKeys(plate, GetEntityModel(vehicle))
    elseif GetResourceState('cd_garage') == 'started' then
        TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
    else
        --custom code here
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    end
end

function removekey(vehicle, plate)
    -- remove vehicle key here
    if GetResourceState('ak47_qb_vehiclekeys') == 'started' then
        exports['ak47_qb_vehiclekeys']:RemoveKey(plate)
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:RemoveKeys(plate, GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
    else
        --custom code here
    end
end

function SetGarage(ganglabel, pos, heading)
    if Config.Garage.script == 'qb-garages' then
        TriggerEvent('qb-garages:client:addHouseGarage', 'Gang:'..ganglabel, {
            label = 'Gang:'..ganglabel,
            takeVehicle = vector4(pos.x, pos.y, pos.z, heading),
            category = 'car',
        })
        Wait(100)
        TriggerEvent('qb-garages:client:setHouseGarage', 'Gang:'..ganglabel, true)
    end
end

function StoreOwnVehicle(ganglabel, vehicle)
    if Config.Garage.script == 'ak47_qb_garage' then
        TriggerEvent("ak47_qb_garage:housing:storevehicle", "Gang "..ganglabel, 'car')
    elseif Config.Garage.script == 'cd_garage' then
        TriggerEvent('cd_garage:StoreVehicle_Main', 1, false)
    elseif Config.Garage.script == 'okokGarage' then
        TriggerEvent("okokGarage:StoreVehiclePrivate")
    elseif Config.Garage.script == 'jg-advancedgarages' then
        TriggerEvent('jg-advancedgarages:client:store-vehicle', 'gang:'..ganglabel, "car")
    elseif Config.Garage.script == 'loaf_garage' then
        exports.loaf_garage:StoreVehicle("property", vehicle)
    end
end

function OpenOwnGarage(ganglabel, pos, heading)
    if Config.Garage.script == 'ak47_qb_garage' then
        TriggerEvent("ak47_qb_garage:housing:takevehicle", "Gang "..ganglabel, 'car')
    elseif Config.Garage.script == 'cd_garage' then
        TriggerEvent('cd_garage:PropertyGarage', 'quick', nil)
    elseif Config.Garage.script == 'okokGarage' then
        TriggerEvent("okokGarage:OpenPrivateGarageMenu", GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()))
    elseif Config.Garage.script == 'jg-advancedgarages' then
        TriggerEvent('jg-advancedgarages:client:open-garage', 'gang:'..ganglabel, "car", vec4(pos.x, pos.y, pos.z, heading))
    elseif Config.Garage.script == 'loaf_garage' then
        exports.loaf_garage:BrowseVehicles("property", vec4(pos.x, pos.y, pos.z, heading))
    end
end