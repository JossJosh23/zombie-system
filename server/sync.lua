-- Sync.lua - Sincronización de Zombies entre Jugadores

RegisterServerEvent('zombie:syncZombies')
AddEventHandler('zombie:syncZombies', function(zombieData)
    -- Recibe los datos de un zombie desde un cliente y lo envía a todos los demás clientes
    TriggerClientEvent('zombie:updateZombies', -1, zombieData)
end)

-- Evento para sincronizar la muerte de un zombie
RegisterServerEvent('zombie:syncZombieDeath')
AddEventHandler('zombie:syncZombieDeath', function(zombieId)
    -- Enviar a todos los jugadores que un zombie ha muerto
    TriggerClientEvent('zombie:zombieDied', -1, zombieId)
end)
