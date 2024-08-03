fx_version 'cerulean'
game 'gta5'

author 'Akik4'
description 'Plugin test'
version '0.0.1'

ressource_type 'gametype' {name = "my game type"}

client_scripts {
    'mymode_client.lua',
    'src/vehiclemanager.lua',
    'src/menu.lua'
}