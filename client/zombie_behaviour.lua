-- Comportamiento de los Zombies - Detección de Ruido y Ataques

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local isShooting = IsPedShooting(playerPed)
        local isInVehicle = IsPedInAnyVehicle(playerPed, false)
        
        -- Detectar el ruido generado por el jugador
        if isShooting or isInVehicle then
            for _, zombie in pairs(Config.ZombieModels) do
                local nearbyZombies = GetNearbyPeds(playerCoords.x, playerCoords.y, playerCoords.z, 100.0)

                for _, ped in pairs(nearbyZombies) do
                    if IsEntityAMissionEntity(ped) and GetEntityModel(ped) == GetHashKey(zombie.model) then
                        -- El zombie detecta el ruido y va hacia el jugador
                        TaskGoToCoordAnyMeans(ped, playerCoords.x, playerCoords.y, playerCoords.z, 2.0, 0, 0, 786603, 0xbf800000)
                    end
                end
            end
        end

        -- Cambiar agresividad según el clima y la hora del día
        if GetClockHours() >= 20 or IsPedInAnyVehicle(playerPed, true) then
            -- Incrementar agresividad de los zombies en la noche o cuando está lloviendo
            SetPedAccuracy(ped, 100) -- Mayor precisión
        end

        Citizen.Wait(500) -- Esperar medio segundo antes de revisar de nuevo
    end
end)
