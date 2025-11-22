--[[
BY RX Scripts © rxscripts.xyz
--]]

Config.DiscordWebhook = '' -- Discord webhook to send important logs (Set to '' to disable)

function IsJobAllowed(src, jobs)
    local p = FM.player.get(src)
    local pJob = p.getJob()
    if not pJob then return false end

    for _, job in pairs(jobs) do
        if job == pJob.name then
            return true
        end
    end

    return false
end