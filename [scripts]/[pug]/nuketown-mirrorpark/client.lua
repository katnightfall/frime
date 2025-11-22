-- This is all just for creating invisible walls and a very few visible walls
local function LoadModel(model)
    if HasModelLoaded(model) then return end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end
RegisterNetEvent("FullyDeleteEntitysNuketownMirrorPark", function(vehicle)
    local entity = vehicle
    NetworkRequestControlOfEntity(entity)
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    SetEntityAsMissionEntity(entity, true, true)
    local timeout = 2000
    while timeout > 0 and not IsEntityAMissionEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    if ( DoesEntityExist( entity ) ) then 
        DeleteEntity(entity)
        if ( DoesEntityExist( entity ) ) then     
            return false
        else 
            return true
        end
    else 
        return true
    end 
end)

local MirrorParkWallsToPlace = {}
local MirrorParkWalls = {
    {
        Target = {y = -738.9474487304688, z = 66.2016372680664, x = 1399.5174560546876},
        Business = "criminal",
        Feature = "props",
        Heading = 320.0,
        PedCoords = {y = -738.9474487304688, z = 66.2016372680664, x = 1399.5174560546876},
        VisibleWall = true,
        UsedProp = "prop_const_fence01a"
    },
    {
        Target = {y = -741.3062744140625, z = 65.72928619384766, x = 1401.09619140625},
        Business = "criminal",
        Feature = "props",
        Heading = 275.0,
        PedCoords = {y = -741.3062744140625, z = 65.72928619384766, x = 1401.09619140625},
        VisibleWall = true,
        UsedProp = "prop_const_fence01a"
    },
    {
        Target = {y = -755.1216430664063, z = 66.19033813476563, x = 1368.000244140625},
        Business = "criminal",
        Feature = "props",
        Heading = 85.0,
        PedCoords = {y = -755.1216430664063, z = 66.19033813476563, x = 1368.000244140625},
        VisibleWall = true,
        UsedProp = "imp_prop_impexp_boxwood_01"
    },
    {
        Target = {y = -732.79150390625, z = 66.06926727294922, x = 1384.3809814453126},
        Business = "criminal",
        Feature = "props",
        Heading = 50.0,
        PedCoords = {y = -732.79150390625, z = 66.06926727294922, x = 1384.3809814453126},
        VisibleWall = true,
        UsedProp = "imp_prop_impexp_boxwood_01"
    },
    {
        Business = "criminal",
        Target = {x = 1356.6815185546876, y = -725.3301391601563, z = 66.18817138671875},
        UsedProp = "prop_barrier_work06a",
        Heading = 355.0,
        PedCoords = {x = 1356.6815185546876, y = -725.3301391601563, z = 66.18817138671875},
        VisibleWall = true,
        Feature = "props"
    },
    {
        Heading = 250.0,
        Target = {x = 1371.0621337890626, z = 68.4391098022461, y = -745.6619262695313},
        PedCoords = {x = 1371.0621337890626, z = 68.4391098022461, y = -745.6619262695313},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 50.0,
        Target = {x = 1373.854248046875, z = 67.04574584960938, y = -723.1959838867188},
        PedCoords = {x = 1373.854248046875, z = 67.04574584960938, y = -723.1959838867188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 5.0,
        Target = {x = 1370.4871826171876, z = 67.04574584960938, y = -724.7061157226563},
        PedCoords = {x = 1370.4871826171876, z = 67.04574584960938, y = -724.7061157226563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 5.0,
        Target = {x = 1366.4847412109376, z = 67.04574584960938, y = -725.0050048828125},
        PedCoords = {x = 1366.4847412109376, z = 67.04574584960938, y = -725.0050048828125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 5.0,
        Target = {x = 1362.4775390625, z = 67.04574584960938, y = -725.3194580078125},
        PedCoords = {x = 1362.4775390625, z = 67.04574584960938, y = -725.3194580078125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 355.0,
        Target = {x = 1358.51416015625, z = 67.04574584960938, y = -725.2201538085938},
        PedCoords = {x = 1358.51416015625, z = 67.04574584960938, y = -725.2201538085938},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 355.0,
        Target = {x = 1354.514404296875, z = 67.04574584960938, y = -724.80322265625},
        PedCoords = {x = 1354.514404296875, z = 67.04574584960938, y = -724.80322265625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 80.0,
        Target = {x = 1354.87744140625, z = 66.2011489868164, y = -726.8097534179688},
        PedCoords = {x = 1354.87744140625, z = 66.2011489868164, y = -726.8097534179688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 80.0,
        Target = {x = 1354.0013427734376, z = 66.09933471679688, y = -730.682373046875},
        PedCoords = {x = 1354.0013427734376, z = 66.09933471679688, y = -730.682373046875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 75.0,
        Target = {x = 1353.1331787109376, z = 66.21841430664063, y = -734.5569458007813},
        PedCoords = {x = 1353.1331787109376, z = 66.21841430664063, y = -734.5569458007813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 65.0,
        Target = {x = 1351.791259765625, z = 66.28099822998047, y = -738.239501953125},
        PedCoords = {x = 1351.791259765625, z = 66.28099822998047, y = -738.239501953125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 155.0,
        Target = {x = 1352.562744140625, z = 67.04574584960938, y = -741.1505737304688},
        PedCoords = {x = 1352.562744140625, z = 67.04574584960938, y = -741.1505737304688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 155.0,
        Target = {x = 1356.1663818359376, z = 67.04574584960938, y = -742.8565673828125},
        PedCoords = {x = 1356.1663818359376, z = 67.04574584960938, y = -742.8565673828125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 150.0,
        Target = {x = 1359.6724853515626, z = 67.04574584960938, y = -744.7389526367188},
        PedCoords = {x = 1359.6724853515626, z = 67.04574584960938, y = -744.7389526367188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 110.0,
        Target = {x = 1361.6627197265626, z = 66.9383316040039, y = -747.0908203125},
        PedCoords = {x = 1361.6627197265626, z = 66.9383316040039, y = -747.0908203125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1362.1571044921876, z = 66.19033813476563, y = -750.9534912109375},
        PedCoords = {x = 1362.1571044921876, z = 66.19033813476563, y = -750.9534912109375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1362.2259521484376, z = 69.23875427246094, y = -750.9678344726563},
        PedCoords = {x = 1362.2259521484376, z = 69.23875427246094, y = -750.9678344726563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 180.0,
        Target = {x = 1362.251220703125, z = 66.22737121582031, y = -753.885986328125},
        PedCoords = {x = 1362.251220703125, z = 66.22737121582031, y = -753.885986328125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 180.0,
        Target = {x = 1362.2581787109376, z = 69.28305053710938, y = -753.8160400390625},
        PedCoords = {x = 1362.2581787109376, z = 69.28305053710938, y = -753.8160400390625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 65.0,
        Target = {x = 1351.804443359375, z = 69.3481216430664, y = -738.3766479492188},
        PedCoords = {x = 1351.804443359375, z = 69.3481216430664, y = -738.3766479492188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 75.0,
        Target = {x = 1353.1466064453126, z = 69.29910278320313, y = -734.7766723632813},
        PedCoords = {x = 1353.1466064453126, z = 69.29910278320313, y = -734.7766723632813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 80.0,
        Target = {x = 1354.026123046875, z = 69.13481140136719, y = -730.9444580078125},
        PedCoords = {x = 1354.026123046875, z = 69.13481140136719, y = -730.9444580078125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 80.0,
        Target = {x = 1354.91357421875, z = 69.12060546875, y = -727.0077514648438},
        PedCoords = {x = 1354.91357421875, z = 69.12060546875, y = -727.0077514648438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 235.0,
        Target = {x = 1383.7142333984376, z = 69.05388641357422, y = -719.299560546875},
        PedCoords = {x = 1383.7142333984376, z = 69.05388641357422, y = -719.299560546875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 320.0,
        Target = {x = 1382.61865234375, z = 69.66178894042969, y = -724.6091918945313},
        PedCoords = {x = 1382.61865234375, z = 69.66178894042969, y = -724.6091918945313},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 320.0,
        Target = {x = 1385.5567626953126, z = 69.7707748413086, y = -726.8541870117188},
        PedCoords = {x = 1385.5567626953126, z = 69.7707748413086, y = -726.8541870117188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 145.0,
        Target = {x = 1386.3487548828126, z = 69.61261749267578, y = -718.9229125976563},
        PedCoords = {x = 1386.3487548828126, z = 69.61261749267578, y = -718.9229125976563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 140.0,
        Target = {x = 1389.383056640625, z = 69.74124908447266, y = -721.2288208007813},
        PedCoords = {x = 1389.383056640625, z = 69.74124908447266, y = -721.2288208007813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 230.0,
        Target = {x = 1382.76953125, z = 70.29710388183594, y = -722.0099487304688},
        PedCoords = {x = 1382.76953125, z = 70.29710388183594, y = -722.0099487304688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 270.0,
        Target = {x = 1372.7259521484376, z = 68.80613708496094, y = -738.823974609375},
        PedCoords = {x = 1372.7259521484376, z = 68.80613708496094, y = -738.823974609375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 95.0,
        Target = {x = 1383.6995849609376, z = 68.8276596069336, y = -738.7688598632813},
        PedCoords = {x = 1383.6995849609376, z = 68.8276596069336, y = -738.7688598632813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 0.0,
        Target = {x = 1381.782470703125, z = 68.7436294555664, y = -740.0418701171875},
        PedCoords = {x = 1381.782470703125, z = 68.7436294555664, y = -740.0418701171875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 175.0,
        Target = {x = 1381.765380859375, z = 68.53620910644531, y = -737.5724487304688},
        PedCoords = {x = 1381.765380859375, z = 68.53620910644531, y = -737.5724487304688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 180.0,
        Target = {x = 1377.977294921875, z = 68.44383239746094, y = -737.4864501953125},
        PedCoords = {x = 1377.977294921875, z = 68.44383239746094, y = -737.4864501953125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 180.0,
        Target = {x = 1374.4635009765626, z = 68.52721405029297, y = -737.4287109375},
        PedCoords = {x = 1374.4635009765626, z = 68.52721405029297, y = -737.4287109375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 0.0,
        Target = {x = 1374.8194580078126, z = 68.71682739257813, y = -740.0390014648438},
        PedCoords = {x = 1374.8194580078126, z = 68.71682739257813, y = -740.0390014648438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 0.0,
        Target = {x = 1378.079833984375, z = 68.77804565429688, y = -740.0227661132813},
        PedCoords = {x = 1378.079833984375, z = 68.77804565429688, y = -740.0227661132813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 165.0,
        Target = {x = 1373.184326171875, z = 68.85062408447266, y = -745.3201293945313},
        PedCoords = {x = 1373.184326171875, z = 68.85062408447266, y = -745.3201293945313},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 345.0,
        Target = {x = 1372.349609375, z = 68.79222106933594, y = -747.1751708984375},
        PedCoords = {x = 1372.349609375, z = 68.79222106933594, y = -747.1751708984375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1376.0443115234376, z = 68.91686248779297, y = -720.562255859375},
        PedCoords = {x = 1376.0443115234376, z = 68.91686248779297, y = -720.562255859375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1378.3067626953126, z = 68.95722198486328, y = -717.28759765625},
        PedCoords = {x = 1378.3067626953126, z = 68.95722198486328, y = -717.28759765625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1380.5147705078126, z = 68.9790267944336, y = -714.0918579101563},
        PedCoords = {x = 1380.5147705078126, z = 68.9790267944336, y = -714.0918579101563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1382.792236328125, z = 69.05583953857422, y = -710.79541015625},
        PedCoords = {x = 1382.792236328125, z = 69.05583953857422, y = -710.79541015625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1388.1409912109376, z = 69.07343292236328, y = -703.07177734375},
        PedCoords = {x = 1388.1409912109376, z = 69.07343292236328, y = -703.07177734375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1385.0118408203126, z = 69.28009796142578, y = -707.9374389648438},
        PedCoords = {x = 1385.0118408203126, z = 69.28009796142578, y = -707.9374389648438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1386.440673828125, z = 69.2506332397461, y = -705.514404296875},
        PedCoords = {x = 1386.440673828125, z = 69.2506332397461, y = -705.514404296875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1390.4451904296876, z = 69.07215881347656, y = -699.8050537109375},
        PedCoords = {x = 1390.4451904296876, z = 69.07215881347656, y = -699.8050537109375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 55.0,
        Target = {x = 1392.6829833984376, z = 68.95732879638672, y = -696.6317138671875},
        PedCoords = {x = 1392.6829833984376, z = 68.95732879638672, y = -696.6317138671875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 335.0,
        Target = {x = 1394.970458984375, z = 68.96654510498047, y = -696.4762573242188},
        PedCoords = {x = 1394.970458984375, z = 68.96654510498047, y = -696.4762573242188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 335.0,
        Target = {x = 1398.4368896484376, z = 69.0423812866211, y = -698.1692504882813},
        PedCoords = {x = 1398.4368896484376, z = 69.0423812866211, y = -698.1692504882813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 335.0,
        Target = {x = 1402.0291748046876, z = 68.99307250976563, y = -700.0069580078125},
        PedCoords = {x = 1402.0291748046876, z = 68.99307250976563, y = -700.0069580078125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 300.0,
        Target = {x = 1403.6640625, z = 69.0987777709961, y = -701.9009399414063},
        PedCoords = {x = 1403.6640625, z = 69.0987777709961, y = -701.9009399414063},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 310.0,
        Target = {x = 1406.2047119140626, z = 69.03494262695313, y = -704.8449096679688},
        PedCoords = {x = 1406.2047119140626, z = 69.03494262695313, y = -704.8449096679688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 300.0,
        Target = {x = 1403.8060302734376, z = 71.82984924316406, y = -702.28662109375},
        PedCoords = {x = 1403.8060302734376, z = 71.82984924316406, y = -702.28662109375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 320.0,
        Target = {x = 1406.083984375, z = 71.74644470214844, y = -704.8098754882813},
        PedCoords = {x = 1406.083984375, z = 71.74644470214844, y = -704.8098754882813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 310.0,
        Target = {x = 1408.6016845703126, z = 69.21266174316406, y = -707.4972534179688},
        PedCoords = {x = 1408.6016845703126, z = 69.21266174316406, y = -707.4972534179688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 325.0,
        Target = {x = 1409.8531494140626, z = 69.06660461425781, y = -708.416259765625},
        PedCoords = {x = 1409.8531494140626, z = 69.06660461425781, y = -708.416259765625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 325.0,
        Target = {x = 1413.0966796875, z = 69.1192626953125, y = -710.7959594726563},
        PedCoords = {x = 1413.0966796875, z = 69.1192626953125, y = -710.7959594726563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 325.0,
        Target = {x = 1416.3505859375, z = 69.16474914550781, y = -713.1834106445313},
        PedCoords = {x = 1416.3505859375, z = 69.16474914550781, y = -713.1834106445313},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 325.0,
        Target = {x = 1418.9197998046876, z = 69.21463012695313, y = -715.0667114257813},
        PedCoords = {x = 1418.9197998046876, z = 69.21463012695313, y = -715.0667114257813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 240.0,
        Target = {x = 1418.0411376953126, z = 68.9555435180664, y = -716.2001342773438},
        PedCoords = {x = 1418.0411376953126, z = 68.9555435180664, y = -716.2001342773438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 230.0,
        Target = {x = 1415.51025390625, z = 68.99637603759766, y = -719.368408203125},
        PedCoords = {x = 1415.51025390625, z = 68.99637603759766, y = -719.368408203125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 230.0,
        Target = {x = 1413.079833984375, z = 69.05860900878906, y = -722.410888671875},
        PedCoords = {x = 1413.079833984375, z = 69.05860900878906, y = -722.410888671875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 235.0,
        Target = {x = 1410.71826171875, z = 69.19025421142578, y = -725.3758544921875},
        PedCoords = {x = 1410.71826171875, z = 69.19025421142578, y = -725.3758544921875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 235.0,
        Target = {x = 1408.3001708984376, z = 69.13172912597656, y = -728.5498046875},
        PedCoords = {x = 1408.3001708984376, z = 69.13172912597656, y = -728.5498046875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 230.0,
        Target = {x = 1406.0775146484376, z = 69.11864471435547, y = -731.4671020507813},
        PedCoords = {x = 1406.0775146484376, z = 69.11864471435547, y = -731.4671020507813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 230.0,
        Target = {x = 1403.716552734375, z = 69.0406265258789, y = -734.5656127929688},
        PedCoords = {x = 1403.716552734375, z = 69.0406265258789, y = -734.5656127929688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 230.0,
        Target = {x = 1402.154052734375, z = 69.06832885742188, y = -737.0341796875},
        PedCoords = {x = 1402.154052734375, z = 69.06832885742188, y = -737.0341796875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 180.0,
        Target = {x = 1400.2286376953126, z = 69.0545883178711, y = -737.2108154296875},
        PedCoords = {x = 1400.2286376953126, z = 69.0545883178711, y = -737.2108154296875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 315.0,
        Target = {x = 1399.3536376953126, z = 69.12854766845703, y = -738.9011840820313},
        PedCoords = {x = 1399.3536376953126, z = 69.12854766845703, y = -738.9011840820313},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 270.0,
        Target = {x = 1401.0596923828126, z = 68.69156646728516, y = -741.6904907226563},
        PedCoords = {x = 1401.0596923828126, z = 68.69156646728516, y = -741.6904907226563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 170.0,
        Target = {x = 1385.5069580078126, z = 69.279052734375, y = -758.3818969726563},
        PedCoords = {x = 1385.5069580078126, z = 69.279052734375, y = -758.3818969726563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1387.21044921875, z = 68.87415313720703, y = -760.4035034179688},
        PedCoords = {x = 1387.21044921875, z = 68.87415313720703, y = -760.4035034179688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 265.0,
        Target = {x = 1394.2711181640626, z = 68.94708251953125, y = -765.22265625},
        PedCoords = {x = 1394.2711181640626, z = 68.94708251953125, y = -765.22265625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 265.0,
        Target = {x = 1393.987060546875, z = 69.11559295654297, y = -769.1454467773438},
        PedCoords = {x = 1393.987060546875, z = 69.11559295654297, y = -769.1454467773438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 265.0,
        Target = {x = 1393.7027587890626, z = 69.15977478027344, y = -773.072998046875},
        PedCoords = {x = 1393.7027587890626, z = 69.15977478027344, y = -773.072998046875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 265.0,
        Target = {x = 1393.4146728515626, z = 69.24958038330078, y = -777.053466796875},
        PedCoords = {x = 1393.4146728515626, z = 69.24958038330078, y = -777.053466796875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 265.0,
        Target = {x = 1393.1373291015626, z = 69.3163070678711, y = -780.8844604492188},
        PedCoords = {x = 1393.1373291015626, z = 69.3163070678711, y = -780.8844604492188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 265.0,
        Target = {x = 1392.8499755859376, z = 69.36981964111328, y = -784.8544311523438},
        PedCoords = {x = 1392.8499755859376, z = 69.36981964111328, y = -784.8544311523438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 265.0,
        Target = {x = 1392.576904296875, z = 69.1995849609375, y = -788.6299438476563},
        PedCoords = {x = 1392.576904296875, z = 69.1995849609375, y = -788.6299438476563},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 175.0,
        Target = {x = 1390.7457275390626, z = 69.19104766845703, y = -788.8659057617188},
        PedCoords = {x = 1390.7457275390626, z = 69.19104766845703, y = -788.8659057617188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 175.0,
        Target = {x = 1386.6817626953126, z = 69.30655670166016, y = -788.4364013671875},
        PedCoords = {x = 1386.6817626953126, z = 69.30655670166016, y = -788.4364013671875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 175.0,
        Target = {x = 1384.7249755859376, z = 69.63404846191406, y = -788.2371215820313},
        PedCoords = {x = 1384.7249755859376, z = 69.63404846191406, y = -788.2371215820313},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 175.0,
        Target = {x = 1380.7242431640626, z = 69.062744140625, y = -787.7913818359375},
        PedCoords = {x = 1380.7242431640626, z = 69.062744140625, y = -787.7913818359375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 175.0,
        Target = {x = 1376.8026123046876, z = 69.1738510131836, y = -787.3925170898438},
        PedCoords = {x = 1376.8026123046876, z = 69.1738510131836, y = -787.3925170898438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 260.0,
        Target = {x = 1374.7374267578126, z = 69.10725402832031, y = -789.0993041992188},
        PedCoords = {x = 1374.7374267578126, z = 69.10725402832031, y = -789.0993041992188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 185.0,
        Target = {x = 1372.6993408203126, z = 69.05931091308594, y = -790.1318359375},
        PedCoords = {x = 1372.6993408203126, z = 69.05931091308594, y = -790.1318359375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 170.0,
        Target = {x = 1368.9173583984376, z = 69.20086669921875, y = -789.7306518554688},
        PedCoords = {x = 1368.9173583984376, z = 69.20086669921875, y = -789.7306518554688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 175.0,
        Target = {x = 1365.086181640625, z = 69.13516235351563, y = -789.324462890625},
        PedCoords = {x = 1365.086181640625, z = 69.13516235351563, y = -789.324462890625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 165.0,
        Target = {x = 1361.3233642578126, z = 69.18238830566406, y = -788.9254760742188},
        PedCoords = {x = 1361.3233642578126, z = 69.18238830566406, y = -788.9254760742188},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1360.996826171875, z = 69.21025848388672, y = -786.7923583984375},
        PedCoords = {x = 1360.996826171875, z = 69.21025848388672, y = -786.7923583984375},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1361.529296875, z = 69.27008819580078, y = -783.2266845703125},
        PedCoords = {x = 1361.529296875, z = 69.27008819580078, y = -783.2266845703125},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 80.0,
        Target = {x = 1362.0655517578126, z = 69.10640716552735, y = -779.6326904296875},
        PedCoords = {x = 1362.0655517578126, z = 69.10640716552735, y = -779.6326904296875},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 90.0,
        Target = {x = 1362.5828857421876, z = 69.08700561523438, y = -775.7649536132813},
        PedCoords = {x = 1362.5828857421876, z = 69.08700561523438, y = -775.7649536132813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 90.0,
        Target = {x = 1362.868896484375, z = 68.90843200683594, y = -772.0208129882813},
        PedCoords = {x = 1362.868896484375, z = 68.90843200683594, y = -772.0208129882813},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 90.0,
        Target = {x = 1363.0594482421876, z = 68.7824935913086, y = -769.5272827148438},
        PedCoords = {x = 1363.0594482421876, z = 68.7824935913086, y = -769.5272827148438},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 90.0,
        Target = {x = 1363.3399658203126, z = 68.90422058105469, y = -765.85400390625},
        PedCoords = {x = 1363.3399658203126, z = 68.90422058105469, y = -765.85400390625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1363.642333984375, z = 69.10187530517578, y = -761.8950805664063},
        PedCoords = {x = 1363.642333984375, z = 69.10187530517578, y = -761.8950805664063},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1363.9365234375, z = 69.06009674072266, y = -758.043212890625},
        PedCoords = {x = 1363.9365234375, z = 69.06009674072266, y = -758.043212890625},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 85.0,
        Target = {x = 1364.1248779296876, z = 69.05725860595703, y = -755.5744018554688},
        PedCoords = {x = 1364.1248779296876, z = 69.05725860595703, y = -755.5744018554688},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Heading = 90.0,
        Target = {x = 1361.4747314453126, y = -753.5780639648438, z = 66.27088928222656},
        PedCoords = {x = 1361.4747314453126, y = -753.5780639648438, z = 66.27088928222656},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Business = "criminal"
    },
    {
        Target = {z = 70.02494812011719, y = -725.1784057617188, x = 1357.23486328125},
        Feature = "props",
        Business = "criminal",
        Heading = 355.0,
        PedCoords = {z = 70.02494812011719, y = -725.1784057617188, x = 1357.23486328125},
        UsedProp = "prop_const_fence01a"
    },
    {
        Target = {z = 70.0597152709961, y = -725.5015258789063, x = 1361.1986083984376},
        UsedProp = "prop_const_fence01a",
        Feature = "props",
        Heading = 355.0,
        PedCoords = {z = 70.0597152709961, y = -725.5015258789063, x = 1361.1986083984376},
        Business = "criminal"
    },
    {
        Target = {z = 69.87971496582031, y = -725.2529907226563, x = 1364.0394287109376},
        UsedProp = "prop_const_fence01a",
        Business = "criminal",
        Heading = 10.0,
        PedCoords = {z = 69.87971496582031, y = -725.2529907226563, x = 1364.0394287109376},
        Feature = "props"
    },
    {
        Target = {z = 69.96235656738281, y = -724.9530639648438, x = 1367.8802490234376},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Heading = 360.0,
        PedCoords = {z = 69.96235656738281, y = -724.9530639648438, x = 1367.8802490234376},
        Business = "criminal"
    },
    {
        Target = {z = 69.96925354003906, y = -724.6798095703125, x = 1371.590087890625},
        Feature = "props",
        Business = "criminal",
        Heading = 10.0,
        PedCoords = {z = 69.96925354003906, y = -724.6798095703125, x = 1371.590087890625},
        UsedProp = "prop_const_fence01a"
    },
    {
        Target = {z = 70.06255340576172, y = -723.2113647460938, x = 1373.9326171875},
        UsedProp = "prop_const_fence01a",
        Feature = "props",
        Heading = 50.0,
        PedCoords = {z = 70.06255340576172, y = -723.2113647460938, x = 1373.9326171875},
        Business = "criminal"
    },
    {
        Target = {z = 69.871826171875, y = -747.1354370117188, x = 1361.7532958984376},
        UsedProp = "prop_const_fence01a",
        Business = "criminal",
        Heading = 105.0,
        PedCoords = {z = 69.871826171875, y = -747.1354370117188, x = 1361.7532958984376},
        Feature = "props"
    },
    {
        Target = {z = 69.99878692626953, y = -744.4896850585938, x = 1359.3804931640626},
        Feature = "props",
        UsedProp = "prop_const_fence01a",
        Heading = 150.0,
        PedCoords = {z = 69.99878692626953, y = -744.4896850585938, x = 1359.3804931640626},
        Business = "criminal"
    },
    {
        Target = {z = 70.06321716308594, y = -742.7146606445313, x = 1356.0274658203126},
        Feature = "props",
        Business = "criminal",
        Heading = 150.0,
        PedCoords = {z = 70.06321716308594, y = -742.7146606445313, x = 1356.0274658203126},
        UsedProp = "prop_const_fence01a"
    },
    {
        Target = {x = 1352.4251708984376, y = -741.00927734375, z = 70.05645751953125},
        UsedProp = "prop_const_fence01a",
        Feature = "props",
        Heading = 160.0,
        PedCoords = {x = 1352.4251708984376, y = -741.00927734375, z = 70.05645751953125},
        Business = "criminal"
    }
}

CreateThread(function()
    CreateThread(function()
        for _, i in pairs(MirrorParkWalls) do
            local Info = i
            ClosestObject = GetClosestObjectOfType(vector3(Info.Target.x,Info.Target.y,Info.Target.z), 5.0, GetHashKey(Info.UsedProp))
            if DoesEntityExist(ClosestObject) then
                TriggerEvent("FullyDeleteEntitysNuketownMirrorPark", ClosestObject)
            end
            MirrorParkWallsToPlace[#MirrorParkWallsToPlace+1] = {
                Prop = Info.UsedProp,
                Coords = Info.Target, 
                Heading = Info.Heading,
                Spawned = nil,
                Visible = Info.VisibleWall
            }
        end
        for k, v in pairs(MirrorParkWallsToPlace) do
            LoadModel(v.Prop)
            MirrorParkWallsToPlace[k].Spawned = CreateObject(GetHashKey(v.Prop), vector3(v.Coords.x,v.Coords.y,v.Coords.z))
            while not DoesEntityExist(MirrorParkWallsToPlace[k].Spawned) do Wait(100) end
            SetEntityHeading(MirrorParkWallsToPlace[k].Spawned, v.Heading)
            FreezeEntityPosition(MirrorParkWallsToPlace[k].Spawned, true)
            if MirrorParkWallsToPlace[k].Visible then
            else
                SetEntityVisible(MirrorParkWallsToPlace[k].Spawned, false)
            end
        end
    end)
end)