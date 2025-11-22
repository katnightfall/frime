1. Add items into ox_inventory > data > items.lua
2. Add images into ox_inventory > web > images
3. ensure `devkit_bodybag` in your resources.cfg
4. Config script to your server's liking under Config.lua.
5. Restart Server and boom!






```lua
-- > into ox_inventory > data > items.lua
--#Items

	['bodybag'] = {
		label = 'Body Bag',
		weight = 10,
		stack = true,
		close = true,
		description = nil,
	},

   ['coffin'] = {
		label = 'Weighted Coffin',
		weight = 900,
		stack = true,
		close = true,
		description = nil,
	},

	['dkshovel'] = {
		label = 'Shovel',
		weight = 200,
		stack = true,
		close = true,
		description = nil,
	},