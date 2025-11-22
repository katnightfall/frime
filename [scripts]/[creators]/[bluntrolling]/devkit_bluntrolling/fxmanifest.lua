fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'DevKit'
description 'Blunt Rolling System'

ui_page 'web/build/index.html'

files {
    'web/build/index.html',
    'web/build/**/*'
}


shared_scripts {
    '@ox_lib/init.lua',
    'config/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

escrow_ignore {
    'config/*.lua',
}

dependency '/assetpacks'