import Test.HUnit
import Guia5mas

main = runTestTT tests

tests = test [
    "enloscontactos lista vacia" ~: (enLosContactos "flor" []) ~?= False,
    "enloscontactos es verdadero" ~: (enLosContactos "flor" [("flor","24567"),("kari","45678")]) ~?= True,
    "enloscontactos es falso"  ~: (enLosContactos "flor" [("ana","24567"),("kari","45678")]) ~?= False,

    "agregarcontacto lista vacia" ~: (agregarContacto ("flor","34567") []) ~?= [("flor","34567")],
    "agregarconctacto ya esta en la lista" ~: (agregarContacto ("flor","34567") [("flor","9876"),("kari","6119")]) ~?= [("flor","34567"),("kari","6119")],
    "agregarcontacto no estaba en la lista" ~: (agregarContacto ("flor","34567") [("ana","9876"),("kari","6119")]) ~?= [("ana","9876"),("kari","6119"),("flor","34567")],
    
    "lista vacia eliminar" ~: (eliminarContacto "ana" []) ~?= [],
    "esta el nombre" ~: (eliminarContacto  "ana" [("ana", "234"), ("pedro", "413")]) ~?= [("pedro", "413")],
    "no  esta" ~: (eliminarContacto  "ana" [("caca", "234"), ("pedro", "4123432")]) ~?= [("caca", "234"), ("pedro", "4123432")],

    
    "lista vacia" ~: (existeElLocker 345 []) ~?= False,
    "existe el locker" ~: (existeElLocker 345 [(34,(Libre,"A5")),(345,(Ocupado,"A2"))]) ~?= True,
    "no esta" ~: (existeElLocker 345 [(34,(Libre,"A5")),(2,(Ocupado,"A2"))]) ~?= False,

    "lista vacia" ~: (ubicacionDelLocker 345 []) ~?= [],
    "no esta" ~: (ubicacionDelLocker 345 [(3,(Libre,"A3")),(4,(Ocupado,"A5"))]) ~?= [],  
    "es el primero" ~: (ubicacionDelLocker 345 [(345,(Libre,"A3")),(4,(Ocupado,"A5"))]) ~?= "A3",
    "es otro" ~: (ubicacionDelLocker 345 [(3,(Libre,"A3")),(4,(Ocupado,"A5")),(345,(Libre,"A9"))]) ~?= "A9",

    "lista vacia" ~: (estaDisponibleElLocker 345 []) ~?= False,
    "no esta" ~: (estaDisponibleElLocker 345 [(34,(Libre,"A3")), (6,(Ocupado,"A4"))]) ~?= False,
    "el primero esta libre" ~: (estaDisponibleElLocker 345 [(345,(Libre,"A3")), (6,(Ocupado,"A4"))]) ~?= True,
    "el primero esta Ocupado" ~: (estaDisponibleElLocker 345 [(345,(Ocupado,"A3")), (6,(Libre,"A4"))]) ~?= False,
    "es otro y esta ocupado" ~: (estaDisponibleElLocker 345 [(36,(Libre,"A3")), (345,(Ocupado,"A4")), (65,(Libre,"A7"))]) ~?= False,
    "es otro y esta libre" ~: (estaDisponibleElLocker 345 [(36,(Libre,"A3")), (345,(Libre,"A4")), (56,(Ocupado,"AB4"))]) ~?= True,

    "lista vacia" ~: (ocuparLocker 345 []) ~?= [],
    "es el primero y esta libre" ~: (ocuparLocker 345 [(345,(Libre,"A3")), (6,(Ocupado,"A4"))]) ~?= [(345,(Ocupado,"A3")), (6,(Ocupado,"A4"))],
    "es el primero y esta ocupado" ~: (ocuparLocker 345 [(345,(Ocupado,"A3")), (6,(Ocupado,"A4"))]) ~?= [(345,(Ocupado,"A3")), (6,(Ocupado,"A4"))],
    "es otro y esta libre" ~: (ocuparLocker 6 [(345,(Libre,"A3")), (6,(Libre,"A4")), (7,(Libre,"A9"))]) ~?= [(345,(Libre,"A3")), (6,(Ocupado,"A4")), (7,(Libre,"A9"))],
    "es otro y esta ocupado" ~: (ocuparLocker 6 [(345,(Libre,"A3")), (6,(Ocupado,"A4")), (7,(Libre,"A9"))]) ~?= [(345,(Libre,"A3")), (6,(Ocupado,"A4")), (7,(Libre,"A9"))]
     ]
