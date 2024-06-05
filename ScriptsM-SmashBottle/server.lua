if Config.Framework == 'qb' then
QBCore = exports['qb-core']:GetCoreObject()
end

if Config.Framework == 'esx' then
ESX = exports["es_extended"]:getSharedObject()	
end

notifytrue = nil
RegisterNetEvent('readyredirect')
AddEventHandler('readyredirect', function(ready)
	notifytrue = ready
end)

-- remove '--' if you wanna use it with esx and delete QBCore.Functions.CreateUseableItem

--ESX.RegisterUsableItem(Config.BottleItem, function(source) 
--	if not notifytrue then
--	TriggerClientEvent('bottlesmash', source)
--end
--end)

QBCore.Functions.CreateUseableItem(Config.BottleItem, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
       if not notifytrue then
       TriggerClientEvent('bottlesmash', source) 
   end
end)

RegisterNetEvent('removebottle')
AddEventHandler('removebottle', function()
	if Config.Framework == 'esx' then
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('WEAPON_BOTTLE', 1)
	xPlayer.removeInventoryItem(Config.BottleItem, 1)
end
	if Config.Framework == 'qb' then
		local xPlayer = QBCore.Functions.GetPlayer(source)
        TriggerClientEvent('3dme:shareDisplayExport', -1, 'Разбил бутылку', source, 5000)
        xPlayer.Functions.AddItem('WEAPON_BOTTLE', 1)
        xPlayer.Functions.RemoveItem(Config.BottleItem, 1)
    end
end)
