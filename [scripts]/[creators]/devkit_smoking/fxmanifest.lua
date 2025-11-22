fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Devkit'
description 'Smoking'


shared_scripts {
  '@ox_lib/init.lua',
  'config/*.lua',
  'bridge/init.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'bridge/server.lua',
  'server/**/*.lua'
}

client_scripts {
  'bridge/client.lua',
  'client/**/*.lua'
}

escrow_ignore {
  'config/*.lua',
}

dependency '/assetpacks'