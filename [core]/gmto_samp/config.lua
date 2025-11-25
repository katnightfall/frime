Config = {}
-- Start of Config.lua --

-- Text Roleplay Section
-- Settings for everything Text Roleplay based features.

Config.TextRP = true -- Enable Text Roleplay Mode by default.
Config.TextRPCommand = 'togs' -- Toggle Text Roleplay Mode Command.
Config.TogsColor = { 200, 200, 200 } --  What Color Should the Text RP Togs Notification be? https://htmlcolorcodes.com/color-picker/ - Vist this website if you need help looking for rbg codes!
Config.AllowShowBadgeCMD = true -- Allows players to do /showbadge, in chat to show players their job and rank.
Config.AllowLanguageCommand = true -- Allows player's to change their character's language when in text-rp mode. ((Example: FirstName LastName says [In Korean]: Hey!))
Config.TextRadio = true -- Allows players to talk to other police officers / EMT's in a radio based in the chat using /r-/r6 and /fr-/fr6 
Config.EmergancyResponseChats = true -- Allows players to talk to other Emergancy Responders using /dep (EMS To Police & Police To EMS) and /hq (Police To Police) 
Config.EnableAutoWalk = true

-- Management Section
-- Settings related to Server related things.

Config.BanMessage = true -- Display a message when a player is banned through TX
Config.AllowListGunsCommand = true -- Allows Admins to do /listguns to check what guns players have in their inventory.
Config.StaffColor = 'rgba(0, 118, 0)' -- What Color Should the Staff Chat be? https://htmlcolorcodes.com/color-picker/ - Vist this website if you need help looking for rbg codes!
Config.AllowAutoGrammar = true -- This allows players to toggle auto-grammar, which adds periods and capitalization for them.
Config.Allow911Command = true -- This allows players to do /911, remove this if you already have one.
Config.AdminCommands = true -- Allow Server Staff to do command such as /dvall & /bring.
Config.AllowCarDescriptions = true -- This allows players to describe their vehicle, and others to see it. (CMDS: /examinecar & /cardetails)
Config.EnableQuitCommand = true -- Allows players to do /q and /quit to leave the server without having to access the F8 console.
Config.EnableDevTag = true -- What color should the DevTag display as?
Config.ReportCooldown = 250
-- Message Section
-- Message configurations.

Config.ErrorMessage = {
    ['error_message'] = '^4ERROR:^0 You have entered an invalid command, please type ^4/help^0 for further assistance.',
}

-- Advertisement Section
-- Settings for player advertisements.

Config.AllowAds = true -- Allow players to use /ad to advertise their company
Config.AdvertCost = 100 -- Cost for players to post an advertisement
Config.AdBlips = true -- Display blips for advertisement locations


-- Autowalk Section
-- Autowalk Configuartions.

Config.AllowAutoWalk = true -- Allows players to enable automatic walking

Config.AutoWalkCommand = "aw" -- What command should they input to enable this?

Config.AutoWalkSpeedNormal = 1.0 -- Dont mess with this if you don't know what you're doing.

Config.AutoWalkSpeedRunning = 2.4 -- Dont mess with this if you don't know what you're doing.

Config.UseDisabledCommands = true -- Should it disable the useage of other commands?

Config.GoLeftControl = 34 -- A by default
Config.GoLeftSpeed = 0.2

Config.GoRightControl = 35 -- D by default
Config.GoRightSpeed = 0.2

Config.RunButton = 21 -- Shift by default

Config.DisableWalkControl = 32 -- W by defaul(recommended)

-- End of Config.lua --
