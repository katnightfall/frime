1. Add images into inventory.
2. Run `items` sql.
3. ensure `devkit_bodybag` in your resources.cfg
4. Config script to your server's liking under Config.lua.
5. Restart Server and boom!





--#IMPORTANT#-
ONLY RUN THIS IF YOU'RE NOT USING OX INVENTORY, IF YOU ARE, USE THE ox-install.


--#Items

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
('bodybag', 'Body Bag', 10),
('coffin', 'Coffin', 20);
('dkshovel', 'Shovel', 20);