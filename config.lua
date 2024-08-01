print("load module MC_BANKER: sh_config.lua")

-- CONFIG variable declaration and initialization
CONFIG = CONFIG or {}
CONFIG.MC_BANKER = {}

CONFIG.MC_BANKER.PrintTime = 30 -- Chaque intervalle écoulé signifie un gain d'argent pour l'imprimante, mais aussi une perte de batterie, de papier ou d'encre.

CONFIG.MC_BANKER.DistToPrinter = 200000 -- Permet de modifier la distance d'affichage des Start3D2D des printers 

CONFIG.MC_BANKER.Vector_Spawn_Box = Vector( -3374, -3567, 96 ) // Spawn de la boite à l'achat

CONFIG.MC_BANKER.Blogs = true -- Activer les blogs pour traquer les interactions de vos joueurs 

CONFIG.MC_BANKER.JobBanker = TEAM_BANKER // Job du banquier permet d'ouvir le PNJ SHOP

CONFIG.MC_BANKER.PNJ_model = "models/Humans/Group01/male_02.mdl"
CONFIG.MC_BANKER.PNJ_name = "Vendeur de Printer"

CONFIG.MC_BANKER.MaxTaxs = 50
CONFIG.MC_BANKER.Bank_transfer = 10 // Interet pour les transferts ( l'argent que le joueur va perdre )

CONFIG.MC_BANKER.MinMoneyForTransfert = 150

CONFIG.MC_BANKER.DistBanker = 200000 * 4

CONFIG.MC_BANKER.EnableTaxMayor = false // Compatible avec https://www.gmodstore.com/market/view/slawer-mayor-an-advanced-mayor-system
CONFIG.MC_BANKER.TaxMayor = 10 

CONFIG.MC_BANKER.LimitPrinter = 5

CONFIG.MC_BANKER.COLOR = {
    main = Color(36, 36, 36),
    second = Color(44, 44, 44),
    outlined = Color(64, 64, 64),

    blue = Color(45, 71, 122),
    blue1 = Color(38, 63, 118),
    blue2 = Color( 25, 44, 83),

    text = Color( 240, 240, 240),
    text1 = Color( 100, 100, 100),
    text2 = Color( 175, 175, 175),

    dark = Color(28, 28, 28),

    trans = Color( 255, 255, 255, 5 ),
    trans_light = Color( 240, 240, 240, 1 ),

}

CONFIG.MC_BANKER.MATERIAL = {
    background_printer = Material("monarch_banquier/background_printer.png"),
    background_pnj = Material("monarch_banquier/background_pnj.png"),
    background_list = Material("monarch_banquier/background_list.png"),

    plus = Material("monarch_banquier/plus.png"),
    refuse = Material("monarch_banquier/refuse.png"),
}

hook.Add("loadCustomDarkRPItems", "Monarch:Banker_Printers", function()

    CONFIG.MC_BANKER.PRINTER = {
        [1] = {
            name = "Printer Silver",
            color = Color(80, 80, 80, 255),
            money_per_print = 46, -- Argent gagné à chaque intervalle de PrintTime.
            battery_decrement_per_print = 0.029, -- Battery perdu à chaque intervalle de PrintTime.
            paper_decrement_per_print = 0.108, -- Papier perdu à chaque intervalle de PrintTime.
            encre_decrement_per_print = 0.052, -- Encre perdu à chaque intervalle de PrintTime.
            max_storage = 1150 -- Stockage max que peut contenir un printer
        },
        [2] = {
            name = "Printer Gold",
            color = Color( 239, 168, 60),
            money_per_print = 57.5,
            battery_decrement_per_print = 0.036,
            paper_decrement_per_print = 0.135,
            encre_decrement_per_print = 0.065,
            max_storage = 1438
        },
        [3] = {
            name = "Printer Ruby",
            color = Color( 137, 51, 54),
            money_per_print = 69.73,
            battery_decrement_per_print = 0.048,
            paper_decrement_per_print = 0.18,
            encre_decrement_per_print = 0.087,
            max_storage = 1920
        },

    }

    Monarch_Banker_Create_Printer()

end)

CONFIG.MC_BANKER.Item_PNJ = {
    [1] = {
        name = "Batterie",
        ent = "mc_banker_batterie",
        model = "models/items/car_battery01.mdl",
        color = color_white,
        quantity = {1, 100},
        order = 6,
        price = 90,
    },
    [2] = {
        name = "Encre",
        ent = "mc_banker_encre",
        model = "models/props_lab/jar01b.mdl",
        color = color_white,
        quantity = {1, 100},
        order = 5,
        price = 7,
    },
    [3] = {
        name = "Papier",
        ent = "mc_banker_paper",
        model = "models/props/cs_office/paper_towels.mdl",
        color = color_white,
        quantity = {1, 100},
        order = 4,
        price = 2,
    },
    [4] = {
        name = "Printer Silver",
        ent = "mc_printer_silver",
        model = "models/props_c17/consolebox01a.mdl",
        color = Color(80, 80, 80),
        quantity = {1, 5},
        order = 3,
        price = 500,
    },
    [5] = {
        name = "Printer Gold",
        ent = "mc_printer_gold",
        model = "models/props_c17/consolebox01a.mdl",
        color = Color( 239, 168, 60),
        quantity = {1, 5},
        order = 2,
        price = 625,
    },
    [6] = {
        name = "Printer Ruby",
        ent = "mc_printer_ruby",
        model = "models/props_c17/consolebox01a.mdl",
        color = Color( 137, 51, 54),
        quantity = {1, 5},
        order = 1,
        price = 750,
    },
}
