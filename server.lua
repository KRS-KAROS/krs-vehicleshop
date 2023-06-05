ESX = exports["es_extended"]:getSharedObject()

 
-- Controlla il prezzo di una targa e verifica se il giocatore ha abbastanza soldi
ESX.RegisterServerCallback('krs-vehicleshop:checkPlatePrice', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    if tonumber(xPlayer.getQuantity("money")) >= 3000 then
        -- Verifica se la targa è già presente nel database degli veicoli posseduti
        cardata = MySQL.insert.await("SELECT plate FROM owned_vehicles WHERE plate='"..plate.."' ", {})
        if #cardata == 0 then
            -- Se la targa non è presente, restituisce true al client e rimuove 3000 soldi dal giocatore
            cb(true)
            xPlayer.removeInventoryItem("money", 3000)
        end
    else
        -- Se il giocatore non ha abbastanza soldi, mostra una notifica
        xPlayer.showNotification('Non hai abbastanza soldi')
    end
end)

-- Imposta lo stato di un veicolo di lavoro
RegisterNetEvent('krs-vehicleshop:setJobVehicleState')
AddEventHandler('krs-vehicleshop:setJobVehicleState', function(plate, state)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Aggiorna lo stato del veicolo nel database degli veicoli posseduti
    MySQL.update.await('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
        ['@stored'] = state,
        ['@plate'] = plate,
        ['@job'] = xPlayer.job.name
    }, function(rowsChanged)
        if rowsChanged == 0 then
            -- Se nessuna riga viene modificata, stampa un avviso nella console indicando un possibile exploit del garage
            print(('[krs-vehicleshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
        end
    end)
end)

-- Recupera i veicoli di lavoro di un giocatore
ESX.RegisterServerCallback('krs-vehicleshop:retrieveJobVehicles', function(source, cb, type)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Recupera i veicoli di lavoro del giocatore dal database degli veicoli posseduti
    MySQL.query.await('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
        ['@owner'] = xPlayer.identifier,
        ['@type'] = type,
        ['@job'] = xPlayer.job.name
    }, function(result)
        cb(result)
    end)
end)

-- Verifica se una targa è già in uso
ESX.RegisterServerCallback('krs-vehicleshop:isPlateTaken', function(source, cb, plate)
    -- Controlla se la targa è presente nel database degli veicoli posseduti
    MySQL.query.await('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        -- Restituisce true se la targa è già in uso, altrimenti false
        cb(result[1] ~= nil)
    end)
end)

-- Verifica il prezzo di un veicolo e controlla se il giocatore ha abbastanza soldi
ESX.RegisterServerCallback('krs-vehicleshop:checkPrice', function(source, cb, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = "money"

    if data.bank == true then
        item = "bank"
    end

    local quantity = xPlayer.getAccount(item).money

    if quantity >= data.price then
        -- Rimuove il prezzo dal conto del giocatore se ha abbastanza soldi e restituisce true al client
        xPlayer.removeAccountMoney(item, data.price)

        if xPlayer.getAccount(item).money == (quantity - data.price) then
            cb(true)
        end
    else
        -- Mostra una notifica al giocatore quando non ha abbastanza soldi per acquistare il veicolo
        xPlayer.showNotification("Non hai abbastanza soldi per acquistare questo veicolo.")
    end
end)


-- Assegna un veicolo al giocatore
RegisterNetEvent('krs-vehicleshop:givecar')
AddEventHandler('krs-vehicleshop:givecar', function(props)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    -- Inserisce il veicolo nel database degli veicoli posseduti
    MySQL.insert.await("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES ('"..Player.identifier.."', '"..props.plate.."', '"..json.encode(props).."')", {})
    local info = {model = props.model, plaka = props.plate}
end)
