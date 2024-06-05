RegisterNetEvent('bottlesmash')
AddEventHandler('bottlesmash', function()
ready = true

TriggerServerEvent('readyredirect', ready)
Config.PersistNotify()

local player = GetPlayerPed(-1)
TaskPlayAnim(player, 'move_action@p_m_one@holster', 'mini_holster_unarmed', 5.0, 5.0, 1000, 49, 0, false, false, false)
	beer = CreateObject(GetHashKey("prop_beer_pissh"), GetEntityCoords(PlayerPedId()), true, true, true);
	AttachEntityToEntity(beer, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0, -0.1, -0.05, 240.0, 240.0, -360.0, true, false, false, false, 0, true);
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		RequestAnimDict('melee@knife@streamed_core')
		RequestAnimDict('move_action@p_m_one@holster')
		if IsControlJustReleased(0, 38) and ready == true then
			Config.EndPersistNotify()
ready = false
TriggerServerEvent('readyredirect', ready)
		local player = GetPlayerPed(-1)
	TaskPlayAnim(player, 'melee@knife@streamed_core', 'knife_short_range_90', 5.0, 5.0, 500, 49, 0, false, false, false)
	Wait(500)
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 8, 'bottle', 1.0)
DeleteObject(beer)
TriggerServerEvent('removebottle')
end
if IsControlJustReleased(0, 73) and ready == true then
Config.EndPersistNotify()
				ready = false
				TriggerServerEvent('readyredirect', ready)
	local player = GetPlayerPed(-1)
	TaskPlayAnim(player, 'melee@holster', 'holster', 5.0, 5.0, 1000)
	DeleteObject(beer)
	end
	end
end)
		