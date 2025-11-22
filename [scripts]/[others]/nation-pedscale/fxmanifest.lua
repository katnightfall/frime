fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.1.5'
escrow_ignore {
    'shared/*.lua',
    'locales/*.lua',
    'client/core.lua',
    'server/core.lua'
}
shared_scripts {
    'shared/cores.lua',
    'shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'shared/config.lua'
}
client_scripts {
	'client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
    'shared/config_sv.lua'
}
ui_page 'html/index.html'
files {'html/**'}
dependency '/assetpacks'