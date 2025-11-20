exports.ox_target:addBoxZone({
    coords = vec3(
        Config.FoodDeliveryClockInMenuLocation.coords.x,
        Config.FoodDeliveryClockInMenuLocation.coords.y,
        Config.FoodDeliveryClockInMenuLocation.coords.z
    ),
    size = vec3(0.5, 0.5, 0.5),
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