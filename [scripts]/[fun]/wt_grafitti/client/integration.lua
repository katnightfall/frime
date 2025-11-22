--- Let me know if you need more stuff exposed here

--- This function is only called after submitting a graffiti
---@param position vector3
---@param rotation vector3
function CanUseSprayCan(position, rotation)
    return true
end

---@param progress {label: string,duration: number, anim: {dict: string,clip: string,lockX: boolean,lockY: boolean,lockZ: boolean}}
---@param action "spraying"|"drwaing"|"cleaning"
---@return boolean
function StartProgressBar(progress, action)
    lib.progressBar(progress)
    return true 
end

---@param text string
function ShowTextUI(text)
    lib.showTextUI(text)
end

function HideTextUI()
    lib.hideTextUI()
end

---@param rayFlags any
---@param ignoreFlags any
---@param maxDistance any
---@return boolean hit
---@return number entityHit
---@return vector3 endCoords
---@return vector3 surfaceNormal
---@return number materialHash
function PerformRaycastFromCamera(rayFlags, ignoreFlags, maxDistance)
    return lib.raycast.cam(rayFlags, ignoreFlags, maxDistance)
end

---@param title string
---@param options {label: string, type: "input", required: boolean?, max: number? }
---@return number[]|boolean[]|string[]
function PrompInputDialog(title, options)
    return lib.inputDialog(title, options)
end

---@param modelName string
function _RequestModel(modelName)
    return lib.requestModel(modelName)
end

---@param assetName string
function _RequestNamedPtfxAsset(assetName)
    return lib.requestNamedPtfxAsset(assetName)
end