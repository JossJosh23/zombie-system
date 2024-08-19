-- fxmanifest.lua - Configuración del Recurso de Sistema de Zombies

fx_version 'cerulean'            -- Especifica la versión de fxmanifest, 'cerulean' es una de las más recientes.
game 'gta5'                      -- Especifica que el recurso es para GTA V.

author 'TuNombre'                -- Tu nombre o el nombre del equipo de desarrollo.
description 'Sistema de Zombies para FiveM' -- Breve descripción del recurso.
version '1.0.0'                  -- Versión del recurso.

-- Archivos de configuración compartidos entre cliente y servidor
shared_script 'config.lua'

-- Archivos específicos del cliente
client_scripts {
    'client/main.lua',           -- Script principal del cliente
    'client/zombie_behaviour.lua', -- Control del comportamiento de los zombies
    'client/safe_zones.lua',     -- Gestión de zonas seguras
    'client/loot_system.lua',    -- Sistema de loot para zombies muertos
    'client/sound_management.lua' -- Gestión de sonidos ambientales y de zombies
}

-- Archivos específicos del servidor
server_scripts {
    'server/main.lua',           -- Script principal del servidor
    'server/sync.lua',           -- Sincronización de zombies entre jugadores
    'server/spawn_manager.lua'   -- Gestión del spawn de zombies y jefes
}

-- Archivos adicionales como imágenes, sonidos, etc. (si los tienes)
files {
    'sounds/apocalypse_ambient.wav', -- Sonido ambiental del apocalipsis
    'sounds/zombie_groan.wav',      -- Sonido de gruñido de zombie
    'sounds/zombie_scream.wav'      -- Sonido de grito de zombie
}

-- Configuración de datos de audio (si tienes archivos de sonido)
data_file 'AUDIO_WAVEPACK' 'sounds/'

-- Configuración de la dependencia (si utilizas otros recursos)
-- dependencies {
--     'some_other_resource'      -- Ejemplo de un recurso del que podría depender este script
-- }
