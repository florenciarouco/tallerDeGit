
-- EJERCICIO 1 --
generarStock :: [[Char]] -> [([Char],Integer)]
generarStock [] = []
generarStock (producto:productos) = eliminarRepetidos ((producto , cuantasVecesAparece producto (producto:productos)) : generarStock productos)

-- la longitud de res, es igual a la cantidad ed productos distintos
-- banana banana banana -> banana 3

-- funcion auxiliar para ver cuantas veces aparece
cuantasVecesAparece :: [Char] -> [[Char]] -> Integer
cuantasVecesAparece _ [] = 0
cuantasVecesAparece producto (stock:elresto)  | producto == stock = 1 + cuantasVecesAparece producto elresto
                                              | otherwise = cuantasVecesAparece producto elresto

-- aux de elminar repetidos
eliminarRepetidosAux :: [Char] -> [([Char],Integer)] -> [([Char],Integer)]
eliminarRepetidosAux _ [] = []
eliminarRepetidosAux palabra ((x,y):xs) | palabra == x = eliminarRepetidosAux palabra xs 
                                        | otherwise = (x,y) : eliminarRepetidosAux palabra xs

-- funcion eliminar repetidos pero dejando 1
eliminarRepetidos :: [([Char],Integer)] -> [([Char],Integer)]
eliminarRepetidos [] = []
eliminarRepetidos ((x,y):xs) = (x,y) : eliminarRepetidosAux x xs

-- EJERCICIO 2 --
stockDeProducto :: [([Char],Integer)] -> [Char] -> Integer
stockDeProducto [] _ = 0
stockDeProducto ((producto,stock):elresto) nombre | nombre == producto = stock + stockDeProducto elresto nombre
                                                  | otherwise = stockDeProducto elresto nombre

-- func pertenece
pertenece :: [Char] -> [([Char],Integer)] -> Bool 
pertenece n [] = False
pertenece n ((x,xs):ys) = n == x || pertenece n ys

-- EJERCICIO 3 --
dineroEnStock :: [([Char],Integer)] -> [([Char],Float)] -> Float 
dineroEnStock [] _ = 0
dineroEnStock ((producto,stock):elresto) precios = (obtenerPrecioProducto producto precios * fromIntegral stock) + dineroEnStock elresto precios

-- funcion aux para obtener el precio del producto
obtenerPrecioProducto :: [Char] -> [([Char],Float)] -> Float 
obtenerPrecioProducto nombre ((producto,precio):elresto) | nombre == producto = precio 
                                                         | otherwise = obtenerPrecioProducto nombre elresto

-- res es la suma de los precios de todos los productos que estan es stock
-- multiplicado por la cantidad de producto q hay en stock
-- osae que el resultado es: precio producto1 * stock producto 1 + lo mismo pero en cada coso de la cola de la lista

-- EJERCICIO 4 --
-- si stock > 10, el precio es * 0.80
-- si stock < 10 el p'recio es el original

--                   stock                   precios
aplicarOferta :: [([Char],Integer)] -> [([Char],Float)] -> [([Char],Float)]
aplicarOferta _ [] = []
aplicarOferta listaStock ((producto,precio):elresto) | stockDeProducto listaStock producto > 10 = (producto , precio * 0.8) : aplicarOferta listaStock elresto 
                                                     | otherwise = (producto , precio) : aplicarOferta listaStock elresto 











