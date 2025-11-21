lib.registerContext({
    id = 'food_delivery_menu',
    title = 'Food Delivery',
    options = {
        {
            title = 'Clock In / Clock Out',
            description = 'Start or end your delivery shift.',
            icon = 'fa-regular fa-clock',
            iconColor = 'orange',
            serverEvent = 'rs_fooddelivery:clockInOrOut'
        },
        {
            title = 'Rent Delivery Vehicle',
            description = 'Rent a scooter or bike for deliveries. (£4000)',
            icon = 'fa-solid fa-motorcycle',
            iconColor = 'lightblue',
            serverEvent = 'rs_fooddelivery:rentDeliveryVehicle'
        },
        {
            title = 'Request Delivery Route',
            description = 'Get a new delivery route assigned to you.',
            icon = 'fa-solid fa-map-location-dot',
            iconColor = 'green',
            serverEvent = 'rs_fooddelivery:requestDeliveryRoute'
        },
        {
            title = 'Cancel Delivery Route',
            description = 'Cancel your current delivery route.',
            icon = 'fa-regular fa-circle-xmark',
            iconColor = 'red',
            serverEvent = 'rs_fooddelivery:cancelDeliveryRoute'
        }
    }
})