Config                        = {}
Locales                       = Locales or {}
Config.Framework              = 'qb'       -- esx, oldesx, qb, oldqb, vrp, qb = qbox
Config.Locale                 = 'en'
Config.CurrencyUnit           = '$'        -- '€' -- '₺'  '$'
Config.SQL                    = "oxmysql"  -- oxmysql / mysql-async / ghmattimysql
Config.Inventory              =
"qb_inventory"                             -- qb_inventory / esx_inventory / ox_inventory / qs_inventory / tgiann-inventory / need Config.missioncompletedItems
Config.ServeName              = "TWORST"   -- Server Name MAX 10
Config.MoneyType              = "$"        -- Money Type
Config.MoneyType2             = "bank"     -- Money Type bank / cash
Config.InteractionHandler     = 'drawtext' --  qb-target, drawtext,ox-target
Config.ExampleProfilePicture  = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
Config.Command                = {
    jobReset = "jobresetfashion",
    jobLeave = "jobleavefashion",
    openTutorial = "openTutorial",
}
Config.jobCoolDownHours       = 0             -- Job Cooldown Hours if 0 no cooldowns
Config.ChangeClothesSystem    = false         -- true / false
Config.ClothingScript         = "qb-clothing" -- fivem-appearance / illenium-appearance  / esx_skin / qb-clothing
Config.TebexSystem            = true          -- true / false
Config.DevMode                = false         -- true / false
Config.Debug                  = false         -- true / false
Config.maxWaitingClothesCount = 4             -- Maximum number of unfolded and ironed clothes on the table
Config.ScriptSound            = true          -- true / false
Config.Controls               = {
    ['QuitTable'] = 322,
}

Config.Fashion                = {
    ['coords'] = {
        ['intreactionCoords'] = vector3(722.07, -976.57, 24.13),
        ['ped'] = true,
        ['pedCoords'] = vector3(722.07, -976.57, 24.13),
        ['pedHeading'] = 176.8,
        ['pedHash'] = 0x20C8012F,
    },
    ['market'] = {
        ['intreactionCoords'] = vector3(452.32, -787.34, 27.36),
        ['ped'] = true,
        ['pedCoords'] = vector3(452.32, -787.34, 27.36),
        ['pedHeading'] = 278.22,
        ['pedHash'] = 0xECD04FE9,
    },
    ['job'] = 'all',
    ['blip'] = {
        show = true,
        blipName = Locales[Config.Locale]['fashionjob'],
        blipType = 73,
        blipColor = 2,
        blipScale = 0.65

    },
    ['marketBlip'] = {
        show = true,
        blipName = Locales[Config.Locale]['fashionmarket'],
        blipType = 59,
        blipColor = 24,
        blipScale = 0.65
    },
    ['missionBlips'] = {
        ['boxdelivery'] = {
            SetBlipSprite = 366,
            SetBlipColour = 25,
            SetBlipScale = 0.80,
            SetBlipDisplay = 4
        },
        ['vehicleBlips'] = {
            SetBlipSprite = 67,
            SetBlipColour = 0,
            SetBlipScale = 0.8,
        },
        ['deliveryBlips'] = {
            SetBlipSprite = 38,
            SetBlipColour = 29,
            SetBlipScale = 0.80,
        }
    },
    ['missioncompletedItems'] = {
        giveItemPlayer = false, -- true / false
        itemList = {
            { item = "sandwich", count = math.random(1, 4) },
            { item = "sandwich", count = 1 },
        },
    },
    ['drawtext'] = {
        ['text'] = "Press ~g~[E]~s~ to open the ~g~Fashion~s~",
        ['marketText'] = "Press ~g~[E]~s~ to open the ~g~Market~s~",
        ['openMachine'] = Locales[Config.Locale]['openMachine'],
        ['openTable'] = Locales[Config.Locale]['openTable'],
        ['deliveryVehicle'] = Locales[Config.Locale]['deliveryVehicle'],
    },
    ['progressBarText'] = {
        ['openboxLoading'] = Locales[Config.Locale]['openboxLoading'],
        ['giveVehicle'] = Locales[Config.Locale]['giveVehicle'],
        ['pickupWaiting'] = Locales[Config.Locale]['pickupWaiting'],
        ['giveWaiting'] = Locales[Config.Locale]['giveWaiting'],
    },
    ['regionData'] = {
        {
            regionKey = 1,
            regionInfo = {
                regionTitle = "Fashion Region",
                regionDetails = Locales[Config.Locale] and Locales[Config.Locale]['regionDetails'],
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionJobVehicle = {
                vehicle = "burrito4",
                vehicleBoneName = "chassis_dummy"
            },
            vehicleSpawnCoords = {
                vector4(711.66, -980.29, 23.93, 225.27),
                vector4(707.41, -980.64, 23.94, 225.21),
                vector4(703.99, -981.66, 23.94, 225.64),
                vector4(699.12, -982.74, 23.9, 223.45),
            },
            jobDeliverCoords = vector3(707.41, -980.64, 23.94),
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                extraMoneyperClothes = 100 -- 0 == false
            },

            regionJobTask = {
                {
                    jobName = "tshirtcraft",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", secondItem = true, count = 2 },
                        { item = "dye",  label = "Dye",  count = 3 },
                    },
                    jobLabel = Locales[Config.Locale]['producecoloredtshirt']
                },
                {
                    jobName = "sweatercraft",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", secondItem = true, count = 3 },
                        { item = "dye",  label = "Dye",  count = 4 },
                    },
                    jobLabel = Locales[Config.Locale]['producesweater']
                },
                {
                    jobName = "boxloading",
                    jobCount = 0,
                    jobLabel = Locales[Config.Locale]['boxloading']
                },
                {
                    jobName = "boxdelivery",
                    jobCount = 0,
                    jobLabel = Locales[Config.Locale]['boxdelivery']
                }
            },
            regionBoxDeliveryCount = math.random(2, 3),
            regionBoxDelivery = {
                {
                    boxDeliveryAreaCoords = vector3(618.94, 2786.04, 43.48),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 42.486145019531,
                },
                {
                    boxDeliveryAreaCoords = vector3(1190.36, 2722.58, 38.62),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 37.628437042236,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1108.41, 2723.72, 18.8),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 17.80029296875,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1204.64, -1453.26, 4.38),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 3.384765625,
                },
                {
                    boxDeliveryAreaCoords = vector3(-699.01, -146.49, 37.85),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 36.85066986084,
                },
                {
                    boxDeliveryAreaCoords = vector3(-235.56, -332.94, 30.06),
                    boxDeliveryAreaRadius = 8.0,
                    zCoords = 29.06247329711914,
                    regionType = "rich"
                },
                {
                    boxDeliveryAreaCoords = vector3(-1423.3, -213.81, 46.5),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 45.500392913818,
                },
                {
                    boxDeliveryAreaCoords = vector3(116.14, -244.01, 51.4),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 50.3994140625,
                },
                {
                    boxDeliveryAreaCoords = vector3(-849.71, -1089.77, 9.17),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 8.1688232421875,
                },
                {
                    boxDeliveryAreaCoords = vector3(453.83, -800.72, 27.45),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 26.450012207031,
                },
                {
                    boxDeliveryAreaCoords = vector3(66.53, -1400.49, 29.36),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 28.358276367188,
                },
            },
        },
        {
            regionKey = 2,
            regionInfo = {
                regionTitle = "Fashion Region",
                regionDetails = Locales[Config.Locale] and Locales[Config.Locale]['regionDetails'],
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 3

            },
            regionJobVehicle = {
                vehicle = "burrito4",
                vehicleBoneName = "chassis_dummy"
            },
            vehicleSpawnCoords = {
                vector4(711.66, -980.29, 23.93, 225.27),
                vector4(707.41, -980.64, 23.94, 225.21),
                vector4(703.99, -981.66, 23.94, 225.64),
                vector4(699.12, -982.74, 23.9, 223.45),
            },
            jobDeliverCoords = vector3(707.41, -980.64, 23.94),
            regionAwards = {
                money = 10000,
                xp = 2000,
                onlineJobExtraAwards = 2,
                extraMoneyperClothes = 200 -- 0 == false
            },

            regionJobTask = {
                {
                    jobName = "tshirtcraft",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", secondItem = true, count = 2 },
                        { item = "dye",  label = "Dye",  count = 3 },
                    },
                    jobLabel = Locales[Config.Locale]['producecoloredtshirt']
                },
                {
                    jobName = "sweatercraft",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", count = 3 },
                        { item = "dye",  label = "Dye",  count = 4 },
                    },
                    jobLabel = Locales[Config.Locale]['producesweater']
                },

                {
                    jobName = "boxloading",
                    jobCount = 0, -- dont change
                    jobLabel = Locales[Config.Locale]['boxloading']
                },

                {
                    jobName = "boxdelivery",
                    jobCount = 0, -- dont change
                    jobLabel = Locales[Config.Locale]['boxdelivery']

                }
            },
            regionBoxDeliveryCount = math.random(2, 5),
            regionBoxDelivery = {
                {
                    boxDeliveryAreaCoords = vector3(618.94, 2786.04, 43.48),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 42.486145019531,
                },
                {
                    boxDeliveryAreaCoords = vector3(1190.36, 2722.58, 38.62),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 37.628437042236,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1108.41, 2723.72, 18.8),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 17.80029296875,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1204.64, -1453.26, 4.38),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 3.384765625,
                },
                {
                    boxDeliveryAreaCoords = vector3(-699.01, -146.49, 37.85),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 36.85066986084,
                },

                {
                    boxDeliveryAreaCoords = vector3(-235.56, -332.94, 30.06),
                    boxDeliveryAreaRadius = 8.0,
                    zCoords = 29.06247329711914,
                    regionType = "rich"
                },
                {
                    boxDeliveryAreaCoords = vector3(-1423.3, -213.81, 46.5),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 45.500392913818,
                },

                {
                    boxDeliveryAreaCoords = vector3(116.14, -244.01, 51.4),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 50.3994140625,
                },

                {
                    boxDeliveryAreaCoords = vector3(-849.71, -1089.77, 9.17),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 8.1688232421875,
                },

                {
                    boxDeliveryAreaCoords = vector3(453.83, -800.72, 27.45),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 26.450012207031,
                },

                {
                    boxDeliveryAreaCoords = vector3(66.53, -1400.49, 29.36),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 28.358276367188,
                },


            },
        },
        {
            regionKey = 3,
            regionInfo = {
                regionTitle = "Fashion Region",
                regionDetails = Locales[Config.Locale] and Locales[Config.Locale]['regionDetails'],
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 5

            },
            regionJobVehicle = {
                vehicle = "burrito4",
                vehicleBoneName = "chassis_dummy"
            },
            vehicleSpawnCoords = {
                vector4(711.66, -980.29, 23.93, 225.27),
                vector4(707.41, -980.64, 23.94, 225.21),
                vector4(703.99, -981.66, 23.94, 225.64),
                vector4(699.12, -982.74, 23.9, 223.45),
            },
            jobDeliverCoords = vector3(707.41, -980.64, 23.94),
            regionAwards = {
                money = 15000,
                xp = 3000,
                onlineJobExtraAwards = 2,
                extraMoneyperClothes = 300 -- 0 == false
            },

            regionJobTask = {
                {
                    jobName = "tshirtcraft",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", secondItem = true, count = 2 },
                        { item = "dye",  label = "Dye",  count = 3 },
                    },
                    jobLabel = Locales[Config.Locale]['producecoloredtshirt']
                },
                {
                    jobName = "sweatercraft",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", count = 3 },
                        { item = "dye",  label = "Dye",  count = 4 },
                    },
                    jobLabel = Locales[Config.Locale]['producesweater']
                },

                {
                    jobName = "boxloading",
                    jobCount = 0, -- dont change
                    jobLabel = Locales[Config.Locale]['boxloading']
                },

                {
                    jobName = "boxdelivery",
                    jobCount = 0, -- dont change
                    jobLabel = Locales[Config.Locale]['boxdelivery']

                }
            },
            regionBoxDeliveryCount = math.random(2, 5),
            regionBoxDelivery = {
                {
                    boxDeliveryAreaCoords = vector3(618.94, 2786.04, 43.48),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 42.486145019531,
                },
                {
                    boxDeliveryAreaCoords = vector3(1190.36, 2722.58, 38.62),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 37.628437042236,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1108.41, 2723.72, 18.8),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 17.80029296875,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1204.64, -1453.26, 4.38),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 3.384765625,
                },
                {
                    boxDeliveryAreaCoords = vector3(-699.01, -146.49, 37.85),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 36.85066986084,
                },

                {
                    boxDeliveryAreaCoords = vector3(-235.56, -332.94, 30.06),
                    boxDeliveryAreaRadius = 8.0,
                    zCoords = 29.06247329711914,
                    regionType = "rich"
                },
                {
                    boxDeliveryAreaCoords = vector3(-1423.3, -213.81, 46.5),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 45.500392913818,
                },

                {
                    boxDeliveryAreaCoords = vector3(116.14, -244.01, 51.4),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 50.3994140625,
                },

                {
                    boxDeliveryAreaCoords = vector3(-849.71, -1089.77, 9.17),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 8.1688232421875,
                },

                {
                    boxDeliveryAreaCoords = vector3(453.83, -800.72, 27.45),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 26.450012207031,
                },

                {
                    boxDeliveryAreaCoords = vector3(66.53, -1400.49, 29.36),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 28.358276367188,
                },


            },
        },
        {
            regionKey = 4,
            regionInfo = {
                regionTitle = "Fashion Region",
                regionDetails = Locales[Config.Locale] and Locales[Config.Locale]['regionDetails'],
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 8

            },
            regionJobVehicle = {
                vehicle = "burrito4",
                vehicleBoneName = "chassis_dummy"
            },
            vehicleSpawnCoords = {
                vector4(711.66, -980.29, 23.93, 225.27),
                vector4(707.41, -980.64, 23.94, 225.21),
                vector4(703.99, -981.66, 23.94, 225.64),
                vector4(699.12, -982.74, 23.9, 223.45),
            },
            jobDeliverCoords = vector3(707.41, -980.64, 23.94),
            regionAwards = {
                money = 20000,
                xp = 4000,
                onlineJobExtraAwards = 2,
                extraMoneyperClothes = 400 -- 0 == false
            },

            regionJobTask = {
                {
                    jobName = "tshirtcraft",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", secondItem = true, count = 2 },
                        { item = "dye",  label = "Dye",  count = 3 },
                    },
                    jobLabel = Locales[Config.Locale]['producecoloredtshirt']
                },
                {
                    jobName = "sweatercraft",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3,
                        MaxColors = math.random(1, 5),
                        maxTotalAmount = 10
                    },
                    jobColor = {
                        darkblue = true,
                        purple = true,
                        black = true,
                        white = true,
                        blue = true,
                    },
                    materialsNeeded = {
                        { item = "wool", label = "Wool", count = 3 },
                        { item = "dye",  label = "Dye",  count = 4 },
                    },
                    jobLabel = Locales[Config.Locale]['producesweater']
                },

                {
                    jobName = "boxloading",
                    jobCount = 0, -- dont change
                    jobLabel = Locales[Config.Locale]['boxloading']
                },

                {
                    jobName = "boxdelivery",
                    jobCount = 0, -- dont change
                    jobLabel = Locales[Config.Locale]['boxdelivery']

                }
            },
            regionBoxDeliveryCount = math.random(2, 5),
            regionBoxDelivery = {
                {
                    boxDeliveryAreaCoords = vector3(618.94, 2786.04, 43.48),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 42.486145019531,
                },
                {
                    boxDeliveryAreaCoords = vector3(1190.36, 2722.58, 38.62),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 37.628437042236,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1108.41, 2723.72, 18.8),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 17.80029296875,
                },
                {
                    boxDeliveryAreaCoords = vector3(-1204.64, -1453.26, 4.38),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "poor",
                    zCoords = 3.384765625,
                },
                {
                    boxDeliveryAreaCoords = vector3(-699.01, -146.49, 37.85),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 36.85066986084,
                },

                {
                    boxDeliveryAreaCoords = vector3(-235.56, -332.94, 30.06),
                    boxDeliveryAreaRadius = 8.0,
                    zCoords = 29.06247329711914,
                    regionType = "rich"
                },
                {
                    boxDeliveryAreaCoords = vector3(-1423.3, -213.81, 46.5),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "rich",
                    zCoords = 45.500392913818,
                },

                {
                    boxDeliveryAreaCoords = vector3(116.14, -244.01, 51.4),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 50.3994140625,
                },

                {
                    boxDeliveryAreaCoords = vector3(-849.71, -1089.77, 9.17),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 8.1688232421875,
                },

                {
                    boxDeliveryAreaCoords = vector3(453.83, -800.72, 27.45),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 26.450012207031,
                },

                {
                    boxDeliveryAreaCoords = vector3(66.53, -1400.49, 29.36),
                    boxDeliveryAreaRadius = 8.0,
                    regionType = "mid",
                    zCoords = 28.358276367188,
                },


            },
        },
    },
    ['dailyMission'] = {
        {
            name = 'jobtask_one',
            header = Locales[Config.Locale]['jobtask'] .. " 1",
            label = Locales[Config.Locale]['dailyjobone'],
            count = 50,
            xp = 2500,
            money = 1000,
        },
        {
            name = 'jobtask_two',
            header = Locales[Config.Locale]['jobtask'] .. " 2",
            label = Locales[Config.Locale]['dailyjobtwo'],
            count = 10,
            xp = 1000,
            money = 3000

        },
        {
            name = 'jobtask_three',
            header = Locales[Config.Locale]['jobtask'] .. " 3",
            label = Locales[Config.Locale]['dailyjobthree'],
            count = 10000,
            xp = 2000,
            money = 3000
        },

        {
            name = 'jobtask_four',
            header = Locales[Config.Locale]['jobtask'] .. " 4",
            label = Locales[Config.Locale]['dailyjobfour'],
            count = 20,
            xp = 2000,
            money = 3000
        },
    },
}

Config.Clothes                = { -- Do not change this part, the information about the props in the map file given to you
    [1] = {
        ['tshirtcraft'] = {
            folded = {
                darkblue = {
                    model = 'tshirt',
                    textureName = 'white5'
                },
                purple = {
                    model = 'tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = 'tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = 'tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = 'tshirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'f-tshirt1',
                    textureName = 'white5'
                },
                purple = {
                    model = 'f-tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = 'f-tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = 'f-tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = 'f-tshirt5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = 'tshirtv1',
                    textureName = 'white5'
                },
                purple = {
                    model = 'tshirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'tshirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'tshirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'tshirtv5',
                    textureName = 'white'
                }
            }
        },
        ['sweatercraft'] = {
            folded = {
                darkblue = {
                    model = 'kashirt',
                    textureName = 'white'
                },
                purple = {
                    model = 'kashirt2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'kashirt3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'kashirt4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'kashirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'dsweat1',
                    textureName = 'white'
                },
                purple = {
                    model = 'dsweat2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'dsweat3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'dsweat4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'dsweat5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = 'shirtv1',
                    textureName = 'white'
                },
                purple = {
                    model = 'shirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'shirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'shirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'shirtv5',
                    textureName = 'white5'
                }
            }
        }
    },
    [2] = {
        ['tshirtcraft'] = {
            folded = {
                darkblue = {
                    model = '2tshirt',
                    textureName = 'white5'
                },
                purple = {
                    model = '2tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = '2tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = '2tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = '2tshirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'f2-tshirt1',
                    textureName = 'white5'
                },
                purple = {
                    model = 'f2-tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = 'f2-tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = 'f2-tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = 'f2-tshirt5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = '2tshirtv1',
                    textureName = 'white5'
                },
                purple = {
                    model = '2tshirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = '2tshirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = '2tshirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = '2tshirtv5',
                    textureName = 'white'
                }
            }
        },
        ['sweatercraft'] = {
            folded = {
                darkblue = {
                    model = 'k2ashirt',
                    textureName = 'white'
                },
                purple = {
                    model = 'k2ashirt2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'k2ashirt3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'k2ashirt4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'k2ashirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'd2sweat1',
                    textureName = 'white'
                },
                purple = {
                    model = 'd2sweat2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'd2sweat3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'd2sweat4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'd2sweat5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = '2shirtv1',
                    textureName = 'white'
                },
                purple = {
                    model = '2shirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = '2shirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = '2shirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = '2shirtv5',
                    textureName = 'white5'
                }
            }
        }
    },
    [3] = {
        ['tshirtcraft'] = {
            folded = {
                darkblue = {
                    model = '3tshirt',
                    textureName = 'white5'
                },
                purple = {
                    model = '3tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = '3tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = '3tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = '3tshirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'f3-tshirt1',
                    textureName = 'white5'
                },
                purple = {
                    model = 'f3-tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = 'f3-tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = 'f3-tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = 'f3-tshirt5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = '3tshirtv1',
                    textureName = 'white5'
                },
                purple = {
                    model = '3tshirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = '3tshirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = '3tshirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = '3tshirtv5',
                    textureName = 'white'
                }
            }
        },
        ['sweatercraft'] = {
            folded = {
                darkblue = {
                    model = 'k3ashirt',
                    textureName = 'white'
                },
                purple = {
                    model = 'k3ashirt2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'k3ashirt3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'k3ashirt4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'k3ashirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'd3sweat1',
                    textureName = 'white'
                },
                purple = {
                    model = 'd3sweat2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'd3sweat3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'd3sweat4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'd3sweat5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = '3shirtv1',
                    textureName = 'white'
                },
                purple = {
                    model = '3shirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = '3shirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = '3shirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = '3shirtv5',
                    textureName = 'white5'
                }
            }
        }
    },
    [4] = {
        ['tshirtcraft'] = {
            folded = {
                darkblue = {
                    model = '4tshirt',
                    textureName = 'white5'
                },
                purple = {
                    model = '4tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = '4tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = '4tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = '4tshirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'f4-tshirt1',
                    textureName = 'white5'
                },
                purple = {
                    model = 'f4-tshirt2',
                    textureName = 'white5'
                },
                black = {
                    model = 'f4-tshirt3',
                    textureName = 'white5'
                },
                white = {
                    model = 'f4-tshirt4',
                    textureName = 'white5'
                },
                blue = {
                    model = 'f4-tshirt5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = '4tshirtv1',
                    textureName = 'white5'
                },
                purple = {
                    model = '4tshirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = '4tshirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = '4tshirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = '4tshirtv5',
                    textureName = 'white'
                }
            }
        },
        ['sweatercraft'] = {
            folded = {
                darkblue = {
                    model = 'k4ashirt',
                    textureName = 'white'
                },
                purple = {
                    model = 'k4ashirt2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'k4ashirt3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'k4ashirt4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'k4ashirt5',
                    textureName = 'white5'
                }
            },
            wrinkle = {
                darkblue = {
                    model = 'd4sweat1',
                    textureName = 'white'
                },
                purple = {
                    model = 'd4sweat2',
                    textureName = 'white_2'
                },
                black = {
                    model = 'd4sweat3',
                    textureName = 'white_3'
                },
                white = {
                    model = 'd4sweat4',
                    textureName = 'white4'
                },
                blue = {
                    model = 'd4sweat5',
                    textureName = 'white5'
                }
            },
            notfolded = {
                darkblue = {
                    model = '4shirtv1',
                    textureName = 'white'
                },
                purple = {
                    model = '4shirtv2',
                    textureName = 'white_2'
                },
                black = {
                    model = '4shirtv3',
                    textureName = 'white_3'
                },
                white = {
                    model = '4shirtv4',
                    textureName = 'white4'
                },
                blue = {
                    model = '4shirtv5',
                    textureName = 'white5'
                }
            }
        }
    },
}

Config.MachineCoords          = {
    [1] = {
        regionMachine = {
            machineCoords = vector4(711.67, -973.96, 30.81, 91.26),
            machineHeading = 91.26,
            machineSteps = {
                vector3(711.03, -973.47, 30.41),
                vector3(711.04, -973.08, 30.45),
                vector3(711.04, -972.7, 30.45),
                vector3(711.03, -972.39, 30.45),
                vector3(711.06, -972.12, 30.45),
                vector3(711.01, -971.75, 30.45),
                vector3(711.05, -971.47, 30.45),
                vector3(711.04, -971.2, 30.45),
                vector3(711.05, -970.88, 30.45),
                vector3(711.13, -970.43, 30.41)
            },
        },
        regionTable = {
            drawtextCoords = vector3(712.2, -969.18, 30.4),
            tablePosition = vector3(711.17, -969.17, 29.89),
            centerPosition = vector3(711.1, -969.2, 30.41),
            boxCoords = vector3(711.23, -968.29, 30.39),
            boxModel = "shirtbox",
            closedBoxModel = "shirtbox_closed",
            boxWaitingAreaCoords = vector3(715.4, -973.63, 30.4),
            boxHeading = 0.0,
            tableCamUPDistance = 2.2,
            tableDetails = {
                detailsone = 0.5,
                detailstwo = 2.0,
                heading = 90.0,
                tableRadius = 1.29
            },
            boxDetails = {
                boxClothesCount = 2,
                boxOffset = {
                    ['sweatercraft'] = {
                        xOffset = 0.1,
                        yOffset = 0.07,
                    },
                    ['tshirtcraft'] = {
                        xOffset = -0.02,
                        yOffset = -0.02,
                    }
                },
                boxLimit = {
                    rows = 3,
                    cols = 3,
                    height = 2,
                }
            }
        },
    },
    [2] = {
        regionMachine = {
            machineCoords = vector4(705.65, -967.94, 30.4, 82.53),
            machineHeading = 91.26,
            machineSteps = {
                vector3(704.61, -967.24, 30.41),
                vector3(704.6, -966.8, 30.44),
                vector3(704.56, -966.45, 30.44),
                vector3(704.61, -966.12, 30.44),
                vector3(704.62, -965.78, 30.44),
                vector3(704.59, -965.46, 30.44),
                vector3(704.61, -965.25, 30.44),
                vector3(704.63, -964.96, 30.44),
                vector3(704.63, -964.74, 30.44),
                vector3(704.58, -964.32, 30.41),
                vector3(704.55, -964.14, 30.41),
            },
        },
        regionTable = {
            drawtextCoords = vector3(705.61, -962.81, 30.4),
            tablePosition = vector3(704.8, -962.83, 29.89),
            centerPosition = vector3(704.48, -962.92, 30.41),
            boxCoords = vector3(704.59, -961.84, 30.41),
            boxModel = "shirtbox",
            closedBoxModel = "shirtbox_closed",
            boxWaitingAreaCoords = vector3(707.91, -967.37, 30.4),
            boxHeading = 0.0,
            tableCamUPDistance = 2.3,
            tableDetails = {
                detailsone = 0.5,
                detailstwo = 2.0,
                heading = 90.0,
                tableRadius = 1.30,
            },
            boxDetails = {
                boxClothesCount = 2,
                boxOffset = {
                    ['sweatercraft'] = {
                        xOffset = 0.1,
                        yOffset = 0.07,
                    },
                    ['tshirtcraft'] = {
                        xOffset = -0.02,
                        yOffset = -0.02,
                    }
                },
                boxLimit = {
                    rows = 3,
                    cols = 3,
                    height = 2,
                }
            }
        },
    },
    [3] = {
        regionMachine = {
            machineCoords = vector4(704.82, -960.35, 30.4, 22.52),
            machineHeading = 2.12,
            machineSteps = {
                vector3(705.34, -959.43, 30.42),
                vector3(706.96, -959.36, 30.45),
                vector3(708.38, -959.37, 30.42),
            },
        },
        regionTable = {
            drawtextCoords = vector3(709.78, -960.47, 30.4),
            tablePosition = vector3(709.67, -959.45, 29.90),
            centerPosition = vector3(709.73, -959.36, 30.41),
            boxCoords = vector3(710.81, -959.36, 30.41),
            boxModel = "shirtbox",
            closedBoxModel = "shirtbox_closed",
            boxWaitingAreaCoords = vector3(711.11, -962.46, 30.4),
            boxHeading = 90.0,
            tableCamUPDistance = 2.3,
            tableDetails = {
                detailsone = 0.5,
                detailstwo = 2.0,
                heading = 2.00,
                tableRadius = 1.35,
            },

            boxDetails = {
                boxClothesCount = 2,
                boxOffset = {
                    ['sweatercraft'] = {
                        xOffset = -0.1,
                        yOffset = -0.11,
                    },
                    ['tshirtcraft'] = {
                        xOffset = -0.02,
                        yOffset = -0.02,
                    }
                },
                boxLimit = {
                    rows = 3,
                    cols = 3,
                    height = 2,
                }
            }
        },
    },
    [4] = {
        regionMachine = {
            machineCoords = vector4(713.87, -960.11, 30.4, 341.07),
            machineHeading = 2.68,
            machineSteps = {
                vector3(714.48, -959.23, 30.41),
                vector3(715.75, -959.13, 30.45),
                vector3(716.76, -959.16, 30.45),
                vector3(717.60, -959.17, 30.41),
            },
        },
        regionTable = {
            drawtextCoords = vector3(718.81, -960.16, 30.4),
            tablePosition = vector3(718.9, -959.16, 29.90),
            centerPosition = vector3(718.9, -959.16, 30.40),
            boxCoords = vector3(720.05, -959.21, 30.40),
            boxModel = "shirtbox",
            closedBoxModel = "shirtbox_closed",
            boxWaitingAreaCoords = vector3(719.3, -962.45, 30.4),
            boxHeading = 90.0,
            tableCamUPDistance = 2.3,
            tableDetails = {
                detailsone = 0.5,
                detailstwo = 2.0,
                heading = 2.00,
                tableRadius = 1.35,
            },

            boxDetails = {
                boxClothesCount = 2,
                boxOffset = {
                    ['sweatercraft'] = {
                        xOffset = -0.1,
                        yOffset = -0.11,
                    },
                    ['tshirtcraft'] = {
                        xOffset = -0.02,
                        yOffset = -0.02,
                    }
                },
                boxLimit = {
                    rows = 3,
                    cols = 3,
                    height = 2,
                }
            }
        },
    }
}

Config.InventoryAccess        = {
    allowedItems = {
        'wool',
        'darkbluedye',
        'purpledye',
        'blackdye',
        'whitedye',
        'bluedye',
    }
}

Config.MarketItems            = {
    { item = 'darkbluedye', label = 'Dark Blue Dye', image = 'darkbluedye.png', price = 250, weight = 0.1 },
    { item = 'purpledye',   label = 'Purple Dye',    image = 'purpledye.png',   price = 250, weight = 0.1 },
    { item = 'blackdye',    label = 'Black Dye',     image = 'blackdye.png',    price = 250, weight = 0.1 },
    { item = 'whitedye',    label = 'White Dye',     image = 'whitedye.png',    price = 250, weight = 0.1 },
    { item = 'bluedye',     label = 'Blue Dye',      image = 'bluedye.png',     price = 250, weight = 0.1 },
    { item = 'wool',        label = 'Wool',          image = 'wool.png',        price = 150, weight = 0.1 },
}

Config.DefaultLogo            = {
    {
        bigImage = 'https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/images/Logo.png',
    },
    {
        bigImage = 'https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/images/image_31.png',
    },
    {
        bigImage = 'https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/images/image_30.png',
    },
    {
        bigImage = 'https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/images/image_14.png',
    },
    {
        bigImage = 'https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/images/wallpaperflare.com_wallpaper_1.png',
    },
}

Config.TutorialList           = {
    { id = 1, title = Locales[Config.Locale]['tutorialTitle1'], description = Locales[Config.Locale]['tutorialDescription1'], name = 'https://r2.fivemanage.com/1nGyKjdI2UjH9zXtwKQQa/tutorial_one.mp4', },
    { id = 2, title = Locales[Config.Locale]['tutorialTitle2'], description = Locales[Config.Locale]['tutorialDescription2'], name = 'https://r2.fivemanage.com/1nGyKjdI2UjH9zXtwKQQa/tutorial_two.mp4' },
    { id = 3, title = Locales[Config.Locale]['tutorialTitle3'], description = Locales[Config.Locale]['tutorialDescription3'], name = 'https://r2.fivemanage.com/1nGyKjdI2UjH9zXtwKQQa/tutorial_three.mp4' },
    { id = 4, title = Locales[Config.Locale]['tutorialTitle4'], description = Locales[Config.Locale]['tutorialDescription4'], name = 'https://r2.fivemanage.com/1nGyKjdI2UjH9zXtwKQQa/tutorial_four.mp4' },
    { id = 5, title = Locales[Config.Locale]['tutorialTitle5'], description = Locales[Config.Locale]['tutorialDescription5'], name = 'https://r2.fivemanage.com/1nGyKjdI2UjH9zXtwKQQa/tutorial_five.mp4' },
    { id = 6, title = Locales[Config.Locale]['tutorialTitle6'], description = Locales[Config.Locale]['tutorialDescription6'], name = 'https://r2.fivemanage.com/1nGyKjdI2UjH9zXtwKQQa/tutorial_six.mp4' },
}

Config.JobClothes             = {
    male = {
        { jacket = 97,   texture = 0 },
        { shirt = 15,    texture = 0 },
        { arms = 0,      texture = 0 },
        { legs = 9,      texture = 6 },
        { shoes = 12,    texture = 3 },
        { mask = 0,      texture = 0 },
        { chain = 0,     texture = 11 },
        { decals = 0,    texture = 11 },
        { helmet = 0,    texture = 11 },
        { glasses = 0,   texture = 11 },
        { watches = 0,   texture = 11 },
        { bracelets = 0, texture = 11 }
    },
    female = {
        { jacket = 239,  texture = 8 },
        { shirt = 15,    texture = 0 },
        { arms = 0,      texture = 0 },
        { legs = 35,     texture = 0 },
        { shoes = 26,    texture = 0 },
        { mask = 0,      texture = 0 },
        { chain = 0,     texture = 11 },
        { decals = 0,    texture = 11 },
        { helmet = 0,    texture = 11 },
        { glasses = 0,   texture = 11 },
        { watches = 0,   texture = 11 },
        { bracelets = 0, texture = 11 }
    }
}


Config.Vehiclekey       = true

Config.GiveVehicleKey   = function(plate, model, vehicle) -- you can change vehiclekeys export if you use another vehicle key system
    if Config.Vehiclekey then
        if GetResourceState("cd_garage") == "started" then
            TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
        elseif GetResourceState("qs-vehiclekeys") == "started" then
            model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
        elseif GetResourceState("wasabi-carlock") == "started" then
            exports.wasabi_carlock:GiveKey(plate)
        elseif GetResourceState("qb-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        elseif GetResourceState("qbx-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        else
            if Config.Framework == "qb" or Config.Framework == "oldqb" then
                TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
            else
                print("No vehicle key system found")
            end
        end
    end
end

Config.Removekeys       = true

Config.RemoveVehiclekey = function(plate, model, vehicle)
    if Config.Removekeys then
        if GetResourceState("cd_garage") == "started" then
            TriggerServerEvent('cd_garage:RemovePersistentVehicles', exports['cd_garage']:GetPlate(vehicle))
        elseif GetResourceState("qs-vehiclekeys") == "started" then
            model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            exports['qs-vehiclekeys']:RemoveKeys(plate, model)
        elseif GetResourceState("wasabi-carlock") == "started" then
            exports.wasabi_carlock:RemoveKey(plate)
        elseif GetResourceState("qb-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
        elseif GetResourceState("qbx-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
        else
            if Config.Framework == "qb" or Config.Framework == "oldqb" then
                TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
            else
                print("No vehicle key system found")
            end
        end
    end
end

Config.SetVehicleFuel   = function(vehicle) -- you can change LegacyFuel export if you use another fuel system
    if GetResourceState("LegacyFuel") == "started" then
        return exports["LegacyFuel"]:SetFuel(vehicle, 100.0)
    elseif GetResourceState("x-fuel") == "started" then
        return exports["x-fuel"]:SetFuel(vehicle, 100.0)
    elseif GetResourceState("ox_fuel") == "started" then
        return SetVehicleFuelLevel(vehicle, 100.0)
    elseif GetResourceState("cdn-fuel") == "started" then
        return exports['cdn-fuel']:SetFuel(vehicle, 100.0)
    elseif GetResourceState("ps-fuel") == "started" then
        return exports['ps-fuel']:SetFuel(vehicle, 100.0)
    else
        return SetVehicleFuelLevel(vehicle, 100.0)
    end
end

Config.sendNotification = function(messages, value)
    NuiMessage('NOTIFICATION', { message = messages, type = value })
end

Config.endJobFunction   = function(source, owneridentifier, scoreAmount)
end

Config.NotificationText = {
    ['vehicleexist'] = {
        text = Locales[Config.Locale]['vehicleexist'],
        type = "errorNotify"
    },
    ['wrongjob'] = {
        text = Locales[Config.Locale]['wrongjob'],
        type = "errorNotify"
    },
    ['jobcooldown'] = {
        text = Locales[Config.Locale]['jobcooldown'],
        type = "errorNotify"
    },
    ['delivervehicle'] = {
        text = Locales[Config.Locale]['delivervehicle'],
        type = "infoNotify"
    },
    ['playerfaraway'] = {
        text = Locales[Config.Locale]['playerfaraway'],
        type = "infoNotify"
    },
    ['lobbyfull'] = {
        text = Locales[Config.Locale]['lobbyfull'],
        type = "succesNotify"
    },
    ['jobnotstarted'] = {
        text = Locales[Config.Locale]['jobnotstarted'],
        type = "errorNotify"
    },
    ['jobalreadystarted'] = {
        text = Locales[Config.Locale]['jobalreadystarted'],
        type = "errorNotify"
    },
    ['maxlevel'] = {
        text = Locales[Config.Locale]['maxlevel'],
        type = "errorNotify"
    },
    ['joblevelnotenough'] = {
        text = Locales[Config.Locale]['joblevelnotenough'],
        type = "errorNotify"
    },
    ['playeralreadyinlobby'] = {
        text = Locales[Config.Locale]['playeralreadyinlobby'],
        type = "errorNotify"
    },

    ['missionnotselected'] = {
        text = Locales[Config.Locale]['missionnotselected'],
        type = "errorNotify"
    },
    ['playerleftlobby'] = {
        text = Locales[Config.Locale]['playerleftlobby'],
        type = "errorNotify"
    },
    ['deliverVehile'] = {
        text = Locales[Config.Locale]['deliverVehile'],
        type = "infoNotify"
    },
    ['resetJob'] = {
        text = Locales[Config.Locale]['resetJob'],
        type = "errorNotify"
    },
    ['notowner'] = {
        text = Locales[Config.Locale]['notowner'],
        type = "errorNotify"
    },
    ['usedtbxid'] = {
        text = Locales[Config.Locale]['usedtbxid'],
        type = "errorNotify"
    },
    ['successfullyExp'] = {
        text = Locales[Config.Locale]['successfullyExp'],
        type = "succesNotify"
    },
    ['notfoundtbxid'] = {
        text = Locales[Config.Locale]['notfoundtbxid'],
        type = "errorNotify"
    },
    ['getontruck'] = {
        text = Locales[Config.Locale]['getontruck'],
        type = "infoNotify"
    },
    ['notenoughmoney'] = {
        text = Locales[Config.Locale]['notenoughmoney'],
        type = "errorNotify"
    },
    ['buyItemN'] = {
        text = Locales[Config.Locale]['buyItemN'],
        type = "succesNotify"
    },
    ['doorisopen'] = {
        text = Locales[Config.Locale]['doorisopen'],
        type = "errorNotify"
    },
    ['finishBoxDelivery'] = {
        text = Locales[Config.Locale]['finishBoxDelivery'],
        type = "succesNotify"
    },
    ['takebox'] = {
        text = Locales[Config.Locale]['takebox'],
        type = "succesNotify"
    },
    ['giveabox'] = {
        text = Locales[Config.Locale]['giveabox'],
        type = "succesNotify"
    },
    ['waypoint'] = {
        text = Locales[Config.Locale]['waypoint'],
        type = "succesNotify"
    },
    ['boxfull'] = {
        text = Locales[Config.Locale]['boxfull'],
        type = "errorNotify"
    },
    ['clothesback'] = {
        text = Locales[Config.Locale]['clothesback'],
        type = "errorNotify"
    },
    ['boxcreated'] = {
        text = Locales[Config.Locale]['boxcreated'],
        type = "succesNotify"
    },

    ['clothesalreadyproduced'] = {
        text = Locales[Config.Locale]['clothesalreadyproduced'],
        type = "errorNotify"
    },
    ['toomanyclothes'] = {
        text = Locales[Config.Locale]['toomanyclothes'],
        type = "errorNotify"
    },

    ['alreadyarea'] = {
        text = Locales[Config.Locale]['alreadyarea'],
        type = "errorNotify"
    },
    ['isownernotleave'] = {
        text = Locales[Config.Locale]['isownernotleave'],
        type = "errorNotify"
    },
    ['removed'] = {
        text = Locales[Config.Locale]['removed'],
        type = "succesNotify"
    },
    ['notremoved'] = {
        text = Locales[Config.Locale]['notremoved'],
        type = "errorNotify"
    },

    ['alreadymade'] = {
        text = Locales[Config.Locale]['alreadymade'],
        type = "errorNotify"
    },
}

Config.RequiredXP       = {
    [1] = 1000,
    [2] = 1500,
    [3] = 2000,
    [4] = 2500,
    [5] = 3000,
    [6] = 3500,
    [7] = 4000,
    [8] = 4500,
    [9] = 5000,
    [10] = 5500,
    [11] = 6000,
    [12] = 6500,
    [13] = 7000,
    [14] = 7500,
    [15] = 8000,
    [16] = 8500,
    [17] = 9000,
    [18] = 9500,
    [19] = 10000,
    [20] = 10500,
    [21] = 11000,
    [22] = 11500,
    [23] = 12000,
    [24] = 12500,
    [25] = 13000,
    [26] = 13500,
    [27] = 14000,
    [28] = 14500,
    [29] = 15000,
    [30] = 15500,
    [31] = 16000,
    [32] = 16500,
    [33] = 17000,
    [34] = 17500,
    [35] = 18000,
    [36] = 18500,
    [37] = 19000,
    [38] = 19500,
    [39] = 20000,
    [40] = 20500,
    [41] = 21000,
    [42] = 21500,
    [43] = 22000,
    [44] = 22500,
    [45] = 23000,
    [46] = 23500,
    [47] = 24000,
    [48] = 24500,
    [49] = 25000,
    [50] = 25500,
    [51] = 26500,
    [52] = 27500,
    [53] = 28500,
    [54] = 29500,
    [55] = 30500,
    [56] = 31500,
    [57] = 32500,
    [58] = 33500,
    [59] = 34500,
    [60] = 35500,
    [61] = 36500,
    [62] = 37500,
    [63] = 38500,
    [64] = 39500,
    [65] = 40500,
    [66] = 41500,
    [67] = 42500,
    [68] = 43500,
    [69] = 44500,
    [70] = 45500,

}

Config.Disable          = {
    onDeath = true,    -- Disable interactions on death
    onNuiFocus = true, -- Disable interactions while NUI is focused
    onVehicle = true,  -- Disable interactions while in a vehicle
    onHandCuff = true, -- Disable interactions while handcuffed
}

Config.OtherNuiClose    = function(bool)
    TriggerServerEvent('tworst-fashion:server:OtherNuiClose', bool)
    if Config.Inventory == 'ox_inventory' then
        local invOpen = LocalPlayer.state.invOpen
        if invOpen then
            exports.ox_inventory:closeInventory()
        end
        if GetResourceState("lb-phone") == "started" then
            exports["lb-phone"]:ToggleOpen(false, false)
        end
        LocalPlayer.state.invBusy = bool
    end
end
