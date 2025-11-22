Config = {
    Canvas = {
        Width = 400,
        Height = 400,
    },

    CullingDistance = 150.0,
    ScaleClamp = {
        Min = 0.25,
        Max = 2.5,
        Step = 0.025
    },

    OpacityClamp = {
        Min = 0, 
        Max = 255, 
        Step = 30
    },

    DisplayErrorMessages = false,

    -- how far from the wall you can be to draw 
    DrawMaxRayDistance = 10.0,

    -- shaking & spraying animation options
    DrawAnimation = {
        Dict = "anim@scripted@freemode@postertag@graffiti_spray@male@",
        Clip = "shake_can_male",
        Enabled = false,
        ShakeSprayDuration = 2500,
        SprayingDuration = 5000,
    },

    CleanMaxRayDistance = 3.0,
    -- cleaning animation options
    CleanAnimation = {
        Dict = "amb@world_human_maid_clean@",
        Clip = "base",
        Enabled = false,
        Duration = 5000,
    },

    Integration = {
        Item = "spraycan",
        CleanItem = "acetone",
        -- for how long the graffiti should stay (in seconds)
        -- default: 3 days
        DisappearTime = 86400 * 3,
        --- https://api.imgbb.com/ to register your own personal key
        --- note: i share this API key so you don't need to go and create your own if you just want to use the script without thinking about it so please don't abuse it >_<
        --- although i would highly RECOMMEND you changing it to your own if you can.
        UploadAPIKey = "47c2c744f54d10e309b879955d156458",
        -- this option is by default set to true but in some cases you would want to set it to false (anticheat-wise?)
        NetworkedAnimation = true,
        -- max distance a player can be from a graffiti to remove it.
        MaxCleanDistance = 10.0
    },

    DisableContextMenu = false,
    Localization = {
        CleanGraffiti = "Cleaning graffiti",
        CleanGraffitiText = "Hover over a graffiti and press **ENTER** to clean it. **BACKSPACE** to cancel",
        BrushSize = "Size",
        BrushColor = "Color",
        SavedCanvases = "Saved Canvases",
        Accept = "Accept",
        Cancel = "Cancel",
        EditText = "Use your **ARROW** keys to adjust the graffiti, **SCROLL** to scale and **PGUP/PGDOWN** to change opacity",
        SaveCanvas = "Save Canvas",
        CanvasName = "Canvas Name",
        PasteImage = "Paste Image",
        NoSavedCanvases = "No saved canvases",
        SaveCanvasItem = "Press RMB to save this canvas",
        ShakeSpray = "Shaking the spraycan",
        Spraying = "Spraying"
    }
}

-- How fast (per seconds) should each graffiti sent over the network, by default it's using the maximal canvas size
Config.BytesPerSeconds = (Config.Canvas.Width * Config.Canvas.Height) * 0.25
Config.MaxGrafittiSize = (Config.Canvas.Width * Config.Canvas.Height) * 1.5 -- lenient