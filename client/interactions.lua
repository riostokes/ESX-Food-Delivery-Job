exports.ox_target:addBoxZone({
    coords = vec3(
        Config.FoodDeliveryClockInMenuLocation.coords.x,
        Config.FoodDeliveryClockInMenuLocation.coords.y,
        Config.FoodDeliveryClockInMenuLocation.coords.z
    ),
    size = vec3(1.5, 1.5, 1.5),
    rotation = 45,
    debug = drawZones,
    drawSprite = false,
    options = {
        name = 'food_delivery_interaction',
        icon = 'fa-solid fa-burger',
        label = 'Speak with Jerry',
        distance = 1.5,
        onSelect = function()
            lib.showContext('food_delivery_menu')
        end
    }
})

function createDeliveryCustomerInteraction(deliveryLocation)
    exports.ox_target:addBoxZone({
        name = 'food_delivery_customer_interaction_target',
        coords = vec3(
            deliveryLocation.coords.x,
            deliveryLocation.coords.y,
            deliveryLocation.coords.z + 1.0
        ),
        size = vec3(1.5, 1.5, 1.5),
        rotation = 45,
        debug = drawZones,
        drawSprite = false,
        options = {
            name = 'food_delivery_customer_interaction',
            icon = 'fa-solid fa-box',
            label = 'Delivery Food',
            distance = 1.5,
            serverEvent = 'rs_fooddelivery:deliveredFood'
        }
    })
end

function removeDeliveryInteraction()
    exports.ox_target:removeZone('food_delivery_customer_interaction_target')
end