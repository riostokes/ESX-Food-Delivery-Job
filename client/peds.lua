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

function createDeliveryCustomerPedWithInteraction()
    local allModels = Config.FoodDeliveryCustomerPed
    local allDeliveryLocations = Config.FoodDeliveryCustomerLocations
    local selectedModel = allModels[math.random(1, #allModels)]
    local selectedDeliveryLocation = allDeliveryLocations[math.random(1, #allDeliveryLocations)]
    local customerModel = selectedModel.model
    local netId = nil

    RequestModel(customerModel)
    while not HasModelLoaded(customerModel) do
        Wait(10)
    end

    local customer = CreatePed(
        4,
        customerModel,
        selectedDeliveryLocation.coords.x,
        selectedDeliveryLocation.coords.y,
        selectedDeliveryLocation.coords.z,
        selectedDeliveryLocation.heading,
        true,
        false
    )

    SetEntityInvincible(customer, true)
    SetBlockingOfNonTemporaryEvents(customer, true)
    FreezeEntityPosition(customer, true)

    netId = NetworkGetNetworkIdFromEntity(customer)
    createDeliveryCustomerInteraction(selectedDeliveryLocation)
    
    return netId
end

CreateThread(function()
    createDeliveryJobPed()
end)