-- Zonas Seguras - Control de Ingreso a Zonas Seguras

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, zone in pairs(Config.SafeZones) do
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, zone.x, zone.y, zone.z)
            if distance <= zone.radius then
                -- Desactivar la IA de los zombies en zonas seguras
                DisableZombiesInSafeZone(zone)
            else
                EnableZombiesOutsideSafeZone()
            end
        end

        Citizen.Wait(1000) -- Esperar 1 segundo antes de revisar de nuevo
    end
end)

function DisableZombiesInSafeZone(zone)
    -- Lógica para desactivar los zombies en la zona segura
end

function EnableZombiesOutsideSafeZone()
    -- Lógica para reactivar los zombies fuera de la zona segura
end
