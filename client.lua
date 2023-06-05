ESX = exports["es_extended"]:getSharedObject()


curGarage = nil
vehicle = nil
rgb = {}
spawnedVehs = {}
curVehName = ""

Citizen.CreateThread(function()
    SetEntityVisible(PlayerPedId(), 1)
    Citizen.Wait(0)
end)

-- Initialize vehicle properties
for k, va in pairs(Config.Vehicles) do
    for i, v in pairs(Config.Vehicles[k]) do
        if k == "super" then
            v.fuel = math.random(80, 100)
            v.consumption = 3
            v.trunk = Config.TrunkCapacity
        elseif k == "vans" then
            v.fuel = math.random(80, 100)
            v.consumption = 2
            v.trunk = Config.TrunkVanCapacity
        else
            v.fuel = math.random(80, 100)
            v.consumption = 1
            v.trunk = Config.TrunkCapacity
        end
    end
end

-- Create blips for shops
for i, v in pairs(Config.Shops) do
    blip = AddBlipForCoord(v.coord.x, v.coord.y, v.coord.z)
    SetBlipSprite(blip, 225)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(v.name)
    EndTextCommandSetBlipName(blip)
end

-- Create NPCs and interaction zones for shops
if Config.type == "ox_target" then
Citizen.CreateThread(function()
    
    sleepThread = 2000
    PlayerData = ESX.GetPlayerData()
    plyCoords = GetEntityCoords(PlayerPedId())
    
    for k,v in pairs(Config.Shops) do
        local options = {
            {
                icon = v.icon,
                label = v.name,
                distance = 10.5,
                onSelect = function(data)
                    initGarage(k)
                end,
                canInteract = function(entity, distance, coords, name, bone)
                    return not IsEntityDead(entity)
                end
            }
        }
        
        Citizen.CreateThread(function()
            for i = 1, #Config.NpcPosizioneAutosalone, 1 do
                if not HasModelLoaded(Config.NpcPosizioneAutosalone[i].modelloNpc) then
                    RequestModel(Config.NpcPosizioneAutosalone[i].modelloNpc)
                    while not HasModelLoaded(Config.NpcPosizioneAutosalone[i].modelloNpc) do
                        Citizen.Wait(5)
                    end
                end
                npc = CreatePed(4, Config.NpcPosizioneAutosalone[i].modelloNpc, Config.NpcPosizioneAutosalone[i].posizioneNpc, false, true)
                FreezeEntityPosition(npc, true)
                SetEntityInvincible(npc, true)
                SetBlockingOfNonTemporaryEvents(npc, true)
        
                exports.ox_target:addLocalEntity(npc, options)
            end
        end)
    end
end)
end

if Config.type == "marker" then
Citizen.CreateThread(function()
        sleepThread = 2000
        PlayerData = ESX.GetPlayerData()
        plyCoords = GetEntityCoords(PlayerPedId())
        
        for k,v in pairs(Config.Shops) do
            TriggerEvent('gridsystem:registerMarker', {
                name = 'inventario',
                pos = v.coord,
                type = 22,
                color = { r = 0, g = 0, b = 255 },
                scale = vector3(0.25, 0.25, 0.25),
                size = vector3(1.5,1.5,1.5),
                control = 'E',
                msg = '[E] - Autosalone',
                action = function()
                    initGarage(k)
                end
            })
        end
    end)
end


cam = nil

function initGarage(x)
    curGarage = Config.Shops[x]
    SetEntityVisible(PlayerPedId(), 0)
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    SetCamCoord(cam, curGarage.camCoord)
    SetCamRot(cam, curGarage.camRot, 2)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1)
    SendNUIMessage({ action = "load", garage = curGarage })
    SetNuiFocus(1, 1)
    DisplayRadar(0)
end

function destroyCam()
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
        RenderScriptCams(false, true, 1)
        cam = nil
    end
end

RegisterNUICallback("close", function(data, cb)
    SetEntityCoords(PlayerPedId(), curGarage.coord)
    DisplayRadar(1)
    SetNuiFocus(0, 0)
    destroyCam()
    SetEntityVisible(PlayerPedId(), 1)
    deleteLastCar()
end)

RegisterNUICallback("testdrive", function(data, cb)
    SetNuiFocus(0, 0)
    SetEntityVisible(PlayerPedId(), 1)
    destroyCam()
    startTestDrive()
end)

isTestDriving = false

function startTestDrive(dealer_object)
    if isTestDriving then
        return
    end
    if vehicle and DoesEntityExist(vehicle) then
        FreezeEntityPosition(vehicle, false)
        SetVehicleUndriveable(vehicle, false)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetPedCoordsKeepVehicle(PlayerPedId(), Config.TestDrive.coords)
        SendNUIMessage({ action = "startTest" })
    end
    local finished = nil
    CreateThread(function()
        local start = GetGameTimer() / 1000
        while GetGameTimer() / 1000 - start < Config.TestDrive.seconds and DoesEntityExist(vehicle) and not IsEntityDead(PlayerPedId()) do
            if #(GetEntityCoords(PlayerPedId()) - Config.TestDrive.coords) > Config.TestDrive.range then
                SetPedCoordsKeepVehicle(PlayerPedId(), Config.TestDrive.coords)
            end
            if GetVehiclePedIsIn(PlayerPedId(), false) == 0 and DoesEntityExist(vehicle) then
                SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
            end
            Wait(1000)
        end
        SetPedCoordsKeepVehicle(PlayerPedId(), curGarage.carSpawnCoord)
        FreezeEntityPosition(vehicle, true)
        SetVehicleUndriveable(vehicle, true)
        ClearPedTasksImmediately(PlayerPedId())
        SetEntityCoords(PlayerPedId(), curGarage.coord)
        finished = true
        SendNUIMessage({ action = "stopTest" })
        deleteLastCar()
    end)
    while finished == nil or not finished do
        Wait(0)
    end
    return
end




RegisterNUICallback("moveright", function(data)
    moveCarRight(2)
end)

RegisterNUICallback("moveleft", function(data)
    moveCarLeft(2)
end)

RegisterNUICallback("buy", function(data, cb)
    bank = data.bank
    local PlayerPed = PlayerPedId()
    print(curVehName)
    local veh = getVehicleFromName(curVehName)
    print(ESX.DumpTable(veh))
    ESX.TriggerServerCallback("Config-vehicleshop:checkPrice", function(pg)
        if pg == true then
            Citizen.CreateThread(function()
                RequestModel(GetHashKey(veh.name))
                while not HasModelLoaded(GetHashKey(veh.name)) do
                    Wait(1000)
                end
                local xVehicle = CreateVehicle(veh.name, curGarage.deliveryCoord, true, false)
                SetVehicleNumberPlateText(xVehicle, GetVehicleNumberPlateText(vehicle))
                SetVehicleCustomPrimaryColour(xVehicle, tonumber(rgb.r), tonumber(rgb.g), tonumber(rgb.b))
                SetVehicleCustomSecondaryColour(xVehicle, tonumber(rgb.r), tonumber(rgb.g), tonumber(rgb.b))
                SetPedIntoVehicle(PlayerPed, xVehicle, -1)
                Wait(500)
                TriggerServerEvent('Config-vehicleshop:givecar', ESX.Game.GetVehicleProperties(xVehicle))
                rgb = {}
                DisplayRadar(1)
                SetNuiFocus(0, 0)
                destroyCam()
                SetEntityVisible(PlayerPed, 1)
                deleteLastCar()
            end)
            Wait(500)
            cb(pg)
        else
            cb(false)
        end
    end, { price = veh.price, bank = bank })
end)

function getVehicleFromName(x)
    for k, va in pairs(curGarage.Vehicles) do
        for i, v in pairs(curGarage.Vehicles[k]) do
            if v.name == x then
                return v
            end
        end
    end
end

RegisterNUICallback("checkPlatePrice", function(data, cb)
    plate = data.plate
    ESX.TriggerServerCallback("Config-vehicleshop:checkPlatePrice", function(pg) cb(pg) if pg == true then SetVehicleNumberPlateText(vehicle, plate) end end, plate)
end)

function moveCarRight(value)
    if vehicle and DoesEntityExist(vehicle) then
        SetEntityRotation(vehicle, GetEntityRotation(vehicle) + vector3(0, 0, value), false, false, 2, false)
    end
end

function moveCarLeft(value)
    if vehicle and DoesEntityExist(vehicle) then
        SetEntityRotation(vehicle, GetEntityRotation(vehicle) - vector3(0, 0, value), false, false, 2, false)
    end
end

RegisterNUICallback("setcolour", function(data)
    if DoesEntityExist(vehicle) then
        rgb = data.rgb
        SetVehicleCustomPrimaryColour(vehicle, tonumber(data.rgb.r), tonumber(data.rgb.g), tonumber(data.rgb.b))
    end
end)

RegisterNUICallback("showCar", function(data, cb) showCar(data.name) end)

function deleteLastCar()
    for i, v in pairs(spawnedVehs) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
        table.remove(spawnedVehs, i)
    end
    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
        vehicle = nil
    end
end

function showCar(modelName)
    local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))

    Citizen.CreateThread(function()

        deleteLastCar()

        local modelHash = model
        modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

        if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
            RequestModel(modelHash)

            while not HasModelLoaded(modelHash) do
                Citizen.Wait(1)
            end
        end

        vehicle = CreateVehicle(model, curGarage.carSpawnCoord, false, false)
        curVehName = modelName
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        table.insert(spawnedVehs, vehicle)
        local timeout = 0

        SetEntityAsMissionEntity(vehicle, true, false)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
        SetVehRadioStation(vehicle, 'OFF')
        SetModelAsNoLongerNeeded(model)
        RequestCollisionAtCoord(curGarage.carSpawnCoord.x, curGarage.carSpawnCoord.y, curGarage.carSpawnCoord.z)

        while not HasCollisionLoadedAroundEntity(vehicle) and timeout < 2000 do
            Citizen.Wait(0)
            timeout = timeout + 1
        end

        if cb then
            cb(vehicle)
        end
    end)
end


function DrawText3D(x, y, z, text)
	SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 250
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end