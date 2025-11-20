RegisterNetEvent('rs_fooddelivery:spawnDeliveryVehicle')
AddEventHandler('rs_fooddelivery:spawnDeliveryVehicle', function(vehicleModel, canSpawnVehicle)

    if canSpawnVehicle then
        RequestModel(vehicleModel)
        while not HasModelLoaded(vehicleModel) do
            Wait(10)
        end

        local vehicle = CreateVehicle(
        vehicleModel,
        Config.FoodDeliveryRentVehicleSpaces.coords.x,
        Config.FoodDeliveryRentVehicleSpaces.coords.y,
        Config.FoodDeliveryRentVehicleSpaces.coords.z,
        Config.FoodDeliveryRentVehicleSpaces.heading,
        true,
        false
        )

        SetVehicleOnGroundProperly(vehicle)
        ESX.ShowNotification("Successfully Rented Vehicle", "info", 3000, "Vehicle Notification")
    else
        ESX.ShowNotification("You must be clocked in to rent a vehicle.", "info", 3000, "Vehicle Notification")
    end  
end)