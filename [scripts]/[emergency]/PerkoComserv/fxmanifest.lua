fx_version 'adamant'
game 'gta5'

author 'Percz Development'
description 'A standalone Comms Script to help enforce RP | Store: https://percz.dev/'
version '2.0.0'

client_scripts {
    'ClientConfig.lua',
    'comserv-cl.lua'
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "ServerConfig.lua",
    "comserv-sv.lua"
}

escrow_ignore {
    'communityservice.sql',
    'ClientConfig.lua',
    'ServerConfig.lua'
}

lua54 'yes'

dependency '/assetpacks'