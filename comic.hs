--1
              --           nom    not      alu      n 
aproboMasDeNMaterias :: [([Char],[Int])] ->[Char] -> Int ->  Bool
aproboMasDeNMaterias [] [] materias = False
aproboMasDeNMaterias ((x,y):resto) alumnos materias | x == alumnos && ((mayoresacuatro y) > materias) = True
                                             | x == alumnos && ((mayoresacuatro y) <= materias) = False
                                             | otherwise = aproboMasDeNMaterias resto alumnos materias 

mayoresacuatro :: [Int] -> Int
mayoresacuatro [] = 0
mayoresacuatro (x:xs) | x >= 4 = 1 + mayoresacuatro xs 
                      | otherwise = mayoresacuatro xs

--2

buenosAlumnos :: [([Char],[Int])] -> [Char] 
buenosAlumnos [] = []
buenosAlumnos ((x,y):resto) | promedio y >= 8 && hayaplazos y == False = x 
                            | otherwise = buenosAlumnos resto 

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
sumanotas (x:xs) = x + sumanotas xs

--3
mejorPromedio :: [([Char],[Int])] -> [Char] 
mejorPromedio [] = []
mejorPromedio ((x,y):[]) = x 
mejorPromedio ((x,y):(z,q):resto) | promedio y >= promedio q = mejorPromedio ((x,y):resto)
                                  | otherwise = mejorPromedio ((z,q):resto)

--4
seGraduoConHonores :: [([Char],[Int])] -> Int -> [Char] -> Bool
seGraduoConHonores [] m [] = False
seGraduoConHonores ((x,y):xs) materias alumnos = (aprobadoMasDeNMateria ((x,y):xs) alumnos (materias-1))  && (pertenece (buenosAlumnos ((x,y):xs)) alumnos) && (((nmejorPromedio ((x,y):xs)) - (promedio2 ((x,y):xs) alumnos)) < 1 )


pertenece :: [[Char]] -> [Char] -> Bool
pertenece [] alumnos = False 
pertenece  (x:resto) alumnos | x == alumnos = True
                             | otherwise = pertenece resto alumnos 


promedio2 :: [([Char],[Int])] -> [Char] -> Float
promedio2 [] alumnos = 0
promedio2 ((x,y):xs) alumnos | x == alumnos = promedio y 
                             | otherwise = promedio2 xs alumnos 

nmejorPromedio :: [([Char],[Int])] -> Float
nmejorPromedio [] = 0 
nmejorPromedio ((x,y):[]) = promedio y 
nmejorPromedio ((x,y):(z,q):resto) | promedio y >= promedio q = nmejorPromedio ((x,y):resto)
                                   | otherwise = nmejorPromedio ((z,q):resto)


                      
