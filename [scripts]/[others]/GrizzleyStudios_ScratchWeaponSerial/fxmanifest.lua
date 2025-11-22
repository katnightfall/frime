--[[ FX Information ]]--
fx_version  'cerulean'
lua54  "yes"
game  'gta5'

--[[ Resource Information ]]--
name  'Grizzley Studios Scratch Weapon Serial'
author  'Grizzley Studios'
description 'Scratch Weapon Serial'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'ox_lib'
}

escrow_ignore {
    'config.lua',
    'install/*.lua'
}

dependency '/assetpacks'