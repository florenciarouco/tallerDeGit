
todoMeno :: (Float, Float) -> (Float, Float) -> Bool 
todoMeno (a, b) (c, d) = a<c && b<d


posPrimerPar :: (Int, Int , Int) -> Int 
posPrimerPar (x, y, z) | (mod x 2 == 0) = 1
                       | (mod y 2 == 0)= 2
                       | (mod z 2 == 0) = 3
                       | otherwise = 4


sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int 
sumarSoloMultiplos (a, b, c) d | mod a d == 0 && mod b d == 0 && mod c d == 0 = a + b +c
                               | mod a d == 0 && mod b d == 0 && mod c d /= 0 = a +b 
                               | mod a d == 0 && mod b d /= 0 && mod c d == 0 = a +c 
                               | mod a d /= 0 && mod b d == 0 && mod c d == 0 = b + c
                               | mod a d == 0 && mod b d /= 0 && mod c d /= 0 = a
                               | mod a d /= 0 && mod b d == 0 && mod c d /= 0 = b 
                               | mod a d /= 0 && mod b d /= 0 && mod c d == 0 = c
                               | otherwise = 0 


bisiesto :: Int -> Bool 
bisiesto x | mod x 100 == 0 = mod x 400 == 0
           | otherwise = mod x 4 == 0

absoluto :: Float -> Float
absoluto n | n < 0 = -n
           | otherwise = n 
distanciam :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciam  (x, y, z) (a, b, c) = absoluto (x - a) + absoluto (y - b) + absoluto (z - c) 




digitoUnidades :: Integer -> Integer
digitoUnidades x | (x > 0) = mod x 10
                 | otherwise = x * (-1) `mod` 10

digitoDecenas :: Integer -> Integer
digitoDecenas x | x > 0 = div ((x `mod` 100) - digitoUnidades x) 10
                | otherwise = div ((x * (-1) `mod` 100) - digitoUnidades x) 10

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = digitoUnidades (x) + digitoDecenas (x)

comparar :: Integer -> Integer -> Integer
comparar a b | sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b) = 1
             | sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b) = (-1)
             | sumaUltimosDosDigitos(a) == sumaUltimosDosDigitos(b) = 0





