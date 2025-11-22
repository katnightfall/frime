Config.RemoveSprayInterval = 48 -- hours
Config.SprayAddDelay = 15      -- seconds
Config.SprayRemoveDelay = 5    -- seconds
Config.RenderDistance = 30.0
Config.NextGraffitiDistance = 5.0
Config.OnlyRenderWhenFacing = true -- increase performance
Config.MaxGraffitiInAZone = 2
Config.OverwriteOldSprayIfMaxedOut = true
Config.GraffitiCooldown = 5 -- minutes
Config.OnlySprayInZone = true -- recomended

Config.DisableSprayType = { -- set true to disable a type
    image = false,
    text = false,
}

Config.SpraySize = {
    minimum = 10,
    maximum = 20
}

Config.BlackListedWords = {
    'nigga',
    'nigger',
    'niger'
}

Config.AllowedImages = {
    {name = 'families',     label = 'The Families',     spraycolorhex = '089100'},
    {name = 'ballas',       label = 'The Ballas',       spraycolorhex = '850187'},
    {name = 'vagos',        label = 'The Vagos',        spraycolorhex = 'ba9502'},
    {name = 'marabunta',    label = 'Marabunta Grande', spraycolorhex = '011382'},
    {name = 'lostmc',       label = 'Lost MC',          spraycolorhex = 'a8a7a7'},
    {name = 'cartel',       label = 'Madrazo Cartel',   spraycolorhex = 'ba9502'},
    {name = 'oneils',       label = "O'Neil Brothers",  spraycolorhex = 'ba9502'},
    {name = 'weicheng',     label = "Wei Cheng Triad",  spraycolorhex = '942d01'},
    {name = 'aztecas',      label = "Aztecas",          spraycolorhex = '02a8a8'},
    {name = 'hillbillies',  label = "Hillbillies",      spraycolorhex = '089100'},
}

Config.Fonts = {
    { font = 'sprayfont4',  label = 'Bad Painter',          characterSet = '[^A-Z0-9]+',                             sizeMultiplier = 1.0 },
    { font = 'sprayfont5',  label = 'Supporter',            characterSet = '[^A-Z]+',                                sizeMultiplier = 1.0 },
    { font = 'sprayfont6',  label = 'Rich The Barber',      characterSet = '[^A-Z]+',                                sizeMultiplier = 1.0 },
    { font = 'sprayfont7',  label = 'Marsneveneksk',        characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont8',  label = 'Bombing',              characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont9',  label = 'Marseloup',            characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont10', label = 'Paint Rough',          characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont11', label = 'Uniquely Sprayed',     characterSet = '[^A-Z]+',                                sizeMultiplier = 1.0 },
    { font = 'sprayfont12', label = 'Hard Zone',            characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont13', label = 'Edo',                  characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont14', label = 'Queen Rocker',         characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 0.6 },
    { font = 'sprayfont1',  label = 'Next Custom',          characterSet = '[^A-Z0-9\\-.]+',                         sizeMultiplier = 0.35 },
    { font = 'sprayfont15', label = 'Punk Kid',             characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont16', label = 'Black Rocker',         characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont17', label = 'Cold Night',           characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont18', label = 'Drunk Millionaire',    characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont19', label = 'The Pocong',           characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont20', label = 'Gattergone',           characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont2',  label = 'Dripping Marker',      characterSet = '[^A-Za-z0-9\\-.$+-*/=%"\'#@&();:,<>!_~]+', sizeMultiplier = 1.0 },
    { font = 'sprayfont21', label = 'Bosscha Raws',         characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont22', label = 'Ocean Brush',          characterSet = '[^A-Za-z]+',                             sizeMultiplier = 1.0 },
    { font = 'sprayfont23', label = 'Overbite',             characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont24', label = 'VTKS SMASH',           characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont25', label = 'IF',                   characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont26', label = 'Spray Paint',          characterSet = '[^A-Z]+',                                sizeMultiplier = 1.0 },
    { font = 'sprayfont27', label = 'Grashrock',            characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont28', label = 'Nosifer',              characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont29', label = 'Gingsul',              characterSet = '[^A-Z]+',                                sizeMultiplier = 1.0 },
    { font = 'sprayfont3',  label = 'Docallisme',           characterSet = '[^A-Z]+',                                sizeMultiplier = 0.45 },
    { font = 'sprayfont30', label = 'Fight Hard',           characterSet = '[^A-Za-z]+',                             sizeMultiplier = 0.5 },
    { font = 'sprayfont31', label = 'Storm Gust',           characterSet = '[^A-Za-z]+',                             sizeMultiplier = 1.0 },
    { font = 'sprayfont32', label = 'Niagato',              characterSet = '[^A-Za-z]+',                             sizeMultiplier = 1.0 },
    { font = 'sprayfont33', label = 'Chocolate',            characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont34', label = 'Autumn Brush',         characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont35', label = 'Graffiti Stream',      characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont36', label = 'Midorima',             characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont37', label = 'RUSTY ATTACK',         characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
    { font = 'sprayfont38', label = 'SELINCAH',             characterSet = '[^A-Za-z0-9]+',                          sizeMultiplier = 1.0 },
}


Config.FontColors = {
    { label = 'White',    colors = { 'a8a7a7', '696969', '363636' } }, -- colors -> day, mid-day, night
    { label = 'Red',      colors = { 'a80802', '6b0501', '2b0200' } },
    { label = 'Yellow',   colors = { 'ba9502', '635001', '332901' } },
    { label = 'Brown',    colors = { '784040', '422424', '291515' } },
    { label = 'Cyan',     colors = { '02a8a8', '005454', '003333' } },
    { label = 'Lemon',    colors = { '7f913c', '4a5423', '282e13' } },
    { label = 'Green',    colors = { '089100', '044a01', '022100' } },
    { label = 'Purple',   colors = { '850187', '49004a', '230024' } },
    { label = 'Blue',     colors = { '011382', '000c54', '00062e' } },
    { label = 'Gold',     colors = { 'b57b09', '5e4006', '2e1f02' } },
    { label = 'Pink',     colors = { 'a1475c', '4f202c', '3b1921' } },
    { label = 'Orange',   colors = { '942d01', '521900', '2b0d00' } },
    { label = 'Magenta',  colors = { '940194', '4f014f', '240024' } },
    { label = 'Violet',   colors = { '560b9c', '33085c', '22063d' } },
}

