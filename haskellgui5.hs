longitud :: [t] -> Int
longitud [] = 0
longitud [x] = 1
longitud (x:xs) = 1 + longitud xs

ultimo :: [t] -> t 
ultimo [x] = x
ultimo (x:xs) = ultimo xs

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

reverso :: [t] -> [t]
reverso [x] = [x]
reverso (x:xs) = reverso xs ++ [x]

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False 
pertenece e (x:xs) | e == x = True
                   | otherwise = pertenece e xs 

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) | x == y =  todosIguales (y:xs) 
                      | otherwise = False

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:y:xs) | x /= y = todosDistintos (y:xs)
                        | otherwise = False

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) | pertenece x xs = True
                    | hayRepetidos xs = True
                    | otherwise = False

quitar :: (Eq t) => t -> [t] -> [t] 
quitar x [] = []
quitar x (y:xs) | x == y = xs 
                | otherwise = y : quitar x xs 

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x [] = []
quitarTodos x (y:xs) | x == y = quitarTodos x xs 
                     | otherwise = y : quitarTodos x xs 

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos (x:xs) (y:ys) | pertenece x (y:ys) && pertenece y (x:xs) = True
                              | otherwise = mismosElementos xs ys 
-- no esta completamente bien 

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs) | (x:xs) == reverso (x:xs) = True
               | otherwise = False

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs 

productoria :: [Int] -> Int
productoria [] = 0
productoria [x] = x
productoria (x:xs) = x * productoria xs 

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | otherwise = maximo (y:xs)

sumarN :: Int -> [Int] -> [Int]
sumarN n [] = []
sumarN n [x] = [(x+n)]
sumarN n (x:xs) =  x+n : sumarN n xs 

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero [] = []
sumarElPrimero [x] = [(x+x)]
sumarElPrimero (x:xs) =  x+x : sumarElPrimero xs

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo [] = []
sumarElUltimo [x] = [(x+x)]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs) 


pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) |  mod x 2 == 0 = x : pares xs 
             | otherwise = pares xs 

multiplosDeN :: Int -> [Int] -> [Int]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | mod n x == 0 = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

minimo ::  [Int] -> Int
minimo [x] = x
minimo (x:y:xs) | x < y = minimo (x:xs)
                | otherwise = minimo (y:xs)

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar [x] = [x]
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs)





--------------------------REPASASAR EJERCICIO 4--------------------------------------------
--1
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (a:b:xs) | a == ' ' && b == ' ' = sacarBlancosRepetidos (a:xs)
                               | otherwise = a : sacarBlancosRepetidos (b:xs)
--2
contarPalabras :: [Char] -> Int
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:xs) = 1 + aux (blancoinicio (blancofinal (sacarBlancosRepetidos (x:xs))))

aux :: [Char] -> Int
aux [] = 0
aux (x:xs) | x == ' ' = 1 + aux xs 
           | otherwise = aux xs 

blancoinicio :: [Char] -> [Char]
blancoinicio [] = []
blancoinicio (x:xs) | x == ' ' = xs
                    | otherwise = x:xs 

blancofinal :: [Char] -> [Char]
blancofinal [] = []
blancofinal [x] | x == ' ' = []
                | otherwise = [x]
blancofinal (x:xs) = x : blancofinal xs 


--3
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs) = primera (x:xs) : palabras (sacarprimera (x:xs))

primera :: [Char] -> [Char]
primera [] = []
primera (x:xs) = auxprimera ( blancoinicio (blancofinal (sacarBlancosRepetidos (x:xs))))

auxprimera :: [Char] -> [Char]
auxprimera [] = []
auxprimera (x:xs) | x == ' ' = []
                  | otherwise = x : auxprimera xs
sacarprimera :: [Char] -> [Char]
sacarprimera [] = []
sacarprimera (x:xs) = auxsacar (blancoinicio (blancofinal (sacarBlancosRepetidos (x:xs))))

auxsacar :: [Char] -> [Char]
auxsacar [] = []
auxsacar (x:xs) | x == ' ' = xs
                | otherwise = auxsacar xs
--4
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga (x:xs) | sacarprimera (x:xs) == "" = primera (x:xs)
                       | longitud (primera (x:xs)) < longitud (primera (sacarprimera (x:xs))) = palabraMasLarga (sacarprimera (x:xs))
                       | otherwise = palabraMasLarga ((primera (x:xs)) ++ [' '] ++ sacarprimera (sacarprimera (x:xs)))


--5++
type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]


enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos nombre ((x,y):xs) | nombre == x = True
                                 | otherwise = enLosContactos nombre xs

agregarContacto :: Contacto -> ContactosTel -> ContactosTel 
agregarContacto (nombre,tel) [] = [(nombre,tel)]
agregarContacto (nombre,tel) ((x,y):xs) | enLosContactos nombre ((x,y):xs) == True = (nombre,tel): xs
                                        | otherwise = (x,y) : agregarContacto (nombre,tel) xs

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel 
eliminarContacto _ [] = []
eliminarContacto nombre ((x,y):xs) | nombre == x = eliminarContacto nombre xs 
                                   | otherwise = (x,y) : eliminarContacto nombre xs 

--------------------------------------------------------------------------------------------------------------------------------------------
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
data Disponibilidad = Libre | Ocupado deriving (Eq, Show)

existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker numero [] = False
existeElLocker numero ((x,y):xs) | numero == x = True
                                 | otherwise = existeElLocker numero xs 


ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion 
ubicacionDelLocker numero [] = []
ubicacionDelLocker numero ((x,(d,u)):xs) | numero == x = u 
                                         | otherwise = ubicacionDelLocker numero xs 

estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool
estaDisponibleElLocker numero [] = False
estaDisponibleElLocker numero ((x,(d,u)):xs) | numero == x && d == Libre = True
                                             | otherwise = estaDisponibleElLocker numero xs
            

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers 
ocuparLocker numero [] = []
ocuparLocker numero ((x,(d,u)):xs) | numero == x && d == Libre = ((x,(Ocupado,u)):xs)
                                   | numero == x && d == Ocupado = ((x,(d,u)):xs)
                                   | otherwise = (x,(d,u)) : ocuparLocker numero xs 
