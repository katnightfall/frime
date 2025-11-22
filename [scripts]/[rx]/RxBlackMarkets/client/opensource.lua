--[[
BY RX Scripts © rxscripts.xyz
--]]

function AddTarget(name, bOptions)
    if OXTarget then
        OXTarget:addLocalEntity(bOptions.obj, {
            {
                label = "Open " .. name,
                name = name,
                icon = "fas fa-laptop",
                iconColor = "black",
                distance = 2.5,
                onSelect = function()
                    OpenBlackMarket(name)
                end,
            },
        })
    elseif QBTarget then
        QBTarget:AddTargetEntity(bOptions.obj, {
            options = {
                {
                    num = 1,
                    icon = "fas fa-laptop",
                    label = "Open " .. name,
                    action = function()
                        OpenBlackMarket(name)
                    end
                },
            },
            distance = 2.5
        })
    end
end

function AddPickupTarget(entity, name, location)
    if OXTarget then
        OXTarget:addLocalEntity(entity, {
            {
                label = "Pickup Items",
                name = name,
                icon = "fas fa-boxes",
                iconColor = "red",
                distance = 2.5,
                onSelect = function()
                    PickupItems(location)
                end,
            },
        })
    elseif QBTarget then
        QBTarget:AddTargetEntity(entity, {
            options = {
                {
                    num = 1,
                    icon = "fas fa-boxes",
                    label = "Pickup Items",
                    action = function()
                        PickupItems(location)
                    end
                },
            },
            distance = 2.5
        })
    end
end

function IsJobAllowed(jobs)
    local pJob = FM.player.getJob()
    if not pJob then return false end

    for k, v in pairs(jobs) do
        if pJob.name == v then
            return true
        end
    end

    return false
end