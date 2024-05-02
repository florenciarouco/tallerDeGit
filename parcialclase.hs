--parcial clase 2/05

--ejercico 2
formulasValidas :: [(String,String)] -> Bool
--formulasValidas [] = True
formulasValidas ((p,v):[]) = p/=v --(ESTA NO ES NECESARIO, pero no está mal ponerla, solo está de más) 
formulasValidas ((p,v):xs) = p /= v && (noaparecen (p,v) xs) && (formulasValidas xs)

--so queiro poner una lista de un solo elemento, lo puedo escribir: ((p,v):[])

noaparecen :: (String,String) -> [(String,String)] -> Bool
noaparecen _ [] = True
noaparecen (p,v) ((p1,v1):xs) = p /=p1 && p /= v1 && v /= p1 && v /= v1 && noaparecen (p,v) xs 

--ejercicio 1 
votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int 
votosEnBlanco [] [] y = 0
votosEnBlanco ((p,v):formulas) (x:xs) y | formulasValidas ((p,v):formulas) == True = y - votosAfirmativos (x:xs)
                                        | otherwise = 0

votosAfirmativos :: [Int] -> Int
votosAfirmativos [] = 0
votosAfirmativos (x:xs) = x + votosAfirmativos xs  

--ejercicio 3
porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeVotos presidente [] [] = 0 
porcentajeDeVotos presidente formulas x =  division ((cantidadDeVotos presidente formulas x)*100) (votosAfirmativos x) 


cantidadDeVotos :: String -> [(String,String)] -> [Int] -> Int
cantidadDeVotos presidente ((p,v):formulas) (x:xs) | presidente == p = x 
                                                   | otherwise = cantidadDeVotos presidente formulas xs

division :: Int -> Int -> Float
division a b = (fromIntegral a)/(fromIntegral b)
--"flor" [("flor","niki"),("cami","luli")] [7,2] = (7*100) / (7+2)

-- ejercicio 4
proximoPresidente :: [(String,String)] -> [Int] -> String
proximoPresidente [] [] = ""
proximoPresidente formulas votos = proximoPresidenteAux formulas formulas votos




proximoPresidenteAux :: [(String,String)] -> [(String,String)] -> [Int] -> String
proximoPresidenteAux ((p,v):[]) _ _ = p
proximoPresidenteAux ((p1,v1):(p2,v2):xs) formulas votos | cantidadDeVotos (p1 formulas votos) >= cantidadDeVotos (p2 formulas votos) = proximoPresidenteAux ((p1,v1):xs) formulas votos
                                                         | otherwise = proximoPresidenteAux ((p2,v2):xs) formulas votos

--[(flor,niki)(cami,luli)] [7,2] = flor


