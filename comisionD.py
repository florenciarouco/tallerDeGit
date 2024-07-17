from typing import List
from typing import Tuple

def stock_productos (stock_cambios: List[Tuple[str,int]]) -> dict:
    res = {}
    for (i,v) in stock_cambios:
        if i in res:
            minimo_Actual = res[i][0]
            max_actual = res[i][1]
            if v < minimo_Actual:
                res[i] = (v,max_actual)
            elif v > max_actual:
                res[i] = (minimo_Actual,v)
        else:
            res[i] = (v,v)
    return res
#print (stock_productos([("flo",5),("ef",3),("flo",45),("fe",3)]))

def es_primo(numero:int) -> bool:
    if (numero < 2):
        return False
        
    resultado:bool = True
    for i in range(2, numero):
        if (numero % i) == 0:
            resultado = False
    return resultado

def es_codigo_primo(numero:int) -> bool:
    ultimos_tres:int = numero % 1000
    return es_primo(ultimos_tres)


def filtrar_codigos_primos(codigos_de_barras: List[int]) -> List[int]:
    res:list[int] = []
    for codigo in codigos_de_barras:
        if(es_codigo_primo(codigo)):
            res.append(codigo)
    return res

#print (filtrar_codigos_primos([123,526,183,2323,1317]))

def subsecuencia_mas_larga (tipos:List[str]) -> int:
    res:int = 0
    largo_max:int = 0
    largo_actual:int = 0
    indice:int = 0
    for t in tipos:
        if t == "perro" or t == "gato":
            largo_actual +=1
        else:
            if largo_max < largo_actual:
                res = indice - largo_actual                
                largo_max = largo_actual
            largo_actual = 0
        indice +=1

    if largo_max < largo_actual:
        res = indice - largo_actual                

    return res
#---------------------VER BIEN------------

def columnas (m:List[List[str]]) -> List[List[str]]:
    res = []
    aux = []
    
    for i in range(len(m)):
        for fila in m:
            aux.append(fila[i])
        res.append(aux)
        aux = []
    return res

"""
def tabla_turnos (grilla:List[List[str]]) -> List[Tuple[bool,bool]]:
    transpuesta = columnas (grilla)
    res = []
    for fila in transpuesta:
        misma_persona_mañana = True
        misma_persona_noche = True
        for i in range(8):
            if i < 4:
                if fila[i] != fila[0]:
                    misma_persona_mañana = False
            else:
                if fila[i] != fila[4]:
                    misma_persona_noche = False
        tupla = [misma_persona_mañana,misma_persona_noche]
        res.append(tupla)
    return res
print (tabla_turnos ([
            ["Ana", "Ana", "Sol", "Ana", "Sol", "Sol"],    # 9-10
            ["Ana", "aNa", "Sol", "Ana", "Ana", "Ana"],    # 10-11
            ["Ana", "Ana", "Sol", "Sol", "Ana", "Ana"],    # 11-12
            ["Ana", "Ana", "Sol", "Sol", "Ana", "Ana"],    # 12-13
            ["Luis", "Luis", "Luis", "Luis", "Luis", "Sol"],    # 14-15
            ["Luis", "Sol", "Luis", "Luis", "Luis", "Sol"],    # 15-16
            ["Luis", "Luis", "Luis", "Luis", "Sol", "Sol"],    # 16-17
            ["Luis", "Sol", "Luis", "Ana", "Luis", "Sol"]     # 17-18
        ]))
"""

def esDamero (m:List[List[int]]) -> bool:
    transpuesta = columnas (m)
    if len(m[0]) != 8 or len(transpuesta[0]) != 8:
        return False
    
    for fila in m:
        for i in range (len(fila)-1):
            if fila[i] == fila[(i+1)]:
                return False
    for columna in transpuesta:
        for j in range (len(columna)-1):
            if columna[j] == columna[(j+1)]:
                return False
    return True



#print (esDamero ([[1,0,1,0,1,0,1,0],
#                  [0,1,0,1,0,1,0,1],
#                  [1,0,1,0,1,0,1,0],
#                  [0,1,0,1,0,1,0,1],
#                  [1,0,1,0,1,0,1,0],
#                  [0,1,0,1,0,1,0,1],
#                  [1,0,1,0,1,0,1,0],
#                  [0,1,0,1,0,1,0,1]]))

def modificar_matriz (matriz:List[List[int]], lista_parametro:List[int]) -> List[List[int]]:
    res = []
    for fila in range(len(matriz)):
        fila_mod = []
        for i in range(len(matriz)):
            fila_mod.append(matriz[fila][i] + lista_parametro[i])
        res.append(fila_mod)
    return res 

#print (modificar_matriz ([[1,2,3],[4,5,6],[7,8,9]], [10,20,30]))

