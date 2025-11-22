function Client.Functions.__Thread_Elevator()
    CreateThread(function()
        local floorElevatorIdNear = nil
        local doors = Config.Elevator.coords.doors
        local door_model = Config.Elevator.door_model

        local function isNearAnyElevatorDoor(playerCoords)
            for floor, door in pairs(doors) do
                if #(playerCoords - door.left) < 1.5 or #(playerCoords - door.right) < 1.5 then
                    return true, floor
                end
            end
            return false, nil
        end

        local function SetDoorFreeze(door, freeze)
            if door then
                FreezeEntityPosition(door, freeze)
            end
        end

        local function SetDoorCoords(door, coords)
            if door then
                SetEntityCoords(door, coords.x, coords.y, coords.z, false, false, false, true)
            end
        end

        local function CheckElevatorDoor(floorElevatorId, free)
            local door = doors[floorElevatorId]
            if door then
                local doorLeft = GetClosestObjectOfType(door.left.x, door.left.y, door.left.z, 1.0, door_model, false,
                    false, false)
                local doorRight = GetClosestObjectOfType(door.right.x, door.right.y, door.right.z, 1.0, door_model, false,
                    false, false)

                SetDoorFreeze(doorLeft, free)
                SetDoorFreeze(doorRight, free)
                if free then
                    SetDoorCoords(doorLeft, door.left)
                    SetDoorCoords(doorRight, door.right)
                end
            end
        end

        local isElevatorNearby = false

        while Client.Player.inApartment and not Client.Player.inRoom do
            local sleep = 500
            local playerCoords = GetEntityCoords(cache.ped)
            local nearAnyElevatorDoor, floorElevatorIdNear = isNearAnyElevatorDoor(playerCoords)

            if nearAnyElevatorDoor then
                isElevatorNearby = true
                local elevator = nil

                if NetworkDoesEntityExistWithNetworkId(Client.ApartmentElevator.netId) then
                    if DoesEntityExist(NetToEnt(Client.ApartmentElevator.netId)) then
                        elevator = true
                    end
                end

                local free = not elevator or Client.ApartmentElevator.onMove or
                    Client.ApartmentElevator.floor ~= floorElevatorIdNear

                CheckElevatorDoor(floorElevatorIdNear, free)
            else
                if isElevatorNearby then
                    isElevatorNearby = false
                    CheckElevatorDoor(floorElevatorIdNear, false)
                end
            end

            Wait(sleep)
        end

        Client.Functions.DeleteElevatorTargets()
    end)
end

function Client.Functions.__Thread_Cameras()
    CreateThread(function()
        local cameras = {}
        if Client.Player.inApartment == -1 then
            cameras = Config.InteriorMloApart.cameras
        else
            cameras = Config.InteriorHotelCorridor.coords.cameras
        end
        local camId = 1
        local camCoords = cameras[camId]
        local camRot = vec3(0.0, 0.0, cameras[camId].w)
        local currentCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", vec3(camCoords), 0, 0, 0, Config.CCTV.FOV)

        local function InstructionButtonMessage(text)
            BeginTextCommandScaleformString("STRING")
            AddTextComponentScaleform(text)
            EndTextCommandScaleformString()
        end

        local function CreateInstuctionScaleform(scaleform)
            local scaleform = RequestScaleformMovie(scaleform)
            while not HasScaleformMovieLoaded(scaleform) do
                Wait(1)
            end
            PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
            PushScaleformMovieFunctionParameterInt(200)
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
            PushScaleformMovieFunctionParameterInt(2)
            ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(1, Config.CCTV.Controls.ZoomOut,
                true))
            ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(1, Config.CCTV.Controls.ZoomIn,
                true))
            InstructionButtonMessage(locale("game.cctv_zoom"))
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
            PushScaleformMovieFunctionParameterInt(1)
            ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(1, Config.CCTV.Controls.Right,
                true))
            ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(1, Config.CCTV.Controls.Left, true))
            InstructionButtonMessage(locale("game.cctv_next_camera"))
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
            PushScaleformMovieFunctionParameterInt(0)
            ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(1, Config.CCTV.Controls.Exit, true))
            InstructionButtonMessage(locale("game.cctv_exit"))
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
            PushScaleformMovieFunctionParameterInt(0)
            PushScaleformMovieFunctionParameterInt(0)
            PushScaleformMovieFunctionParameterInt(0)
            PushScaleformMovieFunctionParameterInt(80)
            PopScaleformMovieFunctionVoid()

            return scaleform
        end

        local function ChangeCamera(id)
            camCoords = cameras[id]
            camRot = vec3(0.0, 0.0, cameras[camId].w)
            ClearFocus()
            SetCamCoord(currentCam, vec3(camCoords))
            SetCamRot(currentCam, vec3(camRot), 2)
            SetFocusArea(vec3(camCoords), 0.0, 0.0, 0.0)
            PointCamAtCoord(currentCam, vec3(camCoords))
            RenderScriptCams(true, false, 1, true, false)
        end

        local function CheckCamRotationInput(cam)
            local rightAxisX = GetDisabledControlNormal(0, 220)
            local rightAxisY = GetDisabledControlNormal(0, 221)
            local oldRotation = GetCamRot(cam, 2)
            local rotation = GetCamRot(cam, 2)

            if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
                local new_z = rotation.z + rightAxisX * -1.0 * (2.0) * (4.0 + 0.1)
                local minRotation = -20.5
                local maxRotation = 20.0
                local sensitivity = 2.0
                local axisMultiplier = -1.0
                local additionalMultiplier = 4.0
                local clampMargin = 0.1
                local new_x = math.max(
                    math.min(
                        maxRotation,
                        rotation.x + rightAxisY * axisMultiplier * sensitivity * (additionalMultiplier + clampMargin)
                    ),
                    minRotation
                )
                if oldRotation.z ~= new_z or oldRotation.x ~= new_x then
                    SetCamRot(cam, new_x, 0.0, new_z, 2)
                end
            end
        end

        SetNuiFocus(false, false)
        local PlayerPed = cache.ped
        ClearFocus()
        SetCamRot(currentCam, vec3(camRot), 2)
        SetCamActive(currentCam, true)
        SetFocusArea(vec3(camCoords), 0.0, 0.0, 0.0)
        PointCamAtCoord(currentCam, vec3(camCoords))
        RenderScriptCams(true, false, 1, true, false)
        SetTimecycleModifier("scanline_cam_cheap")
        SetTimecycleModifierStrength(2.0)
        DisableAllControlActions(0)
        Wait(1000)
        DoScreenFadeIn(500)
        RequestAmbientAudioBank("Phone_Soundset_Franklin", 0, 0)
        RequestAmbientAudioBank("HintCamSounds", 0, 0)
        local instructions = CreateInstuctionScaleform("instructional_buttons")

        while Client.Player.inCameraMode do
            Wait(5)
            DisableAllControlActions(0)
            HideHudAndRadarThisFrame()

            CheckCamRotationInput(currentCam)

            DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)

            if IsDisabledControlJustPressed(0, Config.CCTV.Controls.Left) and camId > 1 then
                camId = camId - 1
                ChangeCamera(camId)
            end

            if IsDisabledControlJustPressed(0, Config.CCTV.Controls.Right) and camId < #cameras then
                camId = camId + 1
                ChangeCamera(camId)
            end

            if IsDisabledControlPressed(0, Config.CCTV.Controls.ZoomOut) and GetCamFov(currentCam) < Config.CCTV.MinZoom then
                SetCamFov(currentCam, GetCamFov(currentCam) + 1.0)
            end

            if IsDisabledControlPressed(0, Config.CCTV.Controls.ZoomIn) and GetCamFov(currentCam) > Config.CCTV.MaxZoom then
                SetCamFov(currentCam, GetCamFov(currentCam) - 1.0)
            end

            if IsDisabledControlJustPressed(0, Config.CCTV.Controls.Exit) then
                DoScreenFadeOut(500)
                while not IsScreenFadedOut() do Wait(100) end
                Client.Functions.CloseCameraMode()
                Wait(1000)
                DoScreenFadeIn(500)
                break
            end
        end
    end)
end

function Client.Functions.Thread_IntoCorridor()
    Wait(1000)
    Client.Functions.GetSoldRooms(Client.Player.inApartment)
    Client.Functions.CheckElevator()
    if Config.InteriorHotelCorridor.interactionType == "target" then
        Client.Functions.CreateCorridorDoorTargets()
    else
        CreateThread(function()
            local isDrawTextUIOpen = false
            local roomIdNear = nil
            local xPlayerIdentity = Client.Functions.GetPlayerIdentifier()
            local function showUI(message)
                if isDrawTextUIOpen then return end
                isDrawTextUIOpen = true
                Utils.Functions.showUI(message)
            end

            local function checkRoomStatus(roomId)
                for _, value in pairs(Client.Player.rooms) do
                    if value.room_id == roomId and value.apartment_id == Client.Player.inApartment then
                        return true
                    end
                end
                for _, value in pairs(Client.SoldRooms) do
                    if value.room_id == roomId and value.apartment_id == Client.Player.inApartment then
                        if value.owner == xPlayerIdentity then
                            return true
                        end
                        for _, permission in pairs(value.permissions) do
                            if permission.user == xPlayerIdentity then
                                return true
                            end
                        end
                    end
                end
                return false
            end

            local function isNearAnyRoomDoor(playerCoords)
                for _, value in pairs(Config.Rooms) do
                    if #(playerCoords - vec3(value.coords.door)) < 1.0 then
                        roomIdNear = value.room_id
                        return true
                    end
                end
                return false
            end

            while Client.Player.inApartment and not Client.Player.inRoom do
                local sleep = 500
                local playerCoords = GetEntityCoords(cache.ped)

                if isNearAnyRoomDoor(playerCoords) then
                    if checkRoomStatus(roomIdNear) then
                        sleep = 1
                        showUI("[E] " .. locale("game.get_in_the_room", roomIdNear))
                        if IsControlJustPressed(0, 38) then
                            Client.Functions.GetIntoApartmentRoom(Client.Player.inApartment, roomIdNear)
                            break
                        end
                    else
                        if Config.UnauthorizedEntryIntoRooms.active then
                            sleep = 1
                            showUI("[H] " .. locale("game.force_door", roomIdNear))
                            if IsControlJustPressed(0, 74) then -- force [H]
                                Client.Functions.UnauthorizedEntry(Client.Player.inApartment, roomIdNear)
                                Wait(1500)
                            end
                        end
                    end
                elseif #(playerCoords - vec3(Config.InteriorHotelCorridor.coords.mainDoor)) < 1.25 then
                    sleep = 1
                    showUI("[E] " .. locale("game.leave_apartment"))
                    if IsControlJustPressed(0, 38) then
                        Client.Functions.LeaveApartmentCorridor(Client.Player.inApartment)
                        break
                    end
                elseif isDrawTextUIOpen then
                    isDrawTextUIOpen = false
                    Utils.Functions.HideTextUI()
                end
                Wait(sleep)
            end

            if isDrawTextUIOpen then
                Utils.Functions.HideTextUI()
            end
        end)
    end
    CreateThread(function()
        local xPlayerIdentity = Client.Functions.GetPlayerIdentifier()
        while Client.Player.inApartment and not Client.Player.inRoom do
            local sleep = 500
            local playerCoords = GetEntityCoords(cache.ped)
            for _, value in pairs(Client.SoldRooms) do
                local coords = Config.Rooms[value.room_id].coords.door
                local roomHeight = coords.z
                local playerHeight = playerCoords.z
                local heightDifference = math.abs(roomHeight - playerHeight)
                local dist = #(playerCoords - vec3(coords))
                if heightDifference <= 1.0 and dist < 10.0 and dist > 1.0 then
                    if value.apartment_id == Client.Player.inApartment then
                        if value.owner == xPlayerIdentity then
                            sleep = 1
                            Utils.Functions.DrawMarker(coords, 2)
                        else
                            for _, permission in pairs(value.permissions or {}) do
                                if permission.user == xPlayerIdentity then
                                    sleep = 1
                                    Utils.Functions.DrawMarker(coords, 2)
                                end
                            end
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

function Client.Functions.Thread_IntoRoom()
    Client.Functions.CreateRoomModifyTargets()
    CreateThread(function()
        local isDrawTextUIOpen = false
        local roomCoords = Config.InteriorHotelRoom.coords

        local function showUI(message)
            if isDrawTextUIOpen then return end
            isDrawTextUIOpen = true
            Utils.Functions.showUI(message)
        end
        while Client.Player.inRoom do
            local sleep = 500
            SetRainLevel(0.0)
            local playerCoords = GetEntityCoords(cache.ped)
            if #(playerCoords - roomCoords.door) <= 0.5 then
                sleep = 1
                showUI("[E] " .. locale("game.leave_room"))
                if IsControlJustPressed(0, 38) then
                    Client.Functions.LeaveApartmentRoom(Client.Player.inApartment, Client.Player.inRoom.room_id)
                    break
                end
            elseif isDrawTextUIOpen then
                isDrawTextUIOpen = false
                Utils.Functions.HideTextUI()
            end
            Wait(sleep)
        end
        if isDrawTextUIOpen then
            Utils.Functions.HideTextUI()
        end
        Client.Functions.DeleteRoomModifyTargets()
    end)
end

CreateThread(function()
    for _, apartment in pairs(Config.Apartments) do
        if apartment.blip.active then
            local coords = apartment.blip.coords or apartment.coords.enter
            Client.Functions.AddBlipForCoord(coords, apartment.blip)
        end
    end
    if Config.InteriorMloApart.active then
        local MloLobbyCoords = Config.InteriorMloApart.lobby.door_coords
        Client.Functions.AddBlipForCoord(MloLobbyCoords, {
            active = true,
            title = Config.InteriorMloApart.label,
            sprite = 476,
            color = 2,
            scale = 0.8,
        })
    end

    local function showUI(message)
        Utils.Functions.showUI(message)
    end

    local isWithinRange = false
    local isDrawTextUIOpen = false
    while true do
        local sleep = 1000
        if not Client.Player.inRoom then
            local playerCoords = GetEntityCoords(cache.ped)
            isWithinRange = false

            for key, apartment in pairs(Config.Apartments) do
                if #(playerCoords - vec3(apartment.coords.enter)) <= 1.5 then
                    if not IsNuiFocused() then
                        sleep = 5
                        isWithinRange = true
                        Client.Player.inApartment = key
                        local message = "[E] " .. locale("game.enterApartment") .. " - [H] " .. locale("game.openUI")
                        if not isDrawTextUIOpen and not IsNuiFocused() then
                            showUI(message)
                            isDrawTextUIOpen = true
                        end

                        if IsControlJustPressed(0, 38) then
                            Client.Functions.GetIntoApartmentCorridor(key)
                        elseif IsControlJustPressed(0, 74) then
                            Client.Functions.OpenTablet(key)
                        end
                    else
                        if isWithinRange then
                            isWithinRange = false
                        end
                    end
                end
            end

            if not isWithinRange and isDrawTextUIOpen then
                Utils.Functions.HideTextUI()
                isDrawTextUIOpen = false
            end
        end
        Wait(sleep)
    end
end)
