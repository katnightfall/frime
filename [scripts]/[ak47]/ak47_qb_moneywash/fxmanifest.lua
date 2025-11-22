fx_version 'adamant'
game 'gta5'
author "MenanAk47 (MenanAk47#3129)"
version "2.0"

client_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'client/utils.lua',
    'client/main.lua',
    'client/teleport.lua',
    
    'locales/locale.lua',
    'locales/en.lua',
}

server_scripts {
    'config.lua',
    'server/utils.lua',
    'server/main.lua',
    'webhook.lua',

    'locales/locale.lua',
    'locales/en.lua',
}

dependencies {
    '/onesync',
    'qb-core',
    'ox_lib',
}

escrow_ignore {
    "config.lua",
    "locales/*.lua",
    "server/utils.lua",
    "client/utils.lua",
    'INSTALL ME FIRST/**/*',
    'webhook.lua',
}

lua54 'yes'
dependency '/assetpacks'