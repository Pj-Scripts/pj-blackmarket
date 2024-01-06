-- server.lua
-- This file is authored by PJ-Script and owned by Patrick Jakobsen.
-- Date: 2024-01-06
-- Author: PJ-Script
-- License: MIT (https://opensource.org/licenses/MIT)

ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback("pj-blackmarket:configCallback", function(source, cb)
cb(Config)
end)

ESX.RegisterServerCallback("pj-blackmarket:randomLocCB", function (soruce, cb)
	cb(Config.randomLocation)
end)

ESX.RegisterServerCallback("pj-blackmarket:canOpen", function (soruce, cb, location)
	local dist = #(Config.randomLocation.coords - location)
	if dist <= 10 then
		cb(true)
	else
		cb(false)
	end
end)


CreateThread(function ()
	print('^1/////////////////////////////////////////////////////////////////////////////////////////////////')
	print('^4PJ-blackmarket: KØRE! Lokation for denne session: '..Config.randomLocation.coords)
	print('^1/////////////////////////////////////////////////////////////////////////////////////////////////^0')
end)





RegisterServerEvent('pj-blackmarket:item')
AddEventHandler('pj-blackmarket:item', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local dist = #(Config.randomLocation.coords - xPlayer.getCoords(true))
	amount = ESX.Math.Round(amount)
	if amount < 0 or dist >= 10 then
		sendToDiscord(Strings['exploit_title'], (Strings['exploit_message']):format(xPlayer.identifier), 15548997)
		print('pj-blackmarket: ' .. xPlayer.identifier .. ' forsøgte at bruge exploit på blackmarket!')
		xPlayer.kick(Strings['kick_msg'])
		return
	end
	local price = 0
	local itemLabel = ''
	local itemType = ''
	for i=1, #Config.Items, 1 do
		if Config.Items[i].item == itemName then
			price = Config.Items[i].price
			itemLabel = Config.Items[i].label
			if Config.Items[i].type then
				itemType = Config.Items[i].type
			end
			break
		end
	end
	price = price * amount
	local xMoney = xPlayer.getAccount(Config.PayAccount).money
	if xMoney >= price then
        if Config.OldESX then
            xPlayer.removeAccountMoney(Config.PayAccount, price)
            if itemType == 'weapon' then
		
				exports.ox_inventory:AddItem(xPlayer.source, itemName, amount)
            else

				exports.ox_inventory:AddItem(soruce, itemName, amount)
            end
            local label = xPlayer.getInventoryItem(itemName).label
            sendToDiscord(Strings['purchase_title'], (Strings['purchase_message']):format(xPlayer.identifier, xPlayer.getName(), amount, itemName, ESX.Math.GroupDigits(price), 5763719))
            TriggerClientEvent('pj-blackmarket:notify', source, (Strings['purchase_notify']):format(amount, label, ESX.Math.GroupDigits(price)))
        else
            if xPlayer.canCarryItem(itemName, amount) then
                xPlayer.removeAccountMoney(Config.PayAccount, price)
                if itemType == 'weapon' then

					exports.ox_inventory:AddItem(xPlayer.source, itemName, amount)
                else
		
					exports.ox_inventory:AddItem(xPlayer.source, itemName, amount)
                end
                local label = xPlayer.getInventoryItem(itemName).label
                sendToDiscord(Strings['purchase_title'], (Strings['purchase_message']):format(xPlayer.identifier, xPlayer.getName(), amount, itemName, ESX.Math.GroupDigits(price), 5763719))
                TriggerClientEvent('pj-blackmarket:notify', source, (Strings['purchase_notify']):format(amount, label, ESX.Math.GroupDigits(price)))
            else
                TriggerClientEvent('pj-blackmarket:notify', source, Strings['no_room_notify'])
            end
        end
    else
        local missingMoney = price - xMoney
        TriggerClientEvent('pj-blackmarket:notify', source, (Strings['not_enough_notify']):format((ESX.Math.GroupDigits(missingMoney))))
    end
end)

RegisterServerEvent('pj-blackmarket:later')
AddEventHandler('pj-blackmarket:later', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	sendToDiscord(Strings['exploit_title'], (Strings['exploit_message']):format(xPlayer.identifier), 15548997)
	print('pj-blackmarket: ' .. xPlayer.identifier .. ' forsøgte at bruge exploit på blackmarket!')
	xPlayer.kick(Strings['kick_msg'])
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