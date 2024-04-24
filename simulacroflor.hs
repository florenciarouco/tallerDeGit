--ejercicio1 
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):xs) | a == b = False
                             | pertenece (a,b) xs = False
                             | otherwise = relacionesValidas xs


tuplasiguales :: (String, String) -> (String, String) -> Bool 
tuplasiguales (x,y) (a,b) | x == a && y == b = True
                          | x == b && y == a = True
                          | otherwise = False
 

pertenece  :: (String, String) -> [(String, String)] -> Bool
pertenece _ [] = False
pertenece (a,b) (x:xs) | tuplasiguales (a,b) x = True
                    | otherwise = pertenece (a,b) xs

--ejercicio 2
personas :: [(String,String)] -> [String]
personas [] = []
personas  ((a,b):xs) = a : b : personas xs

--quitarrepetidos :: 



