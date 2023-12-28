fx_version "cerulean"
game "gta5"
lua54 'yes'

version '1.0.0'

description "PJ-Blackmarket for esx"

author "PJ-Scripts"


server_scripts {
	'config.lua',
	'server/*.lua',
}

client_scripts {
    "config.lua",
	'client/*.lua'
}

shared_scripts {
	'strings.lua'
}


dependencies {
	'es_extended',
	'qtarget' -- Removed as dependency because 3d text option provided in config 
}

ui_page "http://localhost:3000"