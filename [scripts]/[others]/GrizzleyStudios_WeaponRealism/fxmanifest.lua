--[[ FX Information ]]--
fx_version  'cerulean'
use_experimental_fxv2_oal 'yes'
lua54   'yes'
game  'gta5'

--[[ Resource Information ]]--
name  'Grizzley Studios Weapon Realism'
author  'Grizzley Studios'
description 'Weapon Realism'

dependencies {
	'/server:5888',
	'/onesync'
}

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/client.lua'
}

escrow_ignore {
    'config.lua'
}

dependency '/assetpacks'