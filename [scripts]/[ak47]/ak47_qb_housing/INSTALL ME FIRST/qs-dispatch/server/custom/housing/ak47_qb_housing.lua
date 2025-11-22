if Config.Housing ~= "ak47_qb_housing" then
    return
end


function GetPlayerHouses(identifier) 
    local results = MySQL.query.await("SELECT * FROM ak47_qb_housing WHERE `owner` = ?", {identifier})
    local houses = {}
    for key, value in ipairs(results) do
        table.insert(
            houses,
            {
                ["name"] = "House:"..value.id,
                ["id"] = value.id,
                ["coords"] = json.decode(value.enter)
            }
        )
    end
    DebugPrint(houses)
    return houses
end