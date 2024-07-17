#{"a":[61,60,59,58],"b":[1,2,3,0],"c":[2,3,4,5],"d":[2,0,61,2],"e":[0,0,0,0],"f":[61,61,61,61]}
from typing import List
def promedio (s:List[int]) -> float:
    res:int = 0
    cant:int = 0
    for i in s:        
        if i > 0 and  i < 61:
            res += i
            cant +=1
    if cant <= 0:
        return 0.0

    return res/(cant)
#print (promedio ([61,60,59,58]))

def promedio_de_salidad (registro:dict) -> dict:
    res = dict()
    lista = list(registro.items())
    cantidad:int = 0

    for k,lis in lista:
        for num in lis:
            if num > 0 and num < 61:
                cantidad += 1
        res[k] = (cantidad,promedio(lis))
        cantidad = 0
    return res

registro = {"a":[61,60,59,58],"b":[1,2,3,0],"c":[2,3,4,5],"d":[2,0,61,2],"e":[0,0,0,0],"f":[61,61,61,61]}
#print (promedio_de_salidad (registro))

def tiempo_mas_rapido (tiempos_salas:List[int]) -> int:
    res:int = 0
    minimo_actual = tiempos_salas[0]
    for i in range(len(tiempos_salas)):
        segundo = tiempos_salas[i]
        if segundo > 0 and segundo < minimo_actual:
            minimo_actual = segundo
            res = i 
    return res
#print (tiempo_mas_rapido ([45,61,0,42,46,48,0,61,41,0,26]))

from typing import Tuple
def racha_mas_larga (tiempos:List[int]) -> Tuple[int,int]:
    pos_menor = 0
    pos_mayor = 0
    cant_may= 0
    pos_menor_act = -1
    cant_may_act = 0

    for i in range   (len(tiempos)):
        elem_act = tiempos[i]
        if elem_act < 61 and elem_act > 0:
            cant_may_act += 1
            if pos_menor_act == -1:
                pos_menor_act = i
        else:
            if cant_may_act > cant_may:
                cant_may = cant_may_act
                cant_may_act = 0
                pos_menor = pos_menor_act
                pos_menor_act = -1

                pos_mayor = pos_menor + cant_may -1
    if cant_may_act > cant_may:
        cant_may = cant_may_act
        pos_menor = pos_menor_act
        pos_mayor = pos_menor + cant_may -1
    return (pos_menor,pos_mayor)

#print (racha_mas_larga([1,2,3,61,1,2,3,7,0]))

#----------------VER-------------------

# 4
def escape_en_solitario (amigos:List[List[int]]) -> List[int]:
    respuesta = []
    
    for fila in range (len(amigos)):
        if amigos[fila][0] == 0 and amigos[fila][1] == 0 and amigos[fila][2] != 0 and amigos[fila][3] == 0:
            respuesta.append(fila) 
    return respuesta
#print (escape_en_solitario ([[0,0,1,0],
#                             [1,61,61,44],
#                             [6,1,2,4],
#                             [55,44,60,60],
#                             [0,0,60,0]]))