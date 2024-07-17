--1
hay_que_codificar :: Char -> [(Char,Char)] -> Bool
hay_que_codificar c [] = False
hay_que_codificar c ((x,y):xs) | c == x = True
                               | otherwise = hay_que_codificar c xs 

--2
cuantas_veces_hay_que_codificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantas_veces_hay_que_codificar c [] ((a,b):as) = 0
cuantas_veces_hay_que_codificar c (x:xs) as | hay_que_codificar c as == False = 0
                                            | c == x  && hay_que_codificar c as == True = 1 + cuantas_veces_hay_que_codificar c xs as
                                            | otherwise = cuantas_veces_hay_que_codificar c xs as 

--3                                    
laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar [x] as = x
laQueMasHayQueCodificar (c:d:cs) as | cuantas_veces_hay_que_codificar c (c:d:cs) as >= cuantas_veces_hay_que_codificar d (c:d:cs) as = laQueMasHayQueCodificar (c:cs) as
                                    | otherwise = laQueMasHayQueCodificar (d:cs) as 

--4
codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] ((a,b):as) = []
codificarFrase (f:fs) ((a,b):as) = reeplazar f ((a,b):as) : codificarFrase fs ((a,b):as) 

reeplazar :: Char -> [(Char,Char)] -> Char
reeplazar c ((a,b):as) | hay_que_codificar c ((a,b):as) == False = c 
                       | c == a = b 
                       | otherwise = reeplazar c as 

                       