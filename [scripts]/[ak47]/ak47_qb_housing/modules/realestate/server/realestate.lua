RegisterCommand(Config.Commands.createhouse, function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if (xPlayer.PlayerData.job.name == Config.Realestate.Job and xPlayer.PlayerData.job.grade.level >= Config.Realestate.createhouserank) or IsAdmin(source) then
        TriggerClientEvent('ak47_qb_housing:createhouse', source)
    else
        TriggerClientEvent('ak47_qb_housing:notify', source, _U('nopermission'))
    end
end)

RegisterCommand(Config.Commands.deletehouse, function(source, args)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if (xPlayer.PlayerData.job.name == Config.Realestate.Job and xPlayer.PlayerData.job.grade.level >= Config.Realestate.deletehouserank) or IsAdmin(source) then
        TriggerClientEvent('ak47_qb_housing:deletehouse:agent', source)
    else
        TriggerClientEvent('ak47_qb_housing:notify', source, _U('nopermission'))
    end
end)
