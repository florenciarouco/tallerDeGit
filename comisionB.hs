--1
generarStock :: [[Char]] -> [([Char],Int)]
generarStock [] = []
generarStock (x:xs) = eliminar ((x, cantidad (x:xs) x ) : generarStock xs)

cantidad :: [[Char]] -> [Char] -> Int 
cantidad [] producto = 0
cantidad (x:xs) producto | x == producto = 1 + cantidad xs producto 
                         | otherwise = cantidad xs producto 

eliminarRepetidos :: [Char] -> [([Char],Int)] -> [([Char],Int)]
eliminarRepetidos producto [] = []
eliminarRepetidos producto ((x,y):xs) | producto == x = eliminarRepetidos producto xs    
                                      | otherwise = (x,y) : eliminarRepetidos producto xs 
 
eliminar :: [([Char],Int)] -> [([Char],Int)]
eliminar [] = []
eliminar ((x,y):xs) = (x,y) : eliminarRepetidos x xs 


--2
stockdeproductos :: [([Char],Int)] -> [Char] -> Int
stockdeproductos [] as = 0
stockdeproductos ((x,y):xs) as | x == as =  y + stockdeproductos xs as
                               | otherwise = stockdeproductos xs as 

--3 
dineroEnStock :: [([Char],Int)] -> [([Char],Float)] -> Float
dineroEnStock [] ((a,b):as) = 0
dineroEnStock ((x,y):xs) ((a,b):as) = obtenerprecio x ((a,b):as) * fromIntegral y + dineroEnStock xs ((a,b):as) 

obtenerprecio :: [Char] -> [([Char],Float)] -> Float
obtenerprecio producto [] = 0
obtenerprecio producto ((x,y):xs) | producto == x = y
                                  | otherwise = obtenerprecio producto xs 

--4 
aplicarOferta :: [([Char],Int)] -> [([Char],Float)] -> [([Char],Float)]
aplicarOferta ((x,y):xs) [] = []
aplicarOferta ((x,y):xs) ((a,b):as) | stockdeproductos ((x,y):xs) a > 10 = (a, b* 0.80) : aplicarOferta ((x,y):xs) as 
                                    | otherwise = (a,b) : aplicarOferta ((x,y):xs) as
--1
generarStock2 :: [[Char]] -> [([Char],Int)]
generarStock2 [] = []
generarStock2 (x:xs) = elimiREPE ((x, cantidad2 (x:xs) x) : generarStock2 xs)

cantidad2 :: [[Char]] -> [Char] ->  Int
cantidad2 [] producto = 0
cantidad2 (x:xs)  producto | x == producto =  1 + cantidad2 xs producto
                           | otherwise = cantidad2 xs producto

elimiREPE :: [([Char],Int)] -> [([Char],Int)]
elimiREPE [] = []
elimiREPE ((x,y):xs) = (x,y) : elim xs x 

elim :: [([Char],Int)] -> [Char] -> [([Char],Int)]
elim [] producto = []
elim ((x,y):xs) producto | x == producto = elim xs producto      
                         | otherwise = (x,y) : elim xs producto 