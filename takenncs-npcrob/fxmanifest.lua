fx_version 'cerulean'
game 'gta5'

description 'takenncsDev NPC Robbery'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'qb-core',
    'ox_lib'
}

lua54 'yes'