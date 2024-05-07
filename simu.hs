--ejercicio 1
relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True 
relacionesValidas ((p1,p2):personas) = p1 /= p2 && (noaparece (p1,p2) personas) && relacionesValidas personas
                                    

noaparece :: (String,String) -> [(String,String)] -> Bool 
noaparece _ [] = True
noaparece (a,b) ((p1,p2):personas) =  a/= p1 && a /= p2 && b /= p1 && b /= p2 && noaparece (a,b) personas

--ejercicio 2 
personas :: [(String,String)] -> [String] 
personas [] = []
personas ((p1,p2):per) = quitarrepetidos (p1 : p2 : personas per)

quitarrepetidos :: [String] -> [String]
quitarrepetidos [] = []
quitarrepetidos [x] = [x] 
quitarrepetidos (x:xs) | pertenece x xs = quitarrepetidos xs 
                       | otherwise = x : quitarrepetidos xs
                       

pertenece :: String -> [String] -> Bool 
pertenece _ [] = False 
pertenece y (x:xs) | y == x = True 
                   | otherwise = pertenece y xs 

--ejercicio 3 
amigosDe :: String -> [(String,String)] -> [String] 
amigosDe _ [] = []
amigosDe persona ((p1,p2):otros) | persona == p1 = p2 : amigosDe persona otros 
                                 | persona == p2 = p1 : amigosDe persona otros
                                 | otherwise = amigosDe persona otros 

--ejercicio 4
longitud :: [String] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

cantAmigos :: String -> [(String,String)] -> Integer
cantAmigos p ((a,b):bs) = longitud (amigosDe p ((a,b):bs))

personaConMasAmigosAux :: [String] -> [(String,String)] -> String
personaConMasAmigosAux _ [] = "nadie"
personaConMasAmigosAux [x] ((a,b):bs) = x
personaConMasAmigosAux (x:y:xs) ((a,b):bs) | cantAmigos x ((a,b):bs) >= cantAmigos y ((a,b):bs) = personaConMasAmigosAux (x:xs) ((a,b):bs)
                                           | otherwise = personaConMasAmigosAux (y:xs) ((a,b):bs)

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos [] = "nadie"
personaConMasAmigos ((a,b):bs) = personaConMasAmigosAux (personas ((a,b):bs)) ((a,b):bs)
