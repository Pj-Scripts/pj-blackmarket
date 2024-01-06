fx_version "cerulean"
game "gta5"
lua54 'yes'

version '1.0.3'

description "PJ-Blackmarket for esx"

author "PJ-Scripts"

ui_page 'https://pj-blackmarket.vercel.app'

server_scripts {
	'config.lua',
	'server/*.lua',
}

client_scripts {
	'cl_config.lua',
	'client/*.lua'
}

shared_scripts {
	'strings.lua'
}


dependencies {
	'es_extended',
	'qtarget'
}

