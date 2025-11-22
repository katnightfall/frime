
### INSTALL

1) Drag and drop `dz-items` into your server resources
2) Ensure `dz-items` in your server.cfg
3) Open `config.lua` file and config the script to your like
4) Open `config_server.lua` file and setup the discord logs webhook
5) Add the `packaged_items` item bellow, to your items list
6) Add the `packaged_items` image to your inventory images folder
7) Restart your server


### PACKAGED ITEMS ITEM

* QBCore Framework

['packaged_items'] 			 = {['name'] = 'packaged_items', 				['label'] = 'Packaged Items', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'packaged_items.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},

* ESX Legacy Framework (ox_inventoy)

['packaged_items'] = {
	label = 'Packaged Items',
	weight = 1000,
	stack = false,
	close = true,
},

### SUPPORT
https://discord.gg/8nFqCR4xVC