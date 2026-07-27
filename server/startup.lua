local _ran = false

--- plsr.Dealerships.Stock:Ensure(dealerId, vehModel, modelType, quantity, vehData)
---@param dealerId  string  Dealership key from config/dealerships.lua, e.g. "pdm", "tuna"
---@param vehModel  string  Vehicle spawn name (lowercase, matches the GTA model hash string)
---@param modelType string  "automobile" or "motorcycle" (anything else falls back to automobile downstream)
---@param quantity  number  Stock level to ensure is available
---@param vehData   table   { class, price, make, model, category } 
function LoadDealershipData()
    if not _ran then
        _ran = true

        GlobalState.DealershipShowrooms = {}
        plsr.Dealerships.Showroom:Load()
        plsr.Dealerships.Management:LoadData()

        plsr.Dealerships.Stock:Ensure("pdm", "toros", "automobile", 5, {
            class = "A",
            price = 395000,
            make = "Pegassi",
            model = "Toros",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "caddy", "automobile", 20, {
            class = "D",
            price = 3500,
            make = "Nagasaki",
            model = "Caddy",
            category = "misc",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "banshee", "automobile", 5, {
            class = "A",
            price = 255000,
            make = "Bravado",
            model = "Banshee",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sentinelsg4", "automobile", 5, {
            class = "A",
            price = 265000,
            make = "Ubermacht",
            model = "Sentinel SG4",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "coquette", "automobile", 5, {
            class = "A",
            price = 300000,
            make = "Invetero",
            model = "Coquette",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ninef", "automobile", 5, {
            class = "A",
            price = 295000,
            make = "Obey",
            model = "9F",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ninef2", "automobile", 5, {
            class = "A",
            price = 300000,
            make = "Obey",
            model = "9F Cabrio",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "drafter", "automobile", 5, {
            class = "A",
            price = 325000,
            make = "Obey",
            model = "8F Drafter",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "alpha", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Albany",
            model = "Alpha",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bestiagts", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Grotti",
            model = "Bestia GTS",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "carbonizzare", "automobile", 5, {
            class = "A",
            price = 265000,
            make = "Grotti",
            model = "Carbonizzare",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "comet2", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Pfister",
            model = "Comet",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "comet3", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Pfister",
            model = "Comet Retro",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "comet5", "automobile", 5, {
            class = "A",
            price = 265000,
            make = "Pfister",
            model = "Comet SR",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "comet6", "automobile", 5, {
            class = "A",
            price = 280000,
            make = "Pfister",
            model = "Comet S2",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "comet7", "automobile", 5, {
            class = "A",
            price = 295000,
            make = "Pfister",
            model = "Comet S2 Cabrio",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "jester3", "automobile", 5, {
            class = "A",
            price = 255000,
            make = "Dinka",
            model = "Jester Retro",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "kanjo", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Dinka",
            model = "Kanjo",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "elegy2", "automobile", 5, {
            class = "A",
            price = 270000,
            make = "Annis",
            model = "Elegy RH8",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "feltzer2", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Benefactor",
            model = "Feltzer",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "furoregt", "automobile", 5, {
            class = "A",
            price = 280000,
            make = "Lampadati",
            model = "Furore GT",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "jester", "automobile", 5, {
            class = "A",
            price = 325000,
            make = "Dinka",
            model = "Jester",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "jugular", "automobile", 5, {
            class = "A",
            price = 310000,
            make = "Ocelot",
            model = "Jugular",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "lynx", "automobile", 5, {
            class = "A",
            price = 300000,
            make = "Ocelot",
            model = "Lynx",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "locust", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Ocelot",
            model = "Locust",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "massacro", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Dewbauchee",
            model = "Massacro",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "pariah", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Ocelot",
            model = "Pariah",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "penumbra", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Maibatsu",
            model = "Penumbra",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "penumbra2", "automobile", 5, {
            class = "A",
            price = 275000,
            make = "Maibatsu",
            model = "Penumbra FF",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rapidgt", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Dewbauchee",
            model = "Rapid GT",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rapidgt2", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Dewbauchee",
            model = "Rapid GT Cabrio",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ruston", "automobile", 5, {
            class = "A",
            price = 255000,
            make = "Hijak",
            model = "Ruston",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "schwarzer", "automobile", 5, {
            class = "A",
            price = 255000,
            make = "Benefactor",
            model = "Schwartzer",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "seven70", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Dewbauchee",
            model = "Seven-70",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "specter", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Dewbauchee",
            model = "Specter",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "specter2", "automobile", 5, {
            class = "A",
            price = 265000,
            make = "Dewbauchee",
            model = "Specter Custom",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "surano", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Benefactor",
            model = "Surano",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "z190", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Karin",
            model = "190z",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "cogcabrio", "automobile", 5, {
            class = "A",
            price = 255000,
            make = "Enus",
            model = "Cognoscenti Cabrio",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "f620", "automobile", 5, {
            class = "A",
            price = 255000,
            make = "Ocelot",
            model = "F620",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "felon2", "automobile", 5, {
            class = "A",
            price = 275000,
            make = "Lampadati",
            model = "Felon GT",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "zion", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Ubermacht",
            model = "Zion",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "zion2", "automobile", 5, {
            class = "A",
            price = 265000,
            make = "Ubermacht",
            model = "Zion Cabrio",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "paragon", "automobile", 5, {
            class = "A",
            price = 315000,
            make = "Enus",
            model = "Paragon",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "windsor", "automobile", 5, {
            class = "A",
            price = 280000,
            make = "Enus",
            model = "Windsor",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "brioso", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Grotti",
            model = "Brioso R/A",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "voltic", "automobile", 5, {
            class = "A",
            price = 290000,
            make = "Coil",
            model = "Voltic",
            category = "super",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dominator", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Vapid",
            model = "Dominator",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dominator3", "automobile", 5, {
            class = "A",
            price = 275000,
            make = "Vapid",
            model = "Dominator GTX",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "gauntlet", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Bravado",
            model = "Gauntlet",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "gauntlet5", "automobile", 5, {
            class = "A",
            price = 315000,
            make = "Bravado",
            model = "Gauntlet Classic Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "stafford", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Enus",
            model = "Stafford",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "blade", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Vapid",
            model = "Blade",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dukes", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Imponte",
            model = "Dukes",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "vamos", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Declasse",
            model = "Vamos",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ellie", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Vapid",
            model = "Ellie",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ruiner", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Imponte",
            model = "Ruiner",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sabregt", "automobile", 5, {
            class = "A",
            price = 260000,
            make = "Declasse",
            model = "Sabre Turbo",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "slamvan", "automobile", 5, {
            class = "A",
            price = 290000,
            make = "Vapid",
            model = "Slamvan",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "slamvan3", "automobile", 5, {
            class = "A",
            price = 310000,
            make = "Vapid",
            model = "Slamvan Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tampa", "automobile", 5, {
            class = "A",
            price = 280000,
            make = "Declasse",
            model = "Tampa",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "yosemite", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Declasse",
            model = "Yosemite",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tornado6", "automobile", 5, {
            class = "A",
            price = 270000,
            make = "Declasse",
            model = "Tornado Rat",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "stratum", "automobile", 5, {
            class = "A",
            price = 280000,
            make = "Zirconium",
            model = "Stratum",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sultan", "automobile", 5, {
            class = "A",
            price = 275000,
            make = "Karin",
            model = "Sultan MKIII",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "flashgt", "automobile", 10, {
            class = "B",
            price = 210000,
            make = "Vapid",
            model = "Flash GT",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "vagrant", "automobile", 10, {
            class = "B",
            price = 35000,
            make = "Maxwell",
            model = "Vagrant",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "iwagen", "automobile", 20, {
            class = "D",
            price = 45000,
            make = "Obey",
            model = "I-Wagen",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "cinquemila", "automobile", 15, {
            class = "C",
            price = 85000,
            make = "Lampadati",
            model = "Cinquemila",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "astron", "automobile", 10, {
            class = "B",
            price = 135000,
            make = "Pfister",
            model = "Astron",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tropos", "automobile", 10, {
            class = "B",
            price = 200000,
            make = "Lampadati",
            model = "Tropos Rallye",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "warrener", "automobile", 15, {
            class = "C",
            price = 45000,
            make = "Vulcar",
            model = "Warrener",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "contender", "automobile", 15, {
            class = "C",
            price = 65000,
            make = "Vapid",
            model = "Contender",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "baller7", "automobile", 15, {
            class = "C",
            price = 75000,
            make = "Gallivanter",
            model = "Baller ST",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "gb200", "automobile", 10, {
            class = "B",
            price = 205000,
            make = "Vapid",
            model = "GB2000",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "washington", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Albany",
            model = "Washington",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "issi2", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Weeny",
            model = "Issi",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "panto", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Benefactor",
            model = "Panto",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "picador", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Cheval",
            model = "Picador",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "faction2", "automobile", 20, {
            class = "B",
            price = 175000,
            make = "Willard",
            model = "Faction Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rumpo3", "automobile", 15, {
            class = "C",
            price = 55000,
            make = "Bravado",
            model = "Rumpo Custom",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rhapsody", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Declasse",
            model = "Rhapsody",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "omnis", "automobile", 10, {
            class = "B",
            price = 225000,
            make = "Obey",
            model = "Omnis",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ignus", "automobile", 10, {
            class = "B",
            price = 200000,
            make = "Pegassi",
            model = "Ignus",
            category = "super",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "baller", "automobile", 15, {
            class = "C",
            price = 45000,
            make = "Gallivanter",
            model = "Baller",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "streiter", "automobile", 15, {
            class = "C",
            price = 40000,
            make = "Benefactor",
            model = "Streiter",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "retinue2", "automobile", 10, {
            class = "B",
            price = 150000,
            make = "Vapid",
            model = "Retinue MkII",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "stalion", "automobile", 10, {
            class = "B",
            price = 175000,
            make = "Declasse",
            model = "Stallion",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "blista", "automobile", 10, {
            class = "B",
            price = 135000,
            make = "Dinka",
            model = "Blista",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "chino2", "automobile", 15, {
            class = "c",
            price = 65000,
            make = "Vapid",
            model = "Chino Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "baller2", "automobile", 15, {
            class = "C",
            price = 55000,
            make = "Gallivanter",
            model = "Baller II",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "asea", "automobile", 20, {
            class = "D",
            price = 12000,
            make = "Declasse",
            model = "Asea",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "everon", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Karin",
            model = "Everon",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "exemplar", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Dewbauchee",
            model = "Exemplar",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "cheburek", "automobile", 10, {
            class = "B",
            price = 160000,
            make = "Rune",
            model = "Cheburek",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "youga4", "automobile", 20, {
            class = "D",
            price = 40000,
            make = "Bravado",
            model = "Youga Custom",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "hotknife", "automobile", 15, {
            class = "c",
            price = 55000,
            make = "Vapid",
            model = "Hotknife",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "vigero", "automobile", 10, {
            class = "B",
            price = 165000,
            make = "Declasse",
            model = "Vigero",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "mesa", "automobile", 30, {
            class = "C",
            price = 25000,
            make = "Canis",
            model = "Mesa",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "jackal", "automobile", 10, {
            class = "B",
            price = 185000,
            make = "Ocelot",
            model = "Jackal",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "cavalcade", "automobile", 15, {
            class = "C",
            price = 40000,
            make = "Albany",
            model = "Cavalcade",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "mamba", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Declasse",
            model = "Mamba",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "emperor", "automobile", 20, {
            class = "D",
            price = 13000,
            make = "Declasse",
            model = "Emperor",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rocoto", "automobile", 10, {
            class = "B",
            price = 155000,
            make = "Obey",
            model = "Rocoto",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "virgo", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Albany",
            model = "Virgo",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "hellion6str", "automobile", 10, {
            class = "B",
            price = 225000,
            make = "Annis",
            model = "Hellion",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "brioso3", "automobile", 20, {
            class = "D",
            price = 50000,
            make = "Grotti",
            model = "Brioso 300 Widebody",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "faction", "automobile", 10, {
            class = "B",
            price = 165000,
            make = "Willard",
            model = "Faction",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "cavalcade2", "automobile", 15, {
            class = "C",
            price = 50000,
            make = "Albany",
            model = "Cavalcade II",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "coquette2", "automobile", 10, {
            class = "B",
            price = 175000,
            make = "Invetero",
            model = "Coquette Classic",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "phoenix", "automobile", 10, {
            class = "B",
            price = 160000,
            make = "Imponte",
            model = "Phoenix",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "emperor2", "automobile", 20, {
            class = "D",
            price = 5000,
            make = "Declasse",
            model = "Emperor",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bjxl", "automobile", 15, {
            class = "C",
            price = 35000,
            make = "Karin",
            model = "Beejay XL",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "mesa3", "automobile", 15, {
            class = "C",
            price = 70000,
            make = "Canis",
            model = "Mesa Lifted",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "surge", "automobile", 10, {
            class = "B",
            price = 150000,
            make = "Cheval",
            model = "Surge",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "corsita", "automobile", 10, {
            class = "B",
            price = 215000,
            make = "Lampadati",
            model = "Corsita",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "feltzer3", "automobile", 10, {
            class = "B",
            price = 175000,
            make = "Benefactor",
            model = "Stirling GT",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "casco", "automobile", 10, {
            class = "B",
            price = 165000,
            make = "Lampadati",
            model = "Casco",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rapidgt3", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Dewbauchee",
            model = "Rapid GT Classic",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "btype", "automobile", 15, {
            class = "c",
            price = 60000,
            make = "Albany",
            model = "Roosevelt",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "regina", "automobile", 20, {
            class = "D",
            price = 9000,
            make = "Dundreary",
            model = "Regina",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "fq2", "automobile", 15, {
            class = "C",
            price = 65000,
            make = "Fathom",
            model = "FQ-2",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "greenwood", "automobile", 15, {
            class = "C",
            price = 85000,
            make = "Bravado",
            model = "Greenwood",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "gt500", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Grotti",
            model = "GT500",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "granger", "automobile", 15, {
            class = "C",
            price = 35000,
            make = "Declasse",
            model = "Granger",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "kanjosj", "automobile", 15, {
            class = "C",
            price = 65000,
            make = "Dinka",
            model = "Kanjo SJ",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "zion3", "automobile", 10, {
            class = "B",
            price = 195000,
            make = "Ubermacht",
            model = "Zion Classic",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "stinger", "automobile", 10, {
            class = "B",
            price = 185000,
            make = "Grotti",
            model = "Stinger",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "baller3", "automobile", 10, {
            class = "B",
            price = 160000,
            make = "Gallivanter",
            model = "Baller LE",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tailgater", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Obey",
            model = "Tailgater",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "coquette3", "automobile", 10, {
            class = "B",
            price = 160000,
            make = "Invetero",
            model = "Coquette Blackfin",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "romero", "automobile", 20, {
            class = "D",
            price = 15000,
            make = "Chariot",
            model = "Romero Hearse",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "comet4", "automobile", 15, {
            class = "C",
            price = 140000,
            make = "Pfister",
            model = "Comet Safari",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "habanero", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "Emperor",
            model = "Habanero",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "stingergt", "automobile", 10, {
            class = "B",
            price = 190000,
            make = "Grotti",
            model = "Stinger GT",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "savestra", "automobile", 10, {
            class = "B",
            price = 200000,
            make = "Annis",
            model = "Savestra",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "btype3", "automobile", 15, {
            class = "c",
            price = 75000,
            make = "Albany",
            model = "Roosevelt Classic",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "omnisegt", "automobile", 15, {
            class = "B",
            price = 145000,
            make = "Obey",
            model = "Omnis e-GT",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "landstalker", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "Dundreary",
            model = "Landstalker",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "buccaneer", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Albany",
            model = "Buccaneer",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "minivan", "automobile", 20, {
            class = "D",
            price = 13000,
            make = "Vapid",
            model = "Minivan",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "swinger", "automobile", 10, {
            class = "B",
            price = 195000,
            make = "Ocelot",
            model = "Swinger",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "michelli", "automobile", 10, {
            class = "B",
            price = 220000,
            make = "Lampadati",
            model = "Michelli GT",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rebla", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Ubermacht",
            model = "Rebla",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "postlude", "automobile", 20, {
            class = "D",
            price = 45000,
            make = "Dinka",
            model = "Postlude",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "patriot", "automobile", 15, {
            class = "C",
            price = 45000,
            make = "Mammoth",
            model = "Patriot",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "cog55", "automobile", 10, {
            class = "B",
            price = 185000,
            make = "Enus",
            model = "Cognoscenti 55",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "impaler", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Declasse",
            model = "Impaler",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bifta", "automobile", 15, {
            class = "C",
            price = 35000,
            make = "BF",
            model = "Bifta",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "paradise", "automobile", 20, {
            class = "D",
            price = 21000,
            make = "Bravado",
            model = "Paradise",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "viseris", "automobile", 10, {
            class = "B",
            price = 210000,
            make = "Lampadati",
            model = "Viseris",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "patriot2", "automobile", 15, {
            class = "C",
            price = 115000,
            make = "Mammoth",
            model = "Patriot WCR",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "minivan2", "automobile", 10, {
            class = "B",
            price = 125000,
            make = "Vapid",
            model = "Scuffvan Custom",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ztype", "automobile", 15, {
            class = "c",
            price = 40000,
            make = "truffade",
            model = "Z-type",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rhinehart", "automobile", 15, {
            class = "C",
            price = 75000,
            make = "Ubermacht",
            model = "Rhinehart",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tulip", "automobile", 10, {
            class = "B",
            price = 175000,
            make = "Declasse",
            model = "Tulip",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "intruder", "automobile", 10, {
            class = "B",
            price = 165000,
            make = "Karin",
            model = "Intruder",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "pony", "automobile", 20, {
            class = "D",
            price = 19500,
            make = "Brute",
            model = "Pony",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "novak", "automobile", 10, {
            class = "B",
            price = 155000,
            make = "Lampadati",
            model = "Novak",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "radi", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "Vapid",
            model = "Radius",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sentinel4", "automobile", 10, {
            class = "B",
            price = 130000,
            make = "Ubermacht",
            model = "Sentinel Classic Widebody",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "raiden", "automobile", 10, {
            class = "B",
            price = 155000,
            make = "Coil",
            model = "Raiden",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "prairie", "automobile", 10, {
            class = "B",
            price = 165000,
            make = "Bollokon",
            model = "Prairie",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "seminole", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Canis",
            model = "Seminole",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "moonbeam", "automobile", 15, {
            class = "C",
            price = 35000,
            make = "Declasse",
            model = "Moonbeam",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rumpo", "automobile", 20, {
            class = "D",
            price = 32500,
            make = "Bravado",
            model = "Rumpo News",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dubsta", "automobile", 10, {
            class = "B",
            price = 140000,
            make = "Benefactor",
            model = "Dubsta",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "clique", "automobile", 10, {
            class = "B",
            price = 190000,
            make = "Vapid",
            model = "Clique",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "youga", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Bravado",
            model = "Youga",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "issi7", "automobile", 10, {
            class = "B",
            price = 160000,
            make = "Weeny",
            model = "Issi Sport",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "nightshade", "automobile", 10, {
            class = "B",
            price = 190000,
            make = "Imponte",
            model = "Nightshade",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sm722", "automobile", 15, {
            class = "C",
            price = 120000,
            make = "Benefactor",
            model = "SM722",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "blazer4", "automobile", 15, {
            class = "C",
            price = 15000,
            make = "Nagasaki",
            model = "Street Blazer",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "blista2", "automobile", 15, {
            class = "C",
            price = 75000,
            make = "Dinka",
            model = "Blista Compact",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "moonbeam2", "automobile", 15, {
            class = "C",
            price = 50000,
            make = "Declasse",
            model = "Moonbeam Custom",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rumpo2", "automobile", 20, {
            class = "D",
            price = 32500,
            make = "Bravado",
            model = "Rumpo HerrKutz",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sugoi", "automobile", 10, {
            class = "B",
            price = 165000,
            make = "Dinka",
            model = "Sugoi",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "gresley", "automobile", 10, {
            class = "B",
            price = 130000,
            make = "Bravado",
            model = "Gresley",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ratloader2", "automobile", 10, {
            class = "B",
            price = 185000,
            make = "Bravado",
            model = "Rat-Truck",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "caracara2", "automobile", 15, {
            class = "C",
            price = 80000,
            make = "Vapid",
            model = "Caracara",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "asterope", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Karin",
            model = "Asterope",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sentinel", "automobile", 10, {
            class = "B",
            price = 160000,
            make = "Ubermacht",
            model = "Sentinel",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "tenf2", "automobile", 3, {
            class = "S",
            price = 770000,
            make = "Obey",
            model = "10F Widebody",
            category = "tuners",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "vstr", "automobile", 10, {
            class = "B",
            price = 190000,
            make = "Albany",
            model = "VSTR",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ratloader", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "Bravado",
            model = "Rat Loader",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "huntley", "automobile", 10, {
            class = "B",
            price = 135000,
            make = "Enus",
            model = "Huntley S",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sabregt2", "automobile", 10, {
            class = "B",
            price = 195000,
            make = "Declasse",
            model = "Sabre Turbo Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "speedo", "automobile", 20, {
            class = "D",
            price = 35000,
            make = "Vapid",
            model = "Speedo",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ingot", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "Vulcar",
            model = "Ingot",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sentinel2", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Ubermacht",
            model = "Sentinel XS",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "brawler", "automobile", 15, {
            class = "C",
            price = 80000,
            make = "Coil",
            model = "Brawler",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "xls", "automobile", 10, {
            class = "B",
            price = 140000,
            make = "Benefactor",
            model = "XLS",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "slamvan2", "automobile", 10, {
            class = "B",
            price = 185000,
            make = "Vapid",
            model = "Slamvan",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sultan2", "automobile", 10, {
            class = "B",
            price = 195000,
            make = "Karin",
            model = "Sultan MKII",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "vigero2", "automobile", 3, {
            class = "S",
            price = 775000,
            make = "Declasse",
            model = "Vigero ZX",
            category = "tuners",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "primo", "automobile", 15, {
            class = "C",
            price = 50000,
            make = "Albany",
            model = "Primo",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "buccaneer2", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Albany",
            model = "Buccaneer Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "camper", "automobile", 20, {
            class = "D",
            price = 42500,
            make = "Brute",
            model = "Camper",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "outlaw", "automobile", 10, {
            class = "B",
            price = 30000,
            make = "Nagasaki",
            model = "Outlaw",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "weevil2", "automobile", 15, {
            class = "C",
            price = 55000,
            make = "BF",
            model = "Weevil Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "burrito3", "automobile", 20, {
            class = "D",
            price = 35000,
            make = "Declasse",
            model = "Burrito",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "primo2", "automobile", 15, {
            class = "C",
            price = 45000,
            make = "Albany",
            model = "Primo Custom",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "btype2", "automobile", 15, {
            class = "C",
            price = 42450,
            make = "Albony",
            model = "Fraken Stange",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "ratbike", "motorcycle", 20, {
            class = "D",
            price = 7500,
            make = "Western",
            model = "Rat Bike",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "virgo3", "automobile", 15, {
            class = "c",
            price = 60000,
            make = "Dundreary",
            model = "Virgo Classic",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "schafter4", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Ubermacht",
            model = "Schafter V12 LWB",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "retinue", "automobile", 10, {
            class = "B",
            price = 205000,
            make = "Vapid",
            model = "Retinue",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "chino", "automobile", 15, {
            class = "C",
            price = 45000,
            make = "Vapid",
            model = "Chino",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "stanier", "automobile", 15, {
            class = "C",
            price = 27000,
            make = "Vapid",
            model = "Stanier",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "kalahari", "automobile", 20, {
            class = "D",
            price = 18000,
            make = "Canis",
            model = "Kalahari",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "kuruma", "automobile", 10, {
            class = "B",
            price = 190000,
            make = "Karin",
            model = "Kuruma",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "buffalo", "automobile", 10, {
            class = "B",
            price = 175000,
            make = "Bravado",
            model = "Buffalo",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "serrano", "automobile", 10, {
            class = "B",
            price = 125000,
            make = "Benefactor",
            model = "Serrano",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "taxi", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Vapid",
            model = "Taxi",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dilettante", "automobile", 15, {
            class = "c",
            price = 30000,
            make = "karin",
            model = "Dilettante",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "komoda", "automobile", 10, {
            class = "B",
            price = 200000,
            make = "Lampadati",
            model = "Komoda",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "gburrito", "automobile", 20, {
            class = "D",
            price = 53000,
            make = "Declasse",
            model = "Burrito G",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "faction3", "automobile", 15, {
            class = "C",
            price = 50000,
            make = "Williard",
            model = "Faction Donk",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "zr350", "automobile", 10, {
            class = "B",
            price = 225000,
            make = "Annis",
            model = "ZR350",
            category = "tuners",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "felon", "automobile", 10, {
            class = "B",
            price = 135000,
            make = "Lampadati",
            model = "Felon",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "stretch", "automobile", 15, {
            class = "C",
            price = 100000,
            make = "Dundreary",
            model = "Stretch",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dilettante2", "automobile", 15, {
            class = "c",
            price = 35000,
            make = "karin",
            model = "Dilettante Patrol",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "futo", "automobile", 10, {
            class = "B",
            price = 195000,
            make = "Karin",
            model = "Futo",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "euros", "automobile", 10, {
            class = "B",
            price = 223000,
            make = "Annis",
            model = "Euros",
            category = "tuners",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "youga2", "automobile", 20, {
            class = "D",
            price = 49500,
            make = "Bravado",
            model = "Youga Classic",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "gburrito2", "automobile", 20, {
            class = "D",
            price = 59000,
            make = "Declasse",
            model = "Burrito G2",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "issi3", "automobile", 15, {
            class = "C",
            price = 35000,
            make = "Weeny",
            model = "Issi Classic",
            category = "compact",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "windsor2", "automobile", 10, {
            class = "B",
            price = 190000,
            make = "Enus",
            model = "Windsor Drop",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "jester4", "automobile", 10, {
            class = "B",
            price = 220000,
            make = "Dinka",
            model = "Jester RR",
            category = "tuners",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "journey", "automobile", 20, {
            class = "D",
            price = 39500,
            make = "Zirconium",
            model = "Journey",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "buffalo2", "automobile", 10, {
            class = "B",
            price = 215000,
            make = "Bravado",
            model = "Buffalo S",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "oracle2", "automobile", 10, {
            class = "B",
            price = 185000,
            make = "Ubermacht",
            model = "Oracle XS",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "blazer", "automobile", 20, {
            class = "D",
            price = 7500,
            make = "Nagasaki",
            model = "Blazer",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "fagaloa", "automobile", 15, {
            class = "C",
            price = 40000,
            make = "Vulcar",
            model = "Fagaloa",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "pigalle", "automobile", 20, {
            class = "D",
            price = 39000,
            make = "Lampadati",
            model = "Pigalle",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "remus", "automobile", 15, {
            class = "C",
            price = 80000,
            make = "Annis",
            model = "Remus",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sentinel3", "automobile", 5, {
            class = "A",
            price = 250000,
            make = "Ubermacht",
            model = "Sentinel Classic",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "glendale", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Benefactor",
            model = "Glendale",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "oracle", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Ubermacht",
            model = "Oracle",
            category = "coupe",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sandking", "automobile", 20, {
            class = "d",
            price = 31000,
            make = "vapid",
            model = "Sandking XL",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "previon", "automobile", 15, {
            class = "C",
            price = 75000,
            make = "Karin",
            model = "Previon",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "fusilade", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Shyster",
            model = "Fusilade",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "blazer2", "automobile", 20, {
            class = "D",
            price = 9000,
            make = "Nagasaki",
            model = "Lifeguard",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "superd", "automobile", 10, {
            class = "B",
            price = 190000,
            make = "Enus",
            model = "Super Diamond",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tornado5", "automobile", 20, {
            class = "D",
            price = 24000,
            make = "Declasse",
            model = "Tornado Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "riata", "automobile", 15, {
            class = "C",
            price = 55000,
            make = "Vapid",
            model = "Riata",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bodhi2", "automobile", 20, {
            class = "D",
            price = 12000,
            make = "Canis",
            model = "Bodhi",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bobcatxl", "automobile", 15, {
            class = "C",
            price = 35000,
            make = "Vapid",
            model = "Bobcat XL",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "schafter2", "automobile", 10, {
            class = "B",
            price = 175000,
            make = "Ubermacht",
            model = "Schafter",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "shinobi", "motorcycle", 10, {
            class = "B",
            price = 100000,
            make = "Nagasaki",
            model = "Shinobi",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tornado3", "automobile", 20, {
            class = "D",
            price = 18000,
            make = "Declasse",
            model = "Tornado",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rancherxl", "automobile", 20, {
            class = "D",
            price = 22000,
            make = "Declasse",
            model = "Rancher XL",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dynasty", "automobile", 20, {
            class = "D",
            price = 26000,
            make = "Weeny",
            model = "Bene",
            category = "sportclassic",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "premier", "automobile", 10, {
            class = "B",
            price = 165000,
            make = "Declasse",
            model = "Premier",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bison", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "Bravado",
            model = "Bison",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "schafter3", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Ubermacht",
            model = "Schafter V12",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tornado2", "automobile", 20, {
            class = "D",
            price = 18000,
            make = "Declasse",
            model = "Tornado Cabrio",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dloader", "automobile", 20, {
            class = "D",
            price = 21000,
            make = "Bravado",
            model = "Duneloader",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dune", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "BF",
            model = "Dune Duggy",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "fugitive", "automobile", 10, {
            class = "B",
            price = 175000,
            make = "Cheval",
            model = "Fugitive",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "diablous2", "motorcycle", 10, {
            class = "B",
            price = 45000,
            make = "Principe",
            model = "Diablous Custom",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "guardian", "automobile", 15, {
            class = "C",
            price = 55000,
            make = "Vapid",
            model = "Guardian",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "tornado", "automobile", 20, {
            class = "D",
            price = 19000,
            make = "Declasse",
            model = "Tornado",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rebel2", "automobile", 15, {
            class = "C",
            price = 30000,
            make = "Karin",
            model = "Rebel II",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sadler", "automobile", 20, {
            class = "D",
            price = 24000,
            make = "Vapid",
            model = "Sadler",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "esskey", "motorcycle", 15, {
            class = "C",
            price = 35000,
            make = "Peggasi",
            model = "Esskey",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "peyote", "automobile", 20, {
            class = "D",
            price = 20000,
            make = "Vapid",
            model = "Peyote",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "freecrawler", "automobile", 15, {
            class = "C",
            price = 60000,
            make = "Canis",
            model = "Freecrawler",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "rebel", "automobile", 15, {
            class = "C",
            price = 25000,
            make = "Karin",
            model = "Rebel",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "cognoscenti", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Enus",
            model = "Cognoscenti",
            category = "sedans",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "hustler", "automobile", 20, {
            class = "D",
            price = 48000,
            make = "Vapid",
            model = "Hustler",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "surfer", "automobile", 20, {
            class = "d",
            price = 24000,
            make = "Surfer",
            model = "BF",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "manana", "automobile", 20, {
            class = "D",
            price = 21000,
            make = "Albany",
            model = "Manana",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sandking2", "automobile", 20, {
            class = "D",
            price = 32500,
            make = "Vapid",
            model = "Sandking",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sanctus", "motorcycle", 10, {
            class = "B",
            price = 130000,
            make = "LLC",
            model = "Sanctus",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "kamacho", "automobile", 15, {
            class = "C",
            price = 115000,
            make = "Canis",
            model = "Kamacho",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "nightblade", "motorcycle", 10, {
            class = "B",
            price = 95000,
            make = "Western",
            model = "Nightblade",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "voodoo", "automobile", 20, {
            class = "D",
            price = 36000,
            make = "Declasse",
            model = "Voodoo Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bfinjection", "automobile", 15, {
            class = "C",
            price = 60000,
            make = "BF",
            model = "Injection",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "surfer2", "automobile", 20, {
            class = "D",
            price = 16000,
            make = "BF",
            model = "Surfer Kona",
            category = "van",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "voodoo2", "automobile", 20, {
            class = "D",
            price = 19000,
            make = "Declasse",
            model = "Voodoo",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "virgo2", "automobile", 20, {
            class = "D",
            price = 34000,
            make = "Albany",
            model = "Virgo Custom",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "hakuchou2", "motorcycle", 5, {
            class = "A",
            price = 175000,
            make = "Shitzu",
            model = "Hakuchou Drag Bike",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "faggio3", "motorcycle", 20, {
            class = "D",
            price = 2500,
            make = "Pegassi",
            model = "Faggio Mod",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "akuma", "motorcycle", 10, {
            class = "B",
            price = 40000,
            make = "Dinka",
            model = "Akuma",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bati", "motorcycle", 10, {
            class = "B",
            price = 50000,
            make = "Bati",
            model = "801",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "hexer", "motorcycle", 15, {
            class = "C",
            price = 35000,
            make = "LLC",
            model = "Hexer",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "sanchez2", "motorcycle", 20, {
            class = "D",
            price = 10000,
            make = "Maibistu",
            model = "Sanchez",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "bf400", "motorcycle", 5, {
            class = "A",
            price = 70000,
            make = "Nagasaki",
            model = "BF400",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "dubsta2", "automobile", 10, {
            class = "B",
            price = 170000,
            make = "Benefactor",
            model = "Dubsta Mandem",
            category = "suv",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "avarus", "motorcycle", 15, {
            class = "C",
            price = 45000,
            make = "LLC",
            model = "Avarus",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "wolfsbane", "motorcycle", 20, {
            class = "D",
            price = 25000,
            make = "Western",
            model = "Wolfsbane",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("pdm", "reever", "motorcycle", 15, {
            class = "C",
            price = 40000,
            make = "Western",
            model = "Reever",
            category = "motorcycles",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "growler", "automobile", 5, {
            class = "S",
            price = 395000,
            make = "Pfister",
            model = "Growler",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "dominator7", "automobile", 5, {
            class = "A",
            price = 350000,
            make = "Vapid",
            model = "Dominator ASP",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "gauntlet4", "automobile", 5, {
            class = "A",
            price = 375000,
            make = "Bravado",
            model = "Gauntlet Hellfire",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "ruiner4", "automobile", 5, {
            class = "A",
            price = 335000,
            make = "Imponte",
            model = "Ruiner ZZ-8",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "sultanrs", "automobile", 5, {
            class = "A",
            price = 330000,
            make = "Karin",
            model = "Sultan RS",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "sultan3", "automobile", 5, {
            class = "A",
            price = 330000,
            make = "Karin",
            model = "Sultan RS Classic",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "buffalo4h", "automobile", 5, {
            class = "A",
            price = 380000,
            make = "Bravado",
            model = "Buffalo STX",
            category = "muscle",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "zeno", "automobile", 5, {
            class = "A",
            price = 280000,
            make = "Overflod",
            model = "Zeno",
            category = "super",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "draugur", "automobile", 15, {
            class = "C",
            price = 100000,
            make = "Declasse",
            model = "Draugur",
            category = "offroad",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "calico", "automobile", 10, {
            class = "B",
            price = 220000,
            make = "Karin",
            model = "Calico GTF",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "rt3000", "automobile", 10, {
            class = "B",
            price = 200000,
            make = "Dinka",
            model = "RT3000",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "cypher", "automobile", 10, {
            class = "B",
            price = 135000,
            make = "Ubermacht",
            model = "Cypher",
            category = "sport",
        })

        plsr.Dealerships.Stock:Ensure("tuna", "vectre", "automobile", 10, {
            class = "B",
            price = 180000,
            make = "Emperor",
            model = "Vectre",
            category = "sport",
        })

    end
end
