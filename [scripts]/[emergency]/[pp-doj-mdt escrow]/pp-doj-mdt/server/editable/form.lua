-- qb-inventory
if QBCore then
    QBCore.Functions.CreateUseableItem('doj_form', function(playerId, item)
        TriggerClientEvent('pp-doj-mdt:openFormItem', playerId, item.metadata)
    end)
end
