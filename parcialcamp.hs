{--module Parcialcamp where


--ejercicio 1 
--                     equipo  arq       goles    total   total-goles 
atajaronSuplentes :: [(String,String)] -> [Int] -> Int -> Int 
atajaronSuplentes [] [] total = 0
atajaronSuplentes ((e,a):equipos) (gol:goles) total = total - totalGoles (gol:goles) 

totalGoles :: [Int] -> Int
totalGoles [] = 0
totalGoles (gol:goles) = gol + totalGoles goles 

-- [(uba,juli) (uade,cami)] [3,9] 20 = 8

--ejercicio 2
equiposValidos :: [(String,String)] -> Bool 
equiposValidos [] = True
equiposValidos ((e,a):equipos) = e/=a && (noaparece (e,a) equipos) && equiposValidos equipos

noaparece :: (String,String) -> [(String,String)] -> Bool
noaparece _ [] = True
noaparece (e,a) ((e1,a1):equipos) = e /= e1 && e /= a1 && a /= e1 && a /= a1 && noaparece (e,a) equipos  

--ejercicio 3
--                   arq          equi   arq         goles     porcentaje
porcentajeDeGoles :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeGoles arquero [] [] = 0
porcentajeDeGoles arquero ((e,a):equipos) (gol:goles) = (division (cantidadDeGoles arquero ((e,a):equipos) (gol:goles)) (totalGoles (gol:goles))) *100

                                                                      

cantidadDeGoles :: String -> [(String,String)] -> [Int] -> Int
cantidadDeGoles arquero [] [] = 0
cantidadDeGoles arquero ((e,a):equipos) (gol:goles) | arquero == a = gol
                                                    | otherwise = cantidadDeGoles arquero equipos goles


division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b


-- flor [(uba,flor)(uade,niki)] [7,2] = 7*100 /9

--ejercicio 4
           --         equ   arq            goles   menosgol
vallaMenosVencida :: [(String,String)] -> [Int] -> String
vallaMenosVencida [] [] = ""
vallaMenosVencida ((e,a):equipos) (gol:goles) | gol == menosgoles (gol:goles) = a 
                                              | otherwise = vallaMenosVencida equipos goles
menosgoles :: [Int] -> Int 
menosgoles [] = 0
menosgoles [x] = x
menosgoles (gol:y:goles) | gol < y = menosgoles (gol:goles)
                         | otherwise = menosgoles (y:goles)

--}





--1 
--                     eq       arq      goles    total   total-goles
atajaronSuplentes :: [(String,String)] -> [Int] -> Int -> Int
atajaronSuplentes [] [] total = 0
atajaronSuplentes ((e,a):equipos) (gol:goles) total = total - totalGoles (gol:goles) 


totalGoles :: [Int] -> Int
totalGoles [] = 0
totalGoles (gol:goles) = gol + totalGoles goles

--2
equiposValidos :: [(String,String)] -> Bool 
equiposValidos [] = True
equiposValidos ((e,a):otros) = e /= a && (noaparece (e,a) otros) && equiposValidos otros


noaparece :: (String,String) -> [(String,String)] -> Bool
noaparece _ [] = True
noaparece (b,c) ((e,a):otros) = b /= e && b /= a && c /= e && c /= a && noaparece (b,c) otros

--3
--                    arq        eq      arq       goles       %
porcentajeDeGoles :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeGoles arquero [] [] = 0 
porcentajeDeGoles arquero ((e,a):otros) (gol:goles) = (division (cantidadDeGoles arquero ((e,a):otros) (gol:goles)) (totalGoles (gol:goles))) *100 

cantidadDeGoles :: String -> [(String,String)] -> [Int] -> Int
cantidadDeGoles arquero [] [] = 0
cantidadDeGoles arquero ((e,a):otros) (gol:goles) | arquero == a = gol
                                                  | otherwise = cantidadDeGoles arquero otros goles

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

-- flor [(flor,juli)(luli,cami)] [10,5] = 10 *100 / 15 

--4
vallaMenosVencida :: [(String,String)] -> [Int] -> String
vallaMenosVencida [] [] = ""
vallaMenosVencida ((e,a):otros) (gol:goles) | menosgoles (gol:goles) == gol = a 
                                            | otherwise = vallaMenosVencida otros goles


menosgoles :: [Int] -> Int
menosgoles [] = 0
menosgoles [x] = x
menosgoles (gol:y:goles) | gol < y = menosgoles (gol:goles)
                         | otherwise = menosgoles (y:goles)