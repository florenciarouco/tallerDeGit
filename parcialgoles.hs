module Parcialgoles where 

-- ejercicio1
--                       equ    JUGAD   gol c/ j    total   total-gol  
golesDeNoGoleadores :: [(String,String)] -> [Int] -> Int -> Int 
golesDeNoGoleadores [] [] total = 0
golesDeNoGoleadores ((e,j):otros) (gol:goles) total = total - totalgoles (gol:goles)

totalgoles :: [Int] -> Int 
totalgoles [] = 0
totalgoles [x] = x
totalgoles (gol:goles) = gol + totalgoles goles

--ejercicio 2
equiposValidos :: [(String,String)] -> Bool 
equiposValidos [] = True 
equiposValidos ((e,j):otros) = e/= j && noaparece (e,j) otros && equiposValidos otros

noaparece :: (String,String) -> [(String,String)] -> Bool 
noaparece _ [] = True
noaparece (a,b) ((e,j):otros) = a /= e && a /= j && b /= e && b /= j && noaparece (a,b) otros 

--ejercicio 3
porcentajeDeGoles :: String -> [(String,String)] -> [Int] -> Float 
porcentajeDeGoles jugador [] [] = 0
porcentajeDeGoles jugador ((e,j):otros) (gol:goles) = division (cantidaddegoles jugador ((e,j):otros) (gol:goles)) (totalgoles (gol:goles)) *100


cantidaddegoles :: String -> [(String,String)] -> [Int] -> Int
cantidaddegoles jugador [] [] = 0
cantidaddegoles jugador ((e,j):otros) (gol:goles) | jugador == j = gol
                                                  | otherwise = cantidaddegoles jugador otros goles

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

--ejercicio 4
botinDeOro :: [(String,String)] -> [Int] -> String
botinDeOro [] [] = ""
botinDeOro ((e,j):otros) (gol:goles) | masgoles (gol:goles) == gol = j 
                                     | otherwise = botinDeOro otros goles

masgoles :: [Int] -> Int
masgoles [] = 0
masgoles [x] = x
masgoles (gol:y:goles) | gol > y = masgoles (gol:goles)
                       | otherwise = masgoles (y:goles)