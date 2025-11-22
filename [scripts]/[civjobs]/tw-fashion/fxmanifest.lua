fx_version 'cerulean'
game 'gta5'
version '1.10 alpha'
author 'tworst-script'

shared_scripts {
	--'@ox_lib/init.lua',
	'locales/*.lua',
	'config/*.lua',
}

-- shared_script '@vrp/lib/utils.lua'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/CircleZone.lua',
	'locales/*.lua',
	'client/*.lua',
	'client/interaction/textures.lua',
	'client/interaction/interacts.lua',
	'client/interaction/raycast.lua',
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'locales/*.lua',
	-- '@mysql-async/lib/MySQL.lua'
}

ui_page "html/index.html"
files {
	'html/index.html',
	'html/*.html',
	'html/*.css',
	'html/font/*.TTF',
	'html/font/*.*',
	'html/img/*.*',
	'html/img/svg/*.svg',
	'html/img/tshirtcraft/darkblue/*.png',
	'html/img/tshirtcraft/blue/*.png',
	'html/img/tshirtcraft/purple/*.png',
	'html/img/tshirtcraft/black/*.png',
	'html/img/tshirtcraft/white/*.png',
	'html/img/sweatercraft/darkblue/*.png',
	'html/img/sweatercraft/blue/*.png',
	'html/img/sweatercraft/purple/*.png',
	'html/img/sweatercraft/black/*.png',
	'html/img/sweatercraft/white/*.png',
	'html/img/marketImg/*.png',
	'html/img/tutorial/*.mp4',
	'html/sounds/*.*',
	'html/js/*.js',
	'html/assets/*.png',
	'client/interaction/interactions.lua',
	'client/interaction/utils.lua',
	'client/interaction/entities.lua',
}

escrow_ignore {
	'config/*.lua',
	'locales/*.lua',
	'client/utility.lua',
	'client/interaction/*.lua',
	'server/utility.lua',
	'server/editable.lua',
}

dependency {
	'PolyZone',
}

lua54 'yes'

dependency '/assetpacks'