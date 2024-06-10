from typing import List

def sumar_matriz(m:List[List[int]]) -> int:
    res: int = 0
    for fila in m:
        for elemento in fila:
            res += elemento
    return res
#print (sumar_matriz ([[1,2,3],[3,4,5]]))


def sumar_cada_fila(m:List[List[int]]) -> List[int]:
    lista_sumas: list[int] = []

    for fila in m:
        contador: int = 0
        for elemento in fila:
            contador += elemento
        lista_sumas.append(contador)
    return lista_sumas

#print(sumar_cada_fila ([[1,2,3],[3,4,5]]))


def columnas (m:List[List[int]]) -> List[List[int]]:
    columna = []
    aux = []
    for fila in range (len(m[0])):
        for i in range (len(m)):
            aux.append(m[i][fila])
        columna.append(aux)
        aux = []

    return columna
#print (columnas ([[1,2,3],[3,4,5]]))


def sumar_cada_columna(m:List[List[int]]) -> List[int]:
    resultado: list[int] = []
    fila0: list[int] = m[0]

    for columna in range (len(fila0)):
        contador_col:int = 0
        for fila in range (len(m)):
            contador_col += m[fila][columna]
        resultado.append(contador_col)
    return resultado
#print (sumar_cada_columna ([[1,2,3],[3,4,5]]))