fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'XMMX Development'
description 'Lets Camp! Plus'
version '1.1'

dependencies {
    'ox_lib',
    'xmmx_bridge',
}

shared_scripts { '@ox_lib/init.lua', 'configs/*.lua' }
client_scripts { 'client/**/*.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'server/**/*.lua' }

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/css/*.css',
    'web/js/*.js',
    'web/images/*.png',
}

escrow_ignore {
    '.INSTALL/*',   -- Installation Material
    'stream/*',     -- optional hiking backpack
    'configs/config.lua',
    'configs/functions.lua',
    'configs/locales.lua',
    'configs/metadata.lua',
    'configs/planting.lua',
    'configs/recipes.lua',
    'configs/settings.lua',
    'configs/shops.lua',
    'client/editable.lua',
    'server/editable.lua'
}
dependency '/assetpacks'