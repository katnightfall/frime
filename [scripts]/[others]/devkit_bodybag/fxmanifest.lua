fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Devkit'
description 'Bodybag Script'


shared_scripts {
    '@ox_lib/init.lua',
    'config/*.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'logs.lua',
    'server/*.lua',
}

escrow_ignore {
    'client/cl_notifications.lua',
    'server/sv_notifications.lua',
    'config/*.lua',
    'logs.lua',
}

dependency '/assetpacks'