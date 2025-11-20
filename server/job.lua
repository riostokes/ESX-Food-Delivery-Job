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


