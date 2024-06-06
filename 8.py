from queue import LifoQueue as Pila
import random
from typing import List
from typing import Tuple
from queue import Queue as Cola
import typing

#1
def contar_lineas(nombre_archivo:str) -> int:
    archivo: typing.IO = open(nombre_archivo, "r")
    lineas: List[str] = archivo.readlines()
    archivo.close()
    return len(lineas)

#print (contar_lineas("flor.txt"))

#1.2
def existe_palabra (palabra:str, nombre_archivo:str) -> bool:
    archivo:typing.IO = open(nombre_archivo, 'r')
    lineas:str = archivo.read()
    palabras:str = ""
    for i in lineas:
        if (i== ' ' or i == '\n'):
            if palabra == palabras:
                return True
            palabras = ""
        else:
            palabras += i
    archivo.close()
    return False
#print (existe_palabra("flor","flor.txt"))

#1.3
def cantidad_de_apariciones (nombre_archivo:str, palabra:str) -> int:
    archivo:typing.IO = open(nombre_archivo,'r')
    lineas:str = archivo.read()
    cantidad:int = 0
    palabras:str= ""
    for i in lineas:
        if (i == ' ' or i == '\n'):
            if palabra == palabras:
                cantidad += 1
            palabras = ""
        else:
            palabras += i
    archivo.close()
    return cantidad

#print (cantidad_de_apariciones("flor.txt","holahola"))
#2
def es_comentario (palabras:str) -> bool:
    for i in range (len(palabras)):
        if palabras[i] == ' ':
            continue
        if palabras[i] == '#':
            return True
        else:
            return False
#print (es_comentario("#hola como estas "))

"""def clonar_sin_comentarios (nombre_archivo:str) ->None:
    archivo:typing.IO = open(nombre_archivo,'r')
    lineas:str = archivo.readline()
    lineas_sin_comentario:List[str] = []
    for i in archivo:
        linea = archivo[i]
        if not es_comentario (linea):
            lineas_sin_comentario.append(linea)
    nuevo_archivo = open(nombre_archivo + " clonado.txt",'w') # 'w' permite crear archivo
    nuevo_archivo.writelines(lineas_sin_comentario)
    nuevo_archivo.close()
clonar_sin_comentarios ("flor.txt")

VERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

"""

#PILAS
#8
def generar_nros_al_azar (cant:int, desde:int, hasta:int) -> Pila:
    pila:Pila = Pila()
    elementos:List = []
    for _ in range (cant):
        pila.put(random.randint(desde,hasta))
    return pila
p= generar_nros_al_azar(5,1,78)
#while not p.empty():
#    print(p.get())




#9
def copiar_pila (p:Pila) -> Pila:
    copia:Pila = Pila()
    paux:Pila = Pila()

    while not p.empty():
        saco = p.get()
        paux.put(saco)
    while not paux.empty():
        saco_again = paux.get()
        copia.put(saco_again)
        p.put(saco_again)
    return copia

#PREGUNTAR COMO COMPROBAR
def cantidad_elementos (p:Pila) -> int:
    cantidad:int = 0
    pila:Pila = copiar_pila(p)

    while not pila.empty():
        pila.get()
        cantidad += 1

    return cantidad

p = Pila()
p.put(5)
p.put(3)
p.put(34)
p.put(46)
p.put(5)

#print (cantidad_elementos (p))

#10
def buscar_el_maximo (p:Pila) -> int:
    otrapila:Pila = copiar_pila(p)
    maximo_actual:int = otrapila.get()
    while not otrapila.empty():
        maximo:int = otrapila.get()
        if maximo_actual < maximo:
            maximo_actual = maximo
    return maximo_actual

p = Pila()
p.put(5)
p.put(3)
p.put(34)
p.put(46)
p.put(5)
#print(buscar_el_maximo(p))

#16
def copiar_cola (p:Cola) -> Cola:
    copia:Cola = Cola()
    paux:Cola = Cola()

    while not p.empty():
        saco = p.get()
        paux.put(saco)
    while not paux.empty():
        saco_again = paux.get()
        copia.put(saco_again)
        p.put(saco_again)
    return copia

def secuencia_de_n_elemetnos (n:int) -> List[int]:
     elementos:List[int] = []
     while (len(elementos) < n):
         ns = random.randint (0,99)
         if not ns in elementos:
             elementos.append (ns)
     return elementos 

def armar_secuencia_de_bingo () -> Cola:
    elementos:Cola = Cola()
    for e in secuencia_de_n_elemetnos (100):
        elementos.put (e)
    return elementos 

def jugar_carton_de_bingo (carton:List[int], bolillero:Cola) -> int:
    jugadas:int = 0
    bolillas:Cola = copiar_cola(bolillero)
    tachadas:int = 0
    while tachadas < 12:
        sacados = bolillas.get()
        if sacados in carton:
            jugadas += 1
            tachadas += 1
        else:
            jugadas += 1
    return jugadas
#print (jugar_carton_de_bingo ([1,2,3,4,5,6,7,8,9,10,11,12], armar_secuencia_de_bingo ()))

#17
def n_pacientes_urgentes (c:Cola) -> int:
    urgentes:int = 0
    cola:Cola = copiar_cola(c)
    rango = [1,2,3]
    while not cola.empty():
        numero:int = cola.get()
        if numero in rango:
            urgentes += 1
    return urgentes
c = Cola()
c.put (1,"flor","trauma")
c.put(5,"juli","frc")
c.put(3,"luli","fefe")
c.put(1,"niki","efe")
#print (n_pacientes_urgentes(c))

#18
# nombre - dni- preferencial - prioridas 
def atencion_a_clientes (c:Cola) -> Cola:
    cola:Cola = copiar_cola(c)
    cola_prioridad:Cola = Cola()
    cola_prefercial:Cola = Cola()
    cola_resto:Cola = Cola()
    respuesta:Cola = Cola()

    while not cola.empty():
        datoscliente: Tuple[str,int,bool,bool] = cola.get()
        preferncial:bool = datoscliente[2]
        prioridad:bool = datoscliente[3]
        if prioridad == True:
            cola_prioridad.put(datoscliente)
        elif preferncial == True:
            cola_prefercial.put(datoscliente)
        else:
            cola_resto.put(datoscliente)

    while not cola_prioridad.empty():
        respuesta.put(cola_prioridad.get())

    while not cola_prefercial.empty():
        respuesta.put(cola_prefercial.get())
    
    while not cola_resto.empty():
        respuesta.put(cola_resto.get())
    
    return respuesta 
c = Cola()
c.put(("Juan", 12345678, False, True))  # Prioridad
c.put(("Ana", 23456789, True, False))   # Preferencial
c.put(("Luis", 34567890, False, False))
c.put(("Maria", 45678901, True, False))  # Preferencial
c.put(("Carlos", 56789012, False, False))
c.put(("Sofia", 67890123, False, True))  # Prioridad

cola_atencion = atencion_a_clientes(c)

#while not cola_atencion.empty():
#     print(cola_atencion.get())








