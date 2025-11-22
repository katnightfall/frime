fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Nobody'



client_scripts {
	"client.lua",

}
escrow_ignore {

	"config.lua",

}

shared_scripts { 
	'@ox_lib/init.lua',
	'@es_extended/imports.lua', -- REMOVE THIS IF U USING QB
	'@es_extended/locale.lua', -- REMOVE THIS IF U USING QB
	'config.lua',
}
dependency '/assetpacks'