fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Fysh'
description 'A simple gangmarket, works with ESX. '

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'src/client.lua',
}

server_scripts {
    'src/server.lua'
}

dependency {
    'ox_lib',
    'ox_inventory',
    'es_extended'
}