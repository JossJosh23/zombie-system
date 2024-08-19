zombie-system/
│
├── client/
│   ├── main.lua            # Lógica principal del cliente
│   ├── zombie_behaviour.lua # Comportamiento y detección de zombies
│   ├── safe_zones.lua       # Gestión de zonas seguras
│   ├── loot_system.lua      # Sistema de loot para zombies muertos
│   └── sound_management.lua # Sonidos y efectos ambientales
│
├── server/
│   ├── main.lua            # Lógica principal del servidor
│   ├── sync.lua            # Sincronización de zombies con otros jugadores
│   └── spawn_manager.lua   # Gestión de spawn de zombies y jefes
│
└── config.lua              # Configuraciones generales
