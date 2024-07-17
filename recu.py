from typing import List
from typing import Tuple

from queue import Queue as Cola
#-------------TEMA1-----------------------------
#1
def gestion_notas (notas: List[Tuple[str,str,int]]) -> dict:
    res = {}

    for nombre,materia,nota in notas:
        if nombre in res:
            res[nombre].append((materia,nota))
        else:
            res[nombre] = [(materia,nota)]
    return res 

#print (gestion_notas ([("flor","mate",10),("lucas","quimica",9),("kari","lengua",9),("flor","ip",9)]))

#2
def cantidad_digitos_pares (numeros:List[int]) -> int:
    cantidad:int = 0 

    for i in numeros:
        n = str(i)
        for digito in n:
            if int(digito) % 2 == 0:
                cantidad += 1
    return cantidad

#print (cantidad_digitos_pares ([5434,42]))

#3
def copiar_cola (c:Cola) -> Cola:
    copia = Cola()
    otra = Cola()

    while not c.empty():
        sacar = c.get()
        otra.put(sacar)
    while not otra.empty():
        saco = otra.get()
        copia.put(saco)
        c.put(saco)

    return copia

def reordenar_cola_primero_pesados (paquetes:Cola, umbral:int) -> Cola:
    cola = copiar_cola(paquetes)
    res = Cola()
    menor = Cola()

    while not cola.empty():
        datopaquete = cola.get()
        ids = datopaquete [0]
        peso = datopaquete[1]
        if peso > umbral:
            res.put(datopaquete)
        if peso <= umbral:
            menor.put(datopaquete)
        
    while not menor.empty():
        dato = menor.get()
        res.put(dato)
    return res 
p = Cola()
p.put(("3fwf",5))
p.put(("3223",9))
p.put(("erd",19))
p.put(("2fef",15))

#print (reordenar_cola_primero_pesados (p,10).queue)


#4
def columnas (m:List[List[int]]) -> List[List[int]]:
    res = []
    aux = []

    for fila in range(len(m[0])):
        for posicion in m:
            aux.append(posicion[fila])
        res.append(aux)
        aux= []
    return res 

def minimo (s:List[int]) -> int:
    minimo_Actual = s[0]
    for i in s:
        segundo = i
        if segundo < minimo_Actual:
            minimo_Actual = segundo
    return minimo_Actual


def matriz_pseudo_ordenada (m:List[List[int]]) -> bool:
    transpuesta = columnas(m)

    for columna in range (len(transpuesta)-1):
        if minimo (transpuesta[columna]) > minimo (transpuesta[(columna+1)]):
            return False
    return True
#print (matriz_pseudo_ordenada ([[1, 2, 3],
#                                [4, 5, 6],
#                                [2, 6, 9],
#                                [7, 8, 10]]))


#-------------TEMA2----------------------

#1
def gestion_ventas (ventas:List[Tuple[str,str,int]]) -> dict:
    res = {}
    for nombre,producto,total in ventas:
        if not nombre in res:
            res[nombre] = [(producto,total)]
        else:
            res[nombre].append((producto,total))
    return res 

#print (gestion_ventas ([("flor","def",10),("lucas","e",3),("flor","eff",67)]))

#2
def cantidad_digitos_impares (numeros:List[int]) -> int:
    cantidad:int = 0
    for i in numeros:
        n = str(i)
        for digito in n:
            if int(digito) % 2 != 0:
                cantidad+= 1
    return cantidad

#3
def reordenar_cola_primero_numerosas (carpetas:Cola, umbral:int) -> Cola:
    cola = copiar_cola (carpetas)
    res= Cola()
    menor = Cola()

    while not cola.empty():
        dato = cola.get()
        num = dato[1]
        if num > umbral:
            res.put(dato)
        if num <= umbral:
            menor.put(dato)

    while not menor.empty():
        saco = menor.get()
        res.put(saco)

    return res

p = Cola()
p.put(("3fwf",5))
p.put(("3223",9))
p.put(("erd",19))
p.put(("2fef",15))

#print (reordenar_cola_primero_numerosas (p,10).queue)

#4
def maximo (s:List[int]) -> int:
    maximo_Actual = s[0]
    for i in s:
        segundo = i
        if segundo > maximo_Actual:
            maximo_Actual = segundo
    return maximo_Actual

def paso_a_columnas (m:List[List[int]]) -> List[List[int]]:
    res = []
    aux = []

    for fila in range(len(m[0])):
        for posicion in m:
            aux.append(posicion[fila])
        res.append (aux)
        aux = []
    return res

def matriz_cuasi_decreciente (m:List[List[int]]) -> bool:
    transpuesta = paso_a_columnas (m)

    for columna in range(len(transpuesta)-1):
        if maximo (transpuesta[columna]) < maximo (transpuesta[(columna +1)]):
            return False
    return True


#print (matriz_cuasi_decreciente ([[1, 2, 3],
#                                  [4, 5, 6],
#                                  [2, 6, 9],
#                                  [700, 71, 60]]))
