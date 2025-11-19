fx_version 'cerulean'
games { 'gta5' }

author 'Rio Stokes <riostokes@riostokes.com>'
description 'Lightweight Food Delivery Job for ESX'

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client/peds.lua'
}

server_scripts {
    'server/'
}


dependencies {}