--1
      --          pres    vice        vot     total    blanco        
votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int
votosEnBlanco [] [] total = total
votosEnBlanco ((p,v):formulas) (vo:votos) total = total - (cantidaddevotos (vo:votos))

cantidaddevotos :: [Int] -> Int
cantidaddevotos [] = 0
cantidaddevotos (x:xs) = x + cantidaddevotos xs 

--2
formulasValidas :: [(String,String)] -> Bool
formulasValidas [] = True
formulasValidas ((p,v):formulas) = p /= v && noaparece (p,v) formulas && formulasValidas formulas 

noaparece :: (String,String) -> [(String,String)] -> Bool 
noaparece (x,y) [] = True
noaparece (x,y) ((p,v):formulas) = x /= p && x /= v && y /= p && y /= v && noaparece (x,y) formulas

--3
porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeVotos presidente [] [] = 0
porcentajeDeVotos presidente ((p,v):formulas) (vo:votos) = division (cualeselvoto presidente ((p,v):formulas) (vo:votos)) (cantidaddevotos (vo:votos))* 100
                                                   
--"flor" [("flor","juli"),("ma""pa")] [7,3] = 7*100/ 10
cualeselvoto :: String -> [(String,String)] -> [Int] -> Int
cualeselvoto presidente [] [] = 0 
cualeselvoto presidente ((p,v):formulas) (vo:votos) | presidente == p = vo 
                                                    | otherwise = cualeselvoto presidente formulas votos

division :: Int -> Int -> Float 
division a b = (fromIntegral a)/(fromIntegral b)

--4
proximoPresidente :: [(String,String)] -> [Int] -> String
proximoPresidente [] [] = ""
proximoPresidente ((p,v):formulas) (vo:votos) | vo == masvotado (vo:votos) = p
                                              | otherwise = proximoPresidente formulas votos

masvotado :: [Int] -> Int
masvotado [] = 0
masvotado [x] = x
masvotado (vo:y:votos) | vo > y = masvotado (vo:votos)
                       | otherwise = masvotado (y:votos)

--[("flor","juli"),("ma""pa")] [7,3] = "flor"