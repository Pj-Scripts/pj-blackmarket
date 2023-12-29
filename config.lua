Config = {}

Config.resourceName = GetCurrentResourceName()

Config.checkForUpdates = true -- tjekker for opdateringer?


Config.PayAccount = 'money' -- Account du ville have black market skal bruge ('black_money', 'money', 'bank')
Config.OldESX = false -- Sæt til true for at bruge ælder version af ESX
Config.qtarget = true -- useTaget? Hvis du sætter den til false ville du bruge 3D tekst
Config.MarketPed = `a_m_m_og_boss_01` -- Jenkins hash af ped her
Config.WebhookLink = "" -- Webhook her / efterlad den tom hvis du ikke ville bruge det!

Config.Locations = { 
	[1] = {
		coords = vector3(241.23, 131.55, 102.6),
		heading = 153.14
	},

	[2] = {
		coords = vector3(289.8, -1204.34, 29.29),
		heading = 275.48
	},

	[3] = {
		coords = vector3(-587.2, -1656.64, 19.36),
		heading = 155.51
	},

	[4] = {
		coords = vector3(57.89, -1733.11, 29.31),
		heading = 59.03
	},
}

Config.randomLocation = Config.Locations[math.random(1,#Config.Locations)]

Config.Items = { 
	{
		label = 'Compact Rifle',
		item = 'WEAPON_COMPACTRIFLE',
		price = 42500,
		type = 'weapon'
	},
	{
		label = 'Combat Pistol',
		item = 'WEAPON_COMBATPISTOL',
		price = 19250,
		type = 'weapon'
	},
	{
		label = 'Ceramic Pistol',
		item = 'WEAPON_CERAMICPISTOL',
		price = 41000,
		type = 'weapon'
	},
	{
		label = 'AP Pistol',
		item = 'WEAPON_APPISTOL',
		price = 112000,
		type = 'weapon'
	},
	{
		label = 'Gusenberg',
		item = 'WEAPON_GUSENBERG',
		price = 322111,
		type = 'weapon'
	},
	{
		label = 'Carbine Rifle',
		item = 'WEAPON_CARBINERIFLE',
		price = 322111,
		type = 'weapon'
	},
	{
		label = 'Carbine Rifle',
		item = 'WEAPON_CARBINERIFLE',
		price = 455810,
		type = 'weapon'
	},
	{
		label = 'Ballup Rifle',
		item = 'WEAPON_BULLPUPRIFLE',
		price = 455654,
		type = 'weapon'
	},
	{
		label = 'Micro SMG',
		item = 'WEAPON_MICROSMG',
		price = 455654,
		type = 'weapon'
	},
	{
		label = 'Baseball Bat',
		item = 'WEAPON_BAT',
		price = 40,
		type = 'handweapon'
	},
	{
		label = 'Crow Bar',
		item = 'WEAPON_CROWBAR',
		price = 85,
		type = 'handweapon'
	},
	{
		label = 'Grenade',
		item = 'WEAPON_GRENADE',
		price = 1250,
		type = 'ammo'
	},
	{
		label = 'Bruger',
		item = 'burger',
		price = 20,
		type = 'food'
	},
	{
		label = 'Repair Kit',
		item = "fixkit",
		price = 1000,
		type = "auto"
	},
	{
		label = "Bulletproof Vest",
		item = "armour",
		price = 2000,
		type = "armor"
	}
}


