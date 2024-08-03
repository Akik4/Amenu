
local spawnPos = vector3(686.245, 577.950, 130.461)
--local spawnPos = vector3(-275.522, 6635.835, 7.425)

AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'u_m_y_staggrm_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { 'Welcome to the party!~' }
            })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)

RegisterKeyMapping('menu', 'display menu', 'keyboard', 'F3')

RegisterCommand('fastcar', function()
    SpawnVehicle('zentorno')
end, false)

RegisterCommand('car', function(source, args)
    SpawnVehicle(args[1])
end, false)

