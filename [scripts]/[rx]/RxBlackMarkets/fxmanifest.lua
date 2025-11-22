--[[
BY RX Scripts © rxscripts.xyz
--]]

fx_version 'cerulean'
games { 'gta5' }

author 'Rejox'
description 'Black Markets'
version '5.0.1'

shared_script {
    'config.lua',
    'init.lua',
    'locales/*.lua',
}

client_scripts {
    'client/utils.lua',
    'client/opensource.lua',
    'client/functions.lua',
    'client/main.lua',
}
server_scripts {
    'server/utils.lua',
    'server/opensource.lua',
    'server/functions.lua',
    'server/main.lua',
}

ui_page 'web/build/index.html'

files {
  'web/build/index.html',
  'web/build/**/*',
}

lua54 'yes'

escrow_ignore {
    'client/opensource.lua',
    'server/opensource.lua',
    'config.lua',
    'locales/*.lua',
}

dependency '/assetpacks'