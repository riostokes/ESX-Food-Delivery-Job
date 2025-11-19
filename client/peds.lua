local function createDeliveryJobPed()
    
    local model = Config.FoodDeliveryClockInPed

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end

    local ped = CreatePed(
        4,
        model, 
        Config.FoodDeliveryClockInLocation.coords.x,
        Config.FoodDeliveryClockInLocation.coords.y,
        Config.FoodDeliveryClockInLocation.coords.z,
        Config.FoodDeliveryClockInLocation.heading,
        true,
        false
    )

    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

    return ped
end

CreateThread(function()
    createDeliveryJobPed()
end)