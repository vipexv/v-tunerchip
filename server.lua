ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Vehicles = nil


RegisterCommand('carstats', function(source, args, user)
	      TriggerClientEvent('carstats', source, {})
end)

RegisterServerEvent('tab:refreshOwnedVehicle')
AddEventHandler('tab:refreshOwnedVehicle', function(myCar)
	MySQL.Async.execute('UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `plate` = @plate',
	{
		['@plate']   = myCar.plate,
		['@vehicle'] = json.encode(myCar)
	})
end)

ESX.RegisterUsableItem('tunerchip', function(source)
	TriggerClientEvent('vdev:tunerchip', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
end)



ESX.RegisterUsableItem('medkit', function(source)
	TriggerClientEvent('vipex:medkit', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('medkit', 1)
end)