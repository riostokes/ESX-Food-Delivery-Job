ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('rs_fooddelivery:clockInOrOut')
AddEventHandler('rs_fooddelivery:clockInOrOut', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local currentPlayerJob = xPlayer.getJob().name

        if currentPlayerJob ~= 'fooddelivery' then
            xPlayer.setJob("fooddelivery", 0)
            
        elseif currentPlayerJob == 'fooddelivery' then
            xPlayer.setJob("unemployed", 0)
        end
    end
end)


