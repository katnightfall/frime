local Translations = {
    notifications = {
        min_max = "Please enter a value between %{min}-%{max}."
    },
    menu = {
        menu_title = "Scale Settings",
        save = "Save",
        reset = "Reset",
        info1 = "The height ratio will define your character's appearance.",
        info2 = "Stay within the recommended height range for optimum gaming experience.",
        info3 = "In the walking animation changes, your height ratio may adjust during the process.",
        info4 = "Your height ratio may vary when you get on and off the vehicle."
    },
    interaction = {
        jump = "[E] Jump"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})