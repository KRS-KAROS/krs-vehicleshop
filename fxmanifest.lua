fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts {
    'config.lua',
    'client.lua'
}


server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/js/*.js',
    'ui/css/*.css',
    'ui/css/fonts/*.ttf',
}

exports {
    'GeneratePlate'
}
