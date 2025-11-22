-- REPLACE THIS FILE `fxmanifest.lua` IF YOU WANT THE ESX VERSION OUT OF THE BOX
fx_version 'cerulean'
game 'gta5'
author 'wjuton.dev & hoodstories.pl'
client_scripts {
    'client/integration.lua',
    'main.lua'
}
 
server_scripts {
    'server.lua',
    'server/integration/esx.lua'
}

ui_page 'web/dist/index.html'
lua54 'yes'

files {
    'web/dist/index.html',
    'web/dist/**/**',
}

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

escrow_ignore {
    'config.lua',
    'data.json',
    'client/integration.lua',
    'server/integration/standalone.lua',
    'server/integration/esx.lua',
    'server/integration/qb.lua',
    'server/integration/types.lua',
    'fxmanifest_esx.lua',
    'fxmanifest_qb.lua'
}