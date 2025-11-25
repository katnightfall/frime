
-------------------------------------------------------------------------------
-- Chat Commands
-------------------------------------------------------------------------------
TriggerEvent('chat:addSuggestion', '/talkto', 'Talk directly to someone', { 
    { name = 'id', help = 'The id of the specified person you to talk to. ' },
    { name = 'message', help = 'Message you wish to send. ' } 
  })
  
  TriggerEvent('chat:addSuggestion', '/flirt', 'Show that you are talking to someone in a flirty way', { 
    { name = 'id', help = 'The id of the specified person you to flirt with. ' },
    { name = 'message', help = 'Message you wish to send. ' } 
  })

  TriggerEvent('chat:addSuggestion', '/cardetails', 'Set a description for a vehicle using its license plate.', {
    { name = 'license plate', help = 'The license plate of the vehicle.' },
    { name = 'description', help = 'The description for the vehicle.' }
})

TriggerEvent('chat:addSuggestion', '/examinecar', 'Get the description of a vehicle using its license plate.', {
    { name = 'license plate', help = 'The license plate of the vehicle.' }
})

TriggerEvent('chat:addSuggestion', '/setdevtag', 'Changed DevTag Message', {
  { name = 'message', help = 'Message you wish to display. ' } 
})


TriggerEvent('chat:addSuggestion', '/devtag', 'Toggles DevTag', {
})


TriggerEvent('chat:addSuggestion', '/hq', 'Talk to the Police HQ', {
  { name = 'message', help = 'Message you wish to send. ' } 
})

TriggerEvent('chat:addSuggestion', '/dep', 'Talk back and fourth between Police and EMS.', {
  { name = 'message', help = 'Message you wish to send. ' } 
})

TriggerEvent('chat:addSuggestion', '/q', 'Allows you to leave the server without having to access the F8 console.', {
})


TriggerEvent('chat:addSuggestion', '/quit', 'Allows you to leave the server without having to access the F8 console.', {
})

TriggerEvent('chat:addSuggestion', '/stats', 'Preview Character\'s Stats.', {
})

  TriggerEvent('chat:addSuggestion', '/lowto', 'Whisper directly to someone', { 
    { name = 'id', help = 'The id of the specified person you to talk to. ' },
    { name = 'message', help = 'Message you wish to send. ' } 
  })
  
  TriggerEvent('chat:addSuggestion', '/lang', 'Change the language you\'re character speaks in.', { 
    { name = 'language', help = 'language you wish to speak in, itll come as (In (inputted_language) )' },
  })

  TriggerEvent('chat:addSuggestion', '/'.. Config.TextRPCommand ..'', 'Toggles Text Roleplay Mode.', { 
  })
  
  TriggerEvent('chat:addSuggestion', '/autogrammar', 'Toggles autogrammar, which adds periods and capitalization for you.', { 
  })
  
    
  TriggerEvent('chat:addSuggestion', '/indicator', 'Toggles typing indicator.', { 
  })

  TriggerEvent('chat:addSuggestion', '/b', 'Local OOC.', { 
  })

  TriggerEvent('chat:addSuggestion', '/online', 'Check how many people are in-game.', { 
  })

  TriggerEvent('chat:addSuggestion', '/revertlang', 'Reverts language', { 
  })

  TriggerEvent('chat:addSuggestion', '/address', 'Shows your current location.', { 
  })

  TriggerEvent('chat:addSuggestion', '/togglemask', 'Sets your characters name to a set of randomized numbers.', { 
  })

  TriggerEvent('chat:addSuggestion', '/help', 'Like /report but, for less important things.', { 
    { name = 'message', help = 'Message you wish to send. ' } 
  })

  TriggerEvent('chat:addSuggestion', '/helpme', 'Like /report but, for less important things.', { 
    { name = 'message', help = 'Message you wish to send. ' } 
  })

  TriggerEvent('chat:addSuggestion', '/ooc', 'A global out of character chat.', { 
    { name = 'message', help = 'Message you wish to send. ' } 
  })
  TriggerEvent('chat:addSuggestion', '/aooc', 'A global out of character chat for staff.', { 
    { name = 'message', help = 'Message you wish to send. ' } 
  })
  TriggerEvent('chat:addSuggestion', '/me', 'Displays an action or emote your character is performing.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
  })

  TriggerEvent('chat:addSuggestion', '/ame', 'Displays an action or emote your character is performing but above their head.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
  }) 

  TriggerEvent('chat:addSuggestion', '/amy', 'Displays an action or emote your character is performing but instead you get the Firstname Lastname\'s prefix but above their head.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
  })

  TriggerEvent('chat:addSuggestion', '/my', 'Displays an action or emote your character is performing but instead you get the Firstname Lastname\'s prefix.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
  })
  TriggerEvent('chat:addSuggestion', '/do', 'Used if you want to ask something roleplay wise or something that can\'t begin with your character name.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
  })
  TriggerEvent('chat:addSuggestion', '/revive', 'Revive someone back to life.', { 
    { name = 'id', help = 'The id of the specified person you wish to revive. ' } 
  })
  TriggerEvent('chat:addSuggestion', '/wallet', 'Check how much cash you have in your pockets', {})
  TriggerEvent('chat:addSuggestion', '/job', 'Shows what job you have.', {})
  TriggerEvent('chat:addSuggestion', '/togglepm', 'Toggle your Private Messages.', {})
  TriggerEvent('chat:addSuggestion', '/smode', 'Streamer Mode for Staff.', {})
  TriggerEvent('chat:addSuggestion', '/sc', 'Talk in staff chat. Dont abuse this command!', {})
  -------------------------------------------------------------------------------
  -- Player Commands
  -------------------------------------------------------------------------------
  TriggerEvent('chat:addSuggestion', '/report', 'Send a report against another player to online administrators.', { 
    { name = 'action', help = 'Details about the report.' } 
  })
  TriggerEvent('chat:addSuggestion', '/dice', 'Roll a pair of dice.', { 
    { name = 'action', help = 'Dice pair number 1-3.' } 
  })
  TriggerEvent('chat:addSuggestion', '/closeticket', 'Close your report.', {})
  TriggerEvent('chat:addSuggestion', '/id', 'Check your server ID.', {})
  TriggerEvent('chat:addSuggestion', '/pm', 'Send a private message to the specified person.', { 
    { name = 'id', help = 'The id of the specified person you wish to message.' },
    { name = 'message', help = 'Message you wish to send the person.'} 
  })
  TriggerEvent('chat:addSuggestion', '/ftimeleft', 'Displays the time left you have in jail.', {})
  -------------------------------------------------------------------------------
  -- Police Commands
  -------------------------------------------------------------------------------
  TriggerEvent('chat:addSuggestion', '/jail', 'Sends a player off to prison for a specified amount of time.', {
    { name = 'id', help = 'The id of the specified person you wish to jail.'},
    { name = 'time', help = 'The amount of time you wish to jail the person for.'}
  })
  TriggerEvent('chat:addSuggestion', '/release', 'Releases a player from prison.', {
    { name = 'id', help = 'The id of the specified person you wish to release.'}
  })
  TriggerEvent('chat:addSuggestion', '/fsv', 'Spawn a emergency vehicle.', {
    { name = 'id', help = 'The id of the vehicle you want to spawn. (1-13).'}
  })
  TriggerEvent('chat:addSuggestion', '/fcolors', 'Vehicle Tints.', {})
  TriggerEvent('chat:addSuggestion', '/fclean', 'Clean Vehicle.', {})
  TriggerEvent('chat:addSuggestion', '/fcolorcombinations', 'Vehicle Color Combinations.', {})
  TriggerEvent('chat:addSuggestion', '/911', 'What is your emergency?', {
    { name = 'message', help = 'The emergency you wish to state.'}
  })
  
  TriggerEvent('chat:addSuggestion', '/fimpound', 'Impound a vehicle that is unoccupied.', {})
  
  TriggerEvent('chat:addSuggestion', '/fextra', 'Add a emergency extra to a vehicle.', {
    { name = 'id', help = 'The id of the vehicle extra you want to add. (1-12).'}
  })
  
  TriggerEvent('chat:addSuggestion', '/flivery', 'Add a emergency livery to a vehicle.', {
    { name = 'id', help = 'The id of the vehicle livery you want to add. (1-5).'}
  })
  
  TriggerEvent('chat:addSuggestion', '/register', 'Register your name to the MDT database.', {})
  
  TriggerEvent('chat:addSuggestion', '/mdt', 'Opens the police department MDT.', {})
  TriggerEvent('chat:addSuggestion', '/ambulance', 'Opens the ambulance MDT.', {})
  
  -------------------------------------------------------------------------------
  -- Staff Commands
  -------------------------------------------------------------------------------
  TriggerEvent('chat:addSuggestion', '/noclip', 'Enable and disable noclip.', {})
  
  TriggerEvent('chat:addSuggestion', '/announce', 'Send a announcement to all users', { 
    { name = 'action', help = 'Details about the announcement' } 
  })
  
  TriggerEvent('chat:addSuggestion', '/sc', 'Send a message to administrators and testers.', { 
    { name = 'action', help = 'Details about the message.' } 
  })
  
  TriggerEvent('chat:addSuggestion', '/forceskin', 'Enables skin menu.', {
    { name = 'id', help = 'The id of the specified person you wish to grant the menu.'}
  })
  TriggerEvent('chat:addSuggestion', '/givelicense', 'Grant a license to a specified person.', { 
    { name = 'id', help = 'The id of the specified person you wish to grant a license to.' },
    { name = 'licenseType', help = 'Type of license you want to grant.'} 
  })
  TriggerEvent('chat:addSuggestion', '/removelicense', 'Remove a license from a specified person.', { 
    { name = 'id', help = 'The id of the specified person you wish to remove a license from.' },
    { name = 'licenseType', help = 'Type of license you want to remove.'} 
  })
  TriggerEvent('chat:addSuggestion', '/adminjail', 'Sends a player off to admin jail for a specified amount of time.', {
    { name = 'id', help = 'The id of the specified person you wish to admin jail.'},
    { name = 'time', help = 'The amount of time you wish to jail the person for.'}
  })
  TriggerEvent('chat:addSuggestion', '/ck', 'Character kill, Make sure to put 9999999 for the time.', {
    { name = 'id', help = 'The id of the specified person you wish to Character Kill.'},
    { name = 'time', help = 'Put 999999 for the time!.'}
  })
  TriggerEvent('chat:addSuggestion', '/unadminjail', 'Removes a player from admin jail.', {
    { name = 'id', help = 'The id of the specified person you wish remove from admin jail.'},
  })

  TriggerEvent('chat:addSuggestion', '/showbadge', 'Show\'s players you\'re badge, this can be used for undercover cops, and other things.', {
    { name = 'id', help = 'The id of the specified person you wish to showcase you\'re badge to.'},
  })

  TriggerEvent('chat:addSuggestion', '/listguns', 'Show\'s what weapons a player has on them.', {
    { name = 'id', help = 'The id of the specified person you wish to recieve a weapon\'s list from.'},
  })

  TriggerEvent('chat:addSuggestion', '/ad', 'Sends Advertisement\'s to the whole city, this can be used to promote anything from selling a car, to a lemonade stand!.', {
    { name = 'message', help = 'Message you wish to send the person.'} 
  })
  
  TriggerEvent('chat:addSuggestion', '/acceptreport', 'Accept a report.', {})
  
  TriggerEvent('chat:addSuggestion', '/accepthelp', 'Accept a help request.', {})
  
  TriggerEvent('chat:addSuggestion', '/cw', 'Car whisper.', {})
  
  TriggerEvent('chat:addSuggestion', '/carwhisper', 'Car whisper.', {})
  
  TriggerEvent('chat:addSuggestion', '/l', 'Talk low.', {})
  
  TriggerEvent('chat:addSuggestion', '/low', 'Talk low.', {})
  
  TriggerEvent('chat:addSuggestion', '/s', 'Say.', {})
  
  TriggerEvent('chat:addSuggestion', '/say', 'Say.', {})
  
  TriggerEvent('chat:addSuggestion', '/sh', 'Shout.', {})

  TriggerEvent('chat:addSuggestion', '/speaker', 'Talk through a speaker / intercom.', {})
  TriggerEvent('chat:addSuggestion', '/intercom', 'Talk through a speaker / intercom.', {})

  
  TriggerEvent('chat:addSuggestion', '/shout', 'Shout.', {})
  
  TriggerEvent('chat:addSuggestion', '/tpm', 'Teleport to a waypoint.', {})
  
  TriggerEvent('chat:addSuggestion', '/togooc', 'Enable or disable OOC chat.', {})
  
  TriggerEvent('chat:addSuggestion', '/kick', 'Removes a specified person from the server.', {
    { name = 'id', help = 'The id of the specified person you wish to remove.'},
    { name = 'reason', help = 'The reason you wish to remove the specified person.'}
  })
  -------------------------------------------------------------------------------
  -- Inventory Commands
  -------------------------------------------------------------------------------
  TriggerEvent('chat:addSuggestion', '/giveitem', 'Give an item to a player (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'},
    {name = 'item', help = 'item name', type = 'item'},
    {name = 'count', help = 'item count', type = 'number'}
  })
  
  TriggerEvent('chat:addSuggestion', '/additem', 'Give an item to a player (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'},
    {name = 'item', help = 'item name', type = 'item'},
    {name = 'count', help = 'item count', type = 'number'}
  })
  
  TriggerEvent('chat:addSuggestion', '/removeitem', 'Remove item from player (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'},
    {name = 'item', help = 'item name', type = 'item'},
    {name = 'count', help = 'item count', type = 'number'}
  })
  
  TriggerEvent('chat:addSuggestion', '/clearinv', 'Clear player inventory (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'}
  })
  
  TriggerEvent('chat:addSuggestion', '/takeinv', 'Confiscate player inventory (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'}
  })
  
  TriggerEvent('chat:addSuggestion', '/returninv', 'Return player inventory (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'}
  })
  
  TriggerEvent('chat:addSuggestion', '/viewinv', 'View player inventory (Staff Only)', {
    {name = 'playerId', help = 'player id', type = 'player'}
  })
  
  TriggerEvent('chat:addSuggestion', '/saveinv', 'Save player inventory (Staff Only)', {
    {name = 'playerId', help = 'player id', type = 'player'}
  })
  
  TriggerEvent('chat:addSuggestion', '/clearevidence', 'Clear Evidence (Staff Only)', {
    {name = 'playerId', help = 'player id', type = 'player'}
  })

  TriggerEvent('chat:addSuggestion', '/cls', 'Clears you\'re chat.', {})

  TriggerEvent('chat:addSuggestion', '/clear', 'Clears you\'re chat.', {})





TriggerEvent('chat:addSuggestion', '/r', 'Talk in Police Radio, Channel 1', {
  { name = 'message', help = 'Message you wish to send in Radio Channel 1. ' } 
})

TriggerEvent('chat:addSuggestion', '/r2', 'Talk in Police Radio Channel 2', {
    { name = 'message', help = 'Message you wish to send in Radio Channel 2.' } 
})

TriggerEvent('chat:addSuggestion', '/r3', 'Talk in Police Radio Channel 3', {
    { name = 'message', help = 'Message you wish to send in Radio Channel 3.' } 
})

TriggerEvent('chat:addSuggestion', '/r4', 'Talk in Police Radio Channel 4', {
    { name = 'message', help = 'Message you wish to send in Radio Channel 4.' } 
})

TriggerEvent('chat:addSuggestion', '/r5', 'Talk in Police Radio Channel 5', {
    { name = 'message', help = 'Message you wish to send in Radio Channel 5.' } 
})

TriggerEvent('chat:addSuggestion', '/r6', 'Talk in Police Radio Channel 6', {
    { name = 'message', help = 'Message you wish to send in Radio Channel 6.' } 
})

TriggerEvent('chat:addSuggestion', '/fr', 'Talk in FD Radio Channel 1', {
  { name = 'message', help = 'Message you wish to send in Radio Channel 1.' } 
})

TriggerEvent('chat:addSuggestion', '/fr2', 'Talk in FD Radio Channel 2', {
  { name = 'message', help = 'Message you wish to send in Radio Channel 2.' } 
})

TriggerEvent('chat:addSuggestion', '/fr3', 'Talk in FD Radio Channel 3', {
  { name = 'message', help = 'Message you wish to send in Radio Channel 3.' } 
})

TriggerEvent('chat:addSuggestion', '/fr4', 'Talk in FD Radio Channel 4', {
  { name = 'message', help = 'Message you wish to send in Radio Channel 4.' } 
})

TriggerEvent('chat:addSuggestion', '/fr5', 'Talk in FD Radio Channel 5', {
  { name = 'message', help = 'Message you wish to send in Radio Channel 5.' } 
})
