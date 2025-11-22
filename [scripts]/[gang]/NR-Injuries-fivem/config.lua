Config = {}

Config.bodyparts = "en"  --Chage this to "en" if english is your language, Cambia esto por "es" si hablas Español, Change this to "custom" if u speak other language and edit it below ((Cualquier otro valor que pongas hará que el script NO FUNCIONE))

Config.Locale = {

    notifytitle = "Injuries",
    notifydesc = "You are bleeding!",
    boneunkown = " ",
    boneone = "^8((^7Your ^8",
    bonetwo = "^7 has been injured^8))^7",
}
Config.time = {
    min = 1000, -- tiempo minimo en milisegundos para que el jugador se caiga al suelo // Minimum time in milliseconds for the player to fall to the ground
    max = 30000, -- tiempo maximo en milisegundos para que el jugador se caiga al suelo // Maximum time in milliseconds for the player to fall to the ground
}

Config.showInjuriesInChat = true -- set it to false if you don't want to see the injuries in chat // ponlo en false si no quieres ver las heridas en el chat

Config.BleedingTime = 3000 -- Tiempo en milisegundos que el jugador estará sangrando // Time in milliseconds that the player will be bleeding

Config.health = 150 -- Salud minima para que el jugador se caiga al suelo // Minimum health for the player to fall to the ground (0 is 100 and 100 is 200)

Config.anim = true -- Si quieres que el jugador haga la animacion de herido cambia esto a true, si no a false // If you want the player to do the injured animation change this to true, if not to false

Config.framework = "esx" -- Change this to "esx" if you are using esx, Cambia esto por "esx" si usas esx // Change this to "qb-core" if you are using esx, Cambia esto por "qb-core" si usas qbcore((Cualquier otro valor que pongas hará que el script NO FUNCIONE))

Config.notify = true -- Si quieres que se notifique al jugador cuando se caiga al suelo cambia esto a true, si no a false // If you want to notify the player when they fall to the ground change this to true, if not to false

Config.notifysystem = "legacy" -- "esx" = defaultnotify, "legacy" = legacylibnotify (( Esta opcion solo afecta si usas ESX, Cualquier otro valor que pongas hará que el script NO FUNCIONE))
-- Si hablas Español descomenta las siguientes lineas y comenta las lineas de arriba

-- SPANISH VERSION
--Config.Locale = {
--    notifytitle = "Heridas",
--    notifydesc = "Estás sangrando!",
--    boneunkown = " ",
--    boneone = "^8((^7Tu ^8",
--    bonetwo = "^7 ha sufrido daños^8))^7",
--}


Config.boneNames = {
    one = "RIGHT ELBOW",
    two = "LEFT FOOT",
    three = "RIGHT LEG",
    four = "LEFT LEG",
    five = "TORSO",
    six = "CLAVICLE",
    seven = "NECK",
    eight = "LEFT ARM",
    nine = "RIGHT ARM",
    ten = "LEFT HAND",
    eleven = "LEFT HAND",
    twelve = "LEFT FOREARM",
    thirteen = "LEFT TWIN",
    fourteen = "LEFT THIGH",
    fifteen = "RIGHT THIGH",
    sixteen = "CLAVICLE",
    seventeen = "RIGHT HAND",
    eighteen = "LEFT FOOT",
    nineteen = "RIGHT FOOT",
    twenty = "RIGHT FOOT",
    twentyone = "BACK",
    twentytwo = "TORSO",
    twentythree = "BACK",
    twentyfour = "RIGHT FOREARM",
    twentyfive = "HEAD",
    twentysix = "CUELLO",
    twentyseven = "RIGHT BICEPS",
    twentyeight = "LEFT BICEPS",
    twentynine = "PELVIS",
    thirty = "PELVIS",
}
