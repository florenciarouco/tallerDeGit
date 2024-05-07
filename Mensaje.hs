{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
import Data.Char

esMin :: Char -> Bool -- * Es minuscula?
esMin a = ord a >= ord 'a' && ord a <= ord 'z'

charANat :: Char -> Int -- * Minuscula -> Z
charANat a | esMin a = (ord a) - (ord 'a')

natAChar :: Int -> Char -- * Z -> Minuscula
natAChar n | 0 <= n && n <= 25 = chr ((ord 'a' )+n)

natAChar1 :: Int -> Char -- (-25) = 'a'
natAChar1 n | (-25) <= n && n < 0 = chr ((ord 'z' )+n)

-- * --- --- --- --- EJERCICIO 1: Cantidad de caracteres en minuscula --- --- --- --- * --
cantMinuscula :: String -> Int
cantMinuscula [] = 0
cantMinuscula (x:xs) | esMin x = 1 + cantMinuscula xs
                     | otherwise = cantMinuscula xs

-- * --- --- --- --- EJERCICIO 2: Mensaje con cantidad de cambios maxima --- --- --- --- * --
maximoCambios :: [String] -> String
maximoCambios [msj] = msj
maximoCambios (msj1:msj2:mensajes) | cantMinuscula msj1 >= cantMinuscula msj2 = maximoCambios (msj1:mensajes)
                                   | otherwise = maximoCambios (msj2:mensajes)

-- * --- --- --- --- EJERCICIO 3: Desplazar --- --- --- --- * --
desplazar :: Char -> Int -> Char
desplazar caracter desplazamiento | not (esMin caracter) = caracter
                                  | desplazamiento >= 0 = desplazarAdelante caracter desplazamiento
                                  | otherwise = desplazarAtras caracter desplazamiento

desplazarAdelante :: Char -> Int -> Char -- 26 = cantidad letras abecedario
desplazarAdelante carac desp | posicionFinal > 25 = desplazarAdelante 'a' (posicionFinal - 26)
                             | otherwise = natAChar posicionFinal
    where posicionFinal = charANat carac + desp

desplazarAtras :: Char -> Int -> Char
desplazarAtras carac desp | posicionFinal == 0 = 'z'
                          | posicionFinal < (-25) = desplazarAtras 'z' (posicionFinal + 26)
                          | otherwise = natAChar1 posicionFinal 
    where posicionFinal = charANat carac - 25 + desp

        -- charANat 'x' = 23
    -- charANat 'x' - 25 = -2
    -- natAChar1 (-2) = 'x'


{-
caracter = 'y', charANat = 24, n = 3
charANat + n > 25 = desplazarAdelante caracter (27 - 26)
devoler charANat 2

 y z a b c


 Caso n negativo
 si caracter = 'b', natAChar1 (-24) = 'b', n = -3
 -25 -26 -27
 (-27 + 26) = y
-}

-- * --- --- --- --- EJERCICIO 4: Codificar Mensaje --- --- --- --- * --
codificar :: String -> Int -> String
codificar [] _ = []
codificar (caracter:xs) desplazamiento | esMin caracter = desplazar caracter desplazamiento : codificar xs desplazamiento
                                       | otherwise = caracter : codificar xs desplazamiento


-- * --- --- --- --- EJERCICIO 5: Decodificar Mensaje --- --- --- --- * --
decodificar :: String -> Int -> String
decodificar [] _ = []
decodificar (caracter:xs) desplazamiento | esMin caracter = desplazar caracter (-desplazamiento) : decodificar xs desplazamiento
                                         | otherwise = caracter : decodificar xs desplazamiento



