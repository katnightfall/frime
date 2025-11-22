if not ESX then 
    error("Couldn't find ESX, are you sure is this script depending on it?")
    return 
end

---@return boolean
---@param player number
---@param graffiti Graffiti
function CanUseSprayCan(player, graffiti)
    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then return false end

    if xPlayer.getInventoryItem(Config.Integration.Item).count < 1 then return false end
    xPlayer.removeInventoryItem(Config.Integration.Item, 1)
    return true
end

---@param player number
---@param graffiti Graffiti
---@return boolean
function CanCleanGraffiti(player, graffiti)
    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then return false end
    if xPlayer.getInventoryItem(Config.Integration.CleanItem).count < 1 then return false end
    xPlayer.removeInventoryItem(Config.Integration.CleanItem, 1)

    return true
end

---@param player boolean
---@return boolean
function HasAdminPermissions(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then return false end
    return xPlayer.getGroup() == 'admin'
end

---@param player number
---@return string
function GetPlayerUniqueIdentifier(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then return "unknown" end
    return xPlayer.identifier
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

ESX.RegisterUsableItem(Config.Integration.Item, function(source)
    -- you can call this even to force open the menu although after submitting it will always fallback to see if you can use the spraycan here `CanUseSprayCan`
    TriggerClientEvent("hs-graffiti:openGraffitiMenu", source)
end)

ESX.RegisterUsableItem(Config.Integration.CleanItem, function(source)
    TriggerClientEvent("hs-graffiti:startCleanProcess", source)
end)