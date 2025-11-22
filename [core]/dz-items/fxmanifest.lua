
fx_version 'cerulean'
game 'gta5'

author 'Danzo'
description 'Advanced Items Spawner - Made by Danzo - Discord: https://discord.gg/8nFqCR4xVC'
version '1.0.14'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
	'config_server.lua',
	'server/*.lua',
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/js/*.js',
	'html/css/*.css',
	'html/img/*.png',
}

escrow_ignore {
	'config.lua',
	'config_server.lua',
	'server/iteminfo.lua',
}

lua54 'yes'
dependency '/assetpacks'