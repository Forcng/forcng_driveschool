shared_script "@ReaperV4/bypass.lua"
lua54 "yes" -- needed for Reaper

fx_version 'cerulean'

game 'gta5'

author 'Forcng'
description 'discord.gg/forcng'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/*'
}

server_scripts {
    'server/*'
}


escrow_ignore {
    'config.lua',
}