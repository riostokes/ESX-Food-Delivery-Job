ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('rs_fooddelivery:rentDeliveryVehicle')
AddEventHandler('rs_fooddelivery:rentDeliveryVehicle', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local canSpawnVehicle = false

    if xPlayer then
        local currentPlayerJob = xPlayer.getJob().name

        if currentPlayerJob == 'fooddelivery' then
            local cashBalance = xPlayer.getMoney()
  
            if cashBalance > Config.FoodDeliveryRentVehicleCost then
                xPlayer.removeMoney(Config.FoodDeliveryRentVehicleCost, 'Rent Delivery Vehicle')
                canSpawnVehicle = true
            end
        end

        TriggerClientEvent('rs_fooddelivery:spawnDeliveryVehicle', src, Config.FoodDeliveryRentVehicle, canSpawnVehicle)
    end
end)