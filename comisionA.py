#1
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


def orden_de_atencion (urgentes:Cola, postergables:Cola ) -> Cola:
    urgente:Cola = copiar_cola (urgentes)
    post:Cola = copiar_cola (postergables) 

    res:Cola = Cola()

    while not urgente.empty():
        while not post.empty():
            saco = urgente.get()
            sacar = post.get()
            res.put(saco)
            res.put(sacar)
    return res 

c = Cola()
c.put(1)
c.put(3)
c.put(8)
c.put (2)

g= Cola()
g.put(89)
g.put(54)
g.put(23)
g.put(23)

#print (orden_de_atencion(c,g).queue)
from typing import List
from typing import Tuple
 

#2
def porcentaje (s:List[Tuple[int,str]], enfermedead:str) -> float:
    res:float = 0
    total:int = 0
    for tupla in s:
        if tupla[1] == enfermedead:
            res += 1
            total += 1
        else:
             total += 1
    if total == 0:
            return 0.0
    porcentaje = (res/total)
    return porcentaje

def alarma_epi (registros:List[Tuple[int,str]], infecciosas: List[str], umbral:int) -> dict:
    diccionario = {}
    for i in infecciosas:
        if not i in diccionario.keys() and porcentaje (registros, i) >= umbral:
            diccionario[i] = porcentaje (registros,i)
    return diccionario
registros = [(1, "gripe"), (2, "covid"), (3, "gripe"), (4, "covid"), (5, "covid")]
infecciosas = ["covid", "ebola"]
umbral = 0.4
#print (alarma_epi (registros,infecciosas,umbral))


#3
def suma (s:List[int]) -> int:
    res:int = 0
    for i in s:
        res += i
    return res 

def empleados_del_mes (horas:dict) -> List[int]: # -> {23:[3,4], 4:[7,8]} -> [(23,[3,4]),(4,[7,8])]
    res:List[int] = []
    lista:List[Tuple[int,List[int]]] = list(horas.items())
    if not horas:
        return res 
    
    maximo_Actual = suma(lista[0][1])
    for i in lista: 
        segundo = suma (i[1])
        id_seg = i[0]        
        if segundo == maximo_Actual:
            res.append(id_seg)
        if segundo > maximo_Actual:
            res = []
            maximo_Actual = segundo
            res.append(id_seg)


    return res
horas = {1: [5, 6, 7], 2: [8, 9, 10], 3: [2, 3, 4]} 
#print (empleados_del_mes (horas))


#4
def cantidad (s:List[bool]) -> float:
    res:float = 0
    for i in s:
        if i == True:
            res += 1
    return res

def nivel_de_ocupacion (camas:List[List[bool]]) -> List[float]:
    res:List[float] = []
    for i in camas:
        res.append(cantidad (i)/len(i))
    return res
#print (nivel_de_ocupacion ( [[True,True,True,True], [True,True,True,False], [True,True,False,False], [False,False,False,False]]))    

                                           








                                           