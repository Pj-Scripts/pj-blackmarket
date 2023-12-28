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

shared_script 'strings.lua'

dependencies {
	'es_extended',
	--'qtarget' 
}

ui_page "http://localhost:3000"