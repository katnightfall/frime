RegisterNetEvent('devkit_bodybagSV:notify', function(source, message, type)
    TriggerClientEvent('devkit_bodybagCL:notify', source, message, type)
end)