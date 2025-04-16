ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('forcng:collectPay', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local cost = Config.Cost
    local method = Config.ChargeFrom

    if not xPlayer then return end

    local hasEnough = false

    if method == 'cash' then
        hasEnough = xPlayer.getMoney() >= cost
    elseif method == 'bank' then
        hasEnough = xPlayer.getAccount('bank').money >= cost
    end

    if hasEnough then
        if method == 'cash' then
            xPlayer.removeMoney(cost)
        else
            xPlayer.removeAccountMoney('bank', cost)
        end

        TriggerClientEvent('forcng:beginSchoolt', src)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Driving School',
            description = ('You paid $%d for the theory test.'):format(cost),
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Not Enough Funds',
            position = 'center-right',
            description = ('You need $%d %s.'):format(cost, method),
            type = 'error'
        })
    end
end)

RegisterNetEvent('forcng:passTest', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        xPlayer.addInventoryItem(Config.LicenseItem, 1)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Driving School',
            description = 'You passed the theory test! A driver license has been issued.',
            type = 'success'
        })
    end
end)
