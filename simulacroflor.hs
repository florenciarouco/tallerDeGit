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
personasconmasamigos :: [(String,String)] -> String
personasconmasamigos [] = []
personasconmasamigos ((a,b):xs) = personasconmasamigosaux (personas ((a,b) :xs)) ((a,b):xs)


personasconmasamigosaux :: [String] -> [(String,String)] -> String
personasconmasamigosaux _ [] = []
personasconmasamigosaux [e] _ = e
personasconmasamigosaux (e:d:ds) ((a,b):xs) | cantamigos e ((a,b):xs) >= cantamigos d ((a,b):xs) = personasconmasamigosaux (e:ds) ((a,b):xs)
                                            | otherwise = personasconmasamigosaux (d:ds) ((a,b):xs)

longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

cantamigos ::  String -> [(String,String)] -> Int 
cantamigos persona [] = 0
cantamigos persona ((a,b) :xs) = longitud (amigosde persona ((a,b):xs))


