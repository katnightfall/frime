fx_version 'adamant'
game 'gta5'
name "ak47_qb_smokingv2"
description "Usable Weed Items"
author "MenanAk47 (MenanAk47#3129)"
version "2.5.1"

ui_page('html/index.html')

files({
    'html/index.html',
    'html/*.js',
    'html/sounds/*.mp3',
})

shared_scripts {
    "@ox_lib/init.lua",
}

client_scripts {
    'config.lua',
    'client/utils.lua',
    'client/usable.lua',
    'client/vape.lua',

    'locales/locale.lua',
    'locales/en.lua',
}

server_scripts {
    'config.lua',
    'server/utils.lua',
    'server/usable.lua',

    'locales/locale.lua',
    'locales/en.lua',
}

escrow_ignore {
    'locales/*.lua',
    'config*.lua',
    'server/utils.lua',
    'client/utils.lua',
    'INSTALL ME FIRST/**/*',
}

lua54 'yes'

dependencies {
    'qb-core',
    'ox_lib',
}
dependency '/assetpacks'