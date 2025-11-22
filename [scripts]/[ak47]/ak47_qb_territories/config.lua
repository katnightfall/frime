Config = {}

Config.Locale = 'en'

Config.Debug = false
Config.DebugPrint = false
Config.DynamicZones = false      -- if enabled then player will be able start gang territory from anywhere in the map (starts with spray)
Config.TargetScript = 'qb-target'                               --⚠️Don't change if you are using ox_target
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
--[[
Config.InvImgLink = "nui://qb-inventory/html/images/"           -- qb-inventory
Config.InvImgLink = "nui://ps-inventory/html/images/"           -- ps-inventory
Config.InvImgLink = "nui://lj-inventory/html/images/"           -- lj-inventory
Config.InvImgLink = "nui://qs-inventory/html/images/"           -- qs-inventory
Config.InvImgLink = "nui://ox_inventory/web/images/"            -- ox_inventory
Config.InvImgLink = "nui://ak47_qb_inventory/web/build/images/" -- ak47_qb_inventory
]]

--You can set admin in alternative ways-------------------
--Ace Permission
Config.AdminWithAce = true
--Or license
Config.AdminWithLicense = {
    ['license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'] = true,
}
--Or identifier
Config.AdminWithIdentifier = {
    ['xxxxxxxx'] = true,
}
----------------------------------------------------------
Config.Commands = {
    territory   = 'territory', -- event name ("ak47_qb_territories:territory")
    startsell   = 'startsell',   -- event name ("ak47_qb_territories:startsell")
    stopsell    = 'stopsell',    -- event name ("ak47_qb_territories:stopsell")
    leaderboard = "leaderboard",
    gangmenu    = "gangmenu",
    leavegang   = "leavegang",
}
Config.GangMenuKeyBind = 'F5' -- set nil if you want to remove this

Config.EnableHud = true         -- change text position in nui/style.css #logo
Config.ShowZoneBlip = 'all'     -- 'all', 'gangonly', 'admin', 'hide'
Config.AreaInfo = 'gangonly'    -- 'all', 'gangonly', 'admin', 'hide'
Config.FlashAreaInfo = false     -- if enabled then info will be visible for a moment when player enter the zone or changes the influence
Config.LeaderboardMembersLimit = 100

Config.RemoveInfluence = {
    overtime            = {interval = 10, remove = 1.0}, -- 10 minutes
    sprayremove         = 5,
    killowngangmember   = 5.0,
    killcivilian        = 2.0,
    killnpc             = 1.0,
    killjob = {
        ambulance = 5.0,
    },
}

Config.AddInfluence = {
    presense            = { interval = 60, add = 0.4 }, -- interval in seconds
    spray               = {10, 5, 2},   -- 10 for 1st spray, 5 for 2nd spray, 2 for 3rd spray [in 1 zone]
    killothergangmember = 8.0,
    killjob = {
        police = 5.0,
        sheriff = 5.0,
    },
}

Config.MinimumInfluenceValueToShowColor = 5
Config.DatabaseSaveInterval = 1 -- minutes
Config.FlashZoneByInfluenceDifference = 3

Config.MaxZoneBlipAlpha = 70

Config.Colors = {
    white  = { id = 0, hex = '#fefefe' },
    red    = { id = 1, hex = '#e03232' },
    yellow = { id = 5, hex = '#eec64e' },
    brown  = { id = 10, hex = '#b18f83' },
    cyan   = { id = 15, hex = '#6ac4bf' },
    lemon  = { id = 24, hex = '#bbd65b' },
    green  = { id = 25, hex = '#0c7b56' },
    purple = { id = 27, hex = '#ab3ce6' },
    blue   = { id = 38, hex = '#2c6db8' },
    gold   = { id = 46, hex = '#ECF029' },
    pink   = { id = 48, hex = '#F644A5' },
    orange = { id = 81, hex = '#F2A40C' },
}

Config.Garage = {
    script = 'auto' -- ak47_qb_garage, cd_garage, okokGarage, qb-garages, jg-advancedgarages, loaf_garage
}

Config.MarkedbillItem = {
    item = 'markedbills',
    label = 'Marked Bills',
    usemetavalue = true,
}

Config.SpecialCoin = { 
    enable = false,
    tablename           = 'cointable', --adjust this [I don't know what coin script you are using or not, so don't open ticket for this]
    identifiercolumname = 'identifier',  --adjust this [I don't know what coin script you are using or not, so don't open ticket for this]
    coincolumname       = 'coin',     --adjust this [I don't know what coin script you are using or not, so don't open ticket for this]
}

Config.Currency = {
    cash = "Cash",
    bank = "Bank",
    coin = "Coin", -- keep the name coin if you want to use special coin system
    --black_money = "Black Money",
}

Config.CopAlertBlipTime = 120 --in sec
Config.GangAlertBlipTime = 60 --in sec

Config.Cops = {
    police = true,
    sheriff = true,
}

Config.SendChatMessage = function(type, zone, gang, duration)
    if type == 'start' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: #7a1d0ec2; padding: 5px;" class="chat-message heist"><i class="fa-solid fa-person-rifle"></i><b><span style="color: #ff0000">{0} </span><span style="margin-top: 5px; font-weight: 300;">{1}</span></div>',
            args = { _U('cmdterritory'), _U('msgstart', gang, zone, AirDrop.setting.arrivaltime) }
        })
    elseif type == 'end' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: #0e7a16c2; padding: 5px;" class="chat-message heist"><i class="fa-solid fa-person-rifle"></i><b><span style="color: #ff0000">{0} </span><span style="margin-top: 5px; font-weight: 300;">{1}</span></div>',
            args = { _U('cmdterritory'), _U('msgendwin', zone, gang) }
        })
    elseif type == 'racketalert' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: #d3ac36; padding: 5px;" class="chat-message heist"><i class="fa-solid fa-person-rifle"></i><b><span style="color: #ff0000">{0} </span><span style="margin-top: 5px; font-weight: 300;">{1}</span></div>',
            args = { _U('cmdterritory'), _U('collectalert', zone, gang) }
        })
    elseif type == 'startturf' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: #ab180069; padding: 5px;" class="chat-message heist"><i class="fa-solid fa-person-rifle"></i><b><span style="color: #ff0000">{0} </span><span style="margin-top: 5px; font-weight: 300;">{1}</span></div>',
            args = { _U('cmdterritory'), _U('turfstart', zone, gang, duration) }
        })
    elseif type == 'msgenddraw' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: #bec10770; padding: 5px;" class="chat-message heist"><i class="fa-solid fa-person-rifle"></i><b><span style="color: #ff0000">{0} </span><span style="margin-top: 5px; font-weight: 300;">{1}</span></div>',
            args = { _U('cmdterritory'), _U('msgenddraw', zone) }
        })
    elseif type == 'msgendcop' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: #00409f70; padding: 5px;" class="chat-message heist"><i class="fa-solid fa-person-rifle"></i><b><span style="color: #ff0000">{0} </span><span style="margin-top: 5px; font-weight: 300;">{1}</span></div>',
            args = { _U('cmdterritory'), _U('msgendcop', zone) }
        })
    elseif type == 'msgendwin' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: #009f0570; padding: 5px;" class="chat-message heist"><i class="fa-solid fa-person-rifle"></i><b><span style="color: #ff0000">{0} </span><span style="margin-top: 5px; font-weight: 300;">{1}</span></div>',
            args = { _U('cmdterritory'), _U('msgendwin', zone, gang) }
        })
    end
end

-- only uses when using export to register a gang
Config.GangTemplate = {
    {
        rankid = 1,
        ranktag = 'recrute', -- no space & small character
        ranklabel = 'Recrute',
    },
    {
        rankid = 2,
        ranktag = 'shooter', -- no space & small character
        ranklabel = 'Shooter',
    },
    {
        rankid = 3,
        ranktag = 'topshooter', -- no space & small character
        ranklabel = 'Top Shooter',
    },
    {
        rankid = 4,
        ranktag = 'streetboss', -- no space & small character
        ranklabel = 'Street Boss',
    },
    {
        rankid = 5,
        ranktag = 'boss', -- no space & small character
        ranklabel = 'Boss',
    },
}