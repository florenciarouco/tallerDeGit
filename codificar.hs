--1
hayqueCodificar :: Char -> [(Char,Char)] -> Bool
hayqueCodificar c [] = False
hayqueCodificar c ((m,p):mapeos) | c == m = True
                                 | otherwise = hayqueCodificar c mapeos

--2 
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c [] ((m,p):mapeos) = 0
cuantasVecesHayQueCodificar c (f:frase) ((m,p):mapeos) | hayqueCodificar c ((m,p):mapeos) == False = 0
                                                       | c == f = 1 + cuantasVecesHayQueCodificar c frase ((m,p):mapeos)
                                                       | otherwise = cuantasVecesHayQueCodificar c frase ((m,p):mapeos)

--3
laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar [x] ((m,p):mapeos) = x 
laQueMasHayQueCodificar (f:y:frase) ((m,p):mapeos) | cuantasVecesHayQueCodificar f (f:y:frase) ((m,p):mapeos) >= cuantasVecesHayQueCodificar y (f:y:frase) ((m,p):mapeos) = laQueMasHayQueCodificar (f:frase) ((m,p):mapeos)
                                                   | otherwise = laQueMasHayQueCodificar (y:frase) ((m,p):mapeos)

--4
codificarFrase :: [Char] -> [(Char,Char)] -> [Char] 
codificarFrase [] ((m,p):mapeos) = []
codificarFrase (f:frase) ((m,p):mapeos) = cambiarletras f ((m,p):mapeos) : codificarFrase frase ((m,p):mapeos)
                                
cambiarletras :: Char -> [(Char,Char)] -> Char
cambiarletras x ((m,p):mapeos) | hayqueCodificar x ((m,p):mapeos) == False = x
                               | x == m = p 
                               | otherwise = cambiarletras x mapeos
-- ['q','u','y',o'] [('q','a'),('y','t'),('g','m')] = "auto"