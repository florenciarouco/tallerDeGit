--ejercicio1 
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):xs) | a == b = False
                             | pertenece (a,b) xs = False
                             | otherwise = relacionesValidas xs


tuplasiguales :: (String, String) -> (String, String) -> Bool 
tuplasiguales (x,y) (a,b) | x == a || y == b = True
                          | x == b || y == a = True
                          | otherwise = False
 

pertenece  :: (String, String) -> [(String, String)] -> Bool
pertenece _ [] = False
pertenece (a,b) (x:xs) | tuplasiguales (a,b) x = True
                       | otherwise = pertenece (a,b) xs

--ejercicio 2
personas :: [(String,String)] -> [String]
personas [] = []
personas  ((a,b):xs) = quitarrepetidos (a : b : personas xs)

quitarrepetidos :: [String] -> [String]
quitarrepetidos [] = []
quitarrepetidos (x:xs) | pertenece2 x xs = quitarrepetidos xs 
                       | otherwise = x : quitarrepetidos xs

pertenece2 :: String -> [String] -> Bool
pertenece2 _ [] = False
pertenece2 e (x:xs) | e == x = True 
                    | otherwise = pertenece2 e xs

-- ejercicio 3
amigosde :: String -> [(String,String)] -> [String] 
amigosde _ [] = []
amigosde persona ((a,b):xs) | persona == a = b : amigosde persona xs
                            | persona == b = a : amigosde persona xs
                            | otherwise = amigosde persona xs

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


