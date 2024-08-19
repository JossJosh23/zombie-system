-- Servidor Principal - Sincronización y Gestión de Spawn de Zombies

RegisterServerEvent('zombie:sync')
AddEventHandler('zombie:sync', function(zombieData)
    -- Sincronizar zombies entre los jugadores
    TriggerClientEvent('zombie:sync', -1, zombieData)
end)

Citizen.CreateThread(function()
    while true do
        -- Spawnear zombies en los puntos configurados
        for _, spawnPoint in pairs(Config.ZombieSpawnPoints) do
            SpawnZombieAtCoords(spawnPoint.x, spawnPoint.y, spawnPoint.z)
        end

        -- Spawnear jefes zombies
        for _, boss in pairs(Config.ZombieBosses) do
            SpawnZombieBoss(boss)
        end

        Citizen.Wait(10000) -- Esperar 10 segundos antes de spawnear nuevos zombies
    end
end)

function SpawnZombieAtCoords(x, y, z)
    -- Lógica para spawnear un zombie en las coordenadas dadas
    local zombieModel = Config.ZombieModels[math.random(#Config.ZombieModels)].model
    local ped = CreatePed(4, GetHashKey(zombieModel), x, y, z, 0.0, true, true)
    SetPedAsEnemy(ped, true)
    SetPedCombatAbility(ped, 100)
    SetPedCombatRange(ped, 2)
end

function SpawnZombieBoss(boss)
    -- Lógica para spawnear un jefe zombie
    for _, spawnPoint in pairs(boss.spawnPoints) do
        local ped = CreatePed(4, GetHashKey(boss.model), spawnPoint.x, spawnPoint.y, spawnPoint.z, 0.0, true, true)
        SetPedAsEnemy(ped, true)
        SetPedMaxHealth(ped, boss.health)
        SetPedCombatAbility(ped, 100)
        SetPedCombatRange(ped, 3)
    end
end
