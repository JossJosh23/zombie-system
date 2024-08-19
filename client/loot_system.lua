-- Sistema de Loot - Lootear zombies muertos

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        -- Detectar si el jugador presiona la tecla "E" cerca de un zombie muerto
        if IsControlJustPressed(0, 38) then -- Tecla "E"
            local nearbyZombies = GetNearbyPeds(playerCoords.x, playerCoords.y, playerCoords.z, 2.0)

            for _, ped in pairs(nearbyZombies) do
                if IsEntityDead(ped) and GetEntityModel(ped) == GetHashKey(Config.ZombieModels[1].model) then
                    -- Iniciar animación de búsqueda
                    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CROUCH_INSPECT", 0, true)
                    
                    Citizen.Wait(5000) -- Esperar 5 segundos (animación)

                    -- Generar loot aleatorio
                    GiveRandomLootToPlayer(playerPed)
                end
            end
        end

        Citizen.Wait(0)
    end
end)

function GiveRandomLootToPlayer(playerPed)
    -- Lógica para dar loot al jugador
    local randomItem = math.random(1, 10)
    if randomItem > 5 then
        -- Dar medicina
        TriggerEvent('player:receiveItem', 'medicine', 1)
    else
        -- Dar munición
        TriggerEvent('player:receiveItem', 'ammo', 50)
    end
end
