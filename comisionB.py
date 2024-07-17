#1
# si chocan entre si, cada uno pierde 5
# si los dos se desvian, pierden los dos 10 puntos
# si uno se desvia y otro no, el q se desvia pierde 15 y otro gana 10


def torneo_de_gallinas (estrategias:dict) -> dict:
    res:dict = dict ()
    puntos: int = 0
    lista=list(estrategias.items()) #-> [("flor","me desvio"),("lucas","sigo")]

    for k,v in lista:
        for rival, v_R in lista:
            if k != rival:
                if (v == "me desvio siempre") and (v_R == "me desvio siempre"):
                    puntos -= 10
                elif (v == "me desvio siemore") and (v_R == "me la banco y no me desvio"):
                    puntos -= 15
                elif (v == "me la banco y no me desvio") and (v_R == "me desvio siempre"):
                    puntos += 10
                elif (v == "me la banco y no me desvio") and (v_R== "me la banco y no me desvio"):
                    puntos -= 5
        res [k] = puntos 
        puntos = 0
    return res

#print (torneo_de_gallinas ({"flor":"me la banco y no me desvio", "lucas":"me la banco y no me desvio","ec":"me desvio siempre", "fe":"me desvio siempre"}))

from queue import Queue as Cola    
def copiar_cola (c:Cola) -> Cola:
    copia:Cola = Cola()
    otra:Cola = Cola()

    while not c.empty():
        sacar = c.get()
        otra.put(sacar)
    while not otra.empty():
        saco = otra.get()
        copia.put(saco)
        c.put(saco)
    return copia

def reordenar_cola_priorizando_vips (fila_clientes:Cola) -> Cola:
    cola = copiar_cola (fila_clientes)
    res = Cola()
    colavip = Cola()
    copacomun = Cola()
    
    while not cola.empty():
        datocliente = cola.get()
        tipo = datocliente[1]
        nombre = datocliente[0]
        if tipo == "vip":
            colavip.put(nombre)
        if tipo == "comun":
            copacomun.put(nombre)
    while not colavip.empty():
        sacar= colavip.get()
        res.put(sacar)
    while not copacomun.empty():
        saco = copacomun.get()
        res.put(saco)
    return res

c = Cola()
c.put(("flor","comun"))
c.put(("ef","vip"))
c.put(("efe","vip"))
c.put(("rt","comun"))
c.put(("l","vip"))

#print (reordenar_cola_priorizando_vips(c).queue)

#3
from typing import List
def sufijos (texto:str) -> List[str]:
    res:List[str] = []

    for i in range (len(texto)):
        sufijo = ""
        for j in range (i,len(texto)):
            sufijo += texto[j]
        res.append (sufijo)
    return res
#print (sufijos ("Diego")) 

def reverso (texto:str) -> str:
    res = ""
    for i in range(len(texto)-1,-1,-1):
        res += texto[i]
    return res

def cuantos_palidromos_hay (texto:str) -> int:
    res:int = 0
    lista = sufijos(texto)

    for i in lista:
        if i == reverso (i):
            res += 1
    return res
#print (cuantos_palidromos_hay("hola al"))

def columnas (m:List[List[int]]) -> List[List[int]]:
    res= []
    aux = []

    for fila in range (len(m[0])):
        for posicion in m:
            aux.append(posicion[fila])
        res.append(aux)
        aux = []
    return res 




def tateti_facilito (tablero:List[List[chr]]) -> int:
    transpuesta= columnas(tablero)
    res:int = 0

    for colu in transpuesta:
        for i in range (len(colu)-2):
            if colu[i] == colu[(i+1)] and colu[i] == colu[(i+2)] and colu [i] == 'X':
                res = 1
            if colu[i] == colu[(i+1)] and colu[i] == colu[(i+2)] and colu [i] == 'O':
                res = 2
            if colu[i] == colu[(i+1)] == colu [(i+2)] == 'X' and colu[i] == colu[(i+1)] == colu [(i+2)] == 'O':
                res = 3

    return res

#print (tateti_facilito ([['X', 'O', ' ', ' ', ' '],
#                         ['X', 'X', 'O', ' ', ' '],
#                         [' ', ' ', 'O', 'X', ' '],
#                         [' ', ' ', 'O', 'X', ' '],
#                         [' ', ' ', ' ', 'X', 'O']] ))
#--------PREGUNTAR LEAN COMO HAGO PARA VER SI TIENE 3 X Y 3 O CONSECUTIVAS-----------------------




