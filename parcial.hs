module Parcial where
{--
--ejercicio 1 
hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar c [] = False
hayQueCodificar c ((m,s):mapeos) = c == m || hayQueCodificar c mapeos 

--ejercicio 2
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c [] ((m,p):mapeos) = 0
cuantasVecesHayQueCodificar c (f:frase) ((m,p):mapeos) | hayQueCodificar c mapeos == False = 0
                                                       | c == f = 1 + cuantasVecesHayQueCodificar c frase ((m,p):mapeos)
                                                       | otherwise = cuantasVecesHayQueCodificar c frase ((m,p):mapeos)
                                                   
--ejercicio 3
laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char 
laQueMasHayQueCodificar [x] ((m,p):mapeos) = x
laQueMasHayQueCodificar (f:y:frase) ((m,p):mapeos) | cuantasVecesHayQueCodificar f (f:y:frase) ((m,p):mapeos) >= cuantasVecesHayQueCodificar y (f:y:frase) ((m,p):mapeos) = laQueMasHayQueCodificar (f:frase) ((m,p):mapeos)
                                                   | otherwise = laQueMasHayQueCodificar (y:frase) ((m,p):mapeos)

--ejercicio 4
codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] ((m,p):mapeos) = []
codificarFrase (f:frase) ((m,p):mapeos) = (cambiarletras f ((m,p):mapeos)) : (codificarFrase frase ((m,p):mapeos))


cambiarletras :: Char -> [(Char,Char)] -> Char
cambiarletras x [] = x
cambiarletras x ((m,p):mapeos) | hayQueCodificar x ((m,p):mapeos) == False = x
                               | x == m = p
                               | otherwise = cambiarletras x mapeos 

--}






--------------------------------------------------------------------------------------------------------------------------------------------------------------------------                
--1
hayQueCodificar :: Char -> [(Char,Char)] -> Bool 
hayQueCodificar c [] = False 
hayQueCodificar x ((m,p):mapeos) = x == m || hayQueCodificar x mapeos

--2 
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int 
cuantasVecesHayQueCodificar c [] ((m,p):mapeos) = 0 
cuantasVecesHayQueCodificar c (f:frase) ((m,p):mapeos) | hayQueCodificar c ((m,p):mapeos) == False = 0
                                                       | c == f = 1 + cuantasVecesHayQueCodificar c frase ((m,p):mapeos)
                                                       | otherwise = cuantasVecesHayQueCodificar c frase ((m,p):mapeos)

--3
laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar [x] ((m,p):mapeos) = x
laQueMasHayQueCodificar (f:y:frase) ((m,p):mapeos) | cuantasVecesHayQueCodificar f (f:y:frase) ((m,p):mapeos) >= cuantasVecesHayQueCodificar y (f:y:frase) ((m,p):mapeos) = laQueMasHayQueCodificar (f:frase) ((m,p):mapeos)
                                                   | otherwise = laQueMasHayQueCodificar (y:frase) ((m,p):mapeos)

--4
codificarFrase :: [Char]-> [(Char,Char)] -> [Char]
codificarFrase [] ((m,p):mapeos) = []
codificarFrase (f:frase) ((m,p):mapeos) = cambiarletras f ((m,p):mapeos) : codificarFrase frase ((m,p):mapeos)

cambiarletras :: Char -> [(Char,Char)] -> Char
cambiarletras x ((m,p):mapeos) | hayQueCodificar x ((m,p):mapeos) == False = x
                               | x == m = p
                               | otherwise = cambiarletras x mapeos


