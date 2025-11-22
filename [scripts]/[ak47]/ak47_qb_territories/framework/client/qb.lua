QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
PlayerLoaded = false

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.job then
            PlayerData = data
            PlayerLoaded = true
            Init()
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    while not QBCore.Functions.GetPlayerData().job do Wait(1000) end
    PlayerData = QBCore.Functions.GetPlayerData()
    LocalPlayer.state:set('gangjob', PlayerData.job.name, true)
    PlayerLoaded = true
    Init()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    LocalPlayer.state:set('gangjob', PlayerData.job.name, true)
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
    LocalPlayer.state:set('gangjob', PlayerData.job.name, true)
end)

RegisterNetEvent('ak47_qb_territories:notify', function(msg, type)
    Notify(msg, type)
end)

GetJobList = function()
    return QBCore.Shared.Jobs
end

GetGangList = function()
    local gangTable = {}
    if Gangs and next(Gangs) then
        for i, v in pairs(Gangs) do
            gangTable[v.tag] = {
                label = v.label,
                grades = {}
            }
            local ranks = json.decode(v.ranks)
            for j, k in pairs(ranks) do
                gangTable[v.tag].grades[k.id] = {
                    name = k.label
                }
            end
        end
    end
    return gangTable
end
exports('GetGangList', GetGangList)

GetPlayerGang = function()
    return MyGang
end
exports('GetPlayerGang', GetPlayerGang)

GetPlayerGangName = function()
    local gang = GetPlayerGang()
    return gang and gang.tag
end
exports('GetPlayerGangName', GetPlayerGangName)

GetPlayerGangRank = function()
    local gang = GetPlayerGang()
    return gang and gang.rankid
end
exports('GetPlayerGangRank', GetPlayerGangRank)

GetPlayerJobName = function()
    return PlayerData and PlayerData.job.name
end

GetPlayerJobRank = function()
    return PlayerData and PlayerData.job.grade.level
end

ReliveStress = function( value )
    TriggerServerEvent('hud:server:RelieveStress', value)
end

IsDead = function()
    return QBCore.Functions.GetPlayerData().metadata['isdead']
end