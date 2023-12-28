Config = {}

Config.resourceName = GetCurrentResourceName()

Config.checkForUpdates = true -- tjekker for opdateringer?

Config.PayAccount = 'bank' -- Account du ville have black market skal bruge ('black_money', 'money', 'bank')
Config.OldESX = false -- Sæt til true for at bruge ælder version af ESX
Config.oxTarget = false -- useTaget? Hvis du sætter den til false ville du bruge 3D tekst
Config.MarketPed = `a_m_m_og_boss_01` -- Jenkins hash af ped her
Config.WebhookLink = "https://discord.com/api/webhooks/1190042585700503572/ImhhrfnASH85w0d61n6m-q4PeFvEx2mjmxH-g1h5qrg4Moo4PWfbNw7DTXuRQQ6j44r2" -- Webhook her / efterlad den tom hvis du ikke ville bruge det!

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
		label = 'Compact Rifle',
		item = 'WEAPON_COMPACTRIFLE',
		price = 42500,
	},
}


Config.cmd = "openBlackMarket"
Config.hotkey = "o"

