ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()

		while true do
			Citizen.Wait(0)

			local ped = GetPlayerPed(ped)
			local playercoord = GetEntityCoords(ped)
			local vector = vector3(271.31, -636.35, 41.02)

			if Vdist2(playercoord, vector) < 3 then
				DrawMarker(23, vector, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 100, 255, 100, false, true, 2, true, false, false, false)
				ESX.ShowHelpNotification('Naciśnij {E}, Aby uzyskać dostęp do menu')
				if IsControlJustPressed(1 ,46) then
					OpenSearchMenu()
				end
			end
		end
end)

function OpenSearchMenu()

	local elements = {}

		table.insert(elements, {label = "zegar po starym", value = 'sprzet'})

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
		title    = 'LOMBARD - MENU',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'sprzet' then
			ESX.TriggerServerCallback("twojstaryjestnajebanyjakzawsze:check", function(result)
				if result then
					ESX.ShowNotification('~w~Sprzedałeś ~b~1 ~y~zegar po starym za ~g~10k', 'jd was')
					TriggerServerEvent('twojstaryjestnajebanyjakzawsze:giveItem')
				elseif not result then
					ESX.ShowNotification('~r~Nie masz wystarczająco ilości tego przedmiotu', 'jd was')
					Citizen.Wait(200)
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end