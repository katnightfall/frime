return {
    Notify = {
        cant_place          = "You can only place this in a camp zone!",
        skillCheck          = "Skill Check. Get Ready!",
        skillCkFail         = "You failed the skill check!",
        leave_chair         = "Press [ X ] to leave chair!",
        leave_bed           = "Press [ X ] to leave bed!",
        cant_camp           = "You can only camp outside of the city!",
        using_tent          = "You are inside the Tent!", 
        in_tent             = "You are already inside of a Tent!",
        feel_shitty         = "You feel shitty! Was it the beans?",
        shit_self           = "You just shit yourself!",
        tummy_ache          = "Your stomach hurts..",
        bean_warn           = "Beans, Beans, Good for Your Heart. The More You Eat, The More You . . . . . .",
        bean_fail           = "Uh oh! You failed to release all the beans.",
        bean_pass           = "You let all the beans out! lol",
        not_yours           = "This isn't your item!",
        not_camp            = "You can only do this near a camp!",
        not_water           = "You are not in any water!",
        body_clean          = "You are now clean!",
        need_stone          = "You need stones to place this fire!",
        chop_fail           = "You failed to chop down the tree!",
        no_axe              = "You need an axe to chop down a tree!",

        camp_action         = "Lets Camp ",
        camp_remove         = "Pickup ",
        camp_left           = "You left the Camping Area!",
        camp_fire           = "You should chop more wood!", -- Simple camp fire extinguished!

        -- Shop:
        nsf_cash            = "You do not have enough cash to pay for your items!",
        nsf_bank            = "Your bank debit was declined for insufficient funds!",

        -- Stash:
        stash_items         = "You must empty the stash before removing it.",
        not_stash           = "This is not your stash!",
    },
    Raycast = {
        TextIcon            = "fas fa-campground",
        TextHeading         = "CAMP PLACEMENT TOOL:",

        -- Movement
        Raise               = "**ARROW UP** *(Raise)*",
        Lower               = "**ARROW DOWN** *(Lower)*",
        SnapProp            = "**LEFT ALT** *(Ground)*",
    
        -- Rotation Yaw
        RotLeft             = "**SCROLL DOWN** *(Rotate Left)*",
        RotRight            = "**SCROLL UP** *(Rotate Right)*",
    
        -- Tilt Pitch & Roll
        TiltBack            = "**LEFT MOUSE BUTTON** *(Tilt Back)*",
        TiltFront           = "**RIGHT MOUSE BUTTON** *(Tilt Forward)*",
        TiltLeft            = "**LEFT ARROW** *(Tilt Left)*",
        TiltRight           = "**Right Arrow** *(Tilt Right)*",
    
        -- Actions
        PlaceProp           = "**ENTER** *(Confirm)*",
        CancelText          = "**BACKSPACE** *(Cancel)*",

        -- Notify:
        CantPlace           = "Invalid placement position!",
    },
    Actions = {
        close_menu          = "Close Menu",
        chop_tree           = "Chop ",
        chop_wood           = "Chop Log",
        shop_buy            = "Purchasing Items . . .",

        -- TextUI's:
        cancel_tent         = "Press [ X ] to Exit Tent",
        tent_view           = "Press [ V ] to Toggle View",        
        cancel_sit          = "Press [ X ] to Stop Sitting",
        cancel_lay          = "Press [ X ] to Stop Laying",


        chair_icon          = "fas fa-chair",               -- Chair
        bed_icon            = "fas fa-bed",                 -- Bed
        tent_icon           = "fas fa-campground",          -- Tent
        prop_icon           = "fas fa-hands",               -- Prop
        bench_icon          = "fas fa-screwdriver-wrench",  -- Craft
        grill_icon          = "fas fa-burger",              -- Grill
        cooler_icon         = "fas fa-icicles",             -- Cooler
        fire_icon           = "fas fa-fire",                -- Fire
        wood_icon           = "fas fa-tree",
    },
    Menus = {
        alert_title         = "*Let's Camp Prop*",
        alert_text          = "Are you sure you want to remove this object?",

        camp_grill          = "Grill Recipes",     -- MUST MATCH HEADER "EXACTLY" IN RECIPES.LUA!!!!
        camp_fires          = "Fire Recipes",      -- MUST MATCH HEADER "EXACTLY" IN RECIPES.LUA!!!!
        camp_cooler         = "Ice Box",           -- MUST MATCH HEADER "EXACTLY" IN RECIPES.LUA!!!! "money" must be an item!!!
        camp_bench          = "Work Bench",        -- MUST MATCH HEADER "EXACTLY" IN RECIPES.LUA!!!!
    }
}