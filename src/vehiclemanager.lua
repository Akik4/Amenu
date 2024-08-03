function SpawnVehicle(vehicle)
    if not IsModelInCdimage(vehicle) or not IsModelAVehicle(vehicle) then
        TriggerEvent('chat:addMessage', {
            args = {'This vehicle did not exist'}
        })

        return
    end

    if IsPedSittingInAnyVehicle(PlayerPedId()) then
        local vehicle = GetVehiclePedIsUsing(PlayerPedId())
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
    end

    
    RequestModel(vehicle)
    
    while not HasModelLoaded(vehicle) do 
        Wait(500)
    end
    
    local pos = GetEntityCoords(PlayerPedId())
    
    local vehicle = CreateVehicle(vehicle, pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()), true, false)


    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)

    SetModelAsNoLongerNeeded(vehicle)

    TriggerEvent('chat:addMessage', {
        args = {'Here\'s you brand new car'}
    })
end