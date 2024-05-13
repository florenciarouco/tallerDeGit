module Solucion where
import Data.Char
-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!
-- Nombre de grupo: {}
-- Integrante1: {46027156, Florencia Maria Gonzalez Rouco }
-- Integrante2: {46287538, Nicole Lamblot}
-- Integrante3: {46028238, Pedro Iván Vicente}
-- Integrante4: {34454848, German Javier Rud}
-- Integrantes que abandonaron la materia: {En caso que haya abandonado la materia algún
                        -- integrante, completar con los dni y apellidos, sino dejar vacío}

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula caracter = ord caracter >= ord 'a' && ord caracter <= ord 'z'

-- EJ 2
letraANatural :: Char -> Int
letraANatural caracter = ord caracter - 97

-- EJ 3
desplazar :: Char -> Int -> Char
desplazar caracter _ | not (esMinuscula caracter) = caracter
desplazar caracter n | esMinuscula c_desplazado = c_desplazado
                     | ord caracter + n > ord 'z' = desplazar caracter (n-26)
                     | otherwise = desplazar caracter (n+26)
                     where c_desplazado = (chr (ord caracter + n))

-- EJ 4
cifrar :: String -> Int -> String
cifrar [] num = []
cifrar (letra:letras) num = desplazar letra num : cifrar letras num

-- EJ 5
descifrar :: String -> Int -> String
descifrar letras num = cifrar letras (-num)

-- EJ 6
cifrarLista :: [String] -> [String]
cifrarLista [] = []
cifrarLista palabras =  aux palabras 0

aux :: [String] -> Int -> [String]
aux [] num = []
aux (palabra:palabras) num =  cifrar palabra num : aux palabras (num + 1)

-- EJ 7
frecuencia :: String -> [Float]
frecuencia [] = []

cantMinusculas :: String -> Int
cantMinusculas [] = 0


cantApariciones :: String -> Char-> Int
cantApariciones [] _ = 0
cantApariciones [x] n | x == n = 1
                      | otherwise = 0 
cantApariciones (x:xs) n | x == n = 1 + cantApariciones xs n 
                         | otherwise = cantApariciones xs n 

-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente _ _ = ('o', 33.333336)

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado _ _ = False

-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados _ = [("compu", "frpsx"), ("frpsx", "compu")]

-- EJ 11
expandirClave :: String -> Int -> String
expandirClave _ _ = "compucom"

-- EJ 12
cifrarVigenere :: String -> String -> String
cifrarVigenere _ _ = "kdueciirqdv"

-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere _ _ = "computacion"

-- EJ 14
peorCifrado :: String -> [String] -> String
peorCifrado _ _ = "asdef"

-- EJ 15
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere _ _ _ = [("hola", "b")]
