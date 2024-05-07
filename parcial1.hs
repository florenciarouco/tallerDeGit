--EJERCICIO 1

hayQueCodificar :: Char -> [(Char,Char)]->Bool
hayQueCodificar x [] = False
hayQueCodificar x ((a,b):ys) | x == a = True
                             | otherwise = hayQueCodificar x ys 

--EJERCICIO 2
cuantasVecesHayQueCodificar :: Char -> [Char]->[(Char,Char)]->Integer
cuantasVecesHayQueCodificar x [] ((a,b):xs) = 0
cuantasVecesHayQueCodificar x (y:ys) ((a,b):xs) | hayQueCodificar x ((a,b):xs) == False = 0
                                                | x == y = 1 + cuantasVecesHayQueCodificar x ys ((a,b):xs)
                                                | otherwise = cuantasVecesHayQueCodificar x ys ((a,b):xs)

--EJERCICIO 3
laQueMasHayQueCodificar :: [Char]-> [(Char,Char)]->Char
laQueMasHayQueCodificar [x] xs = x 
laQueMasHayQueCodificar (x:y:ys) ((a,b):xs) | cuantasVecesHayQueCodificar x (x:y:ys) ((a,b):xs) >= cuantasVecesHayQueCodificar y (x:y:ys) ((a,b):xs) = laQueMasHayQueCodificar (x:ys) ((a,b):xs)
                                            | otherwise = laQueMasHayQueCodificar (y:ys) ((a,b):xs)

--EJERCICIO 4 
codificarFrase :: [Char]-> [(Char,Char)]->[Char]
codificarFrase [] xs = []
codificarFrase (y:ys) ((a,b):xs) = (reemplazar y ((a,b):xs)):(codificarFrase ys ((a,b):xs))

reemplazar :: Char -> [(Char,Char)] ->Char
reemplazar x [] = x
reemplazar x ((a,b):xs) | not (hayQueCodificar x ((a,b):xs)) = x 
                        | x == a = b
                        | otherwise = reemplazar x xs