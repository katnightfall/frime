fx_version 'adamant'
game 'gta5'
description 'Ak47 Qb Usable Drugs'
version '1.4'

server_scripts {
	'locales/en.lua',
	'config.lua',
	'server/utils.lua',
	'server/main.lua',
}

client_scripts {
	'locales/en.lua',
	'config.lua',
	'client/utils.lua',
	'client/main.lua',
	'client/main.lua',
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
    '/server:5181', -- requires at least server build 5181
}
dependency '/assetpacks'