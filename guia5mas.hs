module Guia5mas where
-- ejercicio 4.a
type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos persona ((li1,li2):listas) | persona == li1 = True
                                          | otherwise = enLosContactos persona listas

--b
agregarContacto :: Contacto -> ContactosTel -> ContactosTel 
agregarContacto (nombre,telefono) [] = [(nombre,telefono)]
agregarContacto (nombre,telefono) ((li1,li2):listas) | nombre == li1 = (nombre,telefono) : listas
                                                     | otherwise = (li1,li2) : agregarContacto (nombre,telefono) listas

--c 
eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto _ [] = [] 
eliminarContacto nombre ((li1,li2):listas) | nombre == li1 = eliminarContacto nombre listas
                                           | otherwise = (li1,li2) : eliminarContacto nombre listas


--ejercicio5.1
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
data Disponibilidad = Libre | Ocupado deriving (Eq, Show)

existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker _ [] = False
existeElLocker x ((iden,e):locker) | x == iden = True
                                   | otherwise = existeElLocker x locker
                        
--5.2
ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion 
ubicacionDelLocker _ [] = []
ubicacionDelLocker x ((iden,(luo,ubi)):locker) | x == iden = ubi
                                               | existeElLocker x locker = ubicacionDelLocker x locker
                                               | not (existeElLocker x ((iden,(luo,ubi)):locker)) = []

--5.3
estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool
estaDisponibleElLocker _ [] = False
estaDisponibleElLocker x ((iden,(luo,ubi)):locker) | x == iden && luo == Libre = True
                                                   | x == iden && luo == Ocupado = False
                                                   | existeElLocker x locker = estaDisponibleElLocker x locker
                                                   | not (existeElLocker x ((iden,(luo,ubi)):locker)) = False
                                                   
--5.4
ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers 
ocuparLocker _ [] = [] 
ocuparLocker x ((iden,(luo,ubi)):locker) | x == iden && estaDisponibleElLocker x ((iden,(luo,ubi)):locker) == True = ((iden,(Ocupado,ubi)):locker)
                                         | x == iden && estaDisponibleElLocker x ((iden,(luo,ubi)):locker) == False = ((iden,(luo,ubi)):locker)
                                         | otherwise = (iden,(luo,ubi)) : ocuparLocker x locker
