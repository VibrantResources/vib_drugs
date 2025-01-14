RegisterNetEvent('hospital:server:InjectAnaesthetic', function(targetId, data)
    local player = QBCore.Functions.GetPlayer(source)
    local targetPlayer = GetPlayerPed(targetId)
    
    TriggerClientEvent('hospital:client:ApplyAnaestheticEffect', -1, targetId, data)
end)