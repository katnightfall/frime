--Bury Locations
Config.BuryLocations = {
    enabled = true,
    locations = {
        cemetery = { coords = vec3(-1763.2334, -263.1300, 48.1588), radius = 2.5 },
        -- Add more locations as necessary
    },
}

--#Burying
Config.Burying = {
    time = 5000, -- Time in milliseconds
    label = 'Burying body...',
    useWhileDead = false,
    canCancel = false,
    anim = {
        dict = 'random@burial',
        clip = 'a_burial',
        flag = 1
    },
    prop = {
        model = `prop_tool_shovel`,
        bone = 28422,
        pos = vec3(0.0, 0.0, 0.24),
        rot = vec3(0.0, 0.0, 0.0)
    },
    disable = {
        move = true,
        car = true,
        combat = true,
    }
}



--Dumping Locations
Config.DumpLocations = {
    enabled = true,
    locations = {
        dock = { coords = vec3(-720.1873, -1367.3905, 1.5952), radius = 3.0 },
        river = { coords = vec3(-500.00, 3000.00, 10.00), radius = 6.0 },
        -- Add more locations as necessary
    }
}


--# Progress Bars for Coffin

Config.Coffin = {
    time = 2000, -- Time in milliseconds
    label = 'Putting Body Bag in Coffin...',
    useWhileDead = false,
    canCancel = false,
    anim = {
        dict = 'anim@heists@prison_heistig1_p1_guard_checks_bus',
        clip = 'loop'
    },
    disable = {
        move = true,
        car = true,
        combat = true,
    }
}

Config.PushCoffin = {
    time = 3000, -- Time in milliseconds
    label = 'Pushing Coffin into Water...',
    useWhileDead = false,
    canCancel = false,
    anim = {
        dict = 'anim@heists@prison_heistig1_p1_guard_checks_bus',
        clip = 'loop'
    },
    disable = {
        move = true,
        car = true,
        combat = true,
    }
}


