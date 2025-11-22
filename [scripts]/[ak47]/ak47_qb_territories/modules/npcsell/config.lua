Config.SellAnyWhere = false
Config.RequiredItem = 'burnerphone' -- set nil if not required
Config.DistanceForExistingNpc = 30.0
Config.WantToUsePedList = false
Config.CustomerPeds = {-- list of peds that will triggered on startsell
    [`g_f_y_families_01`] = true,
    [`g_m_y_ballaeast_01`] = true,
    [`g_f_y_ballas_01`] = true,
    [`g_m_y_ballaorig_01`] = true,
    [`g_f_y_vagos_01`] = true,
    [`g_m_y_famca_01`] = true,
    [`g_m_y_famdnf_01`] = true,
    [`g_m_y_ballasout_01`] = true,
    [`a_f_y_soucent_02`] = true,
    [`a_f_y_soucent_01`] = true,
    [`a_m_m_afriamer_01`] = true,
    [`a_m_m_hillbilly_02`] = true,
    [`a_m_m_soucent_03`] = true,
    [`a_m_m_soucent_01`] = true,
    [`a_m_m_tramp_01`] = true,
    [`a_m_m_trampbeac_01`] = true,
    [`a_m_o_soucent_02`] = true,
    [`a_m_o_soucent_03`] = true,
    [`a_m_o_tramp_01`] = true,
} --more peds https =//docs.fivem.net/docs/game-references/ped-models

Config.MiniGames = {
    minigamelv1 = function()
        return lib.skillCheck({ 'easy' }, { 'e' })
    end,
    minigamelv2 = function()
        return lib.skillCheck({ 'easy', 'easy' }, { 'e', 'e' })
    end,
    minigamelv3 = function()
        return lib.skillCheck({ 'easy', 'medium', 'medium' }, { 'e', 'e', 'e' })
    end,
    minigamelv4 = function()
        return lib.skillCheck({ 'medium', 'medium', 'hard' }, { 'e', 'e', 'e' })
    end,
    minigamelv5 = function()
        return lib.skillCheck({ 'easy', 'medium', 'hard', 'hard' }, { 'e', 'e', 'e', 'e' })
    end,
}

Config.Dispatch = function()
    if GetResourceState('ps-dispatch') == 'started' then
        exports['ps-dispatch']:DrugSale()
    elseif GetResourceState('qs-dispatch') == 'started' then
        exports['qs-dispatch']:DrugSale()
    elseif GetResourceState('cd_dispatch') == 'started' or GetResourceState('cd_dispatch3d') == 'started' then
        local dispatch = GetResourceState('cd_dispatch3d') == 'started' and 'cd_dispatch3d' or (GetResourceState('cd_dispatch') == 'started' and 'cd_dispatch')
        local data = exports[dispatch]:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = { 'police', 'sheriff' },
            coords = data.coords,
            title = '10-13 - Drug Sell',
            message = 'A ' .. data.sex .. ' drug selling at ' .. data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 51,
                scale = 1.0,
                colour = 1,
                flashes = false,
                text = '10-13 - Drug Sell',
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('qb-policejob') == 'started' then
        TriggerServerEvent('police:server:policeAlert', 'Drug sale in progress')
    else
        local playerCoords = GetEntityCoords(cache.ped)
        streetName, _ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        playerStreet = GetStreetNameFromHashKey(streetName)
        TriggerServerEvent('ak47_qb_territories:policeAlert', playerCoords, playerStreet)
    end
end

-- ================ Only for devs ==============
-- (client side only)
Config.CanSellDealer = function(dealerdata)
    return true
end

Config.OnSellDealer = function(dealerdata, item, amount)
    -- print(json.encode(dealerdata))
    -- print(item, amount)
end

Config.CanSellNPC = function(zonedata)
    return true
end

Config.OnSellNPC = function(zonedata, item, amount)
    -- print(json.encode(zonedata))
    -- print(item, amount)
end

-- (server side only)
Config.OnSellNPCServer = function(source, zonedata, item, amount)
    -- print(json.encode(zonedata))
    -- print(item, amount)
    -- TriggerEvent("rcore_gangs:server:increase_loyalty", source, "DRUGS", 1.0)
end