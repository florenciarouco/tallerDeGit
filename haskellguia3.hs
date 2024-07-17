f :: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

-- ejercicio 2 
absoluto :: Int -> Int
absoluto x | x >=  0 = x
           | x < 0 = -x

maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y | absoluto x > absoluto y = x
                   | otherwise = y
algunoes0 :: Float -> Float -> Bool
algunoes0 x y | x == 0  || y == 0 = True
              | otherwise = False

sumadistitnos :: Int -> Int -> Int -> Int
sumadistitnos x y z | x == y && y == z = x
                    | x == y && y /= z = y+z
                    | x /= y && y == z = x+y
                    | otherwise = x+y+z

esmultiplode :: Int -> Int -> Bool
esmultiplode x y | mod x y == 0 = True
                 | otherwise = False


digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10 



sumaultimosdosdigitos :: Int -> Int
sumaultimosdosdigitos x = digitoUnidades x + digitoUnidades (div x 10)

comparar :: Int -> Int -> Int
comparar x y | sumaultimosdosdigitos (x) < sumaultimosdosdigitos (y) = 1 
             | sumaultimosdosdigitos (x) > sumaultimosdosdigitos (y) = -1
             | sumaultimosdosdigitos (x) == sumaultimosdosdigitos (y) = 0 