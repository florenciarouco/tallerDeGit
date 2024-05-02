module 3 where 
    
--ejercicio 2.a
absoluto :: Float -> Float 
absoluto x | x < 0 = -x 
           | otherwise = x

--2.b
maximoabsoluto :: Float -> Float -> Float 
maximoabsoluto x y | absoluto (x) > absoluto (y) = absoluto (x) 
                   | otherwise = absoluto (y)

--2.c
maximo3 :: Float -> Float -> Float -> Float 
maximo3 x y z | x > y && x > z = x 
              | y > x && y > z = y 
              | z > x && z > y = z 

--2.d
algunoEs0 :: Float -> Float -> Bool 
algunoEs0 x y | x == 0 || y == 0 = True
              | otherwise = False 

algunoEs0bis:: Float -> Float -> Bool
algunoEs0bis 0 _ = True 
algunoEs0bis _ 0 = True 
algunoEs0bis _ _ = False 

--2.e
ambosEs0 :: Float -> Float -> Bool 
ambosEs0 x y | x == 0 && y == 0 = True
             | otherwise = False 

ambosEs0bis :: Float -> Float -> Bool
ambosEs0bis 0 0 = True 
ambosEs0bis _ _ = False 

--2.f
mismointervalo :: Float -> Float -> Bool 
mismointervalo x y = x <= 3 && y >= 3 || ((x>3 && y <= 7) && (y>3 && y <=7)) || (x>7 && y >7)

--2.g
sumaDistintos :: Float -> Float -> Float -> Float 
sumaDistintos x y z | x == y && y == z = 0
                    | x == y = z
                    | x == z = y 
                    | y == z = x
                    | otherwise = x+y+z

--2-h
esmultiplode  :: Int -> Int -> Bool 
esmultiplode x y | mod x y == 0 = True 
                 | otherwise = False 

--2.i 
digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10 

--2.j 
digitoDecenas :: Int -> Int 
digitoDecenas x = digitoUnidades (div x 10)

--ejercicio 3
estanRelacionados :: Int -> Int -> Bool 
estanRelacionados a b | mod a b == 0 = True 
                      | otherwise = False 

--ejercicio 4.a
prodInt :: (Float,Float) -> (Float,Float) -> Float 
prodInt (a,b) (c,d) = a*c+b*d

--4.b
todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor (a,b) (c,d) | a < c && b < d = True
                      | otherwise = False

--4.c
distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float  
distanciaPuntos (a,b) (c,d) = sqrt ((c-a)^2 + (d-b)^2)

--4.d
sumaTerna :: (Float,Float,Float) -> Float
sumaTerna (a,b,c) = a+b+c

--4.e
sumarSoloMultiplos :: (Int,Int,Int) -> Int -> Int 
sumarSoloMultiplos (a,b,c) d | mod a d == 0 && mod b d == 0 && mod c d == 0 = a+b+c
                             | mod a d == 0 && mod b d == 0 && mod c d /= 0 = a+b
                             | mod a d == 0 && mod b d /= 0 && mod c d == 0 = a+c
                             | mod a d /= 0 && mod b d == 0 && mod c d == 0 = b+c
                             | mod a d == 0 && mod b d /= 0 && mod c d /= 0 = a
                             | mod a d /= 0 && mod b d == 0 && mod c d /= 0 = b
                             | mod a d /= 0 && mod b d /= 0 && mod c d == 0 = c
                             |otherwise = 0

--4.f
posPrimerPar :: (Int,Int,Int) -> Int 
posPrimerPar (a,b,c) | mod a 2 == 0 = 1
                     | mod b 2 == 0 = 2
                     | mod c 2 == 0 = 3
                     | otherwise = 4 

--4.g
crearpar :: a -> b -> (a,b) 
crearpar a b = (a,b)

--4.h
invertir :: (a,b) -> (b,a) 
invertir (a,b) = (b,a)

--5
todosMenores :: (Int,Int,Int) -> Bool
todosMenores (a,b,c) = f a > g a && f b > g b && f c > g c 

f :: Int -> Int 
f n | n <= 7 = n^2
    | otherwise = (2*n)-1

g :: Int -> Int
g n | mod n 2 == 0 = div n 2
    | otherwise = (3*n) +1

--6
bisiesto :: Int -> Bool 
bisiesto n = mod n 4 == 0 && mod n 100 /= 0 || mod n 400 == 0 

--7 w
distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciaManhattan (a,b,c) (x,y,z) = absoluto (a-x) + absoluto (b-y) + absoluto (c-z)

--8
comparar :: Int -> Int -> Int
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1 
             | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
             | otherwise = 0

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = mod x 10 + (mod (div x 10) 10) 

--9 