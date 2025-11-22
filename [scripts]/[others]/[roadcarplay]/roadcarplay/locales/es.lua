local Translations = {
    error = {},
    success = {},
    info = {
        ['opencarplay'] = 'Abrir Carplay',
        ['nocarplay'] = '¡No tienes un elemento Carplay!',
        ['notincar'] = '¡No estás en un coche!',
        ['already_installed'] = '¡Este coche ya tiene Carplay instalado!',
        ['installed'] = '¡Carplay ha sido instalado!',
        ['notinstalled'] = '¡Este coche no tiene Carplay instalado!',
        ['notmechanic'] = '¡No eres mecánico, solo los mecánicos pueden instalar Carplay!',
        ['damaged'] = 'Este coche está dañado, no puedes usar Carplay.',
        ['notdriver'] = 'No eres el conductor, no puedes usar Carplay.',
        ['autopilot_no_waypoint'] = 'No se ha establecido un punto de referencia',
        ['autopilot_reached_destionation'] = 'Hemos llegado a nuestro punto de referencia.',
        ['progress_bar_text'] = 'Instalando Carplay...',
        ['go_inside'] = "You need to go into a Vehicle to install Carplay",
        ['autopilot_disengaged'] = "Autopilot disengaged, you have control."
},
text = {},
}

Lang = Locale:new({
phrases = Translations,
warnOnMissing = true
})