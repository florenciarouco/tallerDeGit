module Parcialc where

--ejercicio 1
--                         registro            alum      n 
aprobadoMasDeNMateria :: [([Char],[Int])]  -> [Char] -> Int -> Bool
aprobadoMasDeNMateria [] [] n = False 
aprobadoMasDeNMateria ((x,y):xs) alumnos n | x == alumnos && ((notas y) > n) = True
                                           | x == alumnos && ((notas y) <= n) = False
                                           | otherwise = aprobadoMasDeNMateria xs alumnos n 

notas :: [Int] -> Int 
notas [] = 0
notas (x:xs) | x >= 4 = 1 + notas xs    
             | otherwise = notas xs

--2
buenosAlumnos :: [([Char],[Int])] -> [[Char]]
buenosAlumnos [] = []
buenosAlumnos ((x,y):xs) | promedio y >= 8 && hayaplazos y == False = x : buenosAlumnos xs
                         | otherwise = buenosAlumnos xs 

hayaplazos :: [Int] -> Bool 
hayaplazos [] = False
hayaplazos (x:xs) = x < 4 || hayaplazos xs

promedio :: [Int] -> Float
promedio [] = 0
promedio (x:xs) = fromIntegral (sumanotas (x:xs)) / fromIntegral (cantidaddenotas (x:xs))  

cantidaddenotas :: [Int] -> Int
cantidaddenotas [] = 0
cantidaddenotas [x] = 1
cantidaddenotas (x:xs) = 1 + cantidaddenotas xs

sumanotas :: [Int] -> Int
sumanotas [] = 0
sumanotas [x] = x 
sumanotas (x:y:xs) = x + y + sumanotas xs

--3
mejorPromedio :: [([Char],[Int])] -> [Char]
mejorPromedio ((x,y):[]) = x
mejorPromedio ((x,y):(z,q):xs) | promedio y > promedio q = mejorPromedio ((x,y):xs)
                               | otherwise = mejorPromedio ((z,q):xs) 

--4
--                       registro         mat     alum
seGraduoConHonores :: [([Char],[Int])] -> Int -> [Char] -> Bool
seGraduoConHonores [] m [] = False
seGraduoConHonores ((x,y):xs) materias alumnos = (aprobadoMasDeNMateria ((x,y):xs) alumnos (materias-1))  && (pertenece (buenosAlumnos ((x,y):xs)) alumnos) && (((mejorPromedion ((x,y):xs)) - (promedio2 ((x,y):xs) alumnos)) < 1 )

pertenece :: [[Char]] -> [Char] -> Bool
pertenece [] alumnos = False
pertenece (x:xs) alumnos | x == alumnos = True
                         | otherwise = pertenece xs alumnos

promedio2 :: [([Char],[Int])] -> [Char] -> Float
promedio2 [] alumnos = 0
promedio2 ((x,y):xs) alumnos | x == alumnos = promedio y 
                             | otherwise = promedio2 xs alumnos

mejorPromedion :: [([Char],[Int])] -> Float
mejorPromedion [] = 0
mejorPromedion ((x,y):[]) = promedio y 
mejorPromedion ((x,y):(z,q):xs) | promedio y >= promedio q = mejorPromedion ((x,y):xs)
                                | otherwise = mejorPromedion ((z,q):xs)


