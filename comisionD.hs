--1
divisoresPropios :: Int -> [Int]
divisoresPropios n = divisores 1 n

divisores :: Int -> Int -> [Int]
divisores d n | d >= n = []
              | mod n d == 0 = d: divisores (d+1) n
              | otherwise = divisores (d+1) n    

--2
sonAmigos :: Int -> Int -> Bool
sonAmigos n m | suma (divisoresPropios (n)) == m && suma (divisoresPropios (m)) == n = True 
              | otherwise = False 

suma :: [Int] -> Int
suma [] = 0
suma [x] = x
suma (x:xs) = x + suma xs

--3
losPrimerosNPerfectos :: Int -> [Int]
losPrimerosNPerfectos n = losPrimerosNPerfectosDesde 1 n

losPrimerosNPerfectosDesde :: Int -> Int -> [Int]
losPrimerosNPerfectosDesde n 0 = []
losPrimerosNPerfectosDesde n x | suma (divisoresPropios n) == n = n : losPrimerosNPerfectosDesde (n+1) (x-1)
                               | otherwise = losPrimerosNPerfectosDesde (n+1) x

--4
listaDeAmigos :: [Int] -> [(Int,Int)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = listaDeMisAmigos x xs ++ listaDeAmigos xs 


listaDeMisAmigos :: Int -> [Int] -> [(Int,Int)]
listaDeMisAmigos n [] = []
listaDeMisAmigos n (x:xs) | sonAmigos n x == True = (n,x) : listaDeMisAmigos n xs 
                          | otherwise = listaDeMisAmigos n xs 


    