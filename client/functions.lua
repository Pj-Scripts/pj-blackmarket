
loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

ShowHelp = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end


ShowNotification = function(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end

CreateBlip = function(coords, sprite, colour, text, scale)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end


local function displayNUI(display)
    SendNUIMessage({
        type = "app/setDisplay",
        data = display
    })
    SetNuiFocus(display, display)
end

OpenBlackMarket = function()
    local itemsToSend = {}

    for i=1, #Config.Items, 1 do
        local item = Config.Items[i]
        local itemData = {
            itemLabel = item.label,
            item = item.item,
            itemType = item.type,
            price = ESX.Math.GroupDigits(item.price)
        }
        table.insert(itemsToSend, itemData)
    end

    displayNUI(true)
    SendNUIMessage(itemsToSend)
end

bigRewards = function()
	TriggerServerEvent('pj-blackmarket:later')
end