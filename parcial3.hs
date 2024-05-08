module Parcial3 where
aproboMasDeNMaterias :: [([Char], [Int])] -> [Char] -> Int -> Bool
aproboMasDeNMaterias [] _ _ = False
aproboMasDeNMaterias ((alumnoT, notas) : lista) alumnoB n | alumnoT /= alumnoB = aproboMasDeNMaterias lista alumnoB n
                                                          | alumnoB == alumnoT = notasMayoresA4 notas > n
                                                          where notasMayoresA4 [] = 0
                                                                notasMayoresA4 (x : xs) | x >= 4 = 1 + notasMayoresA4 xs
                                                                                        | otherwise = notasMayoresA4 xs
longitud :: [t] -> Int
longitud [] = 0
longitud (x : xs) = 1 + longitud xs

promedio :: [Int] -> Float
promedio notas = fromIntegral (sumatoria notas) / fromIntegral (longitud notas)
               where sumatoria [] = 0
                     sumatoria (x : xs) = x + sumatoria xs

noHayAplazos :: [Int] -> Bool
noHayAplazos [] = True
noHayAplazos (x : xs) = x >= 4 && noHayAplazos xs

promociona :: [Int] -> Bool
promociona notas = noHayAplazos notas && promedio notas >= 8

buenosAlumnos :: [([Char], [Int])] -> [[Char]]
buenosAlumnos [] = []
buenosAlumnos ((alumno, notas) : registro) | promociona notas = alumno : buenosAlumnos registro
                                           | otherwise = buenosAlumnos registro

mejorPromedio :: [([Char], [Int])] -> [Char]
mejorPromedio [] = []
mejorPromedio [(alumno1, notas1)] = alumno1 
mejorPromedio [(alumno1, notas1), (alumno2, notas2)] | promedio notas1 >= promedio notas2 = alumno1
                                                     | otherwise = alumno2
mejorPromedio ((alumno1, notas1) : (alumno2, notas2) : registro) | promedio notas1 >= promedio notas2 = mejorPromedio ((alumno1, notas1) : registro)
                                                                 | otherwise = mejorPromedio ((alumno2, notas2) : registro)

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y : xs) = x == y || pertenece x xs

promedioAlumno :: [Char] -> [([Char], [Int])] -> Float
promedioAlumno alumno ((alumno2, notas) : registro) | alumno == alumno2 = promedio notas
                                                    | otherwise = promedioAlumno alumno registro

absl :: (Num t) => (Ord t) => t -> t
absl n | n >= 0 = n 
      | otherwise = (-n)

seGraduoConHonores :: [([Char], [Int])] -> Int -> [Char] -> Bool
seGraduoConHonores registro cant alumno = aproboMasDeNMaterias registro alumno (cant - 1) && pertenece alumno (buenosAlumnos registro) && absl (promedioAlumno (mejorPromedio registro) registro - promedioAlumno alumno registro) < 1