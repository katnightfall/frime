fx_version   'cerulean'
lua54        'yes'
game         'gta5'

name         'gmto_samp - QB Version '
version      '3.3' -- QB Version 
author       'gmtotu#9322'
description  'gmto_samp | An advanced SA:MP / GTA:W Inspired chat system made for both Text-Roleplay servers and Voice-Based servers.'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/*.lua'
}
client_scripts {
	'config.lua',
	'client/*.lua'
}

shared_scripts {
	'@ox_lib/init.lua'
}

escrow_ignore {
	'config.lua',
	'client/cl_suggestions.lua'
}
dependency '/assetpacks'