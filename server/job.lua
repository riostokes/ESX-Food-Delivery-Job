ESX = exports["es_extended"]:getSharedObject()
local activeRoutes = {}


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

    if not xPlayer then return end

    local job = xPlayer.getJob().name
    local isClockedIn = job == 'fooddelivery'

    if activeRoutes[src] then
        TriggerClientEvent('esx:showNotification', src, "You must finish your current delivery first.", "info", 3000)
        return
    end

    if not isClockedIn then
        TriggerClientEvent('rs_fooddelivery:startDeliveryRoute', src, false)
        return
    end

    activeRoutes[src] = true
    TriggerClientEvent('rs_fooddelivery:startDeliveryRoute', src, true)
end)

RegisterNetEvent('rs_fooddelivery:deliveredFood')
AddEventHandler('rs_fooddelivery:deliveredFood', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        xPlayer.addMoney(4000, "Food Delivered")
    end

    activeRoutes[src] = nil
    TriggerClientEvent('rs_fooddelivery:endDeliveryRoute', src)
end)

RegisterNetEvent('rs_fooddelivery:cancelDeliveryRoute')
AddEventHandler('rs_fooddelivery:cancelDeliveryRoute', function()
    local src = source
    
    if activeRoutes[src] == nil then
        TriggerClientEvent('rs_fooddelivery:noActiveRoute', src)
        return
    end

    activeRoutes[src] = nil
    TriggerClientEvent('rs_fooddelivery:deleteDeliveryRoute', src)
end)