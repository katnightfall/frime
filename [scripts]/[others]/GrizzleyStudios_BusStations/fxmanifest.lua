--[[ FX Information ]]--
fx_version  'cerulean'
lua54  'yes'
game  'gta5'

--[[ Resource Information ]]--
name  'Grizzley Studios Bus Stations'
author  'Grizzley Studios'
description 'Bus Stations'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

escrow_ignore {
    'config.lua',
    'client/functions.lua',
    'server/functions.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
--    '@qbx_core/modules/lib.lua',
--    '@ox_lib/init.lua',
    'config.lua'
}

dependency '/assetpacks'