Config = {}

Config.Ped = 's_m_m_dockwork_01' -- Random Ped That You Third Eye To Start The Test
Config.PedPos = vector4(332.1793, 3740.6055, 9.0724, 93.6447) -- Instructor Ped Location

-- Target Options & Font-Awesome Icon
Config.Target = 'Take Test'
Config.TargetSymbol = 'fas fa-car'

-- Cost of starting the test
Config.Cost = 250
Config.ChargeFrom = 'cash'

-- Whatever Your License Item Is Inside Ox_Inventory Change It Here
Config.LicenseItem = 'driver_license'

-- Out Of 6, You Can Add More If You Like, Or Eventually Ill Add More
Config.RequiredCorrect = 5

Config.Questions = {
    -- Question 1
    {
        question = "Red Light Behavior",
        description = "You're approaching an intersection and the light turns red.",
        options = {
            {label = "Stop", icon = "hand", correct = true}, -- Correct Answer
            {label = "Speed up", icon = "tachometer-alt", correct = false}, -- Incorrect
            {label = "Turn without stopping", icon = "arrow-right", correct = false} -- Also Incorrect
        }
    },
        -- Question 2
    {
        question = "Stop Signs",
        description = "What should you always do when reaching a stop sign?",
        options = {
            {label = "Stop fully", icon = "stop", correct = true},
            {label = "Roll through slowly", icon = "car", correct = false},
            {label = "Ignore if no one’s around", icon = "eye-slash", correct = false}
        }
    },
        -- Question 3
    {
        question = "School Zone Limits",
        description = "You enter a school zone during school hours. What's the speed limit?",
        options = {
            {label = "25 MPH", icon = "tachometer-alt", correct = false},
            {label = "15 MPH", icon = "child", correct = true},
            {label = "35 MPH", icon = "car-side", correct = false}
        }
    },
        -- Question 4
    {
        question = "Yellow Light Rules",
        description = "The traffic light turns yellow as you approach. What do you do?",
        options = {
            {label = "Stop if safe", icon = "exclamation", correct = true},
            {label = "Speed through", icon = "bolt", correct = false},
            {label = "Slowly cruise", icon = "car", correct = false}
        }
    },
        -- Question 5
    {
        question = "Right of Way",
        description = "At a 4-way stop, multiple cars arrive. Who goes first?",
        options = {
            {label = "First to arrive", icon = "flag-checkered", correct = true},
            {label = "Car turning left", icon = "reply", correct = false},
            {label = "Bigger vehicle", icon = "truck", correct = false}
        }
    },
        -- Question 6
    {
        question = "Emergency Vehicles",
        description = "You hear a siren and see flashing lights behind you.",
        options = {
            {label = "Pull over and stop", icon = "ambulance", correct = true},
            {label = "Keep going", icon = "car-crash", correct = false},
            {label = "Outrun them", icon = "running", correct = false}
        }
    }
}
