from queue import LifoQueue as Pila
import random
from typing import List
from typing import Tuple

def generar_nros_alazar (cant:int, desde:int, hasta:int) -> Pila:
    pila:Pila=Pila()
    for i in range (cant):
        pila.put(random.randint(desde,hasta))
    return pila
p= generar_nros_alazar(5,1,10)
#while not p.empty():
#    print(p.get())

def copiar_Pila (p:Pila) -> Pila:
    copia:Pila = Pila()
    otra = Pila()

    while not p.empty():
        sacar = p.get()
        otra.put(sacar)
    while not otra.empty():
        saco = otra.get()
        copia.put(saco)
        p.put(saco)
    return copia

p =Pila()
p.put(45)
p.put(3)
p.put(7)
p.put(9)
#print (copiar_Pila(p).queue)

def cantidad (p:Pila) -> int:
    copia:Pila = copiar_Pila (p)
    cantidad: int = 0
    while not copia.empty():
        copia.get()
        cantidad += 1
    return cantidad

p = Pila()
p.put(45)
p.put(3)
p.put(7)
p.put(9)
#print (cantidad(p))

def buscar_el_max (p:Pila) -> int:
    copia:Pila = copiar_Pila (p)
    maximo:int = copia.get()
    while not copia.empty():
        segundo = copia.get()
        if segundo > maximo:
            maximo = segundo
    return maximo

p = Pila()
p.put(45)
p.put(300)
p.put(700)
p.put(1)
#print (buscar_el_max (p))

def buscar_nota_max (p:Pila) ->Tuple[str,int]:
    pila:Pila = copiar_Pila (p)

    respuesta:Tuple[str,int] = ()
    pilanotas = Pila()
    while not pila.empty ():
        datosalumnos = pila.get()
        notas_Actual = datosalumnos[1]
        pilanotas.put(notas_Actual)
        if buscar_el_max(pilanotas) == notas_Actual:
            respuesta = datosalumnos
    return respuesta

p = Pila()
p.put(("f",8500))
p.put(("r",920))
p.put(("d",780))
p.put(("w",95))
p.put(("t",82323))
#print (buscar_nota_max (p))

def esta_bien_balanceada (s:str) -> bool:
    pila:Pila = Pila()

    for i in s:
        if i == '(':
            pila.put(i)
        elif i == ')':
            if pila.empty():
                return False
            pila.get()

    return pila.empty()

#print (esta_bien_balanceada ("1 + () 2 * 3  ()"))

def evaluar_expresion (s:str) -> float:
    operandos:List[str] = ['+','-','*','/']
    pila:Pila = Pila()

    for i in s:
        if not i in operandos and i != ' ':
            pila.put(i)
        else:
            if i == '+':
                total = int(pila.get()) + int(pila.get())
                pila.put (total)
            if i == '-':
                total = - (int(pila.get()) - int(pila.get()))
                pila.put(total)
            if i == '*':
                total = int (pila.get()) * int(pila.get())
                pila.put(total)
            if i == '/':
                total = int (pila.get()) / int (pila.get())
                pila.put(total)
    return int(pila.get())

#print (evaluar_expresion ("3 4 + 5 * 2 -"))

def intercalar (p:Pila, p2:Pila) -> Pila:
    pila:Pila = Pila()
    otra:Pila = Pila()

    while not p.empty():
        while not p2.empty():
            sacodep = p.get()
            sacodep2 = p2.get()
            otra.put(sacodep2)
            otra.put(sacodep)

    while not otra.empty():
        saco = otra.get()
        pila.put(saco)

    return pila

p =Pila()
p.put(45)
p.put(3)
p.put(7)
p.put(9)

g = Pila()
g.put(4)
g.put(32)
g.put(78)
g.put(90)
#print (intercalar(p,g).queue)

from queue import Queue as Cola

def copiar_cola (c:Cola) -> Cola:
    copia:Cola = Cola()
    otra = Cola()

    while not c.empty():
        sacar = c.get()
        otra.put(sacar)
    while not otra.empty():
        saco = otra.get()
        copia.put(saco)
        c.put(saco)
    return copia

def buscar_min (c:Cola) -> int:
    cola= copiar_cola(c)
    min = cola.get()
    while not cola.empty():
        segundo = cola.get()
        if segundo < min:
            min = segundo
    return min

p = Cola()
p.put(45)
p.put(300)
p.put(700)
p.put(10000)
#print (buscar_min (p))

def buscar_nota_minima (c:Cola) -> Tuple[str,int]:
    cola: Cola = copiar_cola (c)
    respusta = ()
    cola_notas = Cola()
    while not cola.empty ():
        datosalumnos = cola.get()
        notas = datosalumnos [1]
        cola_notas.put(notas)
        if buscar_min (cola_notas) == notas:
            respusta = datosalumnos
    return respusta
c = Cola()
c.put(("f",8500))
c.put(("r",920))
c.put(("d",780))
c.put(("w",95000))
c.put(("t",82323))
#print (buscar_nota_minima (c))


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

def jugar_Carton_de_bingo (carton:List[int], b:Cola ) -> int:
    bolillero = copiar_cola (b)
    jugadas:int = 0
    tachadas: int = 0
    while tachadas < 12:
        numero = bolillero.get()
        if numero in carton:
            jugadas += 1
            tachadas += 1
        else:
            jugadas += 1
    return jugadas

#print (jugar_Carton_de_bingo([1,2,3,4,5,6,7,8,9,10,22,12], armar_secuencia_de_bingo()))    

def n_pacientes_urgentes (c:Cola) -> int:
    cantidad:int = 0
    rango:List[int] = [1,2,3]
    cola:Cola = copiar_cola (c)


    while not cola.empty ():
        datopaciente = cola.get()
        prioridad = datopaciente [0]
        if prioridad in rango:
            cantidad += 1

    return cantidad
c = Cola()
c.put ((1,"flor","trauma"))
c.put((5,"juli","frc"))
c.put((23,"luli","fefe"))
c.put((1,"niki","efe"))
#print (n_pacientes_urgentes(c))

def atencion_a_clientes (c:Cola) -> Cola:
    cola: Cola = copiar_cola (c)
    res = Cola()
    colaprefe = Cola()
    colaprio = Cola()
    resto = Cola()

    while not cola.empty():
        datos = cola.get()
        prioridad = datos[3]
        prefe = datos[2]
        if prioridad == True:
            colaprio.put(datos)
        elif prefe == True:
            colaprefe.put(datos)
        else:
            resto.put(datos)
    while not colaprio.empty():
        sacar = colaprio.get()
        res.put(sacar)
    while not colaprefe.empty():
        saco = colaprefe.get()
        res.put(saco)

    while not resto.empty():
        sac = resto.get()
        res.put(sac)
    return res

cola_clientes = Cola()
cola_clientes.put(("Juan", 12345678, False, True))  # Prioridad
cola_clientes.put(("Ana", 23456789, True, False))   # Preferencial
cola_clientes.put(("Luis", 34567890, False, False))
cola_clientes.put(("Maria", 45678901, True, False))  # Preferencial
cola_clientes.put(("Carlos", 56789012, False, False))
cola_clientes.put(("Sofia", 67890123, False, True)) #Prioridad

#print (atencion_a_clientes (cola_clientes).queue)

def separar_en_palabras (s:str) -> List[str]:
    palabras  = ""
    lista = []
    for i in s:
        if i == ' ':
            if len(palabras) > 0:
                lista.append(palabras)
                palabras = ""
        else:
            palabras += i
    if len(palabras) > 0:
        lista.append(palabras)

    return lista 
#print (separar_en_palabras ("hola como"))


def agrupar_por_long (texto:str) -> dict:
    diccionario = dict()
    palabras = separar_en_palabras (texto)

    for i in palabras:
        if len(i) in diccionario.keys():
            diccionario [len(i)] += 1
        else:
            diccionario [len(i)] = 1
    return diccionario
#print (agrupar_por_long ("hola como estas soy flor"))


def la_palabra_mas_frecuente (texto:str) -> str:
    palabras = separar_en_palabras (texto)
    diccionario = dict()

    for i in palabras:
        if i in diccionario.keys():
            diccionario[i] += 1
        else:
            diccionario[i] = 1

    lista = list(diccionario.items())
    maximo = lista [0][1]
    palabra_Actual = lista [0][0]
    for i in range (len(lista)):
        cantidas = lista[i][1]
        if cantidas > maximo:
            maximo = cantidas
            palabra_Actual = lista [i][0]
    return palabra_Actual
#print (la_palabra_mas_frecuente("hola soy flor como estas bien y vos flor tofo"))

historiales = {}

def visitar_sitio (historiales:dict, usuario:str, sitio:str) :
    if not usuario in historiales.keys():
        sitios = Pila
        historiales[usuario] = sitios
    else:
        historiales[usuario].put(sitio)   

def navegar_hacia_atras (historiales:dict, usuario:str, sitio:str):
    sitioactual = historiales[usuario].get()
    sitionaterior = historiales[usuario].get()

    historiales[usuario].put(sitioactual)
    historiales[usuario].put(sitionaterior)

inventario = {}
def agregar_prod (inventario:dict, nombre:str, precio:int, cantidad:int) :
        inventario[nombre] = {"precio":precio, "cantidad":cantidad}


def actulizar_stock (inventario:dict, nombre:str, cantidad:int):
        inventario[nombre]["cantidad"]= cantidad

def actualizar_precio (inventario:dict, nombre:str, precio:str):
        inventario[nombre]["precio"] = precio

def calcular_valor_inventario (inventario) -> float:
    total:int = 0
    lista = list(inventario.items())
    for i in (lista):
        item = i[1]
        total+= item["precio"] * item ["cantidad"]
    return total

#agregar_prod (inventario,"remera", 10,50)
#agregar_prod (inventario, "pantalon", 30,30)

#print (calcular_valor_inventario (inventario))





