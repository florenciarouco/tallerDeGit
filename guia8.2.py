from queue import LifoQueue as Pila
import random
from typing import List
from typing import Tuple
from queue import Queue as Cola
import typing

#ejercicio 9
def copiarpila (p:Pila) -> Pila:
    paux:Pila = Pila() #creo una pila vacia
    copia: Pila = Pila()
    while not p.empty():
        v= p.get()
        paux.put(v)
    while not paux.empty():
        variable= paux.get()
        copia.put(variable)
        p.put(variable)
    return copia 

def cantidad_elementos (p:Pila) -> int:
    cantidad: int = 0
    otrapila:Pila = copiarpila(p)
    while not otrapila.empty ():
        otrapila.get()
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
    otrapila:Pila = copiarpila (p)
    maximo_actual:int = otrapila.get()

    while not otrapila.empty():
        segundo:int = otrapila.get()
        if maximo_actual < segundo:
            maximo_actual = segundo     
    
    return maximo_actual

p=Pila()

p.put (3)
p.put(46)
p.put(1)
p.put(4)

#print (buscar_el_maximo (p))

#12
def evaluar_expresion(s:str) -> float:
    operadores:List = ['+', '-', '*', '/']
    pila:Pila[int] = Pila()
    for caracter in s:
        if (not (caracter in operadores)) and (caracter != ' '):
            pila.put(caracter)
        elif (caracter in operadores):
            if caracter == '+':
                total = (int(pila.get()) + int(pila.get()))
                pila.put(total)
            elif  caracter == '-':
                total = - (int(pila.get()) - int(pila.get()))
                pila.put(total)
            elif  caracter == '*':
                total = (int(pila.get()) * int(pila.get()))
                pila.put(total)
            else:
                total = (int(pila.get()) / int(pila.get()))
                pila.put(total)
    return int(pila.get())

#print(evaluar_expresion("3 4 + 5 * 2 -"))


#ver bien

def copiar_cola (c:Cola) -> Cola:
    caux: Cola = Cola()
    copia:Cola = Cola()
    while not c.empty():
        v= c.get()
        caux.put(v)
    while not caux.empty ():
        variable = caux.get()
        copia.put(variable)
        c.put(variable)
    return copia

#18
def atencion_a_cliente(c:Cola) -> Cola:
    otracola:Cola = copiar_cola (c)
    res:Cola =Cola()
    cola_prioridad = Cola()
    cola_preferencial = Cola()
    cola_resto = Cola()
    
    while not otracola.empty():
        datos_clientes:Tuple[(str,int,bool,bool)] = otracola.get()
        prioridad:bool = datos_clientes[3]
        preferencial:bool = datos_clientes[2]

        if prioridad == True:
            cola_prioridad.put(datos_clientes)
        elif preferencial == True:
            cola_preferencial.put(datos_clientes)
        else:
            cola_resto.put(datos_clientes)
    while not cola_prioridad.empty():
        res.put(cola_prioridad.get())
    
    while not cola_preferencial.empty():
        res.put(cola_preferencial.get())
    
    while not cola_resto.empty():
        res.put(cola_resto.get())

    return res

c = Cola()
c.put (("juan",12345,True,True))
c.put(("flor",7654,False,True))
c.put(("luli",213456,True,False))
c.put(("kari",123456,False,False))
c.put(("juli",9876543,True,False))

atencion = atencion_a_cliente(c)
#while not atencion.empty():
#     print(atencion.get())

#16.1

def secuencia_de_n_elemetnos (n:int) -> List[int]:
     elementos:List[int] = []
     while (len(elementos) < n):
         ns = random.randint (0,99)
         if not ns in elementos:
             elementos.append (ns)
     return elementos 

#print (secuencia_de_n_elemetnos (100))

def armar_secuencia_de_bingo () -> Cola:
    elementos:Cola = Cola()
    for e in secuencia_de_n_elemetnos (100):
        elementos.put (e)
    return elementos 

#print (armar_secuencia_de_bingo ().queue)

#16.2
def jugar_carton_de_bingo (carton: List[int], bolillero:Cola) -> int:
    jugadas:int = 0
    tachados:int = 0
    otracola: Cola = copiar_cola (bolillero)
    while tachados < 12:
        numero:int = otracola.get()
        if numero in carton:
            tachados += 1
            jugadas += 1
        else: 
            jugadas += 1
    return jugadas 

print (jugar_carton_de_bingo ([3,12,15,24,28,36,48,42,50,80,77,65], armar_secuencia_de_bingo ())) 

#17
def n_pacientes_urgentes (c:Cola) -> int:
    otracola:Cola = copiar_cola (c)
    rango: int = [1,2,3]
    urgentes:int = 0
    while not otracola.empty():
        variable: int = otracola.get()
        if variable in rango:
            urgentes += 1
    return urgentes 


c = Cola()
c.put (1,"flor","trauma")
c.put(5,"juli","frc")
c.put(3,"luli","fefe")
c.put(1,"niki","efe")
#print (n_pacientes_urgentes(c))

#15 
def buscarelmaximo (c:Cola) -> int:
    otracola:Cola = copiar_cola (c)
    maximo_actual:int = otracola.get()
    while not otracola.empty():
        maximo2:int = otracola.get()
        if maximo_actual < maximo2:
            maximo_actual = maximo2
    return maximo_actual

c = Cola()
c.put(45)
c.put(4)
c.put(32)

#print(buscarelmaximo (c))

#18
def atencion_a_clientes (c:Cola) -> Cola:
    otracola:Cola = copiar_cola(c)
    res:Cola = Cola()

    cola_prioridad = Cola()
    cola_preferencial = Cola()
    cola_resto = Cola()

    while not otracola.empty():
        datos_cliente: Tuple[str,int,bool,bool] = otracola.get()
        preferencial: bool = datos_cliente[2]
        prioridad: bool = datos_cliente[3]
        if prioridad == True:
            cola_prioridad.put(datos_cliente)
        elif preferencial == True:
            cola_preferencial.put(datos_cliente)
        else: 
            cola_resto.put(datos_cliente)

    while not cola_prioridad.empty():
        res.put(cola_prioridad.get())

    while not cola_preferencial.empty():
        res.put(cola_preferencial.get())

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

cola_atencion = atencion_a_clientes(cola_clientes)

#print("Cola de atencion resultante:")
#while not cola_atencion.empty():
#     print(cola_atencion.get())

#19
def separarenpalabras (linea:str) -> List:
    separadas:List[str] = []
    palabras= ""
    for i in range (len(linea)):
        if linea[i] == ' ' or linea[i] == '\n' or linea[i] == '\r' or linea[i] == '\t':
            if len(palabras) >0:
                separadas.append(palabras)
                palabras = ''
        else:
            palabras += linea[i]
    if len(palabras) >0:
        separadas.append(palabras)
    return separadas
#print (separarenpalabras ("hola soy flor\ny vos como estas\nholahola hola holaa"))

def agrupar_por_longitud (nombre_archivo:str) -> dict:
    archivo:typing.IO = open(nombre_archivo, 'r')
    lineas:List[str] = separarenpalabras (archivo.read())
    archivo.close()
    diccionario:dict = dict()
    for i in lineas:
        if len(i) in diccionario.keys():
            diccionario [len(i)] += 1 # diccionario [clave] = valor
        else:
            diccionario [len(i)] = 1
    return diccionario
#print (agrupar_por_longitud ("flor.txt"))

#21

#{'hola': 2, 'soy': 1, 'flor': 5, 'y': 1, 'vos': 1, 'como': 1, 'estas': 1, 'holahola': 2, 'holaa': 1}

#clave        valor
#"hola" 2 (cantidad de apariciones)         
def la_palabra_mas_frecuente (nombre_archivo:str) -> str:
    archivo:typing.IO = open(nombre_archivo, 'r')
    lineas:List[str] = separarenpalabras (archivo.read())
    archivo.close()
    diccionario:dict = dict()
    for i in lineas:
        if i in diccionario.keys():
            diccionario [i] += 1
        else:
            diccionario [i] = 1
    lista = list(diccionario.items())
    i:int = 1
    maximo_actual:int = (lista[0])[1]
    palabra_actual:str = (lista[0])[0]
    while i < len(lista):
        candidato:int= (lista[i])[1]
        if maximo_actual < candidato:
            maximo_actual = candidato 
            palabra_actual = (lista[i])[0]
        i += 1
    return palabra_actual
print (la_palabra_mas_frecuente ("flor.txt"))



#22

historiales:dict = dict()

def visitar_sitio (historiales:dict, usuario:str,sitio:str) -> None:
    if not usuario in historiales.keys():
        sitios:Pila = Pila()
        historiales[usuario] = sitios

    if usuario in historiales.keys():
        historiales[usuario].put(sitio)

#visitar_sitio(historiales, "flor", "google")
#visitar_sitio (historiales, "flor", "youtube")

#print (historiales["flor"].queue)

def navegar_sitios (historiales:dict, usuario:str) -> None:
    actual: str = historiales[usuario].get()
    anterior:str = historiales[usuario].get()
    historiales[usuario].put(actual)
    historiales[usuario].put(anterior)
#navegar_sitios (historiales,"flor")
#print (historiales["flor"].queue)


#23
inventario = {}   
# clave                   valor
# nombre       diccionario (precio,cantidad) 
#23.1
def agregar_producto (inventario, nombre, precio, cantidad):
    inventario[nombre] = {"precio":precio, "cantidad":cantidad}
#print(agregar_producto (inventario, "remera", 20, 3))

#23.2
def actualizar_stock (inventario, nombre, cantidad):
    inventario [nombre]["cantidad"] = cantidad

#agregar_producto (inventario, "remera", 20, 3)
#print (actualizar_stock (inventario, "remera", 4))

#23.3
def actualizar_precios (inventario,nombre,precio) :
    inventario[nombre]["precio"] = precio

#agregar_producto (inventario, "remera", 20, 3)
#print (actualizar_precios (inventario, "remera", 4))

#23.4
def calcular_valor_inventario (inventario) -> float:
    total:int = 0
    lista = list(inventario.items())
    for i in lista:
        dic = i[1]
        total += dic["precio"] * dic["cantidad"]
    return total

agregar_producto (inventario,"remera", 20,10)
agregar_producto (inventario, "pantalon", 30,30)



print (calcular_valor_inventario (inventario))


#para cambiar un calor de dic
#dic[clave] = nuevo valor 

# dic = {remera:{precio:20,cantidad:3},producto2:{precio:10,cantidad:2}}
#dic[remera][precio] = 20

#
#diccionario.values () = lista de valores 
#diccioanrio.keys () = lista de claves
#diccionario.items () = lista de tuplas con clave, valor
#diccionario [clave] = valor
#se puede usar in como pertenece


#para ver si existe una clave -> if clave in dicc.keys ()
#values e items 
        
        
#se crea un diccionario nuevo con dicc = dict()
#para acceder dicc[clave]
#dicc:dict[str,int]
#para asignar dicc[clave] = valor






