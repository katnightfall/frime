author 'Bodhix'
description 'Bike Tricks Carreer'
version '1.3.0'

lua54 'yes'

fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'Config.lua',
}

client_scripts {
    'Client/*.lua',
}

server_scripts {
    'server/sv.lua',
}

files {
    'data/handling.meta',
    'stream/bike@tricks@anims.ycd',
    'stream/bike@airtrick@anims.ycd',
    'server/version.json',
}

data_file 'HANDLING_FILE' 'data/handling.meta'

escrow_ignore {
    'Config.lua',
}



dependency '/assetpacks'