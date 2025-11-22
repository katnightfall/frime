# 🟢 Pug Advanced Paintball

For questions or support, join our Discord: https://discord.gg/jYZuWYjfvq  
Browse and purchase my other scripts here: https://pug-webstore.tebex.io/

---

## 🛠️ Installation Instructions

1. Add the MLOs `pug-nuketown-arena` and `pug-nuketown-mirrorpark` (found on Keymaster) to your `maps` folder and ensure them in your server config.
2. Copy the sound files from `pug-paintball/InteractSoundFiles` into `[standalone]/InteractSound/client/html/sounds`.  
3. **OX Inventory Users:** Follow the section below and the YouTube video *exactly*. This is crucial for compatibility.
4. If you want to disable "shots fired" dispatch calls, follow the **Dispatch Integration** section below carefully.

---

## 📌 Key Commands & Features

- `/redoutfit` and `/blueoutfit` — Save your current outfit for each team.
  - Must be using the correct gender model for each team.
- `G` — Opens the paintball scoreboard during a match.
- `/surrenderpaintball` — Use this to forfeit or fix a scuffed session while testing.
- **Map creation tutorial:** https://youtu.be/wALLIIaNoPE  
  *(If you create new maps, feel free to share them in the Pug Discord snippet section!)*

---

## 📦 Ox Inventory Integration (REQUIRED)

🎥 **Video Tutorial:** https://youtu.be/SsfpJ2Wg7Mc

### Step 1: Add this helper at the top of ox_inventory/client.lua
```lua
function DoNotSkip()
    local inPaintball = GetResourceState("pug-paintball") == "started"
        and exports["pug-paintball"]:IsInPaintball()
    local inBattleRoyale = GetResourceState("pug-battleroyale") == "started"
        and exports["pug-battleroyale"]:IsInBattleRoyale()
    return not inPaintball and not inBattleRoyale
end
```

### Step 2: – Disable Weapon Handling in `ox_inventory/client.lua` by editing this code. To quickly find the code to edit, open the client and then hit CTRL+F and then search up
```lua
if weaponType ~= 0 and weaponType ~= `GROUP_UNARMED` then
```
Replace with:
```lua
if weaponType ~= 0 and weaponType ~= `GROUP_UNARMED` and DoNotSkip() then
```

### Step 3: – Prevent Firing Lockout in `ox_inventory/client.lua` by editing this code. To quickly find the code to edit, open the client and then hit CTRL+F and then search up
Search for:
```lua
if usingItem or invBusy == true or IsPedCuffed(playerPed) then 
```
# OR
```lua
if usingItem or invOpen or IsPedCuffed(playerPed) then 
```
Replace with:
```lua
if usingItem or invBusy or invOpen or IsPedCuffed(playerPed) then
    if DoNotSkip() then
        DisablePlayerFiring(playerId, true)
    end
end
```

---

## 🚓 Dispatch Integration

To prevent dispatch alerts while in a paintball match, add this line at the top of your shot/discharge event if your disatch script does not already support this by default OPEN A TICKET WITH THEM AND REQUEST THEM TO ADD DEFAULT SUPPORT!:
```lua
if exports["pug-paintball"]:IsInPaintball() then return end
```

---

## 🛡️ QB-Anticheat Compatibility (QBCore Only)

If your weapon disappears at match start while using `qb-anticheat`, update the following loop in `qb-anticheat/client/main.lua`:

```lua
CreateThread(function()
    while true do
        Wait(5000)

        if LocalPlayer.state.isLoggedIn and not exports["pug-paintball"]:IsInPaintball() then
            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation and WeaponInformation["name"] ~= "weapon_unarmed" then
                QBCore.Functions.TriggerCallback('qb-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Weapon removed!", "orange",
                            "** @everyone " .. GetPlayerName(player) .. "** had a weapon not present in inventory. QB Anticheat removed the weapon.")
                    end
                end, WeaponInformation)
            end
        end
    end
end)
```


# Advanced Paintball. For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
Advanced Paintball 3.0 release!

PREVIEW HERE: https://youtu.be/t9G0t4m3ZAs

​Full QBCore & ESX Compatibility. (supports custom qb-core names and all qb custom file dependency names)

This script is partially locked using escrow encryption. 90% of the script is accessible in client/open.lua, server/server.lua, and config.lua

Readme: https://imgur.com/jMJHiR2.png
Config: https://imgur.com/TjwDoBf.png

# This completely configurable script consist of:
● Supports up to 24 players max. (12v12 red vs blue) and 24 players in all FFA game modes (FFA, One in the chamber, & Gun Game).
● All 19 maps are included for free, featuring Nuketown Arena & Nuketown Mirror Park MLOs at no extra cost.
● Create unlimited custom maps anywhere in the GTA 5 world using zones by placing simple vectors in the config.
● Ability to toggle between having a host of the lobby set all of the settings for the game or allow all players to edit the settings for the game.
● A scoreboard UI that displays and organizes all 24 players, updating kills, deaths, map, scores, etc. (G key to display in-game)
● Passive mode spawn protection with a Config.PassiveModeCoolDownWaitTime variable for safety upon respawning.
● Teammate locations are displayed with red and blue blips and an option to keep UAV always on during FFA modes.
● A kill streak system awards a usable UAV after achieving Config.UavKillstreak kills, and a death machine killstreak can be customized with Config.SpecialWeaponItem.
● Paintball can be made an ownable business, taking a portion of each game's combined wager into the Config.PaintballBusinessName account. (QBCORE only)
● /redoutfit & /blueoutfit commands for saving your current outfit as each teams outfit. (no longer need to config teams clothing)
● A wager amount set to minimum Config.MinWager and maximum Config.MaxWager. Rearward at the end of the game is wager amount * total-players / winning team (Configurable).
● Custom game commentary recorded for each action during games. (Sounds files provided)
● Each team spawns in on the same radio and gets placed back on their radio at the end.
● 33 gun options to choose from (Configurable and addon guns do work).
● Team Death Match game mode (12v12 | The team that reaches Config.MaxTDMScorekills first wins)
● Capture The Flag game mode (12v12 | The first team to capture the enemy flag 3 times wins)
● Free For All game mode (Every man for himself! Earn Config.MaxFFAScore kills to win! 450 random spawn vectors pre-configured, 30 per map)
● Gun Game game mode. (With every kill comes a new weapon granted. go through Config.MaxFFAScoreweapons to win! 570 random spawn vectors configured, 30 per map)
● One In The Chamber game mode. (You have 1 bullet. Every kill earns one more bullet. You only have set amount of lives. 570 random spawn vectors configured, 30 per map)
● Hold Your own game mode (12v12 | Each player tries to last as many lives that are set, Whatever team loses all of their lives first loses)
● Unlimited sprint during the match.
● The option to spectate players.
● Starting game cinematic sequence.
● ox_lib menu map image preview.
● Runs at 0.0 ms resmon (0.02 when playing a match)
● Consistent big updates such as this 3.0 update.

# 3.0 changes
● Installation has become as simple as it gets.
● Nuketown Arena & Nuketown Mirror Park MLOS's included and supported for free.
● Many new game modes (Free For All, Gun game, one in the chamber).
● Team blips to show where teammates are on the minimap.
● Massively cleaned up code from 1.0 and 2.0!
● Made adding new custom maps as simple as possible in the config.
● new scoreboard ui updating kills, deaths, map, score etc.
● added more support for more than 16 players.
● max player count is now 12v12 instead of 8v8.
● Added support for vector4's to all spawn locations so that heading is automatically set.
● Players have unlimited parachutes to use during paintball.
● Added the ability to activate or deactivate each weapon class menu with a new "EnableThisMenu" value to each weapon class menu config option.
● Overhauled how the players death is read, removed (Config.UsingLastStand)
● Created an entire lobby hosting system that allows only the host of the lobby to control all of the game settings if Config.HostOnlyCanControllGame is true
● New /redoutfit & /blueoutfit for saving your current outfit as each teams outfit. (no longer need to config teams clothing)
● Now compatible with every ems job script, no problem.
● Created a cool starting game cinematic cam that is randomly generated every time.
● Added passive mode for every time the player respawns with a Config.PassiveModeCoolDownWaitTime variable
● lobbies are now instanced and locals are turned off.
● You can now make location maps all throughout the gta 5 world just by placing simple vectors
● No longer depends on any inventory (all inventories are compatible)
● Added Config.ArmorAmoutGivenToPlayer. Sets the players armor value every time the player spawns throughout the game.
● Changed the weapon menu coming up after respawn automatically. Now you have to press E to open the weapon menu (with notification).
● New maps created in 3.0 include nuketown arena, nuketown mirror park, grove street, stab city, uptown construction, and reds salvage yard.
● Made kill sound effect for all game modes and not just FFA
● Re wrote how the scoreboard ui updates.


Requirements consist of:
QBCore OR ESX (Other frameworks will work but are not officially supported).
qb-menu OR ox_lib (Alternative UI resources compatible if renamed accordingly).
No specific target script, EMS script, or inventory script required. (all are supported)