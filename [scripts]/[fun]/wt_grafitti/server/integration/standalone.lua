---@return boolean
---@param player number
---@param graffiti Graffiti
function CanUseSprayCan(player, graffiti)
    return true
end

---@param player number
---@param graffiti Graffiti
---@return boolean
function CanCleanGraffiti(player, graffiti)
    return true
end

---@param player number
---@return boolean
function HasAdminPermissions(player)
    return IsPlayerAceAllowed(player, "group.admin")
end

---@param player number
---@return string
function GetPlayerUniqueIdentifier(player)
    return GetPlayerIdentifier(player, 1)
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

RegisterCommand("open_graffiti_menu", function(source, args, raw)
    TriggerClientEvent("hs-graffiti:openGraffitiMenu", source)
end, false)

RegisterCommand("clean_graffiti", function(source, args, raw)
    TriggerClientEvent("hs-graffiti:startCleanProcess", source)
end, false)