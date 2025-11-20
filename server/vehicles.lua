ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('rs_fooddelivery:rentDeliveryVehicle')
AddEventHandler('rs_fooddelivery:rentDeliveryVehicle', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        local cashBalance = xPlayer.getMoney()
  
        if cashBalance > Config.FoodDeliveryRentVehicleCost then
            xPlayer.removeMoney(Config.FoodDeliveryRentVehicleCost, 'Rent Delivery Vehicle')
            TriggerClientEvent('rs_fooddelivery:spawnDeliveryVehicle', src, Config.FoodDeliveryRentVehicle)
        end
    end
end)