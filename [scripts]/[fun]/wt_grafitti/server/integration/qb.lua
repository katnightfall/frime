QBCore = exports['qb-core']:GetCoreObject()

if not QBCore then 
    error("Couldn't find QB, are you sure is this script depending on it?")
    return 
end

---@return boolean
---@param player number
---@param graffiti Graffiti
function CanUseSprayCan(player, graffiti)
    local xPlayer = QBCore.Functions.GetPlayer(player)
    if not xPlayer.Functions.GetItemByName(Config.Integration.Item) then return false end
    xPlayer.Functions.RemoveItem(Config.Integration.Item, 1)
    return true
end


---@param player number
---@param graffiti Graffiti
---@return boolean
function CanCleanGraffiti(player, graffiti)
    local xPlayer = QBCore.Functions.GetPlayer(player)
    if not xPlayer then return false end
    local item = xPlayer.Functions.GetItemByName(Config.Integration.CleanItem)
    if not item then return false end
    xPlayer.Functions.RemoveItem(Config.Integration.CleanItem, 1)

    return true
end

---@param player boolean
---@return boolean
function HasAdminPermissions(player)
    return QBCore.Functions.HasPermission(player, 'admin')
end

---@param player number
---@return string
function GetPlayerUniqueIdentifier(player)
    return QBCore.Functions.GetIdentifier(player, 'license')
end


---@param graffiti Graffiti
---@return string
function UploadGraffiti(graffiti)
    local p = promise:new()
    local MAX_EXPIRATION_TIME = 15552000
    local formData = ([[--FORM_DATA
Content-Disposition: form-data; name="image"

%s
--FORM_DATA--
    ]]):format(graffiti.texture:gsub("data:image/png;base64,", ""))
    
    PerformHttpRequest(("https://api.imgbb.com/1/upload?key=%s&expiration=%s&name=%s"):format(Config.Integration.UploadAPIKey, tostring(math.min(MAX_EXPIRATION_TIME, Config.Integration.DisappearTime)), tostring(graffiti.id)), function (status, body, headers, errorData)
        body = json.decode(body) or {}
        if body?.status ~= 200 then
            print(("Couldn't upload image to host - ID: [%s]"):format(tostring(graffiti.id)))
            p:resolve(false)
            return
        end
  
        p:resolve(body?.data?.url)
    end, "POST", formData, {
        ["Content-Type"] = "multipart/form-data; boundary=FORM_DATA",
    })

    Citizen.Await(p)
    
    --- dispose this as we don't need it anymore :3, if you want to keep it please delete the line below
    graffiti.texture = nil
    return p.value
end

QBCore.Functions.CreateUseableItem(Config.Integration.Item, function(source)
    -- you can call this even to force open the menu although after submitting it will always fallback to see if you can use the spraycan here `CanUseSprayCan`
    TriggerClientEvent("hs-graffiti:openGraffitiMenu", source)
end)

QBCore.Functions.CreateUseableItem(Config.Integration.CleanItem, function(source)
    TriggerClientEvent("hs-graffiti:startCleanProcess", source)
end)
