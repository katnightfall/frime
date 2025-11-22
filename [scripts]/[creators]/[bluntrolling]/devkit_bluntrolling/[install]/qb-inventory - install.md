1. Add images into qb-inventory > html > images.
2. Add items to qb-core > shared > items.lua 
3. ensure `[bluntrolling]` in your resources.cfg
4. Restart Server and boom!





--#Items for items.lua:
```lua

devkit_rackwoods_hb = { name = 'devkit_rackwoods_hb', label = 'Rackwoods Honey Burbon', weight = 10, type = 'item', image = 'devkit_rackwoods_hb.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
devkit_rackwoods_sweet = { name = 'devkit_rackwoods_sweet', label = 'Rackwoods Sweet', weight = 10, type = 'item', image = 'devkit_rackwoods_sweet.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
devkit_rackwoods_vanilla = { name = 'devkit_rackwoods_vanilla', label = 'Rackwoods Vanilla', weight = 10, type = 'item', image = 'devkit_rackwoods_vanilla.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
devkit_rackwoods_wnm = { name = 'devkit_rackwoods_wnm', label = 'Rackwoods W&M', weight = 10, type = 'item', image = 'devkit_rackwoods_wnm.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

marshmallow_og = { name = 'marshmallow_og', label = 'Marshmallow OG', weight = 1, type = 'item', image = 'marshmallow_og.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
marshmallow_og_wood = { name = 'marshmallow_og_wood', label = 'Marshmallow OG Wood', weight = 1, type = 'item', image = 'marshmallow_og_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

zushi = { name = 'zushi', label = 'Zushi', weight = 1, type = 'item', image = 'zushi.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
zushi_wood = { name = 'zushi_wood', label = 'Zushi Wood', weight = 1, type = 'item', image = 'zushi_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

pink_sandy = { name = 'pink_sandy', label = 'Pink Sandy', weight = 1, type = 'item', image = 'pink_sandy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
pink_sandy_wood = { name = 'pink_sandy_wood', label = 'Pink Sandy Wood', weight = 1, type = 'item', image = 'pink_sandy_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

la_confidential = { name = 'la_confidential', label = 'LA Confidential', weight = 1, type = 'item', image = 'la_confidential.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
la_confidential_wood = { name = 'la_confidential_wood', label = 'LA Confidential Wood', weight = 1, type = 'item', image = 'la_confidential_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

apple_gelato = { name = 'apple_gelato', label = 'Apple Gelato', weight = 1, type = 'item', image = 'apple_gelato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
apple_gelato_wood = { name = 'apple_gelato_wood', label = 'Apple Gelato Wood', weight = 1, type = 'item', image = 'apple_gelato_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

ether = { name = 'ether', label = 'Ether', weight = 1, type = 'item', image = 'ether.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
ether_wood = { name = 'ether_wood', label = 'Ether Wood', weight = 1, type = 'item', image = 'ether_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

marathon = { name = 'marathon', label = 'Marathon', weight = 1, type = 'item', image = 'marathon.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
marathon_wood = { name = 'marathon_wood', label = 'Marathon Wood', weight = 1, type = 'item', image = 'marathon_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

white_runtz = { name = 'white_runtz', label = 'White Runtz', weight = 1, type = 'item', image = 'white_runtz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
white_runtz_wood = { name = 'white_runtz_wood', label = 'White Runtz Wood', weight = 1, type = 'item', image = 'white_runtz_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

whitecherry_gelato = { name = 'whitecherry_gelato', label = 'Whitecherry Gelato', weight = 1, type = 'item', image = 'whitecherry_gelato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
whitecherry_gelato_wood = { name = 'whitecherry_gelato_wood', label = 'Whitecherry Gelato Wood', weight = 1, type = 'item', image = 'whitecherry_gelato_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

moon_rock = { name = 'moon_rock', label = 'Moon Rock', weight = 1, type = 'item', image = 'moon_rock.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
moon_rock_wood = { name = 'moon_rock_wood', label = 'Moon Rock Wood', weight = 1, type = 'item', image = 'moon_rock_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

gary_payton = { name = 'gary_payton', label = 'Gary Payton', weight = 1, type = 'item', image = 'gary_payton.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
gary_payton_wood = { name = 'gary_payton_wood', label = 'Gary Payton Wood', weight = 1, type = 'item', image = 'gary_payton_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

biscotti = { name = 'biscotti', label = 'Biscotti', weight = 1, type = 'item', image = 'biscotti.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
biscotti_wood = { name = 'biscotti_wood', label = 'Biscotti Wood', weight = 1, type = 'item', image = 'biscotti_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

georgia_pie = { name = 'georgia_pie', label = 'Georgia Pie', weight = 1, type = 'item', image = 'georgia_pie.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
georgia_pie_wood = { name = 'georgia_pie_wood', label = 'Georgia Pie Wood', weight = 1, type = 'item', image = 'georgia_pie_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

blueberry_cruffin = { name = 'blueberry_cruffin', label = 'Blueberry Cruffin', weight = 1, type = 'item', image = 'blueberry_cruffin.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
blueberry_cruffin_wood = { name = 'blueberry_cruffin_wood', label = 'Blueberry Cruffin Wood', weight = 1, type = 'item', image = 'blueberry_cruffin_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

tahoe_og = { name = 'tahoe_og', label = 'Tahoe OG', weight = 1, type = 'item', image = 'tahoe_og.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
tahoe_og_wood = { name = 'tahoe_og_wood', label = 'Tahoe OG Wood', weight = 1, type = 'item', image = 'tahoe_og_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

blue_tomyz = { name = 'blue_tomyz', label = 'Blue Tomyz', weight = 1, type = 'item', image = 'blue_tomyz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
blue_tomyz_wood = { name = 'blue_tomyz_wood', label = 'Blue Tomyz Wood', weight = 1, type = 'item', image = 'blue_tomyz_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

gmo_cookies = { name = 'gmo_cookies', label = 'GMO cookies', weight = 1, type = 'item', image = 'gmo_cookies.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
gmo_cookies_wood = { name = 'gmo_cookies_wood', label = 'GMO cookies Wood', weight = 1, type = 'item', image = 'gmo_cookies_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

oreoz = { name = 'oreoz', label = 'Oreoz', weight = 1, type = 'item', image = 'oreoz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
oreoz_wood = { name = 'oreoz_wood', label = 'Oreoz Wood', weight = 1, type = 'item', image = 'oreoz_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

cake_mix = { name = 'cake_mix', label = 'Cake Mix', weight = 1, type = 'item', image = 'cake_mix.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
cake_mix_wood = { name = 'cake_mix_wood', label = 'Cake Mix Wood', weight = 1, type = 'item', image = 'cake_mix_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

runtz_og = { name = 'runtz_og', label = 'Runtz OG', weight = 1, type = 'item', image = 'runtz_og.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
runtz_og_wood = { name = 'runtz_og_wood', label = 'Runtz OG Wood', weight = 1, type = 'item', image = 'runtz_og_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

cheetah_piss = { name = 'cheetah_piss', label = 'Cheetah Piss', weight = 1, type = 'item', image = 'cheetah_piss.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
cheetah_piss_wood = { name = 'cheetah_piss_wood', label = 'Cheetah Piss Wood', weight = 1, type = 'item', image = 'cheetah_piss_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

collins_ave = { name = 'collins_ave', label = 'Collins AVE', weight = 1, type = 'item', image = 'collins_ave.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
collins_ave_wood = { name = 'collins_ave_wood', label = 'Collins AVE Wood', weight = 1, type = 'item', image = 'collins_ave_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

pirckly_pear = { name = 'pirckly_pear', label = 'Pirckly Pear', weight = 1, type = 'item', image = 'pirckly_pear.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
pirckly_pear_wood = { name = 'pirckly_pear_wood', label = 'Pirckly Pear Wood', weight = 1, type = 'item', image = 'pirckly_pear_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

cereal_milk = { name = 'cereal_milk', label = 'Cereal Milk', weight = 1, type = 'item', image = 'cereal_milk.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
cereal_milk_wood = { name = 'cereal_milk_wood', label = 'Cereal Milk Wood', weight = 1, type = 'item', image = 'cereal_milk_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

fine_china = { name = 'fine_china', label = 'Fine China', weight = 1, type = 'item', image = 'fine_china.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
fine_china_wood = { name = 'fine_china_wood', label = 'Fine China Wood', weight = 1, type = 'item', image = 'fine_china_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

ice_cream_cake_pack = { name = 'ice_cream_cake_pack', label = 'Ice Cream Cake Pack', weight = 1, type = 'item', image = 'ice_cream_cake_pack.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
ice_cream_cake_pack_wood = { name = 'ice_cream_cake_pack_wood', label = 'Ice Cream Cake Pack Wood', weight = 1, type = 'item', image = 'ice_cream_cake_pack_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

gelatti = { name = 'gelatti', label = 'Gelatti', weight = 1, type = 'item', image = 'gelatti.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
gelatti_wood = { name = 'gelatti_wood', label = 'Gelatti Wood', weight = 1, type = 'item', image = 'gelatti_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

snow_man = { name = 'snow_man', label = 'Snow Man', weight = 1, type = 'item', image = 'snow_man.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
snow_man_wood = { name = 'snow_man_wood', label = 'Snow Man Wood', weight = 1, type = 'item', image = 'snow_man_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

jefe = { name = 'jefe', label = 'Jefe', weight = 1, type = 'item', image = 'jefe.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
jefe_wood = { name = 'jefe_wood', label = 'Jefe Wood', weight = 1, type = 'item', image = 'jefe_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

sour_diesel = { name = 'sour_diesel', label = 'Sour Diesel', weight = 1, type = 'item', image = 'sour_diesel.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
sour_diesel_wood = { name = 'sour_diesel_wood', label = 'Sour Diesel Wood', weight = 1, type = 'item', image = 'sour_diesel_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

froties = { name = 'froties', label = 'Froties', weight = 1, type = 'item', image = 'froties.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
froties_wood = { name = 'froties_wood', label = 'Froties Wood', weight = 1, type = 'item', image = 'froties_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

khalifa_kush = { name = 'khalifa_kush', label = 'Khalifa Kush', weight = 1, type = 'item', image = 'khalifa_kush.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
khalifa_kush_wood = { name = 'khalifa_kush_wood', label = 'Khalifa Kush Wood', weight = 1, type = 'item', image = 'khalifa_kush_wood.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
