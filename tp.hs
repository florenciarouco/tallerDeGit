module Solucion where
import Data.Char


-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula c = ord c >= ord 'a' && ord c <= ord 'z'

-- EJ 2
letraANatural :: Char -> Int
letraANatural c = ord c - ord 'a'

-- EJ 3
desplazar :: Char -> Int -> Char
desplazar caracter x | esMinuscula caracter == False = caracter
desplazar caracter x | ord caracter + x >= ord 'a' && ord caracter + x <= ord 'z' = chr (ord caracter + x )
                     | ord caracter + x > ord 'z' = desplazar caracter (x-26)
                     | ord caracter + x < ord 'a' = desplazar caracter (x+26) 

-- EJ 4
cifrar :: String -> Int -> String
cifrar [] n = []
cifrar (letra:xs) n = desplazar letra n : cifrar xs n 

-- EJ 5
descifrar :: String -> Int -> String
descifrar [] n = []
descifrar (letra:xs) n = desplazar letra (-n) : descifrar xs (n)

-- EJ 6
cifrarLista :: [String] -> [String]
cifrarLista [] = []
cifrarLista palabras = cifrarlistanumero palabras 0

cifrarlistanumero :: [String] -> Int -> [String]
cifrarlistanumero [] n = []
cifrarlistanumero (x:xs) n = cifrar x n : cifrarlistanumero xs (n+1)

-- EJ 7
----------------------------------------VER BIEN-------------------------------------------------
cantidadmin :: String -> Int
cantidadmin [] = 0
cantidadmin (letra:xs) | esMinuscula letra == True = 1 + cantidadmin xs 
                       | otherwise = cantidadmin xs 

cantidadtotal :: String -> Char ->  Int
cantidadtotal [] c = 0
cantidadtotal (letras:xs) c | letras == c = 1 + cantidadtotal xs c 
                            | otherwise = cantidadtotal xs c 

frecuenciaaux :: String -> Int -> [Float]
frecuenciaaux [] n = []
frecuenciaaux frase n | n == 26 = []
                      | cantidadmin frase > 0 = (fromIntegral (cantidadtotal frase (chr(ord 'a' + n))) / fromIntegral (cantidadmin frase)) * 100 : frecuenciaaux frase (n + 1) 
                      | otherwise = 0 : frecuenciaaux frase (n+1)

frecuencia :: String -> [Float]
frecuencia frase = frecuenciaaux frase 0 



-- Ej 8
maximo :: [Float] -> Float
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | otherwise = maximo (y:xs) 

posicion :: [Float] -> Float -> Int
posicion (x:xs) elem | x == elem = 0
                     | otherwise = 1 + posicion xs elem

cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente texto n = (chr ((posicion lista (maximo lista)) + ord 'a'), maximo lista)
                            where lista = frecuencia (cifrar texto n)

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado texto1 texto2 = esDescifradoaux texto1 texto2 0 

esDescifradoaux :: String -> String -> Int -> Bool
esDescifradoaux texto1 texto2 n | n == 26 = False
                                | cifrar texto1 n == texto2  = True 
                                | otherwise = esDescifradoaux texto1 texto2 (n+1)
                                
-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados [] = []
todosLosDescifrados (x:xs) = descifrados (x:xs) ++ todosLosDescifrados xs

nohaymin :: String -> Bool
nohaymin [] = True
nohaymin (letra:xs) = not (esMinuscula letra) && nohaymin xs


descifrados :: [String] -> [(String,String)]
descifrados [frase1] | nohaymin frase1 = [(frase1,frase1)]
descifrados [frase1] = []
descifrados (x1:x2:xs) | esDescifrado x1 x2 = (x1,x2) : (x2,x1) : descifrados (x1:xs)
                       | otherwise = descifrados (x1:xs)
                    

-- EJ 11
iesimo :: [t] -> Int -> t
iesimo (x : xs) 0 = x 
iesimo (x : xs) n = iesimo xs (n-1)

expandirClaveContador :: String -> Int -> Int -> String
expandirClaveContador clave numero i | numero == i = []
                                     | otherwise = iesimo clave (mod i (length clave)) : expandirClaveContador clave numero (i+1)

expandirClave :: String -> Int -> String
expandirClave clave numero = expandirClaveContador clave numero 0


-- EJ 12
cifrarVigenereClaveSinExpandir :: String -> String -> String 
cifrarVigenereClaveSinExpandir [] [] = []
cifrarVigenereClaveSinExpandir (frase:xs) (letra:clave) = desplazar frase (letraANatural letra)  : cifrarVigenereClaveSinExpandir xs clave 

cifrarVigenere :: String -> String -> String
cifrarVigenere frase clave = cifrarVigenereClaveSinExpandir frase (expandirClave clave (length frase))


-- EJ 13

descifrarVigenereClaveSinExpandir :: String -> String -> String
descifrarVigenereClaveSinExpandir [] [] = []
descifrarVigenereClaveSinExpandir (frase:xs) (letra:clave) = desplazar frase (-(letraANatural letra)) : descifrarVigenereClaveSinExpandir xs clave 

descifrarVigenere :: String -> String -> String
descifrarVigenere frase clave = descifrarVigenereClaveSinExpandir frase (expandirClave clave ((length frase)))


-- EJ 14
valorAbsoluto :: Int -> Int
valorAbsoluto numero | numero >= 0 = numero
                     | otherwise = - numero

distanciaVigenere :: String -> String -> Int
distanciaVigenere [] [] = 0
distanciaVigenere (letra1:palabra1) (letra2:palabra2) = valorAbsoluto ((letraANatural letra1) - (letraANatural letra2)) + distanciaVigenere palabra1 palabra2

peorCifrado :: String -> [String] -> String
peorCifrado _ [clave] = clave
peorCifrado palabra (clave1:clave2:claves) | distanciaVigenere palabra (cifrarVigenere palabra clave1) <= distanciaVigenere palabra (cifrarVigenere palabra clave2)  = peorCifrado palabra (clave1:claves)
                                           | otherwise = peorCifrado palabra (clave2:claves)

-- EJ 15
chequearPalabraConDistintasClaves :: String -> [String] -> String -> [(String, String)]
chequearPalabraConDistintasClaves frase [] cifrado = []
chequearPalabraConDistintasClaves frase (letra:letras) cifrado | (cifrarVigenere frase letra) == cifrado = (frase, letra) : chequearPalabraConDistintasClaves frase letras cifrado
                                                               | otherwise = chequearPalabraConDistintasClaves frase letras cifrado


combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere [] claves cifrado = [] 
combinacionesVigenere (msj1:msjs) claves cifrado = (chequearPalabraConDistintasClaves msj1 claves cifrado) ++ combinacionesVigenere msjs claves cifrado
