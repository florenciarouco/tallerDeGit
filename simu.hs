--ejercicio 1
relacionesValidas :: [(String,String)] -> Bool 
relacionesValidas [] = True
relacionesValidas ((a,b):xs) | a == b = False 
                             |pertenece (a,b) xs = False
                             | otherwise = relacionesValidas xs



tuplasiguales :: (String,String) -> (String,String) -> Bool 
tuplasiguales (a,b) (c,d) | a == c && b == d = True
                          | b == c && a == d = True
                          | otherwise = False 

pertenece :: (String,String) -> [(String,String)] -> Bool
pertenece _ [] = False
pertenece (a,b) (x:xs) | tuplasiguales (a,b) x = True 
                       | otherwise = pertenece (a,b) xs

--ejercicio 2
personas :: [(String,String)] -> [String]
personas [] = []
personas ((a,b):xs) = quitarrepetidos (a : b : personas xs)

quitarrepetidos :: [String] -> [String]
quitarrepetidos [x] = [x]
quitarrepetidos (x:xs) | pertenece2 x xs = quitarrepetidos xs
                       | otherwise = x : quitarrepetidos xs 

pertenece2 :: String -> [String] -> Bool 
pertenece2 _ [] = False
pertenece2 e (x:xs) | e == x = True
                    | otherwise =  pertenece2 e xs

--ejercicio 3
amigosde :: String -> [(String,String)] -> [String]
amigosde _ [] = []
amigosde e ((a,b):xs) | e == a = b : amigosde e xs 
                      | e == b = a : amigosde e xs 
                      | otherwise = amigosde e xs
