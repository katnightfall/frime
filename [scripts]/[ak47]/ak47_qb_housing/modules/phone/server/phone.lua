QBCore.Functions.CreateCallback('jpr-phonesystem:server:GetPlayerHouses', function(source, cb, serie)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyHouses = {}
    local CitizenId = MySQL.query.await('SELECT * FROM jpr_phonesystem_base WHERE idtelemovel = ?', {serie})

    if (CitizenId[1]) then
        local result = MySQL.query.await('SELECT * FROM ak47_qb_housing WHERE owner = ?', {CitizenId[1].citizenid})
        local DonoData = MySQL.query.await('SELECT * FROM players WHERE citizenid = ?', {CitizenId[1].citizenid})
        if result and result[1] and DonoData[1] then
            local nome = DonoData[1]
            DonoData.charinfo = json.decode(DonoData[1].charinfo)
            for k, v in pairs(result) do
                MyHouses[#MyHouses+1] = {
                    name = v.id,
                    keyholders = {},
                    owner = CitizenId[1].citizenid,
                    price = v.price,
                    label = "House: "..v.id,
                    tier = "",
                    garage = json.decode(v.garage)
                }

                if v.access ~= "null" then
                    v.access = json.decode(v.access)
                    if v.access and next(v.access) then
                        for cid, data in pairs(v.access) do
                            local keyholderdata = MySQL.query.await('SELECT * FROM players WHERE citizenid = ?', {cid})
                            if keyholderdata[1] then
                                keyholderdata[1].charinfo = json.decode(keyholderdata[1].charinfo)

                                local userKeyHolderData = {
                                    charinfo = {
                                        firstname = keyholderdata[1].charinfo.firstname,
                                        lastname = keyholderdata[1].charinfo.lastname
                                    },
                                    citizenid = keyholderdata[1].citizenid,
                                    name = keyholderdata[1].name
                                }
                                MyHouses[k].keyholders[#MyHouses[k].keyholders+1] = userKeyHolderData
                            end
                        end
                    else
                        MyHouses[k].keyholders[1] = {
                            charinfo = {
                                firstname = DonoData.charinfo.firstname,
                                lastname = DonoData.charinfo.lastname
                            },
                            citizenid = CitizenId[1].citizenid,
                            name = nome.name
                        }
                    end
                else
                    MyHouses[k].keyholders[1] = {
                        charinfo = {
                            firstname = DonoData.charinfo.firstname,
                            lastname = DonoData.charinfo.lastname
                        },
                        citizenid = CitizenId[1].citizenid,
                        name = nome.name
                    }
                end
            end

            SetTimeout(100, function()
                cb(MyHouses)
            end)
        else
            cb({})
        end
    else
        cb({})
    end
end)

QBCore.Functions.CreateCallback('jpr-phonesystem:server:GetHouseKeys', function(source, cb, serie)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyKeys = {}
    local CitizenId = MySQL.query.await('SELECT * FROM jpr_phonesystem_base WHERE idtelemovel = ?', {serie})
    if (CitizenId[1]) then
        local result = MySQL.query.await('SELECT * FROM ak47_qb_housing', {})
        for _, v in pairs(result) do
            local coordsRaw = json.decode(v.enter)
            if v.access ~= "null" then
                v.access = json.decode(v.access)
                for p, _ in pairs(v.access) do
                    if p == CitizenId[1].citizenid and (v.citizenid ~= CitizenId[1].citizenid) then
                        MyKeys[#MyKeys+1] = {
                            HouseData = {
                                adress = 'Adress',
                                coords = {
                                    enter = {
                                        x = coordsRaw.x,
                                        y = coordsRaw.y,
                                    }
                                },
                                name = v.id,
                            }
                        }
                    end
                end
            end
            if v.owner == CitizenId[1].citizenid then
                MyKeys[#MyKeys+1] = {
                    HouseData = {
                        adress = 'Adress',
                        coords = {
                            enter = {
                                x = coordsRaw.x,
                                y = coordsRaw.y,
                            }
                        },
                        name = v.id,
                    }
                }
            end
        end
    end
    cb(MyKeys)
end)

QBCore.Functions.CreateCallback('jpr-phonesystem:server:TransferCid', function(_, cb, NewCid, house)
    local result = MySQL.query.await('SELECT * FROM players WHERE citizenid = ?', {NewCid})
    if result[1] then
        Houses[house.name].owner = NewCid
        TriggerClientEvent('ak47_qb_housing:sync', -1, house.name, Houses[house.name])
        MySQL.update('UPDATE ak47_qb_housing SET owner = ?, WHERE id = ?', {NewCid, house.name})
        cb(true)
    else
        cb(false)
    end
end)