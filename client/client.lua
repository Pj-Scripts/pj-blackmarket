ESX = exports['es_extended']:getSharedObject()
Config = {}

local function displayNUI(display)
    SendNUIMessage({
        type = "app/setDisplay",
        data = display
    })
    SetNuiFocus(display, display)
end




AddEventHandler("onResourceStop", function(resource)
    if resource == Config.resourceName then
        displayNUI(false)
    end
end)

RegisterNUICallback("close", function(data, cb)
    displayNUI(false)
    cb(true)
end)


CreateThread(function ()
    if Config.MarketPed == nil then
        TriggerEvent('pj-blackmarket:getConfig')
    end
    if Config.randomLocation == nil then
        TriggerEvent('pj-blackmarket:getRandomLoc')
    end
end)

AddEventHandler("pj-blackmarket:getConfig", function ()
    ESX.TriggerServerCallback("pj-blackmarket:configCallback", function (c)
        Config = c
    end)
end)

AddEventHandler("pj-blackmarket:getRandomLoc", function ()
    ESX.TriggerServerCallback("pj-blackmarket:randomLocCB", function (c)
        Config.randomLocation = c
    end)
end)

AddEventHandler('esx:OnPlayerSpawn', function ()
    if Config.MarketPed == nil then
        TriggerEvent("pj-blackmarket:getConfig")
    end
    if Config.randomLocation == nil then
        TriggerEvent("pj-blackmarket:getRandomLoc")
    end
end)

AddEventHandler("playerspawned", function ()
    if Config.MarketPed == nil then
        TriggerEvent("pj-blackmarket:getConfig")
    end
    if Config.randomLocation == nil then
        TriggerEvent("pj-blackmarket:getRandomLoc")
    end
end)


CreateThread(function ()
    while Config.randomLocation == nil or Config.MarketPed do
        Wait(1000)
    end
    local coords = Config.randomLocation.coords
    if Config.oxTarget then
        exports.ox_target:addBoxZone("BlkMarket", vector3(coords.x, coords.y, coords.z), 1.0, 1.0, {
            name="BlkMarket",
			heading=11.0,
			debugPoly=false,
			minZ=coords.z-3,
			maxZ=coords.z+3,
			}, {
				options = {
					{
						event = "pj-blackmarket:openShop",
						icon = "fas fa-briefcase",
						label = Strings['open_market'],
					},
				},
				distance = 3.5
		})
    else
        CreateThread(function ()
            while true do
                local sleep = 1500
                local plyCoords = GetEntityCoords(PlayerPedId())
                local dist = #(plyCoords - coords)
                if dist <= 3 then
                    sleep = 0
                    local txtPos = vector3(coords.x, coords.y, coords.z+0.9)
                    DrawText3D(txtPos, Strings['three_d_txt'])
					if dist <= 2 and IsControlJustPressed(0, 38) then
						TriggerEvent('pj-blackmarket:openShop')
					end
                end
                Wait(sleep)
            end
        end)
    end
end)

--Ped Spawn Thread
local pedSpawned = false
local ped

CreateThread(function()
	while Config.randomLocation == nil or Config.MarketPed == nil do
		Wait(1000)
	end
	while true do
		local sleep = 1500
		local playerPed = PlayerPedId()
		local plyCoords = GetEntityCoords(playerPed)
		local dist = #(plyCoords - Config.randomLocation.coords)
		if dist <= 50 and not pedSpawned then
			pedSpawned = true
			local model = loadModel(Config.MarketPed)
			local animDict = loadDict('mini@strip_club@idles@bouncer@base')
			local coords = Config.randomLocation.coords
			ped = CreatePed(28, model, coords.x, coords.y, coords.z-0.9, Config.randomLocation.heading, false, false)
			FreezeEntityPosition(ped, true)
			SetEntityInvincible(ped, true)
			SetBlockingOfNonTemporaryEvents(ped, true)
			TaskPlayAnim(ped, animDict, 'base', 8.0, 0.0, -1, 1, 0, 0, 0, 0)
		elseif dist >= 51 and pedSpawned then
			SetPedAsNoLongerNeeded(ped)
			DeletePed(ped)
			pedSpawned = false
			RemoveAnimDict('mini@strip_club@idles@bouncer@base')
		end
		Wait(sleep)
	end
end)

RegisterNetEvent("pj-blackmarket:notify")
AddEventHandler("pj-blackmarket:notify", function (message)
    ShowNotification(message)
end)


AddEventHandler("pj-blackmarket:openShop", function()
   local playerPed = PlayerPedId()
   local coords = GetEntityCoords(playerPed)
   ESX.TriggerServerCallback("pj-blackmarket:canOpen", function(cb) 
    if cb then
        OpenBlackMarket()
    elseif not cb then
        bigRewards()
    end
   end, coords)
end)


RegisterNuiCallback('item', function (data, cb)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    TriggerServerEvent("pj-blackmarket:item", data.item, 1, coords)
end)




