function GetCore()
    local object = nil
    local Framework = Config.Framework

    if Config.Framework == "oldesx" then
        local counter = 0
        while not object do
            TriggerEvent('esx:getSharedObject', function(obj) object = obj end)
            counter = counter + 1
            if counter == 3 then
                break
            end
            Citizen.Wait(1000)
        end
        if not object then
            print(
                _event(
                    '::Framework is not selected in the config correctly if you\'re sure it\'s correct please check your events to get framework object'))
        end
    end

    if Config.Framework == "esx" then
        local counter = 0
        local status = pcall(function()
            exports['es_extended']:getSharedObject()
        end)
        if status then
            while not object do
                object = exports['es_extended']:getSharedObject()
                counter = counter + 1
                if counter == 3 then
                    break
                end
                Citizen.Wait(1000)
            end
        end
        if not object then
            print(
                _event(
                    '::Framework is not selected in the config correctly if you\'re sure it\'s correct please check your events to get framework object'))
        end
    end

    if Config.Framework == "qb" then
        local counter = 0
        local status = pcall(function()
            exports["qb-core"]:GetCoreObject()
        end)
        if status then
            while not object do
                object = exports["qb-core"]:GetCoreObject()
                counter = counter + 1
                if counter == 3 then
                    break
                end
                Citizen.Wait(1000)
            end
        end
        if not object then
            print(
                _event(
                    '::Framework is not selected in the config correctly if you\'re sure it\'s correct please check your events to get framework object'))
        end
    end

    if Config.Framework == "oldqb" then
        local counter = 0

        while not object do
            counter = counter + 1
            TriggerEvent('QBCore:GetObject', function(obj) object = obj end)
            if counter == 3 then
                break
            end
            Citizen.Wait(1000)
        end
        if not object then
            print(
                _event(
                    '::Framework is not selected in the config correctly if you\'re sure it\'s correct please check your events to get framework object'))
        end
    end

    if Config.Framework == "vrp" then
        local counter = 0
        local Proxy = nil
        -- local tunnel = module("vrp", "lib/Tunnel")


        local ok = pcall(function()
            Proxy = module("vrp", "lib/Proxy")
        end)

        if ok and Proxy then
            while not object do
                object = Proxy.getInterface("vRP")
                counter = counter + 1
                if counter == 3 then break end
                Citizen.Wait(1000)
            end
        end

        if not object and type(vRP) == "table" then
            object = vRP
        end

        if not object then
            print(
                "tw-electrician: vRP interface alınamadı. fxmanifest'te @vrp/lib dosyalarının eklendiğinden ve vRP'nin çalıştığından emin olun.")
        end
    end

    return object, Framework
end
