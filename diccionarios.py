from typing import List
from queue import LifoQueue as Pila
#19

def separar_palabras (texto:str) -> List[str]:
    lista = []
    palabras = ""
    for caracter in texto:
        if caracter == ' ':
            if len(palabras) > 0:
                lista.append(palabras)
                palabras = ''
        else: 
            palabras += caracter
    if len(palabras) > 0:
        lista.append (palabras)
    return lista
#print (separar_palabras ("holac como estas "))

def agrupar_por_long (texto:str) -> dict:
    lista:List[str] = separar_palabras (texto)
    diccionario = dict()
    for i in lista:
        if len(i) in diccionario.keys():
            diccionario [len(i)] += 1
        else:
            diccionario[len(i)] = 1
    return diccionario
#print (agrupar_por_long ("hola como estas soy flor")) 
                                                    
#21
def la_palabra_mas_frecuente (texto:str) -> str:
    lista:List[str] = separar_palabras(texto)
    diccionario:dict = dict()
    for i in lista:
        if i in diccionario.keys():
            diccionario[i] +=1
        else:
            diccionario[i] = 1   # {'hola': 2, 'como': 1, 'estas': 1} -> [(hola,2),(como,1),(estas,1)]
    lista = list(diccionario.items())
    maximo_actual = (lista [0])[1]
    palabra_actual = (lista [0])[0]
    for i in range (len(lista)):
        segundo = lista[i][1]
        if segundo > maximo_actual:
            maximo_actual = segundo
            palabra_actual = lista[i][0]
    return palabra_actual

#print (la_palabra_mas_frecuente ("hola como estas hola flor flor flor "))

#22
historiales = {}
#                   dict = [str, Pila[str]]
def visitar_sitio (historiales: dict, usuario:str, sitio:str) -> None:
    if not usuario in historiales.keys():
        sitios = Pila()
        historiales [usuario] = sitios
    if usuario in historiales.keys():
        historiales[usuario].put(sitio)

def navegar_atras (historiales:dict, usuario:str):
    actual: str = historiales[usuario].get()
    anterior:str = historiales[usuario].get()
    historiales[usuario].put(actual)
    historiales[usuario].put(anterior)


#23
inventario = {}

#23.1
def agregar_producto (inventario, nombre, precio, cantidad):
    inventario[nombre] = {"precio":precio,"cantidad":cantidad}

#print(agregar_producto (inventario, "remera", 20, 3))

#23.2
def actualizar_stock (inventario,nombre, cantidad):
    inventario[nombre]["cantidad"] = cantidad

#23.3
def actualizar_precio (inventario, nombre,precio):
    inventario[nombre]["precio"] = precio

#23.4
def calcular_valor_inventario (inventario) -> float:
    total:int = 0
    lista = list(inventario.items())
    for i in lista:
        item = i[1]
        total += item["precio"]*item["cantidad"]
    return total 
#agregar_producto (inventario,"remera", 10,50)
#agregar_producto (inventario, "pantalon", 30,30)

#print (calcular_valor_inventario (inventario))
    
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#ejercicios de luli

def copiar_diccionario (dic:dict) -> dict:
    copia= dict()
    claves = dic.keys()
    for clave in claves:
        valor = dic[clave]
        copia[clave] = valor
    return copia

def invertir_diccionarios (diccionario:dict) -> dict:
    dicc=dict()
    for k,v in diccionario.items():
        if v in dicc:
            dicc[v].append(k)
        else:
            dicc[v] = [k]
    return dicc

#diccionario = {"flor":10, "juli":190}
#print (invertir_diccionarios (diccionario))

def ranking_ventas(productos: List[str], ventas_diarias: dict) -> dict:
    diccionario = dict()

    for producto in productos:
        diccionario[producto] = [0] *len(productos)

    for venta in ventas_diarias.values():
        for i in range(len(venta)):
            diccionario [venta[i]] [i] += 1
    return diccionario

#productos = ["camisa", "pantalon", "zapatos", "gorra"]
#ventas_diarias = {     "dia1": ["camisa", "pantalon", "zapatos", "gorra"],     "dia2": ["pantalon", "zapatos", "camisa", "gorra"]}

#print (ranking_ventas(productos,ventas_diarias))


# Implementa funciones para registrar una orden de compra y deshacer la última orden usando pilas.
#def registrar_orden(historial: dict[str, Pila[str]], usuario: str, orden: str) -> None:

def registrar_orden(historial: dict, usuario: str, orden: str) -> None:
    if not usuario in historial.keys():
        historial[usuario] = Pila()
        historial[usuario] = orden
    else:
        historial[usuario].put(orden)
            
def deshacer_orden(historial: dict, usuario: str) -> str:
    ultima = historial[usuario].get()
    return ultima 


    






