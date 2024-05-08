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
porcentajeDeVotos presidente ((p,v):formulas) (voto:votos) = division (cantidadDeVotos presidente ((p,v):formulas) (voto:votos) (votosAfirmativos (voto:votos))) *100
                                                                                    
                                                                  
cantidadDeVotos :: String -> [(String,String)] -> [Int] -> Int
cantidadDeVotos presidente [] [] = 0
cantidadDeVotos presidente ((p,v):formulas) (voto:votos) | presidente == p = voto
                                                         | otherwise = cantidadDeVotos presidente formulas votos

division :: Int -> Int -> Float 
division a b = (fromIntegral a)/(fromIntegral b)
--"flor" [(flor,niki),(luli,juli)] [7,2] = 7*100 / 9


-- ejercicio 4
proximoPresidente :: [(String,String)] -> [Int] -> String 
proximoPresidente [] [] = ""
proximoPresidente ((p,v):formulas) (voto:votos) | masvotado (voto:votos) == voto = p 
                                                | otherwise = proximoPresidente formulas votos


masvotado :: [Int] -> Int
masvotado [] = 0
masvotado [x] = x
masvotado (x:y:xs) | x >= y = masvotado (x:xs)
                   | otherwise = masvotado (y:xs)


