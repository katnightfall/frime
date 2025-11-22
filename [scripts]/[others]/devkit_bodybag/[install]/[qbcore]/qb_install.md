1. Add images into qb-inventory > html > images.
2. Add items to qb-core > shared > items.lua 
3. ensure `devkit_bodybag` in your resources.cfg
4. Config script to your server's liking under Config.lua.
5. Restart Server and boom!





--#Items for items.lua:
```lua

bodybag = { name = 'bodybag', label = 'Body Bag', weight = 1000, type = 'item', image = 'bodybag.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A bag used to carry dead bodies.' },
coffin = { name = 'coffin', label = 'Coffin', weight = 3000, type = 'item', image = 'coffin.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'A large wooden box used to bury people.' },
dkshovel = { name = 'dkshovel', label = 'Shovel', weight = 1000, type = 'item', image = 'dkshovel.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'A shovel.' },