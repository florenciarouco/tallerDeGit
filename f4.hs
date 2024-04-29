--guia 4
--ejerciico 1 
fibonacci :: Int -> Int 
fibonacci n | n == 0 = 0
            | n == 1 = 1 
            | otherwise = fibonacci (n-1) + fibonacci (n-2)
 
--ejercicio 2 PREGUNTAR LUCAS
parteEntera :: Float -> Int
parteEntera x | x >= 0 && x < 1 = 0 
              | otherwise = parteEntera (x-1) + 1 

--ejercicio 3
esDivisible :: Int -> Int -> Bool
esDivisible x n | x == 0 = True
                | x < 0 = False
                | otherwise = esDivisible (x-n) n

-- ejercicio 4 
sumaImpares :: Int -> Int
sumaImpares x | x == 0 = 0 
              | x == 1 = 1
              | otherwise = (2*x) - 1 + sumaImpares (x-1)

-- ejercicio 5 
medioFact :: Int -> Int 
medioFact n | n == 0 = 1
            | n == 1 = 1
            | otherwise = n * medioFact (n-2)

-- ejercicio 6 
sumaDigitos :: Int -> Int 
sumaDigitos x | x > 0 && x < 10 = 1 
              | otherwise = mod x 10 + sumaDigitos (div x 10)

-- ejercicio 7 
todosDigitosIguales :: Int -> Bool 
todosDigitosIguales x | x > 0 && x < 10 = True 
                      | otherwise = (mod x 10  == mod (div x 10) 10 ) && todosDigitosIguales (div x 10 )


-- ejercicio 8 
iesimoDigito :: Int -> Int -> Int 
iesimoDigito x i | i == cantDigitos x = mod x 10
                 | otherwise = iesimoDigito (div x 10) i


cantDigitos :: Int -> Int 
cantDigitos n | n > 0 && n < 10 = 1 
              | otherwise = 1 + cantDigitos (div n 10)

-- ejercicio 9
esCapicua :: Int -> Bool 
esCapicua x | cantDigitos x  == 1 = True 
            | cantDigitos x == 2 = todosDigitosIguales x 
            | otherwise = iesimoDigito x 1 == iesimoDigito x (cantDigitos x) && esCapicua (sacarultypri x)

sacarultypri :: Int -> Int 
sacarultypri x | cantDigitos x == 1 = x
               | cantDigitos x == 2 = x
               | otherwise = mod (div x 10) 10             
                          


--parcial cuba wiki 25/08/2023

--ejercicio1
--votosenblanco :: [(String,String)] -> [Int] -> Int -> Int
--no entiendo la consigna directamente 

 --ejercicio 2
formulasvalidas :: [(String,String)] -> Bool 
formulasvalidas [] = True
formulasvalidas ((a,b):xs) | a == b = False
                           | pertenece (a,b) xs = False
                           | otherwise = formulasvalidas xs
                         

formulasiguales :: (String, String) -> (String,String) -> Bool 
formulasiguales (x,y) (a,b) | x == a || y == a = True
                            | x == b || y == b = True 
                            | otherwise = False 

pertenece :: (String, String) -> [(String, String)] -> Bool
pertenece _ [] = False 
pertenece (a,b) (x:xs) | formulasiguales (a,b) x = True
                       | otherwise = pertenece (a,b) xs

--ejercicio 3 
porcentaje :: String -> [(String,String)] -> [Int] -> Float            
porcentaje 