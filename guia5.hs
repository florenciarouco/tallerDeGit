
-- || es el "o"

-- 1 [1,2,3] -> true
-- 1 [7,2,6] -> false

-- ejercicio 1.1
longitud :: [t] -> Int 
longitud [] = 0 
longitud (x:xs) = 1 + longitud xs

--ejercicio 1.2
ultimo :: [t] -> t
ultimo [x] = x 
ultimo (x:xs) = ultimo xs

--ejercicio 1.3
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

--ejercicio 1.4
--VER ESTE, me da el ultimo numero y me tiene q dar la lista al reves 
reverso :: [t] -> [t] 
reverso [] = []
reverso xs = ultimo xs:reverso (principio xs)


--ejercicio 2.1
pertenece  :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs) = e == x || pertenece e xs 

--otra forma 
--pertenece  :: (Eq t) => t -> [t] -> Bool
--pertenece e (x:xs) | e == x = true
     --              | otherwise = pertenece e xs 

-- ejercicio 2.2
todosiguales :: (Eq t) => [t] -> Bool
todosiguales [] = True 
todosiguales [x] = True
todosiguales (x:xs) = x == head xs && todosiguales xs

--ejercicio 2.3
todosdistintos :: (Eq t) => [t] -> Bool
todosdistintos [] = True 
todosdistintos [x] = True
todosdistintos (x:xs) = x /= head xs && todosdistintos xs
               
--ejercicio 2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
--hayRepetidos (x:[]) 
hayRepetidos [_] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs 

--ejercicio 2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar x [] = []
quitar x (y:xs) | x == y = xs
                | otherwise = y : quitar x xs
-- ":" agrega, en el caso anteriror, y a la lista xs 

-- [1,2,3] ++ [4,5] =  [1,2,3,4,5]
-- 2 : [3,4,5] = [2,3,4,5]

-- ejercicio 2.6
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos x [] = []
quitarTodos x (y:xs) | x == y = quitarTodos x xs
                     | otherwise = y : quitarTodos x xs

--ejercicio 2.7
eliminarRepetidos :: (Eq t) => [t] -> [t] 
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

-- ejercicio 2.8
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = estaincluido xs ys && estaincluido ys xs

estaincluido :: (Eq t) => [t] -> [t] -> Bool
estaincluido [] [] = True
estaincluido [x] ys = pertenece x ys
estaincluido (x:xs) ys = pertenece x ys && estaincluido xs ys 

-- ejercicio 2.9
capicua :: (Eq t) => [t] -> Bool
capicua xs = xs == reverso xs


--ejercicio 3.1
sumatoria :: [Integer] -> Integer 
sumatoria [] = 0 
sumatoria (x:xs) = x + sumatoria xs 

-- ejrcicio 3.2
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

--ejercico 3.3
maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs) | x > head xs = x
              | otherwise = maximo xs

--ejercicio 3.4
sumarN :: Int -> [Int] -> [Int]
sumarN n [x] = [(x+n)]
sumarN n (x:xs) = (x + n) : sumarN n xs 

--ejercicio 3.5
sumarElPrimero :: [Int] -> [Int]
sumarElPrimero [x] = [2*x]
sumarElPrimero (x:xs) = sumarN x (x:xs)

--ejercicio 3.6
sumarElUltimo :: [Int] -> [Int]
sumarElUltimo [x] = [2*x]
sumarElUltimo xs = sumarN (ultimo xs) xs

--ejercicio 3.7
pares :: [Int] -> [Int]
pares [] = []
pares [x] | mod x 2 == 0 = [x]
          | otherwise = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

--ejercicio 3.8
multiplosdeN :: Int -> [Int] -> [Int]
multiplosdeN n [x] | mod x n == 0 = [x]
                   | otherwise = []
multiplosdeN n (x:xs) | mod x n == 0 = x : multiplosdeN n xs
                      | otherwise = multiplosdeN n xs

--ejercicio 3.9
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar xs = (minimo xs) : ordenar (quitar (minimo xs) xs)
               

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:xs) | x < head xs = x
              | otherwise = minimo xs

-- ejercicio 4.1
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos [x,y] | x == ' ' && y == ' ' = [' ']
                            | otherwise = [x,y]
sacarBlancosRepetidos (x : y : xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (x:xs)
                                   | otherwise = x : sacarBlancosRepetidos (y:xs)

--ejercicio4.2
contarpalabras :: [Char] -> Int 
contarpalabras [] = 0 
contarpalabras [x] | x == ' ' = 0 
                   | otherwise = 1
contarpalabras [x,y] | x == ' ' && y == ' ' = 0
                     | otherwise = 1 
contarpalabras (x:y:xs) | x /= ' ' && y == ' ' = 1 + contarpalabras (y:xs)
                        | otherwise = contarpalabras (y:xs)

--ejercicio4.4
--hacer ejercicio 4 


--ejerciico5.1
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = x : sumaAcumulada ((x+y):xs)

--ejercicio 5.2
descomponerEnPrimos :: [Int] -> [[Int]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = factoresPrimos x : descomponerEnPrimos xs

factoresPrimos :: Int -> [Int]
factoresPrimos x | x <= 1 = []
                 | esPrimo (fromIntegral x) = [x]
                 | otherwise = menorDivisor x : factoresPrimos (div x (menorDivisor x))


menorDivisor:: Int -> Int 
menorDivisor x = menorDivisorDesde x 2 
               

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde x y | x == y = y
                      | mod x y == 0 = y 
                      | otherwise = menorDivisorDesde x (y+1)
-- b 
esPrimo :: Int -> Bool 
esPrimo x = menorDivisor x == x