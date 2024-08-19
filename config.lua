-- Configuración General del Sistema de Zombies

Config = {}

-- Modelos de Zombies y Comportamiento
Config.ZombieModels = {
    { model = "a_m_y_soucent_03", health = 150, damage = 20 },
    { model = "a_m_m_bevhills_01", health = 200, damage = 30 },
}

-- Zonas Seguras
Config.SafeZones = {
    { x = 200.0, y = -900.0, z = 30.0, radius = 100.0 },
    { x = 1500.0, y = 2500.0, z = 45.0, radius = 150.0 },
}

-- Zonas de Spawn
Config.ZombieSpawnPoints = {
    { x = -100.0, y = 1000.0, z = 30.0 },
    { x = 300.0, y = 2000.0, z = 35.0 },
}

-- Jefes Zombies
Config.ZombieBosses = {
    { model = "a_m_y_genstreet_01", health = 1000, damage = 100, spawnPoints = { { x = 500.0, y = 2000.0, z = 35.0 } } },
}

-- Comportamiento por Condiciones Meteorológicas
Config.NightAggressionMultiplier = 2.0
Config.RainAggressionMultiplier = 1.5
