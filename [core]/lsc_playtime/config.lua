Config = {
    -- esx = es_extended, qb = qb-core
    Framework = "qb",

    -- If you use ox inventory make sure this is turned to true!
    OxInventory = true,
    
    -- Amount of hours needed to use weapons
    RequiredHours = 24,

    -- Jobs that don't require playtime to access weapons.
    BypassJobs = {
        'police',
        'sheriff',
        'admin',
        'god',
        'superadmin',
    },

     -- Weapons that automaticly bypass the RequiredHours.
    BypassWeapons = {
        'WEAPON_JERRYCAN',
        'WEAPON_NEWSPAPER',
        'WEAPON_NIGHTSTICK',
    },
}