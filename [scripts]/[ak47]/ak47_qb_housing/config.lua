Config = {}
Config.Locale = "en"
Config.Debug = false
Config.SocietyInManagement = false --enable if your society is inside qb-management

Config.UseBankMoney = true       --Use bank money to purchase the house
Config.MaxHouseLimit = 10        --How many house a player can own
Config.SellHouse = true          --Allow player to sell house
Config.SellValuePercent = 125    --max 125% of main price

Config.Commands = {
    createhouse = "createhouse", --Start house creation
    deletehouse = "deletehouse", --Delete existing
    furniture   = "furniture",   --Decorate
    realestate  = "realestate",  --Open realestate boss menu
    houserob    = "houserob",    --Rob a player house
    houseraid   = "houseraid",   --Raid a player house
    exterior    = "exterior",     --Clean exterior objects
}

--You can set admin in alternative ways-------------------
--Ace Permission
Config.AdminWithAce = true
--Or group
Config.AdminWithGroup = {
    ['admin'] = true,
    ['superadmin'] = true,
    ['god'] = true,
}
--Or license
Config.AdminWithLicense = {
    ['license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'] = true,
}
--Or character id
Config.AdminWithIdentifier = {
    ['xxxxxxxx'] = true,
}
----------------------------------------------------------

Config.SpecialCoin = { 
    enable = false,
    tablename           = 'cointable', --adjust this [I don't know what coin script you are using or not, so don't open ticket for this]
    identifiercolumname = 'identifier',  --adjust this [I don't know what coin script you are using or not, so don't open ticket for this]
    coincolumname       = 'coin',     --adjust this [I don't know what coin script you are using or not, so don't open ticket for this]
}

Config.Currency = {
    cash = "Cash",
    bank = "Bank Money",
    coin = "Coin", -- keep the name coin if you want to use special coin system
    --black_money = "Black Money",
}

Config.PoliceJobs = {
    ['police'] = true,
    ['sheriff'] = true,
}

Config.Volumes = {
    doorbell        = 0.3,
    securityalarm   = 0.3,
    keydoors        = 0.3,
    dooropen        = 0.3,
    doorclose       = 0.3,
}

Config.Blip = {
    interior = {
        myhouse         = {enable = true, id = 40,  color = 3,  size = 0.8, displaytype = 6},
        familyhouse     = {enable = true, id = 40,  color = 3,  size = 0.6, displaytype = 6},
        neighbourhouse  = {enable = true, id = 40,  color = 2,  size = 0.6, displaytype = 6},
        empty           = {enable = true, id = 350, color = 18, size = 0.4, displaytype = 6},
    },
    mlo = {
        myhouse         = {enable = true, id = 176, color = 3,  size = 0.8, displaytype = 6},
        familyhouse     = {enable = true, id = 176, color = 3,  size = 0.6, displaytype = 6},
        neighbourhouse  = {enable = true, id = 176, color = 2,  size = 0.6, displaytype = 6},
        empty           = {enable = true, id = 176, color = 18, size = 0.4, displaytype = 6},
    },
}