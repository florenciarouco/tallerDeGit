fibonacci :: Int -> Int
fibonacci n | n == 0 = 0
            | n == 1 = 1 
            | otherwise = fibonacci(n-1) + fibonacci (n-2) 

parteEntera :: Float -> Int
parteEntera x | x >= 0 && x < 1 = 0
              | otherwise = parteEntera (x-1) +1

esDivisible :: Int -> Int -> Bool
esDivisible x y | mod x y == 0 = True
                | otherwise = False

sumaImpares :: Int -> Int
sumaImpares x | x == 1 = 1
              | otherwise = (2*x) - 1 + sumaImpares (x - 1)

espar :: Int -> Bool
espar x | mod x 2 == 0 = True
        | otherwise = False 

medioFact :: Int -> Int
medioFact n | n == 0 = 1 
            | n == 1 = 1
            | otherwise = n*medioFact (n-2)

digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10


digitodecenas :: Int -> Int
digitodecenas x = digitoUnidades (div x 10)

sumaDigitos :: Int -> Int
sumaDigitos n | n >= 0 && n < 1 = n
              | otherwise = digitoUnidades n + sumaDigitos (div n 10)
