Citizen.CreateThread(function ()
    if Utils.Functions.GetFrameworkType() == 'esx' then
        if Config.OpenMenuWithTablet.active then
            while Server.Framework == nil do
                Wait(100)
            end
            Server.Framework.RegisterUsableItem(Config.OpenMenuWithTablet.itemName, function(source)
                TriggerClientEvent("0r-apartment:Client:OpenTablet", source)
            end)
        end
    end
end)
