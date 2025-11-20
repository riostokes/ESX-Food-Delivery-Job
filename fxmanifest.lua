fx_version 'cerulean'
games { 'gta5' }

author 'Rio Stokes <riostokes@riostokes.com>'
description 'Lightweight Food Delivery Job for ESX'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/peds.lua',
    'client/interactions.lua',
    'client/menus.lua',
    'client/vehicles.lua',
    'client/job.lua'
}

server_scripts {
    'server/job.lua',
    'server/vehicles.lua'
}


dependencies {
    'ox_lib'
}