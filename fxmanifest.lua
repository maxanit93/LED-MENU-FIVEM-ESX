fx_version 'cerulean'
game 'gta5'

author 'chico'
description 'LED Color Menu'
version '1.0.0'

client_scripts {
    '@NativeUI/NativeUI.lua', -- NativeUI muss vorhanden sein
    'config.lua',
    'client.lua'
}

shared_scripts {
    'config.lua'
}

dependencies {
    'NativeUI'
}
