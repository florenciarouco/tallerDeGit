module Probar where 


{--todosMenores :: (Int,Int,Int) -> Bool
todosMenores (a,b,c) = f a > g a && f b > g b && f c > g c 

f :: Int -> Int
f n | n <=7 = n^2
    | otherwise  = (2*n) -1

g :: Int -> Int 
g n | mod n 2 == 0 = div n 2 
    | otherwise = (3*n) +1 
           "f n con n <= 7" ~: (f 2) ~?= 4, 
    "f n con n > 7" ~: (f 9) ~?= 17,
    "g n con n par" ~: (g 4) ~?= 2, 
    "g n con n impar" ~: (g 7) ~?= 22,
    "todosMenores" ~: (todosMenores (8,3,5)) ~?= True,
    "todosMenores" ~: (todosMenores (1,2,3)) ~?= False 
     ]
--}

    


posPrimerPar :: (Int,Int,Int) -> Int 
posPrimerPar (a,b,c) | mod a 2 == 0 = 1
                     | mod b 2 == 0 = 2
                     | mod c 2 == 0 = 3
                     | otherwise = 4 
                     
