---@meta

---@class Graffiti
---@field position vector3
---@field rotation vector3
---@field scale number
---@field texture string
---@field image string
---@field id number
---@field author number
---@field lifetime number
---@field gameTexture string? Client-side related
---@field alpha number
---@field visible boolean? Client-side related is the graffiti being drawn
---@field retryAfter number Client-side related if the texture doesn't load from URL
---@field url string?

---@param id number
---@return Graffiti?
function GetGraffiti(id) end
---@param id number
function RemoveGraffiti(id) end

--- Returns the runtime list of existing graffitis
---@return Graffiti[]
function GetGraffitiList() end

function UpdateGraffitiDiskData() end