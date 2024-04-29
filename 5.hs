--guia 5 
--ejercicio 1,1
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--ejercicio1.2
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

--1.3
principio :: [t] -> [t]
principio [x] = [] 
principio (x:xs) = x : principio xs


--1,4
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = ultimo xs : reverso (principio xs)

--2,1
pertenece :: (Eq t) => t -> [t] -> Bool 
pertenece  e [] = False 
pertenece e (x:xs) =  e == x || pertenece e xs 

--2,2
todosiguales :: (Eq t) => [t] -> Bool
todosiguales [] = True 
todosiguales [x] = True
todosiguales (x:xs) = x == head xs && todosiguales xs  

--2.3
todosdistintos :: (Eq t) => [t] -> Bool 
todosdistintos [] = True
todosdistintos [x] = True
todosdistintos (x:xs) = x /= head xs && todosdistintos xs

--2.4
hayRepetidos :: (Eq t) => [t] -> Bool 
hayRepetidos [] = False 
hayRepetidos [x] = False 
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

--2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar e [] = [] 
quitar e (x:xs) | e == x = xs
                | otherwise = x : quitar x xs

--2.6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos e [] = []
quitarTodos e (x:xs) | e == x = quitarTodos x xs
                     | otherwise = e : quitarTodos x xs

--2.7
--VER PORQUE ME DA MAL
eliminarRepetidos :: (Eq t) => [t] -> [t] 
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x:eliminarRepetidos (quitarTodos x xs)

--2.8
mismoselementos :: (Eq t) => [t] -> [t] -> Bool 
mismoselementos [] [] = True
mismoselementos (x:xs) (y:ys) | x == y && xs == ys = True
                              | otherwise = False 

--2.9 
capicua :: (Eq t) => [t] -> Bool 
capicua xs = xs == reverso xs


--3.1
sumatoria :: [Int] -> Int
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

--3.2
productoria :: [Int] -> Int
productoria [x] = x
productoria (x:xs) = x * sumatoria xs

--3.3
maximo :: [Int] -> Int 
maximo [x] = x
maximo (x:xs) | x > head xs = x 
              | otherwise = maximo xs

--3.4
sumarN :: Int -> [Int] -> [Int]
sumarN n [x] = [(x+n)]
sumarN n (x:xs) = (x+n) : sumarN n xs

--3.5
sumarElPrimero :: [Int] -> [Int]
sumarElPrimero [] = []
sumarElPrimero [x] =[x+x]
sumarElPrimero (x:xs) = sumarN x (x:xs)

--3.6
sumarElUltimo :: [Int] -> [Int] 
sumarElUltimo [] = []
sumarElUltimo [x] = [x+x]
sumarElUltimo (x:xs) = sumarN (ultimo xs) (x:xs)

--3.7
pares :: [Int] -> [Int]
pares [] = []
pares [x] | mod x 2 == 0 = [x] 
             | otherwise = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

--3.8
multiplosdeN :: Int -> [Int] -> [Int]
multiplosdeN n [] = []
multiplosdeN n [x] | mod x n == 0 = [x]
                   | otherwise = []
multiplosdeN n (x:xs) | mod x n == 0 = x : multiplosdeN n xs
                      | otherwise = multiplosdeN n xs

--3.9
--ver porque me da mal, copie y pegue lo mismo 
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar xs = (minimo xs) : ordenar (quitar (minimo xs) xs)
               

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:xs) | x < head xs = x
              | otherwise = minimo xs

--4.1
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x] 
sacarBlancosRepetidos [x,y] | x == ' ' && y == ' ' = [' '] 
                            | otherwise = x : [x,y]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (x:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)

--4.2
contarpalabras :: [Char] -> Int
contarpalabras [] = 0
contarpalabras [x] | x == ' ' = 0
                   | otherwise = 1
contarpalabras [x,y] | x == ' ' && y == ' ' = 0
                     | otherwise = 1
contarpalabras (x:y:xs) | x /= ' ' && y == ' ' = 1 + contarpalabras (y:xs)
                        | otherwise = contarpalabras (y:xs)
--preguntar que significa poner [x,y] , (x:xs) , (x:y:xs) , o cuando ponen solo palabras, no se me marea. 


--4.3
--VER ESTE NO ENTENDI MUCHO, NO SE ME OCURRE SOLA NI DE CASUALIDAD 
palabras :: [Char] -> [[Char]]
palabras [] = [[]]
palabras xs = rangopalabras 1 (contarpalabras xs) xs
 
npalabras :: Int -> [Char] -> [Char] 
npalabras _ [] = []
npalabras _ [x] = [x] 
npalabras 1 (x:xs) | x == ' ' = npalabras 1 xs
                   | head xs /= ' ' = x : npalabras 1 xs
                   | head xs == ' ' = [x] 
npalabras n (x:xs) | x == ' ' = npalabras n xs
                   | head xs /= ' ' = npalabras n xs
                   | head xs == ' ' = npalabras (n-1) xs

rangopalabras :: Int -> Int -> [Char] -> [[Char]]
rangopalabras n m xs | n == m = [npalabras n xs]
                     | otherwise = [npalabras n xs] ++ rangopalabras (n+1) m xs

--4.4
--ver
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = maximalong (palabras xs)

maximalong :: [[Char]] -> [Char] 
maximalong [[x]] = [x]
maximalong [xs,ys] | longitud xs >= longitud ys = xs
                   | otherwise = ys
maximalong (x:xs) | longitud x >= longitud (head xs) = maximalong (x:tail xs)
                  | otherwise = maximalong xs 

--4.5
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

--4.6
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs 

-- 4.7
aplanarConNBlancos :: [[Char]] -> Int -> [Char] 
aplanarConNBlancos [] _ = []
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ nespacios n ++ aplanarConNBlancos xs n 

nespacios :: Int -> [Char]
nespacios 0 = []
nespacios 1 = [' '] 
nespacios n = [' '] ++ nespacios (n-1) 
