
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


--ejercicio 3.9
-- no se porque esta mal de esta forma, VER
{--ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar (x:xs) | (minimo (x:xs)) : ordenar (quitar (minimo (x:xs)))
               

minimo :: [Integer] -> Integer
minimo [x] = [x]
minimo (x:xs) | x < head xs = x
              | otherwise = minimo xs--}

