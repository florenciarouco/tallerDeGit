from queue import LifoQueue as Pila
import random
from typing import List
from queue import Queue as Cola

#8
def generar_nros_al_Azar (cantidad:int, desde:int , hasta:int) -> Pila:
    pila:Pila = Pila()
    for _ in range(cantidad):
        pila.put(random.randint (desde,hasta))
    return pila

p= generar_nros_al_Azar (5,10,50)
#while not p.empty():
#    print (p.get())

#9
def copiar_pila (p:Pila) -> Pila:
    aux:Pila = Pila()
    copia:Pila = Pila()
    while not p.empty():
        variable = p.get()
        aux.put(variable)
    while not aux.empty():
        v = aux.get()
        copia.put(v)
        p.put(v)
    return copia

def cantidad_elementos (p:Pila) -> int:
    copiaPila:Pila = copiar_pila (p)
    cantidad:int = 0
    while not copiaPila.empty():
        copiaPila.get()
        cantidad += 1
    return cantidad 

p= Pila()
p.put(5)
p.put(3)
p.put(4)
#print (cantidad_elementos (p))

#10
def busacr_el_max( p:Pila) -> int:
    copia:Pila = copiar_pila (p)
    maximo_actual = copia.get()
    while not copia.empty ():
        segundo = copia.get()
        if segundo > maximo_actual:
            maximo_actual = segundo
    return maximo_actual
p= Pila()
p.put(5)
p.put(3)
p.put(4)
p.put(8765)
p.put(2)
#print (busacr_el_max(p))

#12
def evaluar_expresiones (s:str) -> float:
    operadores:List = ['+','-','*','/']
    pila:Pila = Pila ()
    for caracter in s:
        if not caracter in operadores and caracter != ' ':
            pila.put(caracter)
        else:
            if (caracter == '+'):
                total = int (pila.get()) + int(pila.get())
                pila.put(total)
            if caracter == '-':
                total = - (int (pila.get()) - int (pila.get()))
                pila.put (total)
            if caracter == '*':
                total = int (pila.get()) * int(pila.get())
                pila.put(total)
            if caracter == '/':
                total = int (pila.get()) / int (pila.get())
                pila.put(total)
    return int (pila.get())

#print (evaluar_expresiones ("3 4 + 5 * 2 -"))

#colas
# 13
def generaralazar (cantidad: int, desde :int, hasta:int) -> Cola:
    cola:Cola = Cola()
    elementos= []
    for _ in range (cantidad):
        cola.put(random.randint(desde,hasta))
p= generar_nros_al_Azar (5,10,50)
#while not p.empty():
#    print (p.get())

#14
def copiar_cola (c:Cola) -> Cola:
    copia = Cola()
    aux:Cola = Cola()
    while not c.empty():
        variable = c.get()
        aux.put(variable)
    while not aux.empty():
        v = aux.get()
        copia.put(v)
        c.put(v)
    return copia

def cantidad_elementos (c:Cola) -> int:
    copia = copiar_cola (c)
    cantidad = 0
    while not copia.empty():
        copia.get()
        cantidad += 1
    return cantidad

c= Cola()
c.put(53)
c.put(5)
c.put(89)
c.put(2)

#print (cantidad_elementos (c))
#15
def buscar_max (c:Cola) -> int:
    copia:Cola = copiar_cola (c)
    maximo_actual = copia.get()
    while not copia.empty ():
        segundo = copia.get()
        if segundo > maximo_actual:
            maximo_actual = segundo
    return maximo_actual

c= Cola()
c.put(53)
c.put(5)
c.put(89)
c.put(2)

#print (busacr_el_max (c))

#16

def secuencia (n:int) -> List[int]:
    elementos = []
    while len(elementos) < n:
        ns = random.randint(0,99)
        elementos.append(ns)

    return elementos

def armar_sec_de_bingo () ->Cola:
    cola:Cola = Cola()
    for i in secuencia (100):
        cola.put(i)
    return cola

#print (armar_sec_de_bingo ().queue)

def jugar_carton_de_bingo (carton:List[int], bolillero:Cola) -> int:
    copia: Cola = copiar_cola(bolillero)
    jugadas:int = 0
    tachadas:int = 0
    while tachadas < 12:
        bolilla= copia.get()
        if bolilla in carton:
            jugadas += 1
            tachadas += 1
        else:
            jugadas += 1
    return jugadas

#print (jugar_carton_de_bingo ([1,2,3,4,5,6,7,8,9,10,12,11],armar_sec_de_bingo()))

#17
def n_pacientes_urgentes (c:Cola) -> int:
    copia:Cola = copiar_cola(c)
    rango = [1,2,3]
    urgentes:int = 0
    while not copia.empty():
        datospaciente = copia.get()
        prioridad = datospaciente[0]
        if prioridad in rango:
            urgentes += 1
    return urgentes

c = Cola()
c.put ((1,"flor","trauma"))
c.put((5,"juli","frc"))
c.put((3,"luli","fefe"))
c.put((1,"niki","efe"))
#print (n_pacientes_urgentes(c))

#18
def atencion_a_Clientes(c:Cola) -> Cola:
    res:Cola = Cola()
    copia:Cola = copiar_cola (c)

    cola_prioridad = Cola()
    cola_prefe = Cola()
    cola_resto = Cola()

    while not copia.empty():
        datos_cliente = copia.get()
        prioridad= datos_cliente [3]
        prefe = datos_cliente [2]
        if prefe == True :
            cola_prefe.put(datos_cliente)
        elif prioridad == True:
            cola_prioridad.put(datos_cliente)
        else:
            cola_resto.put(datos_cliente)
    
    while not cola_prioridad.empty():
        res.put(cola_prioridad.get())
    while not cola_prefe.empty():
        res.put(cola_prefe.get())
    while not cola_resto.empty():
        res.put(cola_resto.get())

    return res

cola_clientes = Cola()
cola_clientes.put(("Juan", 12345678, False, True))  # Prioridad
cola_clientes.put(("Ana", 23456789, True, False))   # Preferencial
cola_clientes.put(("Luis", 34567890, False, False))
cola_clientes.put(("Maria", 45678901, True, False))  # Preferencial
cola_clientes.put(("Carlos", 56789012, False, False))
cola_clientes.put(("Sofia", 67890123, False, True))  # Prioridad

cola_atencion = atencion_a_Clientes(cola_clientes)

#while not cola_atencion.empty ():
#    print (cola_atencion.get())