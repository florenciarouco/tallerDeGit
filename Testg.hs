import Test.HUnit
import Parcialgoles

main = runTestTT tests

tests = test [
    "lista vacia" ~: (golesDeNoGoleadores [] [] 10) ~?= 0,
    "lista llena" ~: (golesDeNoGoleadores [("uba","flor"),("uade","mama")] [7,2] 20) ~?= 11,

    "lista vacia" ~: (equiposValidos []) ~?= True,
    "esfalso" ~: (equiposValidos [("mama","flor"),("flor","juli")]) ~?= False,
    "esverdadero" ~: (equiposValidos [("mama","flor"),("kari","papa")]) ~?= True,

    "lista vacia" ~: (porcentajeDeGoles "flor" [] []) ~?= 0,
    "jugador primero" ~: (porcentajeDeGoles "flor" [("guille","flor"),("kari","luqui")] [7,15]) ~?= 31.818182,
    "jugador segundo" ~: (porcentajeDeGoles "luqui" [("guille","flor"),("kari","luqui")] [7,15]) ~?= 68.181816,

    "lista vacia" ~: (botinDeOro [] []) ~?= "",
    "es la priemra" ~: (botinDeOro [("uba","flor"),("uade","mama")] [7,3]) ~?= "flor",
    "es otro" ~: (botinDeOro [("uba","flor"),("demk","mama")] [7,9]) ~?= "mama"
     ]