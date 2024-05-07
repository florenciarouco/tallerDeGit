--guia 4 
--ejercicio 2
parteEntera :: Float -> Int
parteEntera 0 = 0
parteEntera x | x > 0 && x < 1 = 0 
              | otherwise = parteEntera (x-1) +1

--3
esDivisible :: Int -> Int -> Bool 
esDivisible x n | x == 0 = True
                | x < 0 = False
                | otherwise = esDivisible (x-n) n

--4
sumaImpares :: Int -> Int 
sumaImpares x | x == 1 = 1 
              | otherwise = (2*x) -1  + sumaImpares (x-1)

--5 
medioFact :: Int -> Int 
medioFact n | n == 0 = 1
            | n == 1 = 1
            | otherwise = n * medioFact (n-2)

--6
sumaDigitos :: Int -> Int 
sumaDigitos x | x > 0 && x < 10 = x 
              | otherwise = (mod x 10) +  sumaDigitos (div x 10)

-- 7 
todosDigitosIguales :: Int -> Bool 
todosDigitosIguales x | x > 0 && x < 10 = True 
                      | otherwise = (mod x 10) == (mod (div x 10) 10) && todosDigitosIguales (div x 10) 

--8
iesimoDigito :: Int -> Int -> Int 
iesimoDigito x i | i == cantDigitos x = mod x 10
                 | otherwise = iesimoDigito (div x 10) i

cantDigitos :: Int -> Int
cantDigitos x | x > 0 && x < 10 = 1 
              | otherwise = 1 + cantDigitos (div x 10) 

--9
esCapicua :: Int -> Bool 
esCapicua x | x > 0 && x < 10 = True 
            | cantDigitos x == 2 && todosDigitosIguales x == True = True
            | otherwise = iesimoDigito x 1 == iesimoDigito x (cantDigitos x) && esCapicua (sacarultypri x)


sacarultypri :: Int -> Int
sacarultypri x | cantDigitos x == 1 = x
               | cantDigitos x == 2 = x 
               | otherwise = mod (div x 10) 10

--10.a
f1 :: Int -> Int
f1 n | n == 0 = (2^0)
     | otherwise = (2^n) + f1 (n-1) 

--10.2
f2 :: Int -> Float -> Float 
f2 n q | n == 1 = q 
       | otherwise = (q^n) + f2 (n-1) q

--10.3
f3 :: Int -> Float -> Float 
f3 n q | n == 1 = (q^2)
       | otherwise = (q^(2*n)) + f3 (n-1) q

--10.4
f4 :: Int -> Float -> Float 
f4 n q | n == 1 = (q + q ^2)
       | otherwise = f3 n q - f2 (n-1) q

--12
raizDe2Aprox :: Int -> Float 
raizDe2Aprox x | x == 1 = 1
               | otherwise = sucesion x - 1

sucesion :: Int -> Float
sucesion x | x == 1 = 2
           | otherwise = 2 + 1 / sucesion (x-1)

-- Ejercicio 13
sumatoriaJ :: Integer -> Integer -> Integer
sumatoriaJ n m | m == 1 = n
               | otherwise = n^m + sumatoriaJ n (m-1)

sumatoriaIJ :: Integer -> Integer -> Integer
sumatoriaIJ n m | n == 1 = sumatoriaJ 1 m
                | otherwise = sumatoriaJ n m + sumatoriaIJ (n-1) m

-- Ejercicio 14
sumaPotenciasAux :: Integer -> Integer -> Integer -> Integer
sumaPotenciasAux q n m | m == 1 = aux q n 1
                       | otherwise = aux q n m + sumaPotenciasAux q n (m-1)

aux :: Integer -> Integer -> Integer -> Integer
aux q n m | n == 1 = q^(n+m)
          | otherwise = q^(n+m) + aux q (n-1) m
          
-- Ejercicio 15
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n m | n == 1 = sumatoriaQ 1 m
                   | otherwise = (sumatoriaQ n m) + sumaRacionales (n-1) m

sumatoriaQ :: Integer -> Integer -> Float
sumatoriaQ n m | m == 1 = fromIntegral (n)
               | otherwise = fromIntegral (n)/fromIntegral (m) + (sumatoriaQ n (m-1))

--16.a
menorDivisor :: Int -> Int
menorDivisor x | mod x 2 == 0 = 2
               | otherwise = menosdivisoraux x 2

menosdivisoraux :: Int -> Int -> Int
menosdivisoraux x i | mod x i == 0 = i 
                    | otherwise = menosdivisoraux x (i+1)

--b
esPrimo :: Int -> Bool 
esPrimo x = menorDivisor x == x 

--c
sonCoprimos :: Int -> Int -> Bool
sonCoprimos x y = gcd x y == 1 --wtf

--d
nEsimoPrimo :: Int -> Int 
nEsimoPrimo x | x == 1 = 2 
              | otherwise = nEsimoPrimoDesde x 2

nEsimoPrimoDesde :: Int -> Int -> Int 
nEsimoPrimoDesde x i | esPrimo i && x == 1 = i
                     | esPrimo i = nEsimoPrimoDesde (x - 1) (i + 1)
                     | otherwise = nEsimoPrimoDesde x (i + 1)

--17 
esFibonacci :: Int -> Bool 
esFibonacci n = esFibonacciDesde n 0

esFibonacciDesde :: Int -> Int -> Bool
esFibonacciDesde n i | n == fib i = True
                     | n < fib i = False
                     | otherwise = esFibonacciDesde n (i+1)

--18
mayorDigitoPar :: Int -> Int 
mayorDigitoPar n = buscarMayorDigitoPar n

buscarMayorDigitoPar :: Int -> Int 
buscarMayorDigitoPar n | n == 0 = (-1)
                       | esPar (digitoUnidades n) = max (digitoUnidades n) (buscarMayorDigitoPar (sacarUnidades n))
                       | otherwise = buscarMayorDigitoPar (sacarUnidades n)

esPar :: Int -> Bool
esPar x = mod x 2 == 0