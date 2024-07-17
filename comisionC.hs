--1 
aprobomasdeNmaterias :: [([Char],[Int])] -> [Char] -> Int -> Bool
aprobomasdeNmaterias [] alumno n = False
aprobomasdeNmaterias ((x,(a:as)):xs) alumno n | x == alumno && mayora4 (a:as) > n = True
                                              | otherwise = aprobomasdeNmaterias xs alumno n 

mayora4 :: [Int] -> Int
mayora4 [] = 0
mayora4 (x:xs) | x >= 4 = 1 + mayora4 xs    
               | otherwise = mayora4 xs 

--2
buenosAlumnos :: [([Char],[Int])] -> [[Char]] 
buenosAlumnos [] = []
buenosAlumnos ((x,(a:as)):xs) | promedio (a:as) >= 8 && menora4 (a:as) == False = x : buenosAlumnos xs
                              | otherwise = buenosAlumnos xs 

menora4 :: [Int] -> Bool
menora4 [] = False
menora4 (x:xs) = x < 4 || menora4 xs 

suma :: [Int] -> Int 
suma [] = 0
suma[x] = x
suma (x:xs) = x + suma xs 

promedio :: [Int] -> Float
promedio [] = 0
promedio (x:xs) = fromIntegral (suma (x:xs)) / fromIntegral (cantidad (x:xs))

cantidad :: [Int] -> Int
cantidad [] = 0
cantidad [x] = 1
cantidad (x:xs) = 1 + cantidad xs 

--3
mejorPromedio :: [([Char],[Int])] -> [Char]
mejorPromedio [] = []
mejorPromedio [(x,y)] = x
mejorPromedio ((x,y):(a,b):xs) | promedio y >= promedio b = mejorPromedio ((x,y):xs)
                               | otherwise = mejorPromedio ((a,b):xs)

--4

pertenece :: [[Char]] -> [Char] ->  Bool
pertenece [] alumno = False
pertenece (x:xs) alumno | x == alumno = True
                        | otherwise = pertenece xs alumno 

seGraduoConHonores :: [([Char],[Int])] -> Int -> [Char] -> Bool
seGraduoConHonores [] n alumno = False
seGraduoConHonores ((x,y):xs) n alumno = (aprobomasdeNmaterias ((x,y):xs) alumno (n-1)) && (pertenece (buenosAlumnos ((x,y):xs)) alumno) && (((mejorPromedion ((x,y):xs)) - (promedio2 ((x,y):xs) alumno ))  <1 )   

promedio2 :: [([Char],[Int])] -> [Char] -> Float
promedio2 [] alumnos = 0
promedio2 ((x,y):xs) alumnos | x == alumnos = promedio y 
                             | otherwise = promedio2 xs alumnos

mejorPromedion :: [([Char],[Int])] -> Float
mejorPromedion [] = 0
mejorPromedion ((x,y):[]) = promedio y 
mejorPromedion ((x,y):(z,q):xs) | promedio y >= promedio q = mejorPromedion ((x,y):xs)
                                | otherwise = mejorPromedion ((z,q):xs)
