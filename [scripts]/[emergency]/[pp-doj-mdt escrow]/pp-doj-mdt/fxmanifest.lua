fx_version "cerulean"
description "DOJ MDT script"
author "PixelPrecision Studio"
version '1.0.1'
lua54 'yes'
game "gta5"

ui_page 'web/build/index.html'
shared_script 'locales/*.lua'

shared_scripts {
    '@pp-bridge/init.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    "client/**/*"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/config_s.lua',
    'server/**/*',
}

files {
    'config/config_c.lua',
    'config/config_ui.lua',
	'web/build/index.html',
	'web/build/**/*',
    'server/editable/banking/*.lua'
}

dependencies {
    'pp-bridge',
    'ox_lib',
    'oxmysql',
    'yarn'
}

escrow_ignore {
    'config/*.lua',
    'locales/*.lua',
    'server/editable/**/*',
    'client/editable/**/*'
}
dependency '/assetpacks'