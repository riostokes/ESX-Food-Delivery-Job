RegisterNetEvent('rs_fooddelivery:spawnDeliveryVehicle')
AddEventHandler('rs_fooddelivery:spawnDeliveryVehicle', function(vehicleModel)

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

    ESX.ShowNotification("Successfully Rented Vehicle", "success", 3000, "Vehicle Notification")
end)