RegisterNetEvent('rs_fooddelivery:clockedInNotification')
AddEventHandler('rs_fooddelivery:clockedInNotification', function(isClockedIn)
    if isClockedIn then
        ESX.ShowNotification("You are now clocked in.", "info", 3000, "Job Notification")
    else
        ESX.ShowNotification("You are now clocked off.", "info", 3000, "Job Notification")
    end
end)