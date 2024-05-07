--
sumaDigitos :: Int -> Int 
sumaDigitos x | x > 0 && x < 10 = x 
              | otherwise = (mod x 10) +  sumaDigitos (div x 10)
--
todosDigitosIguales :: Int -> Bool 
todosDigitosIguales x | x > 0 && x < 10 = True 
                      | otherwise = (mod x 10  == mod (div x 10) 10 ) && todosDigitosIguales (div x 10 )
--
iesimoDigito :: Int -> Int -> Int 
iesimoDigito x i | i == cantDigitos x = mod x 10
                 | otherwise = iesimoDigito (div x 10) i

cantDigitos :: Int -> Int 
cantDigitos n | n > 0 && n < 10 = 1 
              | otherwise = 1 + cantDigitos (div n 10)
--
esCapicua :: Int -> Bool 
esCapicua x | cantDigitos x  == 1 = True 
            | cantDigitos x == 2 = todosDigitosIguales x 
            | otherwise = iesimoDigito x 1 == iesimoDigito x (cantDigitos x) && esCapicua (sacarultypri x)

sacarultypri :: Int -> Int 
sacarultypri x | cantDigitos x == 1 = x
               | cantDigitos x == 2 = x
               | otherwise = mod (div x 10) 10             
--
nEsimoPrimo :: Int -> Int 
nEsimoPrimo x | x == 1 = 2 
              | otherwise = nEsimoPrimoDesde x 2

nEsimoPrimoDesde :: Int -> Int -> Int 
nEsimoPrimoDesde x i | esPrimo i && x == 1 = i
                     | esPrimo i = nEsimoPrimoDesde (x - 1) (i + 1)
                     | otherwise = nEsimoPrimoDesde x (i + 1)
--
--
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
--
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs
--
principio :: [t] -> [t]
principio [x] = [] 
principio (x:xs) = x : principio xs
-- 
reverso :: [t] -> [t]
reverso [] = []
reverso [x] = [x]
reverso xs = ultimo xs : reverso (principio xs)
--
pertenece :: (Eq t) => t -> [t] -> Bool 
pertenece  e [] = False 
pertenece e (x:xs) =  e == x || pertenece e xs 
--
todosiguales :: (Eq t) => [t] -> Bool
todosiguales [] = True 
todosiguales [x] = True
todosiguales (x:xs) = x == head xs && todosiguales xs 
--
hayRepetidos :: (Eq t) => [t] -> Bool 
hayRepetidos [] = False 
hayRepetidos [x] = False 
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs
--
quitar :: (Eq t) => t -> [t] -> [t]
quitar e [] = [] 
quitar e (x:xs) | e == x = xs
                | otherwise = x : quitar e xs
--
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos e [] = []
quitarTodos e (x:xs) | e == x = quitarTodos x xs
                     | otherwise = e : quitarTodos x xs
--
eliminarRepetidos :: (Eq t) => [t] -> [t] 
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x:eliminarRepetidos (quitarTodos x xs)
--
mismoselementos :: (Eq t) => [t] -> [t] -> Bool 
mismoselementos [] [] = True
mismoselementos (x:xs) (y:ys) | x == y && xs == ys = True
                              | otherwise = False 
--
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar (x:xs) = minimo (x:xs) : ordenar (quitar (minimo (x:xs)) (x:xs))

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:y:xs) | x < y = minimo (x:xs) 
                | otherwise = minimo (y:xs)
--
contarpalabras :: [Char] -> Int
contarpalabras [] = 0
contarpalabras [x] | x == ' ' = 0
                   | otherwise = 1
contarpalabras [x,y] | x == ' ' && y == ' ' = 0
                     | otherwise = 1
contarpalabras (x:y:xs) | x /= ' ' && y == ' ' = 1 + contarpalabras (y:xs)
                        | otherwise = contarpalabras (y:xs)
--
relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True 
relacionesValidas ((p1,p2):personas) = p1 /= p2 && (noaparece (p1,p2) personas) && relacionesValidas personas
                                    

noaparece :: (String,String) -> [(String,String)] -> Bool 
noaparece _ [] = True
noaparece (a,b) ((p1,p2):personas) =  a/= p1 && a /= p2 && b /= p1 && b /= p2 && noaparece (a,b) personas
--
personas :: [(String,String)] -> [String] 
personas [] = []
personas ((p1,p2):per) = quitarrepetidos (p1 : p2 : personas per)

quitarrepetidos :: [String] -> [String]
quitarrepetidos [] = []
quitarrepetidos [x] = [x] 
quitarrepetidos (x:xs) | pertenece x xs = quitarrepetidos xs 
                       | otherwise = x : quitarrepetidos xs
                       
pertenece :: String -> [String] -> Bool 
pertenece _ [] = False 
pertenece y (x:xs) | y == x = True 
                   | otherwise = pertenece y xs 
--
amigosDe :: String -> [(String,String)] -> [String] 
amigosDe _ [] = []
amigosDe persona ((p1,p2):otros) | persona == p1 = p2 : amigosDe persona otros 
                                 | persona == p2 = p1 : amigosDe persona otros
                                 | otherwise = amigosDe persona otros 
--
amigosDe :: String -> [(String,String)] -> [String] 
amigosDe _ [] = []
amigosDe persona ((p1,p2):otros) | persona == p1 = p2 : amigosDe persona otros 
                                 | persona == p2 = p1 : amigosDe persona otros
                                 | otherwise = amigosDe persona otros 
--
longitud :: [String] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

cantAmigos :: String -> [(String,String)] -> Integer
cantAmigos p ((a,b):bs) = longitud (amigosDe p ((a,b):bs))

personaConMasAmigosAux :: [String] -> [(String,String)] -> String
personaConMasAmigosAux _ [] = "nadie"
personaConMasAmigosAux [x] ((a,b):bs) = x
personaConMasAmigosAux (x:y:xs) ((a,b):bs) | cantAmigos x ((a,b):bs) >= cantAmigos y ((a,b):bs) = personaConMasAmigosAux (x:xs) ((a,b):bs)
                                           | otherwise = personaConMasAmigosAux (y:xs) ((a,b):bs)

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos [] = "nadie"
personaConMasAmigos ((a,b):bs) = personaConMasAmigosAux (personas ((a,b):bs)) ((a,b):bs)
--
votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int 
votosEnBlanco [] [] y = 0
votosEnBlanco ((p,v):formulas) (x:xs) y | formulasValidas ((p,v):formulas) == True = y - votosAfirmativos (x:xs)
                                        | otherwise = 0

votosAfirmativos :: [Int] -> Int
votosAfirmativos [] = 0
votosAfirmativos (x:xs) = x + votosAfirmativos xs  
--
porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeVotos presidente [] [] = 0
porcentajeDeVotos presidente ((p,v):formulas) (voto:votos) = (division (cantidadDeVotos presidente ((p,v):formulas) (voto:votos)) (votosAfirmativos (voto:votos))) *100
                                                                                                    
cantidadDeVotos :: String -> [(String,String)] -> [Int] -> Int
cantidadDeVotos presidente [] [] = 0
cantidadDeVotos presidente ((p,v):formulas) (voto:votos) | presidente == p = voto
                                                         | otherwise = cantidadDeVotos presidente formulas votos

division :: Int -> Int -> Float 
division a b = (fromIntegral a)/(fromIntegral b)
--
proximoPresidente :: [(String,String)] -> [Int] -> String 
proximoPresidente [] [] = ""
proximoPresidente ((p,v):formulas) (voto:votos) | masvotado (voto:votos) == voto = p 
                                                | otherwise = proximoPresidente formulas votos

masvotado :: [Int] -> Int
masvotado [] = 0
masvotado [x] = x
masvotado (x:y:xs) | x >= y = masvotado (x:xs)
                   | otherwise = masvotado (y:xs)
























palabras :: [Char] -> [[Char]]
palabras [] = [[]]
palabras xs = rangopalabras 1 (contarpalabras xs) xs
 
npalabras :: Int -> [Char] -> [Char] 
npalabras _ [] = []
npalabras _ [x] = [x] 
npalabras 1 (x:xs) | x == ' ' = npalabras 1 xs
                   | head xs /= ' ' = x : npalabras 1 xs
                   | head xs == ' ' = [x] 
npalabras n (x:xs) | x == ' ' = npalabras n xs
                   | head xs /= ' ' = npalabras n xs
                   | head xs == ' ' = npalabras (n-1) xs

rangopalabras :: Int -> Int -> [Char] -> [[Char]]
rangopalabras n m xs | n == m = [npalabras n xs]
                     | otherwise = [npalabras n xs] ++ rangopalabras (n+1) m xs
