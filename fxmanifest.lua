fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'vib_drugs'
author 'Vibrant Resources'
version '1.0.0'
repository 'https://github.com/VibrantResources/vib_drugs'
description 'A growing drugs resource involving multiple drugs for all sorts of scenarios'

client_scripts {
	'client/*.lua',
	'menus/*.lua',
}

server_scripts  {
	'server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
	'config.lua',
}