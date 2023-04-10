local ESX = exports["es_extended"]:getSharedObject()
local wheelChair = nil

RegisterNetEvent('kriki_kolica')
AddEventHandler('kriki_kolica', function()
    if not DoesEntityExist(wheelChair) then
        local wheelChairModel = 'iak_wheelchair'
        RequestModel(wheelChairModel)
        while not HasModelLoaded(wheelChairModel) do
            Citizen.Wait(0)
        end
        wheelChair = CreateVehicle(wheelChairModel, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
        SetVehicleOnGroundProperly(wheelChair)
        SetVehicleNumberPlateText(wheelChair, "PILLBOX".. math.random(9))
        SetPedIntoVehicle(PlayerPedId(), wheelChair, -1)
        SetModelAsNoLongerNeeded(wheelChairModel)
    elseif DoesEntityExist(wheelChair) and #(GetEntityCoords(wheelChair) - GetEntityCoords(PlayerPedId())) < 3.0 and GetPedInVehicleSeat(wheelChair,-1) == 0 then
        DeleteVehicle(wheelChair)
        wheelChair = nil
    else
        exports['okokNotify']:Alert('kriki', 'Predaleko od stolice ili neko sedi na njoj', 5000, 'info')
    end
end)
