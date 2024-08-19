-- Spawn_manager.lua - Gestión del Spawn de Zombies y Jefes

Citizen.CreateThread(function()
    while true do
        -- Spawnear zombies en las coordenadas configuradas
        for _, spawnPoint in pairs(Config.ZombieSpawnPoints) do
            SpawnZombieAtCoords(spawnPoint.x, spawnPoint.y, spawnPoint.z)
        end

        -- Spawnear jefes zombies en sus puntos específicos
        for _, boss in pairs(Config.ZombieBosses) do
            SpawnZombieBoss(boss)
        end

        Citizen.Wait(10000) -- Esperar 10 segundos antes de spawnear nuevos zombies
    end
end)

function SpawnZombieAtCoords(x, y, z)
    local zombieModel = Config.ZombieModels[math.random(#Config.ZombieModels)].model
    RequestModel(zombieModel)
    while not HasModelLoaded(zombieModel) do
        Citizen.Wait(10)
    end

    local ped = CreatePed(4, zombieModel, x, y, z, 0.0, true, true)
    SetPedAsEnemy(ped, true)
    SetPedCombatAbility(ped, 100)
    SetPedCombatRange(ped, 2)
    SetPedAccuracy(ped, 50)
    SetEntityHealth(ped, Config.ZombieModels[1].health)

    -- Sincronizar zombie con otros jugadores
    TriggerClientEvent('zombie:syncZombies', -1, {
        model = zombieModel,
        x = x,
        y = y,
        z = z
    })
end

function SpawnZombieBoss(boss)
    for _, spawnPoint in pairs(boss.spawnPoints) do
        l
