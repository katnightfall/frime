
Simple Instructions:

1. Place these under items.lua in OX_Inventory
2. ensure devkit_smoking in the resource.cfg
3. Throw images into ox_inventory under Web > images



```lua

	--#Devkit's Smoking

	lighter = { name = 'lighter', label = 'Lighter', weight = 1, type = 'item', image = 'lighter.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	cheap_lighter = { name = 'cheap_lighter', label = 'Cheap Lighter', weight = 1, type = 'item', image = 'cheap_lighter.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },


	vape = { name = 'vape', label = 'Vape', weight = 2, type = 'item', image = 'vape.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	blueberry_jam_cookie = { name = 'blueberry_jam_cookie', label = 'Blueberry Jam Cookie', weight = 1, type = 'item', image = 'blueberry_jam_cookie.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	butter_cookie = { name = 'butter_cookie', label = 'Butter Cookie', weight = 1, type = 'item', image = 'butter_cookie.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	cookie_craze = { name = 'cookie_craze', label = 'Cookie Craze', weight = 1, type = 'item', image = 'cookie_craze.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	get_figgy = { name = 'get_figgy', label = 'Get Figgy', weight = 1, type = 'item', image = 'get_figgy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	key_lime_cookie = { name = 'key_lime_cookie', label = 'Key Lime Cookie', weight = 1, type = 'item', image = 'key_lime_cookie.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	marshmallow_crisp = { name = 'marshmallow_crisp', label = 'Marshmallow Crisp', weight = 1, type = 'item', image = 'marshmallow_crisp.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	no_99 = { name = 'no_99', label = 'Number 99', weight = 1, type = 'item', image = 'no_99.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	paris_fog = { name = 'paris_fog', label = 'Paris Fog', weight = 1, type = 'item', image = 'paris_fog.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	pogo = { name = 'pogo', label = 'Pogo', weight = 1, type = 'item', image = 'pogo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	shamrock_cookie = { name = 'shamrock_cookie', label = 'Shamrock Cookie', weight = 1, type = 'item', image = 'shamrock_cookie.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	strawberry_jam_cookie = { name = 'strawberry_jam_cookie', label = 'Strawberry Jam Cookie', weight = 1, type = 'item', image = 'strawberry_jam_cookie.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },



	grabba_leaf = { name = 'grabba_leaf', label = 'Grabba Leaf', weight = 1, type = 'item', image = 'grabba_leaf.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	backwoods_grape = { name = 'backwoods_grape', label = 'Backwoods Grape', weight = 1, type = 'item', image = 'backwoods_grape.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	backwoods_honey = { name = 'backwoods_honey', label = 'Backwoods Honey', weight = 1, type = 'item', image = 'backwoods_honey.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	backwoods_russian_cream = { name = 'backwoods_russian_cream', label = 'Backwoods Russian Cream', weight = 1, type = 'item', image = 'backwoods_russian_cream.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	banana_backwoods = { name = 'banana_backwoods', label = 'Banana Backwoods', weight = 1, type = 'item', image = 'banana_backwoods.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },


	marshmallow_og = { name = 'marshmallow_og', label = 'Marshmallow OG', weight = 1, type = 'item', image = 'marshmallow_og.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	marshmallow_og_joint = { name = 'marshmallow_og_joint', label = 'Marshmallow OG Joint', weight = 1, type = 'item', image = 'marshmallow_og_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	zushi = { name = 'zushi', label = 'Zushi', weight = 1, type = 'item', image = 'zushi.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	zushi_joint = { name = 'zushi_joint', label = 'Zushi Joint', weight = 1, type = 'item', image = 'zushi_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	pink_sandy = { name = 'pink_sandy', label = 'Pink Sandy', weight = 1, type = 'item', image = 'pink_sandy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	pink_sandy_joint = { name = 'pink_sandy_joint', label = 'Pink Sandy Joint', weight = 1, type = 'item', image = 'pink_sandy_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	la_confidential = { name = 'la_confidential', label = 'LA Confidential', weight = 1, type = 'item', image = 'la_confidential.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	la_confidential_joint = { name = 'la_confidential_joint', label = 'LA Confidential Joint', weight = 1, type = 'item', image = 'la_confidential_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	apple_gelato = { name = 'apple_gelato', label = 'Apple Gelato', weight = 1, type = 'item', image = 'apple_gelato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	apple_gelato_joint = { name = 'apple_gelato_joint', label = 'Apple Gelato Joint', weight = 1, type = 'item', image = 'apple_gelato_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	ether = { name = 'ether', label = 'Ether', weight = 1, type = 'item', image = 'ether.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	ether_joint = { name = 'ether_joint', label = 'Ether Joint', weight = 1, type = 'item',image = 'ether_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	marathon = { name = 'marathon', label = 'Marathon', weight = 1, type = 'item', image = 'marathon.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	marathon_joint = { name = 'marathon_joint', label = 'Marathon Joint', weight = 1, type = 'item', image = 'marathon_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	white_runtz = { name = 'white_runtz', label = 'White Runtz', weight = 1, type = 'item', image = 'white_runtz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	white_runtz_joint = { name = 'white_runtz_joint', label = 'White Runtz Joint', weight = 1, type = 'item', image = 'white_runtz_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	whitecherry_gelato = { name = 'whitecherry_gelato', label = 'Whitecherry Gelato', weight = 1, type = 'item', image = 'whitecherry_gelato.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	whitecherry_gelato_joint = { name = 'whitecherry_gelato_joint', label = 'Whitecherry Gelato Joint', weight = 1, type = 'item', image = 'whitecherry_gelato_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	moon_rock = { name = 'moon_rock', label = 'Moon Rock', weight = 1, type = 'item', image = 'moon_rock.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	moon_rock_joint = { name = 'moon_rock_joint', label = 'Moon Rock Joint', weight = 1, type = 'item', image = 'moon_rock_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	gary_payton = { name = 'gary_payton', label = 'Gary Payton', weight = 1, type = 'item', image = 'gary_payton.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	gary_payton_joint = { name = 'gary_payton_joint', label = 'Gary Payton Joint', weight = 1, type = 'item', image = 'gary_payton_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	biscotti = { name = 'biscotti', label = 'Biscotti', weight = 1, type = 'item', image = 'biscotti.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	biscotti_joint = { name = 'biscotti_joint', label = 'Biscotti Joint', weight = 1, type = 'item', image = 'biscotti_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	georgia_pie = { name = 'georgia_pie', label = 'Georgia Pie', weight = 1, type = 'item', image = 'georgia_pie.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	georgia_pie_joint = { name = 'georgia_pie_joint', label = 'Georgia Pie Joint', weight = 1, type = 'item', image = 'georgia_pie_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	blueberry_cruffin = { name = 'blueberry_cruffin', label = 'Blueberry Cruffin', weight = 1, type = 'item', image = 'blueberry_cruffin.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	blueberry_cruffin_joint = { name = 'blueberry_cruffin_joint', label = 'Blueberry Cruffin Joint', weight = 1, type = 'item', image = 'blueberry_cruffin_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	tahoe_og = { name = 'tahoe_og', label = 'Tahoe OG', weight = 1, type = 'item', image = 'tahoe_og.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	tahoe_og_joint = { name = 'tahoe_og_joint', label = 'Tahoe OG Joint', weight = 1, type = 'item', image = 'tahoe_og_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	blue_tomyz = { name = 'blue_tomyz', label = 'Blue Tomyz', weight = 1, type = 'item', image = 'blue_tomyz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	blue_tomyz_joint = { name = 'blue_tomyz_joint', label = 'Blue Tomyz Joint', weight = 1, type = 'item', image = 'blue_tomyz_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	gmo_cookies = { name = 'gmo_cookies', label = 'GMO Cookies', weight = 1, type = 'item', image = 'gmo_cookies.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	gmo_cookies_joint = { name = 'gmo_cookies_joint', label = 'GMO Cookies Joint', weight = 1, type = 'item', image = 'gmo_cookies_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	oreoz = { name = 'oreoz', label = 'Oreoz', weight = 1, type = 'item', image = 'oreoz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	oreoz_joint = { name = 'oreoz_joint', label = 'Oreoz Joint', weight = 1, type = 'item', image = 'oreoz_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	cake_mix = { name = 'cake_mix', label = 'Cake Mix', weight = 1, type = 'item', image = 'cake_mix.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	cake_mix_joint = { name = 'cake_mix_joint', label = 'Cake Mix Joint', weight = 1, type = 'item', image = 'cake_mix_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	runtz_og = { name = 'runtz_og', label = 'Runtz OG', weight = 1, type = 'item', image = 'runtz_og.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	runtz_og_joint = { name = 'runtz_og_joint', label = 'Runtz OG Joint', weight = 1, type = 'item', image = 'runtz_og_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	cheetah_piss = { name = 'cheetah_piss', label = 'Cheetah Piss', weight = 1, type = 'item', image = 'cheetah_piss.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	cheetah_piss_joint = { name = 'cheetah_piss_joint', label = 'Cheetah Piss Joint', weight = 1, type = 'item', image = 'cheetah_piss_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	collins_ave = { name = 'collins_ave', label = 'Collins AVE', weight = 1, type = 'item', image = 'collins_ave.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	collins_ave_joint = { name = 'collins_ave_joint', label = 'Collins AVE Joint', weight = 1, type = 'item', image = 'collins_ave_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	pirckly_pear = { name = 'pirckly_pear', label = 'Pirckly Pear', weight = 1, type = 'item', image = 'pirckly_pear.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	pirckly_pear_joint = { name = 'pirckly_pear_joint', label = 'Pirckly Pear Joint', weight = 1, type = 'item', image = 'pirckly_pear_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	cereal_milk = { name = 'cereal_milk', label = 'Cereal Milk', weight = 1, type = 'item', image = 'cereal_milk.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	cereal_milk_joint = { name = 'cereal_milk_joint', label = 'Cereal Milk Joint', weight = 1, type = 'item', image = 'cereal_milk_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	fine_china = { name = 'fine_china', label = 'Fine China', weight = 1, type = 'item', image = 'fine_china.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	fine_china_joint = { name = 'fine_china_joint', label = 'Fine China Joint', weight = 1, type = 'item', image = 'fine_china_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	ice_cream_cake_pack = { name = 'ice_cream_cake_pack', label = 'Ice Cream Cake Pack', weight = 1, type = 'item', image = 'ice_cream_cake_pack.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	ice_cream_cake_pack_joint = { name = 'ice_cream_cake_pack_joint', label = 'Ice Cream Cake Pack Joint', weight = 1, type = 'item', image = 'ice_cream_cake_pack_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	gelatti = { name = 'gelatti', label = 'Gelatti', weight = 1, type = 'item', image = 'gelatti.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	gelatti_joint = { name = 'gelatti_joint', label = 'Gelatti Joint', weight = 1, type = 'item', image = 'gelatti_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	snow_man = { name = 'snow_man', label = 'Snow Man', weight = 1, type = 'item', image = 'snow_man.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	snow_man_joint = { name = 'snow_man_joint', label = 'Snow Man Joint', weight = 1, type = 'item', image = 'snow_man_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	jefe = { name = 'jefe', label = 'Jefe', weight = 1, type = 'item', image = 'jefe.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	jefe_joint = { name = 'jefe_joint', label = 'Jefe Joint', weight = 1, type = 'item', image = 'jefe_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	sour_diesel = { name = 'sour_diesel', label = 'Sour Diesel', weight = 1, type = 'item', image = 'sour_diesel.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	sour_diesel_joint = { name = 'sour_diesel_joint', label = 'Sour Diesel Joint', weight = 1, type = 'item', image = 'sour_diesel_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	froties = { name = 'froties', label = 'Froties', weight = 1, type = 'item', image = 'froties.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	froties_joint = { name = 'froties_joint', label = 'Froties Joint', weight = 1, type = 'item', image = 'froties_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },

	khalifa_kush = { name = 'khalifa_kush', label = 'Khalifa Kush', weight = 1, type = 'item', image = 'khalifa_kush.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
	khalifa_kush_joint = { name = 'khalifa_kush_joint', label = 'Khalifa Kush Joint', weight = 1, type = 'item', image = 'khalifa_kush_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = '' },
