local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('takenncs-npcrob:server:rob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    -- Give random money
    local money = math.random(13, 20)
    Player.Functions.AddMoney('cash', money)
    
    -- Random items
    local items = {
        {name = 'goldchain', chance = 2}
    }

    for _, item in pairs(items) do
        if math.random(1, 100) <= item.chance then
            Player.Functions.AddItem(item.name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], 'add')
            break
        end
    end

    TriggerClientEvent('QBCore:Notify', src, 'Röövisid $' .. money .. ' !', 'success')
end)