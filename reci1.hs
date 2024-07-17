type Fila = [Int]
type Tablero = [Fila]

--1
maximo :: Tablero -> Int
maximo [as] = maxi as
maximo (x:y:as) | maxi x > maxi y = maximo (x:as)
                | otherwise = maximo (y:as)

maxi :: Fila -> Int
maxi [] = 0
maxi [x] = x
maxi (x:y:xs) | x > y = maxi (x:xs)
              | otherwise = maxi (y:xs)

--2
masRepetidos :: Tablero -> Int
masRepetidos (x:xs) = comparador (aplanar (x:xs)) (aplanar (x:xs))

aplanar :: Tablero -> [Int]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs 

comparador :: Fila -> Fila -> Int
comparador [x] copia = x
comparador (x:y:xs) copia | cantidad copia x >= cantidad copia y = comparador (x:xs) copia
                          | otherwise = comparador (y:xs) copia

cantidad :: Fila -> Int -> Int
cantidad [] a = 0
cantidad (x:xs) a | x == a = 1 + cantidad xs a
                  | otherwise = cantidad xs a


--3
type Posicion = (Int,Int)
type Camino = [Posicion]

valoresDeCamino :: Tablero -> Camino -> [Int]
valoresDeCamino (x:xs) [] = []
valoresDeCamino (x:xs) ((fila,col):as) = buscarNum (buscarfila (x:xs) 1 fila) 1 col : valoresDeCamino (x:xs) as 

buscarfila :: Tablero -> Int -> Int -> Fila
buscarfila (x:xs) i pos | i == pos = x
                        | otherwise = buscarfila xs (i+1) pos

buscarNum :: [Int] -> Int -> Int -> Int
buscarNum (x:xs) i pos | i == pos = x
                       | otherwise = buscarNum xs (i+1) pos 

--4





------------------------tema 2-------------------------
--1
minimo :: Tablero -> Int
minimo [x] = mini x 
minimo (x:y:xs) | mini x < mini y = minimo (x:xs)
                | otherwise = minimo (y:xs)

mini :: Fila -> Int
mini [x] = x
mini (x:y:xs) | x < y = mini (x:xs)
              | otherwise = mini (y:xs)

{--2
repetidos :: Tablero -> [Int]
repetidos [] = []


repefila :: Fila -> [Int]
repefila [] = []
repefila [x] = []
repefila (x:y:xs) | x == y = x : repefila (y:xs)
                  | otherwise = repefila (y:xs)--}


