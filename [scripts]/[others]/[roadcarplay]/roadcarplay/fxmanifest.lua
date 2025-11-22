fx_version 'cerulean'

game 'gta5'

author 'RoadShop | https://fivem.roadshop.org'
description 'RoadCarplay FiveM'
version '1.4.5'

lua54 'yes'

ui_page 'public/index.html'

files {
    'public/index.html',
    'public/assets/*.*',
    'public/img/*.*',
    'public/img/**/*.*',
    'public/img/**/**/*.*',
    'public/static/config/config.json',
    'public/js/*.js'
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua'
}

client_scripts {
    'client/client.lua',
    'client/clientAPI.lua',
    'client/controls.lua',
    'client/music.lua',
    'client/seatshuffle.lua',
    'client/messages.lua',
    'client/vehicle_names.lua',
    'client/autopilot.lua',
    'client/rearcamera.lua'
}

server_scripts {
    --'@oxmysql/lib/MySQL.lua',
    '@mysql-async/lib/MySQL.lua',
    'API.lua',
    'server/server.lua',
    'server/serverAPI/serverAPI.lua',
    'server/music.lua',
    'server/versioncheck.lua'
}

escrow_ignore {
    'config.lua',
    'locales/*.lua',
    'client/clientAPI.lua',
    'client/vehicle_names.lua',
    'server/serverAPI/*.lua',
    'API.lua'
}

dependencies {
    '/server:17000',
    '/onesync',
    'xsound'
}


exports {
    'isBlocked',
    'blockCarPlay',
    'unblockCarPlay',
    'useRoadCarPlay',
    'IsRearCameraActive',
    'ToggleRearCamera'
}

server_exports {
    'getCarsCarplayIsInstalled'
}
dependency '/assetpacks'