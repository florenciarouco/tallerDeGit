from typing import List
from queue import LifoQueue as Pila

#19
def separadas (texto:str) -> List[str]:
    separ = []
    palabras = ""
    for caracter in texto:
        if caracter == ' ':
            if len(palabras) > 0:
                separ.append(palabras)
                palabras =''
        else:
            palabras += caracter
    if len(palabras) > 0:
        separ.append(palabras)
    return separ
#print (separadas ("hola como estas ")) -> {4:2, 5:1}

def agrupar_por_long(texto:str) -> dict:
    diccionario= {}
    sepa= separadas(texto)
    for i in sepa:
        if len(i) in diccionario.keys():
            diccionario[len(i)] += 1
        else:
            diccionario[len(i)] = 1
    return diccionario
#print (agrupar_por_long ("hola como estas hola")) -> {hola:2,como:1,estas:1}

#21
def la_palabra_mas_frecuente (texto:str) -> str:
    lista= separadas (texto)
    diccionario = {}
    for i in lista:
        if i in diccionario.keys():
            diccionario[i] += 1
        else:
            diccionario[i] = 1
    lista = list(diccionario.items()) #[(hola,2),(como,1),(estas,1)]
    maximo_actual = lista[0][1]
    palabra = lista[0][0]
    for i in range (len(lista)):
        segundo = lista [i][1]
        if segundo > maximo_actual:
            maximo_actual = segundo 
            palabra = lista [i][0]
    return palabra
#print (la_palabra_mas_frecuente ("hola como estas hola flor"))

#22
historiales = {}

def visitar_sitios (historiales:dict, usuario:str, sitio:str) -> None:
    if not usuario in historiales.keys():
        pila = Pila()
        historiales[usuario] = pila

    else:
        historiales[usuario].put(sitio)

def navegar_atras (historiales:dict, usuario:str, sitio:str) -> None:
    actual = historiales[usuario].get()
    anterior= historiales[usuario].get()
    historiales[usuario].put(actual)
    historiales[usuario].put(anterior)

#23.1
inventario = {}

def agregar_producto (inventario:dict, nombre:str, precio:int, cant:str):
    inventario[nombre] = {"precio":precio, "cantidad":cant}

#23.2
def actualizar_stock (inventario:dict, nombre:str, cant:int):
    inventario[nombre]["cantidad"] = cant

#23.3
def actualizar_precio (inventario:dict, nombre:str, precio:int):
    inventario[nombre]["precio"] = precio

#23.4

def calcular_valor (inventario:dict) -> int:
    resultado = 0
    lista = inventario.items()
    for i in lista:
        item = i[1]
        resultado += item["precio"] * item["cantidad"]
    return resultado

#agregar_producto (inventario,"remera", 20,5)
#agregar_producto(inventario, "buzo",50,10)
#actualizar_precio (inventario,"remera",15)
#print (calcular_valor(inventario))
d = {1:2, 3:4, 5:6} # -> [(1,2),(3,4),(5,6)]
def invertir (d:dict) -> dict:
    invertido = {} 
    lista= list(d.items())
    for k,v in lista:
        if v in invertido:
            invertido[v].append(k)
        else:
            invertido[v] = [k]
    
    return invertido 
#print (invertir(d))

def copiar (d:dict) -> dict:
    copia = {}
    for i in d.keys():
        valor = d[i]
        copia[i] = valor
    return copia
       
#print (copiar(d))