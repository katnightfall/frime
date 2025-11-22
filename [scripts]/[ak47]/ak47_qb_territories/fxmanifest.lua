fx_version 'adamant'
game 'gta5'
description 'Ak47 Territory'
version '2.3'

ui_page 'nui/index.html'

files {
    'nui/**/*'
}

data_file 'DLC_ITYP_REQUEST' 'stream/ak47_qb_territories.ytyp'

shared_scripts {
	"@ox_lib/init.lua",
	'config.lua',
	"modules/**/config.lua",
	'locales/locale.lua',
    'locales/en.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    "framework/server/*.lua",
    "modules/**/server/*.lua",
}

client_scripts {	
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    
    "framework/client/*.lua",
	"modules/**/client/*.lua",
    "customizable/client.lua",
}

dependencies {
    'qb-core',
    'PolyZone',
    'ox_lib',
    'qb-target',
}

escrow_ignore {
	"INSTALL ME FIRST/**/*",
    "config.lua",
    "framework/**/*",
    "modules/**/config.lua",
    "modules/**/customizable.lua",
    "customizable/*",
    "locales/*.lua",
}

lua54 'yes'
dependency '/assetpacks'