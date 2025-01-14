RegisterNetEvent('hospital:client:InjectAnaesthetic', function(data)
    local player, distance = GetClosestPlayer()

    if player ~= -1 and distance < 2.0 then
        local playerId = GetPlayerServerId(player)

        if lib.progressCircle({
            duration = 3000,
            position = 'bottom',
            label = 'Injecting Anaesthetic',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = false,
                combat = true,
                mouse = false,
            },
            -- anim = {
            --     dict = '',
            --     clip = '',
            -- },
        })
        then
            TriggerServerEvent('hospital:server:InjectAnaesthetic', playerId, data)
        else
            lib.notify({
                title = 'Canceled',
                description = "Canceled",
                type = 'error',
            })
        end
    else
        lib.notify({
            title = 'Unable',
            description = 'No one nearby',
            type = 'error'
        })
    end
end)

RegisterNetEvent('hospital:client:ApplyAnaestheticEffect', function(data)
    local target = GetPlayerFromServerId(targetPlayer)
    print(json.encode(target, {indent = true}))
    
    if data.name == 'local_anaesthetic' then
        SetParticleFxNonLoopedColour(0, 0, 1.0)
    end

    UseParticleFxAsset('core')
    local smokeEffect = StartNetworkedParticleFxNonLoopedOnPedBone('ent_amb_steam', player, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(player, 57005), 1.0, 0.0, 0.0, 0.0)
    -- local smokeEffect = StartNetworkedParticleFxNonLoopedAtCoord('ent_amb_steam', playerCoords, 0.0, 0.0, 0.0, 0.6, 0.0, 0.0, 0.0)
    RemovePtfxAsset('core')

    local player = cache.ped

    SetPedToRagdoll(player, 3000, 3000, 0)
end)