
function GetItemInfos(source, item)
	local src = source
	local info = {}
	
	if (Config.Framework == "qbcore") then
		local Player = QBCore.Functions.GetPlayer(src)
		
		local ItemData = nil
		if (Config.InventoryType == 'qb') then
			ItemData = QBCore.Shared.Items[ItemData]
		elseif (Config.InventoryType == 'ox') then
			ItemData = exports[Config.InventoryName]:Items()[ItemData]
		end
		
		if ItemData then
			if ItemData["name"] == "id_card" then
				info.citizenid = Player.PlayerData.citizenid
				info.firstname = Player.PlayerData.charinfo.firstname
				info.lastname = Player.PlayerData.charinfo.lastname
				info.birthdate = Player.PlayerData.charinfo.birthdate
				info.gender = Player.PlayerData.charinfo.gender
				info.nationality = Player.PlayerData.charinfo.nationality
			elseif ItemData["name"] == "driver_license" then
				info.firstname = Player.PlayerData.charinfo.firstname
				info.lastname = Player.PlayerData.charinfo.lastname
				info.birthdate = Player.PlayerData.charinfo.birthdate
				info.type = "Class C Driver License"
			elseif ItemData["type"] == "weapon" then
				amount = 1
				info.serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
				info.quality = 100
			elseif ItemData["name"] == "harness" then
				info.uses = 20
			elseif ItemData["name"] == "markedbills" then
				info.worth = math.random(5000, 10000)
			elseif ItemData["name"] == "printerdocument" then
				info.url = "https://cdn.discordapp.com/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png"
			end
		end
	end
	
	return info
end