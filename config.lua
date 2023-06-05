Config = {}

Config.type = 'ox_target' --  Funzione per l'utilizzo sia [marker / ox_target]

-- Capacità del bagagliaio per veicoli normali
Config.TrunkCapacity = 18

-- Capacità del bagagliaio per furgoni
Config.TrunkVanCapacity = 50

-- Tabella dei veicoli
Config.Vehicles = {}

-- Configurazione degli autosalone
Config.Shops = {
    {
        
        
        name = "Autosalone", -- Nome dell'autosalone
      
        icon = 'fa-solid fa-car',   -- Icona dell'autosalone (puoi utilizzare icone FontAwesome)
       
        Vehicles = Config.Vehicles,  -- Veicoli disponibili presso l'autosalone
       
        bank = false,  -- Se l'acquisto richiede soldi dal conto in banca / true
     
        testDrive = true,  -- Se è possibile effettuare un test drive
        
        showroom = false, -- Se è presente una sala mostra veicoli / true
       
        editPlate = false,  -- Se è possibile modificare la targa dei veicoli
        
        coord = vector3(-35.8919, -1101.1692, 26.4223), -- Coordinate Respawn del Player
        
        camCoord = vector3(-51.5612, -1098.87, 27.202), -- Coordinate della telecamera per la visualizzazione dei veicoli
        
        camRot = vector3(-26.47, 0.0, -86.17), -- Rotazione della telecamera per la visualizzazione dei veicoli
        
        dist = 3.5, -- Distanza dal marker per l'apertura del menu dell'autosalone
        
        carSpawnCoord = vector4(-43.3238, -1098.67, 26.422, 30.605), -- Coordinate di spawn dei veicoli
      
        deliveryCoord = vector4(-48.3074, -1077.59, 26.787, 66.28)   -- Coordinate di consegna dei veicoli acquistati
    }
}

-- Configurazione del test drive
Config.TestDrive = {
   
    seconds = 45,  -- Durata del test drive in secondi
  
    coords  = vector3(-45.1907, -1078.7808, 26.6746),   -- Coordinate per il test drive
    
    range   = 1200 -- Distanza massima dal punto di partenza per il test drive
}

Config.NpcPosizioneAutosalone = {
  {
   modelloNpc = 'cs_siemonyetarian', -- https://docs.fivem.net/docs/game-references/ped-models/ --
   posizioneNpc = vector4(-33.9482, -1101.7188, 25.4223, 64.6280),
  }

}
  
-- Compacts Finito
Config.Vehicles["compacts"] = {

  { label = "Blista", name = "blista", price = 40000 },
  { label = "Brioso R/A", name = "brioso", price = 40000 },
  { label = "Brioso Classic", name = "brioso2", price = 40000 },
  { label = "Panto", name = "panto", price = 40000 },
  { label = "Prairie", name = "prairie", price = 40000 },
  { label = "Issi 2", name = "issi2", price = 40000 },

} 

-- Coupes Finito
Config.Vehicles["coupes"] = {

  { label = "Cognoscenti Cabrio", name = "cogcabrio", price = 40000 },
  { label = "Exemplar", name = "exemplar", price = 40000 },
  { label = "F620", name = "f620", price = 40000 },
  { label = "Felon", name = "felon", price = 40000 },
  { label = "Felon GT", name = "felon2", price = 40000 },
  { label = "Jackal", name = "jackal", price = 40000 },
  { label = "Sentinel", name = "sentinel", price = 40000 },
  { label = "Sentinel XS", name = "sentinel2", price = 40000 },
  { label = "Windsor", name = "windsor", price = 40000 },
  { label = "Windsor Drop", name = "windsor2", price = 40000 },
  { label = "Zion", name = "zion", price = 40000 },
  { label = "Zion Cabrio", name = "zion2", price = 40000 },
}

-- Moto Finito
Config.Vehicles["motorcycles"] = {

  { label = "Avarus", name = "avarus", price = 140000 },
  { label = "Bati 801", name = "bati", price = 150000 },
  { label = "Bati 801RR", name = "bati2", price = 150000 },
  { label = "Carbon RS", name = "carbonrs", price = 137200 },
  { label = "Daemon", name = "daemon", price = 138100 },
  { label = "Daemon High", name = "daemon2", price = 138100 },
  { label = "Defiler", name = "defiler", price = 138100 },
  { label = "Diablous S", name = "Diablous2", price = 150000 },
  { label = "Gargoyle", name = "gargoyle", price = 134000 },
  { label = "Hexer", name = "hexer", price = 125500 },
  { label = "Innovation", name = "innovation", price = 132000 },
  { label = "sanctus", name = "sanctus", price = 120000 },
  { label = "Akuma", name = "AKUMA", price = 250000 },
  { label = "Bagger", name = "bagger", price = 250000 },
  { label = "Cliffhanger", name = "cliffhanger", price = 250000 },
  { label = "Double T", name = "double", price = 250000 },
  { label = "Enduro", name = "enduro", price = 250000 },
  { label = "Esskey", name = "esskey", price = 250000 },
  { label = "Faggio", name = "faggio", price = 250000 },
  { label = "Vespa", name = "faggio2", price = 250000 },
  { label = "Hakuchou", name = "hakuchou", price = 250000 },
  { label = "Hakuchou Sport", name = "hakuchou2", price = 250000 },
  { label = "Manchez", name = "manchez", price = 250000 },
  { label = "Nemesis", name = "nemesis", price = 250000 },
  { label = "Nightblade", name = "nightblade", price = 250000 },
  { label = "PCJ-600", name = "pcj", price = 250000 },
  { label = "Ruffian", name = "ruffian", price = 250000 },
  { label = "Sanchez Sport", name = "sanchez2", price = 250000 },
  { label = "Shotaro Concept", name = "shotaro", price = 250000 },
  { label = "Sovereign", name = "sovereign", price = 250000 },
  { label = "Thrust", name = "thrust", price = 250000 },
  { label = "Vader", name = "vader", price = 250000 },
  { label = "Vortex", name = "vortex", price = 250000 },
  { label = "Woflsbane", name = "wolfsbane", price = 250000 },
  { label = "Zombie", name = "zombiea", price = 250000 },
  { label = "Zombie Luxuary", name = "zombieb", price = 250000 },

}

Config.Vehicles["bycycles"] = {
  
  { label = "BMX", name = "bmx", price = 1000 },
  { label = "Scorcher (velo)", name = "scorcher", price = 1000 },
  { label = "Tri bike (velo)", name = "tribike3", price = 1000 },
  { label = "Fixter (velo)", name = "fixter", price = 1000 },
  
} 

-- Muscle Finito
Config.Vehicles["muscle"] = {

  { label = "Blade", name = "blade", price = 45000 },
  { label = "Buccaneer", name = "buccaneer", price = 45000 },
  { label = "Buccaneer Rider", name = "buccaneer2", price = 45000 },
  { label = "Chino", name = "chino", price = 230000 },
  { label = "Chino Luxe", name = "chino2", price = 230000 },
  { label = "Coquette BlackFin", name = "coquette3", price = 230000 },
  { label = "Dominator", name = "dominator", price = 230000 },
  { label = "Dukes", name = "dukes", price = 230000 },
  { label = "Faction", name = "faction", price = 230000 },
  { label = "Faction Rider", name = "faction2", price = 230000 },
  { label = "Faction XL", name = "faction3", price = 230000 },
  { label = "Gauntlet", name = "gauntlet", price = 230000 },
  { label = "Hermes", name = "hermes", price = 120000 },
  { label = "Hotknife", name = "hotknife", price = 120000 },
  { label = "Hustler", name = "hustler", price = 120000 },
  { label = "Nightshade", name = "nightshade", price = 120000 },
  { label = "Phoenix", name = "phoenix", price = 120000 },
  { label = "Picador", name = "picador", price = 120000 },
  { label = "Ruiner 2", name = "ruiner2", price = 120000 },
  { label = "Sabre Turbo", name = "sabregt", price = 120000 },
  { label = "Sabre Turbo", name = "sabregt", price = 120000 },
  { label = "Sabregt", name = "sabregt2", price = 120000 },
  { label = "Slam Van", name = "slamvan3", price = 120000 },
  { label = "Tampa", name = "tampa", price = 120000 },
  { label = "Vigero", name = "vigero", price = 120000 },
  { label = "Virgo", name = "virgo", price = 120000 },
  { label = "Voodoo", name = "voodoo", price = 120000 },
  { label = "Yosemite", name = "yosemite", price = 120000 },


} 


-- Sports Finito
Config.Vehicles["sports"] = {

  { label = "Alpha", name = "alpha", price = 250000 }, 
  { label = "Banshee", name = "banshee", price = 250000 },
  { label = "Bestia GTS", name = "bestiagts", price = 250000 },
  { label = "Buffalo", name = "buffalo", price = 250000 },
  { label = "Buffalo S", name = "buffalo2", price = 250000 },
  { label = "Carbonizzare", name = "carbonizzare", price = 250000 },
  { label = "Comet", name = "comet2", price = 250000 },
  { label = "Comet 5", name = "comet5", price = 250000 },
  { label = "Elegy", name = "elegy2", price = 250000 },
  { label = "Furore GT", name = "furoregt", price = 250000 },
  { label = "Fusilade", name = "fusilade", price = 250000 },
  { label = "Jester", name = "jester", price = 250000 },
  { label = "Jester(Racecar)", name = "jester2", price = 250000 },
  { label = "Khamelion", name = "khamelion", price = 250000 },
  { label = "Kuruma", name = "kuruma", price = 250000 },
  { label = "Lynx", name = "lynx", price = 250000 },
  { label = "Mamba", name = "mamba", price = 250000 },
  { label = "Massacro", name = "massacro", price = 250000 },
  { label = "Massacro(Racecar)", name = "massacro2", price = 250000 },
  { label = "Neon", name = "neon", price = 250000 },
  { label = "9F", name = "ninef", price = 250000 },
  { label = "9F Cabrio", name = "ninef2", price = 250000 },
  { label = "Pariah", name = "pariah", price = 250000 },
  { label = "Raiden", name = "raiden", price = 250000 },
  { label = "Rapid GT", name = "rapidgt", price = 250000 },
  { label = "Rapid GT Convertible", name = "rapidgt2", price = 250000 },
  { label = "Revolter", name = "revolter", price = 250000 },
  { label = "Schafter V12", name = "schafter3", price = 250000 },
  { label = "Sentinel3", name = "sentinel3", price = 250000 },
  { label = "Seven 70", name = "seven70", price = 250000 },
  { label = "Streiter", name = "streiter", price = 250000 },
  { label = "Stromberg", name = "stromberg", price = 250000 },
  { label = "Sultan", name = "sultan", price = 250000 },
  { label = "Surano", name = "surano", price = 250000 },
  { label = "Tropos", name = "tropos", price = 250000 },
  { label = "Verlierer", name = "verlierer2", price = 250000 },
  

} 



-- Super Finito
Config.Vehicles["super"] = {

  { label = "Adder", name = "adder", price = 350000 },
  { label = "Autarch", name = "autarch", price = 350000 },
  { label = "Banshee 900R", name = "banshee2", price = 350000 },
  { label = "Bullet", name = "bullet", price = 350000 },
  { label = "Cheetah", name = "cheetah", price = 350000 },
  { label = "Cyclone", name = "cyclone", price = 350000 },
  { label = "Entity XF", name = "entityxf", price = 350000 },
  { label = "FMJ", name = "fmj", price = 350000 },
  { label = "Infernus", name = "infernus", price = 350000 },
  { label = "RE-7B", name = "le7b", price = 350000 },
  { label = "Oppressor", name = "oppressor", price = 350000 },
  { label = "Osiris", name = "osiris", price = 350000 },
  { label = "Pfister", name = "pfister811", price = 350000 },
  { label = "X80 Proto", name = "prototipo", price = 350000 },
  { label = "Reaper", name = "reaper", price = 350000 },
  { label = "SC 1", name = "sc1", price = 350000 },
  { label = "ETR1", name = "sheava", price = 350000 },
  { label = "Sultan RS", name = "sultanrs", price = 350000 },
  { label = "Turismo R", name = "turismor", price = 350000 },
  { label = "Tyrus", name = "tyrus", price = 350000 },
  { label = "Vacca", name = "vacca", price = 350000 },
  { label = "Visione", name = "visione", price = 350000 },
  { label = "Voltic", name = "voltic", price = 350000 },
  { label = "Voltic 2", name = "voltic2", price = 350000 },
  { label = "Zentorno", name = "zentorno", price = 350000 },
  

} 

-- Suvs Finito
Config.Vehicles["suvs"] = {

  { label = "Baller", name = "baller2", price = 370000 },
  { label = "Baller Sport", name = "baller3", price = 370000 },
  { label = "Cavalcade", name = "cavalcade2", price = 370000 },
  { label = "Contender", name = "contender", price = 370000 },
  { label = "Dubsta", name = "dubsta", price = 370000 },
  { label = "Dubsta Luxuary", name = "dubsta2", price = 370000 },
  { label = "Fhantom", name = "fq2", price = 370000 },
  { label = "Grabger", name = "granger", price = 370000 },
  { label = "Gresley", name = "gresley", price = 370000 },
  { label = "Huntley S", name = "huntley", price = 370000 },
  { label = "Landstalker", name = "landstalker", price = 370000 },
  { label = "Mesa", name = "mesa", price = 370000 },
  { label = "Mesa Trail", name = "mesa3", price = 370000 },
  { label = "Patriot", name = "patriot", price = 370000 },
  { label = "Radius", name = "radi", price = 370000 },
  { label = "Rocoto", name = "rocoto", price = 370000 },
  { label = "Seminole", name = "seminole", price = 370000 },
  { label = "XLS", name = "xls", price = 370000 },
 
} 


-- Sport Classics Finito
Config.Vehicles["sports classics"] = {

  { label = "Ardent", name = "ardent", price = 370000 },
  { label = "Btype", name = "btype", price = 370000 },
  { label = "Btype Hotroad", name = "btype2", price = 370000 },
  { label = "Btype Luxe", name = "btype3", price = 370000 },
  { label = "Casco", name = "casco", price = 370000 },
  { label = "Coquette Classic", name = "coquette2", price = 370000 },
  { label = "Deluxo", name = "deluxo", price = 370000 },
  { label = "Stirling GT", name = "feltzer3", price = 370000 },
  { label = "GT 500", name = "gt500", price = 370000 },
  { label = "Manana", name = "manana", price = 370000 },
  { label = "Monroe", name = "monroe", price = 370000 },
  { label = "Pigalle", name = "pigalle", price = 370000 },
  { label = "Rapid GT3", name = "rapidgt3", price = 370000 },
  { label = "Retinue", name = "retinue", price = 370000 },
  { label = "Savestra", name = "savestra", price = 370000 },
  { label = "Stinger", name = "stinger", price = 370000 },
  { label = "Stinger GT", name = "stingergt", price = 370000 },
  { label = "Viseris", name = "viseris", price = 370000 },
  { label = "Z190", name = "z190", price = 370000 },
  { label = "Z-Type", name = "ztype", price = 370000 },
  
} 

-- Sedans Finito
Config.Vehicles["sedans"] = {

  { label = "Asea", name = "asea", price = 5000 },
  { label = "Cognoscenti", name = "cognoscenti", price = 5000 },
  { label = "Emperor", name = "emperor", price = 5000 },
  { label = "Fugitive", name = "fugitive", price = 5000 },
  { label = "Glendale", name = "glendale", price = 5000 },
  { label = "Intruder", name = "intruder", price = 5000 },
  { label = "Premier", name = "premier", price = 5000 },
  { label = "Primo Custom", name = "primo2", price = 5000 },
  { label = "Schafter", name = "schafter2", price = 5000 },
  { label = "Super Diamond", name = "superd", price = 5000 },
  { label = "Tailgater", name = "tailgater", price = 5000 },
  { label = "Warrener", name = "warrener", price = 5000 },
  { label = "Washington", name = "washington", price = 5000 },
  
  
} 


-- Vans Finito
Config.Vehicles["vans"] = {

  { label = "Bison", name = "bison", price = 370000 },
  { label = "Bobcat XL", name = "bobcatxl", price = 370000 },
  { label = "Burrito", name = "burrito2", price = 370000 },
  { label = "Burrito", name = "burrito3", price = 370000 },
  { label = "Camper", name = "camper", price = 370000 },
  { label = "Gang Burrito", name = "gburrito", price = 370000 },
  { label = "Minivan", name = "minivan", price = 370000 },
  { label = "Moonbeam", name = "moonbeam", price = 370000 },
  { label = "Moonbeam Rider", name = "moonbeam2", price = 370000 },
  { label = "Paradise", name = "paradise", price = 370000 },
  { label = "Rumpo", name = "rumpo", price = 370000 },
  { label = "Rumpo Trail", name = "rumpo3", price = 370000 },
  { label = "Surfer", name = "surfer", price = 370000 },
  { label = "Youga", name = "youga", price = 370000 },
  { label = "Youga Luxuary", name = "youga2", price = 370000 },
 
}

-- Off Road Finito
Config.Vehicles["offroad"] = {

  { label = "Bf Injection", name = "bfinjection", price = 10000 },
  { label = "Bifta", name = "bifta", price = 10000 },
  { label = "Blazer", name = "blazer", price = 10000 },
  { label = "Blazer Sport", name = "blazer4", price = 10000 },
  { label = "blazer 5", name = "blazer5", price = 10000 },
  { label = "Brawler", name = "brawler", price = 10000 },
  { label = "Dune Buggy", name = "dune", price = 10000 },
  { label = "Guardian", name = "guardian", price = 10000 },
  { label = "Kamacho", name = "kamacho", price = 10000 },
  { label = "The Liberator", name = "monster", price = 10000 },
  { label = "Rebel", name = "rebel2", price = 10000 },
  { label = "Riata", name = "riata", price = 10000 },
  { label = "Sandking", name = "sandking", price = 10000 },
  { label = "Trophy Truck", name = "trophytruck", price = 10000 },
  { label = "Trophy Truck Limited", name = "trophytruck2", price = 10000 },
  
}







 
