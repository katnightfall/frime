Config = {
    -- Whitelisted classes and models
    WhitelistedClasses = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true },
    WhitelistedModels = { GetHashKey("ADDER"), GetHashKey("SULTAN"), GetHashKey("BALLER") }, 

    -- Detection cone parameters
    ConeAngle = 40.0, -- Total cone opening angle in degrees
    ConeDistance = 250.0, -- Cone distance
    NumRays = 6, -- Number of rays for detection

    -- Wait time and timeout
    WaitTime = 200, -- Wait time in the loop (in ms)
    RequiredNoVehicleTime = 3000, -- Required time without vehicles to turn high beams back on (in milliseconds)

    -- Gradual transition
    TransitionSpeedOn = 0.02, -- Intensity step for gradual transition (raising)
    TransitionSpeedOff = 0.08, -- Intensity step for gradual transition (lowering)
    UpdateInterval = 50, -- Update interval for the transition (ms)

    -- Weather conditions that allow high beams during the day
    DayWeatherConditions = { "RAIN", "FOGGY", "THUNDER", "DRIZZLE", "MISTY" },

    -- Nighttime hours
    NightHours = { start = 19, stop = 6 }, -- From 19:00 to 6:00

    -- Distance and angle sensors
    DistanceThreshold = 100.0, -- Minimum distance to consider a vehicle detected
    AngleThreshold = 30.0, -- Maximum angle to consider a vehicle detected

    -- Beam configuration
    BeamSegments = 4, -- Number of beam segments for each headlight
    BeamRadius = 0.25, -- Radius of the spotlight beam
    BeamAngles = {
        Left = {
            BaseAngle = 5.0, -- Starting angle for left beams
            Increment = 8.0  -- Angle increment between segments
        },
        Right = {
            BaseAngle = -5.0, -- Starting angle for right beams
            Increment = 8.0   -- Angle increment between segments
        }
    },

    -- Ray tracing
    DynamicWaitTimeEnabled = true, -- Enable dynamic wait time when no vehicles
    DynamicWaitTimeIncrement = 50, -- Increment for dynamic wait time (ms)
    DynamicWaitTimeMax = 1000, -- Maximum dynamic wait time (ms)
    
    -- Ray distances
    CenterRayDistance = 110.0, -- Distance for center rays
    OuterRayDistance = 80.0, -- Distance for outer rays
    CenterRayThreshold = 100.0, -- Detection threshold for center rays
    OuterRayThreshold = 75.0, -- Detection threshold for outer rays
    
    -- Light beam rendering
    LightDistance = 28.0, -- Distance light beam travels
    LightBrightness = 1.5, -- Multiplier for light brightness
    LightFalloff = 20.0, -- Falloff rate for the light
    MinIntensityThreshold = 0.1, -- Minimum intensity threshold to render a beam

    -- Vehicle position offset fallbacks (when bones not found)
    VehicleOffsets = {
        Width = 0.85, -- Width multiplier (0.85 = 85% of vehicle width)
        Height = 0.4, -- Height position (0.4 = 40% of vehicle height)
        Front = -0.1 -- Offset from front of vehicle
    },

    LightOffset = -0.1, -- Offset from front of vehicle (when bones are found)
    
    -- Toggle settings
    ToggleCooldown = 500, -- Cooldown for toggling high beams (ms)
    
    -- Vehicle check intervals
    WeatherCheckInterval = 5000, -- Interval to check weather (ms)
    VehicleCheckInterval = 1000, -- Interval to check current vehicle (ms)
    
    -- Dimming settings
    CenterBeamDimSpeed = 4.0, -- Multiplier for center beam dimming speed
    OuterBeamDimSpeed = 3.0, -- Multiplier for outer beam dimming speed
    LowIntensityValue = 0.03, -- Target intensity when dimming for detected vehicles
    NearbyBeamIntensity = 0.05  -- Target intensity for beams near a detection
}

-- Feel free to test, and adjust, based on your preferences