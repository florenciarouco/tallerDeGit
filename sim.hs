-- 1
relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):resto) =  a/=b && noaparece (a,b) resto && relacionesValidas resto

noaparece :: (String,String) -> [(String,String)] -> Bool 
noaparece _ [] = True
noaparece (x,y) ((a,b):resto) = x /= a && x /= b && y /= a && y /= b && noaparece (x,y) resto 

--2
personas :: [(String,String)] -> [String]
personas [] = []
personas ((a,b):resto) = quitarrepetidos (a:b:personas resto)

quitarrepetidos :: [String] -> [String]
quitarrepetidos [] = []
quitarrepetidos [x] = [x]
quitarrepetidos (x:xs) | pertenece x xs = xs
                       | otherwise = x : quitarrepetidos xs 

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece z (x:xs) | z == x = True
                   | otherwise = pertenece z xs

--ejercicio 3
amigosDe :: String -> [(String,String)] -> [String] 
amigosDe _ [] = []
amigosDe x ((a,b):resto) | x == a = b : amigosDe x resto 
                         | x == b = a : amigosDe x resto
                         | otherwise = amigosDe x resto

--"flor" [("flor","juli"),("luli","flor")] = ["juli","luli"]

--4
personaConMasAmigos :: [(String,String)] -> String 
personaConMasAmigos [] = "" 
personaConMasAmigos ((a,b):resto) = personaConMasAmigosAux (personas ((a,b):resto)) ((a,b):resto)

personaConMasAmigosAux :: [String] -> [(String,String)] -> String
personaConMasAmigosAux _ [] = ""
personaConMasAmigosAux [x] ((a,b):resto) = x
personaConMasAmigosAux (x:y:xs) ((a,b):resto) | cantAmigos x ((a,b):resto) >= cantAmigos y ((a,b):resto) = personaConMasAmigosAux (x:xs) ((a,b):resto)
                                              | otherwise = personaConMasAmigosAux (y:xs) ((a,b):resto)

cantAmigos :: String -> [(String,String)] -> Int
cantAmigos x ((a,b):resto) = longitud (amigosDe x ((a,b):resto))

longitud :: [String] -> Int 
longitud [] = 0
longitud [x] = 1
longitud (x:xs) = 1 + longitud xs

 --[("flor","mama"),("juli","luli"),("lu","flor")] = ["flor"]