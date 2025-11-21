local customerNetId = nil

RegisterNetEvent('rs_fooddelivery:clockedInNotification')
AddEventHandler('rs_fooddelivery:clockedInNotification', function(isClockedIn)
    if isClockedIn then
        ESX.ShowNotification("You are now clocked in.", "info", 3000, "Job Notification")
    else
        ESX.ShowNotification("You are now clocked off.", "info", 3000, "Job Notification")
    end
end)


RegisterNetEvent('rs_fooddelivery:startDeliveryRoute')
AddEventHandler('rs_fooddelivery:startDeliveryRoute', function(isClockedIn)
    if not isClockedIn then
        ESX.ShowNotification("You are not clocked in. Clock in to request a delivery.", "info", 3000, "Job Notification")
        return
    end

    local ped = NetworkGetEntityFromNetworkId(customerNetId)
    if DoesEntityExist(ped) then
        ESX.ShowNotification("You already have an active delivery!", "info", 3000, "Job Notification")
        return
    end

    ESX.ShowNotification("Delivery Started — get there quickly while it’s hot!", "info", 3000, "Job Notification")

    customerNetId = createDeliveryCustomerPedWithInteraction()
end)


RegisterNetEvent('rs_fooddelivery:endDeliveryRoute')
AddEventHandler('rs_fooddelivery:endDeliveryRoute', function()
    ESX.ShowNotification("Delivery Complete!", "info", 3000, "Job Notification")
    removeDeliveryInteraction()
    local entityId = NetworkGetEntityFromNetworkId(customerNetId)
    DeleteEntity(entityId)
end)

RegisterNetEvent('rs_fooddelivery:deleteDeliveryRoute')
AddEventHandler('rs_fooddelivery:deleteDeliveryRoute', function()

    ESX.ShowNotification("Canceled Delivery Route", "info", 3000, "Job Notification")

    removeDeliveryInteraction()

    if customerNetId then
        local entityId = NetworkGetEntityFromNetworkId(customerNetId)
        if DoesEntityExist(entityId) then
            DeleteEntity(entityId)
        end
        customerNetId = nil
    end
end)

RegisterNetEvent('rs_fooddelivery:noActiveRoute')
AddEventHandler('rs_fooddelivery:noActiveRoute', function()
    ESX.ShowNotification("You have no active delivery route", "info", 3000, "Job Notification")
end)