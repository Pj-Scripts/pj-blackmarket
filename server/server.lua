ESX = exports['es_extended']:getSharedObject()
local ox_inventory = exports.ox_inventory

RegisterServerEvent('buyBulletproofVest')
AddEventHandler('buyBulletproofVest', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local vestPrice = 500

    if xPlayer.getMoney() >= vestPrice then
        xPlayer.removeAccountMoney("bank", vestPrice)
        ox_inventory:AddItem(soruce, 'bulletproof_vest', 1)

    else
        TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, 'You don\'t have enough money to buy a vest!')
    end
end)


function sendToDiscord(name, message, color) 
    local connect = {
		{
			["color"] = color,
			["title"] = "**".. name .."**",
			["description"] = message,
			["footer"] = {
				["text"] = "PJ-BlackMarket - by PJ-Scripts",
			},
		}
	}
	PerformHttpRequest(Config.WebhookLink, function(err, text, headers) end, 'POST', json.encode({username = 'PJ-BlackMarket', embeds = connect, avatarrl = 'https://media.discordapp.net/attachments/949247950419271680/1184883171813249135/image.png?ex=65a00c72&is=658d9772&hm=33d55bd7be133dacccdf3a9df01412707f52cb3702a94506f9a5bce7640b87c7&=&format=webp&quality=lossless'}), { ['Content-Type'] = 'application/json' })
end