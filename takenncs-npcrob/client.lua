local QBCore = exports['qb-core']:GetCoreObject()
local isRobbing = false
local canRob = true
local cooldownTime = 9000 
local robbedPeds = {}

local function StartCooldown()
    canRob = false
    SetTimeout(cooldownTime, function()
        canRob = true
        QBCore.Functions.Notify('Võid uuesti pättust teha!', 'success')
    end)
end

local function RobNPC(targetPed)
    if isRobbing or not canRob then 
        if not canRob then
            QBCore.Functions.Notify('Pead ootama et röövida!', 'error')
        end
        return 
    end
    isRobbing = true

    -- Instantly freeze NPC
    ClearPedTasksImmediately(targetPed)
    SetEntityAsMissionEntity(targetPed, true, true)
    FreezeEntityPosition(targetPed, true)
    SetBlockingOfNonTemporaryEvents(targetPed, true)
    SetPedCanRagdoll(targetPed, false)

    local progressStarted = lib.progressBar({
        duration = 5000,
        label = 'Röövid kodaniku...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = false,
            combat = false
        }
    })

    CreateThread(function()
        while isRobbing do
            if not IsPlayerFreeAiming(PlayerId()) then
                isRobbing = false
                SetPedCanRagdoll(targetPed, true)
                FreezeEntityPosition(targetPed, false)
                SetBlockingOfNonTemporaryEvents(targetPed, false)
                TaskReactAndFleePed(targetPed, PlayerPedId())
                SetPedKeepTask(targetPed, true)
                robbedPeds[targetPed] = true
                QBCore.Functions.Notify('Röövimine katkestatud - kaotasid sihtimise!', 'error')
                break
            end
            Wait(0)
        end
    end)

    if progressStarted then
        TriggerServerEvent('takenncs-npcrob:server:rob')
        StartCooldown()
        
        SetPedCanRagdoll(targetPed, true)
        FreezeEntityPosition(targetPed, false)
        SetBlockingOfNonTemporaryEvents(targetPed, false)
        TaskReactAndFleePed(targetPed, PlayerPedId())
        SetPedKeepTask(targetPed, true)
        SetPedFleeAttributes(targetPed, 0, true)
        SetPedAsNoLongerNeeded(targetPed)
        robbedPeds[targetPed] = true
    end
    
    isRobbing = false
end

CreateThread(function()
    while true do
        local sleep = 1000
        if IsPedArmed(PlayerPedId(), 7) then
            sleep = 0
            if IsPlayerFreeAiming(PlayerId()) then
                local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if aiming and DoesEntityExist(targetPed) and IsEntityAPed(targetPed) and not IsPedAPlayer(targetPed) 
                    and not IsPedInAnyVehicle(targetPed, true) and not IsPedDeadOrDying(targetPed, true) 
                    and not robbedPeds[targetPed] and canRob then
                    
                    local coords = GetEntityCoords(targetPed)
                    DrawText3D(coords.x, coords.y, coords.z + 1.0, '[E] röövi kodaniku')
                    
                    if IsControlJustPressed(0, 38) then
                        RobNPC(targetPed)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

function DrawText3D(x, y, z, text)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.3, 0.3)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end