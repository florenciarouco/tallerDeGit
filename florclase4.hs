-- factorial 4 = 4 * factorial (3)
          -- = 4 * (3 factorial (2))
          -- = 4 * (3 * (2 * factorial (1)))
          --  = 4 * (3 * (2 * (1 * factorial (0))))
          --  = 4 * (3 * (2 * (1 * (1))))
          --  = 4 * (6)
          --  = 24

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1) 

-- ejercico 1 
-- fib 0 = 0
-- fib 1 = 1
-- fib 4 =          fib (3)              + fib (2)
      -- = (fib (2)     + fib (1))       + (fib 1 + fib 0)
      -- = (((fib 1 + fib 0)) + 1)       + (1 + o)
      -- =       (1 + 0)      + 1        + 1 = 3

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- ejercicio 2
parteEntera :: Float -> Integer
parteEntera x | x < 1 && x >= 0 = 0
              | x  >= 1 = parteEntera (x - 1) + 1
              | x < 0 = -parteEntera (-x + 1) 

-- ejercicio 3 
esDivisible :: Integer -> Integer -> Bool
esDivisible x y | x == 0 = True
                | x < 0 = False
                | otherwise = esDivisible (x - y) y


-- ejercicio 4
sumaImpares :: Int -> Int
sumaImpares x | x == 1 = 1
              | otherwise = (2*x) - 1 + sumaImpares (x - 1)
              -- ((2*3) -1) + ((2*2)-1) + ((2*1)-1)
              -- ((6)-1) + ((4)-1) + ((2)-1)
              -- 5 + 3 + 1 =9  


-- ejercicio 5
medioFact :: Int -> Int 
medioFact x | x == 0 =  1
            | x == 1 = 1
            | otherwise = x * medioFact (x-2)

-- ejercicio 6 
sumaDigitos :: Int -> Int 
sumaDigitos x | x == 0 = 0
              | otherwise = mod x 10 + sumaDigitos (div x 10)

-- ejercicio 7
todosDigitosIguales :: Int -> Bool 
todosDigitosIguales x | x > 0 && x <= 9 = True
                      | otherwise = (digitoUnidades x == digitoUnidades (sacarUnidades x)) && todosDigitosIguales (sacarUnidades x)


digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10

sacarUnidades :: Int -> Int
sacarUnidades x = div x 10

--ejercicio 8
cantDigitos :: Int -> Int
cantDigitos x | x < 10 = 1
              | otherwise = 1 + cantDigitos (sacarUnidades x)


iesimoDigito :: Int -> Int -> Int
iesimoDigito x i | i == cantDigitos x = digitoUnidades x
                 | otherwise = iesimoDigito (sacarUnidades x) i


-- ejercicio 9
esCapicua :: Int -> Bool
esCapicua n | cantDigitos n == 1 = True
            | cantDigitos n == 2 = todosDigitosIguales n
            | otherwise = iesimoDigito n 1 == iesimoDigito n (cantDigitos n) && esCapicua (sacarultypri n)


sacarultypri :: Int -> Int 
sacarultypri n | cantDigitos n == 1 = n
               | cantDigitos n == 2 = n
               | otherwise = mod (sacarUnidades 10) 10

-- ejercicio 10
--a
f1 :: Integer -> Integer
f1 x | x == 0 = 1
     | otherwise = 2 ^ x + f1 (x - 1)

-- b
f2 :: Int -> Float -> Float
f2 n q | n == 1 = q 
       | otherwise = q ^ n + f2 (n - 1) q

--c
f3 :: Int -> Float -> Float 
f3 n q | n == 1 = q + q^2
       | otherwise = q ^(2 * n) + q ^(2 * n -1) + f3 (n - 1) q

--d 
f4 :: Int -> Float -> Float
f4 n q | n == 1 = (q + q ^2)
       | otherwise = f3 n q - f2 (n-1) q

-- ejercicio 11
--a
eAprox :: Int -> Float
eAprox n | n == 0 = 1
         | otherwise = 1 /(fromIntegral (factorial n)) + eAprox (n-1) 

--b
e :: Float 
e = eAprox 10 

--ejercicio 12
raizDe2Aprox :: Int -> Float 
raizDe2Aprox x | x == 1 = 1
               | otherwise = sucesion x - 1

sucesion :: Int -> Float
sucesion x | x == 1 = 2
           | otherwise = 2 + 1 / sucesion (x-1)


-- ejercicio 13
sumaPotenciasDe :: Int -> Int -> Int
sumaPotenciasDe n 1 = n
sumaPotenciasDe n m = n^m + sumaPotenciasDe n (m-1)

sumaDoblePotencias :: Int -> Int -> Int
sumaDoblePotencias 1 m = sumaPotenciasDe 1 m 
sumaDoblePotencias n m = sumaPotenciasDe n m + sumaDoblePotencias (n-1) m

-- ejercicio 14 
sumaPotencias :: Int -> Int -> Int -> Int
sumaPotencias q n m | n == 1 = sumaPotenciasAux q 1 m
                    | otherwise = sumaPotenciasAux q n m + sumaPotencias q (n-1) m

sumaPotenciasAux :: Int -> Int -> Int -> Int
sumaPotenciasAux q n m | m == 1 = q^(n+1)
                       | otherwise = q^(n+m) + sumaPotenciasAux q n (m-1)

-- ejercicio 15
sumaRacionales :: Int -> Int -> Float 
sumaRacionales n m | n == 1 = sumaRacionalesM 1 m
                   | otherwise = sumaRacionalesM n m + sumaRacionales (n-1) m

sumaRacionalesM :: Int -> Int -> Float
sumaRacionalesM n m | m == 1 = fromIntegral n -- Lo mismo q decir 1/n
                    | otherwise = (fromIntegral n / fromIntegral m) + sumaRacionalesM n (m-1)


-- ejercicio 16
--a
menorDivisor:: Int -> Int 
menorDivisor x = menorDivisorDesde x 2 
               

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde x y | x == y = y
                      | mod x y == 0 = y 
                      | otherwise = menorDivisorDesde x (y+1)
-- b 
esPrimo :: Int -> Bool 
esPrimo x = menorDivisor x == x

--c 
sonCoprimos :: Int -> Int -> Bool
sonCoprimos x y = gcd x y == 1 

-- d
nEsimoPrimo :: Int -> Int
nEsimoPrimo n = nEsimoPrimoDesde n 2 

nEsimoPrimoDesde :: Int -> Int -> Int 
nEsimoPrimoDesde n x | esPrimo x && n == 1 = x
                     | esPrimo x = nEsimoPrimoDesde (n - 1) (x + 1)
                     | otherwise = nEsimoPrimoDesde n (x + 1)
--ejercicio 17
esFibonacci :: Int -> Bool
esFibonacci n = esFibonacciDesde n 0

esFibonacciDesde :: Int -> Int -> Bool
esFibonacciDesde n i | n == fib i = True
                     | n < fib i = False
                     | otherwise = esFibonacciDesde n (i+1)

-- ejercicio 18
mayorDigitoPar :: Int -> Int 
mayorDigitoPar n = buscarMayorDigitoPar n

buscarMayorDigitoPar :: Int -> Int 
buscarMayorDigitoPar n | n == 0 = (-1)
                       | esPar (digitoUnidades n) = max (digitoUnidades n) (buscarMayorDigitoPar (sacarUnidades n))
                       | otherwise = buscarMayorDigitoPar (sacarUnidades n)

esPar :: Int -> Bool
esPar x = mod x 2 == 0

-- Ejercicio 19 
esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosDesde 1 n 

esSumaInicialDePrimosDesde :: Int -> Int -> Bool
esSumaInicialDePrimosDesde m n | sumaMprimerosPrimos m == n = True
                               | sumaMprimerosPrimos m > n = False
                               | sumaMprimerosPrimos m < n = esSumaInicialDePrimosDesde (m+1) n

sumaMprimerosPrimos :: Int -> Int
sumaMprimerosPrimos m = sumaMprimerosPrimosDesde 2 m 

sumaMprimerosPrimosDesde :: Int -> Int -> Int
sumaMprimerosPrimosDesde i m | m == 0 = 0
                             | esPrimo i = i + sumaMprimerosPrimosDesde (i+1) (m-1)
                             | otherwise = sumaMprimerosPrimosDesde (i+1) m 

-- ejercicio 20
-- ejercicio 21



