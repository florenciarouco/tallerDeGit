-- || es el "o"

-- 1 [1,2,3] -> true
-- 1 [7,2,6] -> false

--ejercicio 2.1
pertenece  :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs) = e == x || pertenece e xs 

--otra forma 
--pertenece  :: (Eq t) => t -> [t] -> Bool
--pertenece e (x:xs) | e == x = true
     --              | otherwise = pertenece e xs 

-- ejercicio 2.2
--todosiguales :: (Eq t) => [t] -> Bool
--todosiguales 




--ejercicio 2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
--hayRepetidos (x:[]) 
hayRepetidos [_] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs 

quitar :: (Eq t) => t -> [t] -> [t]
quitar x [] = []
quitar x (y:xs) | x == y = xs
                | otherwise = y : quitar x xs
-- ":" agrega, en el caso anteriror, y a la lista xs 

-- [1,2,3] ++ [4,5] =  [1,2,3,4,5]
-- 2 : [3,4,5] = [2,3,4,5]

--ejercico 3.3
maximo :: [Integer] -> Integer 
maximo [x] = x
maximo (x:xs) | x > head xs = x
              | otherwise = maximo xs


--ejercicio 3.9
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar (x:xs) | x == minimo xs = x : xs
               | otherwise = ordenar xs


minimo :: [Integer] -> Integer 
minimo [x] = x
minimo (x:xs) | x < head xs = x
              | otherwise = minimo xs
