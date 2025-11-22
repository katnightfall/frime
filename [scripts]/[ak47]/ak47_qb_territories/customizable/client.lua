Notify = function(msg, type)
    lib.notify({
        type = type or 'info',
        description = msg,
        position = 'top',
    })

    -- QB Notify
    --QBCore.Functions.Notify(msg, type)
end

ShowProgress = function(progressData, success, cancel)
    if lib.progressCircle({
        label = progressData.label,
        duration = progressData.duration,
        disable = progressData.disable,
        canCancel = progressData.canCancel,
        prop = progressData.prop,
        anim = progressData.anim,
    }) then
        if success then
            success()
        end
    else
        if cancel then
            cancel()
        end
    end

    -- Qb Progress
    --[[
    QBCore.Functions.Progressbar('drugmanagerv2:collect', progressData.label, progressData.duration, false, progressData.canCancel, {
        disableMovement = progressData.disable.move, 
        disableCarMovement = progressData.disable.car, 
        disableMouse = progressData.disable.mouse, 
        disableCombat = progressData.disable.combat
    },{
        animDict = progressData.anim and progressData.anim.dict, 
        anim = progressData.anim and progressData.anim.clip,
        flags = progressData.anim and progressData.anim.flag,
    }, nil, nil, function()
        success()
    end, function()
        cancel()
    end)
    ]]
end

CancleProgress = function()
    if lib.progressActive() then
        lib.cancelProgress()
    end

    -- Qb Progress
    --TriggerEvent('progressbar:client:cancel')
end