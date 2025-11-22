## v2.5
    -vehicle collision disabled while setting garage point
    -detect broken shells and auto skip after 10 seconds
    -loading ui for shells
## v2.6
    -a notification trigger name fixed
## v2.7
    -harvest exploit fixed
## v2.8
    -family blip added
## v2.9
    -harvest bug fixed
    -garage bug fixed
## v3.0
    -admin detection fixed
    -furniture code improved
    -invisible in garage exploit fixed
## v3.1
    -see neighbours furniture issue fixed
## v3.2
    -Inventory weight calculation fixed
## v3.2.1
    -house raid error fixed
## v3.2.2
    -house rob server error fixed
    -house raid server error fixed
## v3.2.3
    -identifier error fixed on startup
## v3.2.4
    -Admin check fixed
## v3.2.5
    -Admin permission level fixed
## v3.2.6
    -vehiclekey support added in garage
## v3.2.7
    -admin permission check fixed
## v3.3
    -ox inventory weight calculation fixed
## v3.4
    -decrease weight on edit furniture fixed
    -alternative way to set admin
## v3.5
    -inaccessible inventory on house raid fixed
## v3.6
    -minor bug fix in furniture
## v3.7
    -Unique id for house to fix inventory duplicate
    -lock/unlock shell house if player have door access
## v3.8
    -Minor bug fix of shell door lock access
## v3.8.1
    -Shell door manage bug fix
## v3.9
    -Inventory bug fix
## v4.0
    -Free housing shells are removed. But you can download from : https://github.com/quasar-scripts/k4mb1shellstarter
## v4.1
    -Not receiving offline house selling commission fixed
## v4.2
    -Zoom feature added in shell creation
## v4.3
    -Entry missing for shell housing fixed
    -Furniture missing fixed
## v4.4
    -few improvement
## v4.5
    -disable sell house option for player added in config
## v4.6
    -all k4mb1 shells added in creation config
## v4.7
    -minor bug fixed
## v4.8
    -max weed plant count fixed
## v4.9
    -minor adjustment
## v5.0
    -Shell selection menu
## v5.1
    -core_inventory support
## v5.1.1
    -qb inventory weight adjustment
## v5.1.2
    -set weed plant option fixed
## v5.2
    -cd_garage support
## v5.3
    -okokGarage support
## v5.4
    -Currently, a player can independently change the coordinate via the house menu, even if the house is not supposed to have a garage (fixed)
## v5.5
    -house member lab access fixed
## v5.6
    -os dev command removed
    Replace:
        => modules/creation/client/creation.lua
## v5.7
    -qb-garage support added
    -garage access check added
    -shell rotation added
    Replace:
        => modules/_init/server/main.lua
        => modules/garage/config.lua
        => modules/garage/client/garage.lua
        => modules/garage/server/garage.lua
        => modules/creation/client/creation.lua
        => modules/main/client/main.lua
## v5.7.1
    -qb-garage adjustment
    Replace:
        => modules/_init/server/main.lua
        => modules/garage/client/garage.lua
## v5.8
    -weed harvest error fixed
    Replace:
        => modules/weed/server/weed.lua
## v5.9
    -jg-advancedgarages support added
    Replace:
        => modules/garage/client/garage.lua
        => modules/garage/config.lua
## v5.9.1
    -management export error fixed
    Replace:
        => utils/server.lua
## v5.9.2
    -old qb-management support added
    Replace:
        => config.lua
        => utils/server.lua
## v6.0
    -command permission notification fixed
    -command permission check fixed
    Replace:
        => modules/realestate/server/realestate.lua
## v6.0.1
    -qb-weathersync compatibility added
    Replace:
        => modules/weather/client/weather.lua
## v6.1
    -ak47_qb_garage support added
    Replace:
        => modules/garage/config.lua
        => modules/garage/client/garage.lua
## v6.2
    -codem-apperance support added
    Replace:  
        => modules/wardrobe/config.lua
        => modules/wardrobe/client/wardrobe.lua
## v6.3
    -blip display type added
    -max sell price limit of the house added
    Replace:  
        => config.lua
        => modules/main/client/main.lua
## v6.4
    -ak47_vehiclekeys support added
    -loaf_garage support added
    Replace:  
        => modules/garage/client/garage.lua
        => modules/garage/client/customizable.lua
## v6.5
    -jg-advancedgarages fixed
    Replace:  
        => modules/garage/client/garage.lua
## v6.6
    -admin checker adjustment
    Replace:  
        => config.lua
        => modules/init/server/main.lua
        => modules/realestate/server/realestate.lua
## v6.6.1
    -new qb-inventory support added
    Replace:  
        => modules/inventory/config.lua
        => modules/inventory/client/inventory.lua
        => modules/inventory/server/inventory.lua
    Note:
        you have to set "qb-inventory-new" in modules/inventory/config.lua
## v6.7
    -codem-inventory added
    Replace:  
        => modules/inventory/config.lua
        => modules/inventory/client/inventory.lua
## v6.8
    -rent payment discord log added
    -installment payment discord log added
    Replace:  
        => webhooks.lua
        => modules/_init/server/main.lua
        => modules/main/server/main.lua
## v6.9
    -jg-advancedgarages fixed
    Replace:  
        => modules/garage/client/garage.lua
## v7.0
    -av_weather support added
    Replace:  
        => modules/weather/config.lua
        => modules/weather/client/weather.lua
## v7.1
- you can now finish mlo house creation with mouse right click
### Replace:
- modules/lock/client/lock.lua

## v7.2
- rcore_clothing support added
### Replace:
- modules/wardrobe/config.lua
- modules/wardrobe/client/wardrobe.lua

## v7.3
- jg-advancedgarages integration fixed
### Replace:
- modules/main/server/main.lua

## v7.4
- loaf_garage integration fixed
### Replace:
- modules/garage/client/garage.lua

## v7.5
- loaf_garage integration garage error fixed
### Replace:
- modules/garage/client/garage.lua

## v7.6
- error fixed on startup. (caused by removing character from database but not from housing)
### Replace:
- modules/init/server/main.lua

## v7.7
- config updated for k4mb1 shells
- k4mb1 free shell pack added with the housing
### Replace:
- stream/
- fxmanifest.lua
- modules/creation/config.lua

## v7.8
- special coin support added for buy, rent & installment
### Replace:
- config.lua
- locales\en.lua
- modules\_init\server\main.lua
- modules\creation\client\creation.lua
- modules\installment\server\instalment.lua
- modules\main\client\main.lua
- modules\main\server\main.lua
- modules\rent\server\rent.lua
- utils\server.lua

## v7.9
- rent & installment owner house blip fixed
### Replace:
- modules/main/client/main.lua

## v8.0
- sending large event warning fixed
- invalid furniture models will not show in the manu
### Replace:
- fxmanifest.lua
- modules\labs\server\labs.lua
- modules\main\client\main.lua
- modules\main\server\main.lua
- modules\weed\server\weed.lua
- modules\_init\server\main.lua
- modules\furniture\client\furniture.lua
- modules\furniture\server\furniture.lua

## v8.1
- fix for large event
- error after creating house fixed
- invalid furniture models checker removed
### Replace:
- modules\init\client\main.lua
- modules\init\server\main.lua
- modules\furniture\client\furniture.lua

## v8.2
- dynamic door creation added
### Replace:
- modules\furniture\config.lua
- modules\furniture\client\furniture.lua
### Add:
- `setr game_enableDynamicDoorCreation true` in your server.cfg

## v8.3
- error while removing door fixed
### Replace:
- modules\furniture\client\furniture.lua