-- Create Ped
local function spawnDrivingInstructor()
    local model = joaat(Config.Ped)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local ped = CreatePed(0, model, Config.PedPos.x, Config.PedPos.y, Config.PedPos.z - 1, Config.PedPos.w, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    local blip = AddBlipForCoord(Config.PedPos.x, Config.PedPos.y, Config.PedPos.z)
    SetBlipSprite(blip, 225)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 3)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("New York Driving School")
    EndTextCommandSetBlipName(blip)

    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'driveschool_interact',
            icon = Config.TargetSymbol,
            label = Config.Target,
            onSelect = function()
                TriggerEvent('forcng:openMenu')
            end
        }
    })
end
-- Ped Thread
CreateThread(spawnDrivingInstructor)
-- Menu
RegisterNetEvent('forcng:openMenu', function()
    lib.registerContext({
        id = 'forcng_menu',
        title = 'New York City Driving School',
        options = {
            {
                title = 'Start Driving Theory Test',
                description = 'Answer questions and earn your driver license.',
                onSelect = function()
                    TriggerServerEvent('forcng:collectPay')
                end
            },
        }
    })

    lib.showContext('forcng_menu')
end)

RegisterNetEvent('forcng:beginSchoolt', function()
    local score = 0
    local index = 1
    local total = #Config.Questions

    local function askQuestion()
        if not Config.Questions[index] then
            if score >= Config.RequiredCorrect then
                TriggerServerEvent('forcng:passTest')
            else
                lib.notify({title = 'Driving School', description = 'You failed the test', type = 'error'})
            end
            return
        end

        local q = Config.Questions[index]
        local options = {}

        for _, opt in ipairs(q.options) do
            options[#options + 1] = {
                title = opt.label,
                description = q.description or '',
                icon = opt.icon or 'circle',
                onSelect = function()
                    if opt.correct then
                        score += 1
                        lib.notify({title = 'Correct', type = 'success'})
                    else
                        lib.notify({title = 'Incorrect.', type = 'error'})
                    end
                    index += 1
                    Wait(600)
                    askQuestion()
                end
            }
        end

        lib.registerContext({
            id = 'forcng_questions' .. index,
            title = 'Question ' .. index .. ' of ' .. total,
            description = q.description or '',
            menu = 'forcng_menu',
            options = options
        })

        lib.showContext('forcng_questions' .. index)
    end

    askQuestion()
end)
