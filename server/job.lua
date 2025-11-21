ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('rs_fooddelivery:clockInOrOut')
AddEventHandler('rs_fooddelivery:clockInOrOut', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local isClockedIn = false

    if xPlayer then
        local currentPlayerJob = xPlayer.getJob().name

        if currentPlayerJob ~= 'fooddelivery' then
            xPlayer.setJob("fooddelivery", 0)
            isClockedIn = true
        elseif currentPlayerJob == 'fooddelivery' then
            xPlayer.setJob("unemployed", 0)
            isClockedIn = false
        end
        
        TriggerClientEvent('rs_fooddelivery:clockedInNotification', src, isClockedIn)
    end
end)


RegisterNetEvent('rs_fooddelivery:requestDeliveryRoute')
AddEventHandler('rs_fooddelivery:requestDeliveryRoute', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local isClockedIn = false

    if xPlayer then
        local currentPlayerJob = xPlayer.getJob().name

        if currentPlayerJob == 'fooddelivery' then
            isClockedIn = true
        end
    end
    TriggerClientEvent('rs_fooddelivery:startDeliveryRoute', src, isClockedIn)
end)


RegisterNetEvent('rs_fooddelivery:deliveredFood')
AddEventHandler('rs_fooddelivery:deliveredFood', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        xPlayer.addMoney(4000, "Food Delivered")
    end

    TriggerClientEvent('rs_fooddelivery:endDeliveryRoute', src)
end)