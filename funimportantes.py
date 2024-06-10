from typing import List

def columnas (m:List[List[int]]) -> List[List[int]]:
    columna = []
    aux = []
    for fila in range (len(m[0])):
        for posicion in m:
            aux.append(posicion[fila])
        columna.append(aux)
        aux= []
    return columna
#print (columnas ([[1,2,3],[4,5,6],[7,8,9]]))

def separar (texto:str) -> List[str]:
    separadas = []
    palabras = ""
    for caracter in texto:
        palabras += caracter
        if caracter == ' ':
            if len(palabras) > 0:
                separadas.append(palabras)
            palabras = ''
    if len(palabras)> 0:
        separadas.append(palabras)
    return separadas
#print(separar ("hola como estas "))


def frecuencia_posiciones_caballo (caballos:List[str], carreras:dict) -> dict:
    diccionario = {}
    for caballo in caballos:
        diccionario[caballo] = [0] *len(caballos)

    for carrera in carreras.values():
        for posicion in range (len(carrera)):
            diccionario[carrera[posicion]][posicion] += 1
    return diccionario
#carreras= {"carrera1":["linda", "petisa", "mister", "luck"], "carrera2":["petisa", "mister", "linda", "luck"]}
#caballos= ["linda", "petisa", "mister", "luck" ]
#print (frecuencia_posiciones_caballo (caballos,carreras))


def columnas_repetidas (m:List[List[int]]) -> bool:
    for fila in m:
        for i in range (int(len(fila)/2)):
            if not fila[i] == fila[int(len(fila)/2 + i)]:
                return False
    return True

def sumar_cada_fila(m:List[List[int]]) -> List[int]:
    lista_sumas: list[int] = []

    for fila in m:
        contador: int = 0
        for elemento in fila:
            contador += elemento
        lista_sumas.append(contador)
    return lista_sumas

def sumar_cada_columna(m:List[List[int]]) -> List[int]:
    resultado: list[int] = []
    fila0: list[int] = m[0]

    for columna in range (len(fila0)):
        contador_col:int = 0
        for fila in range (len(m)):
            contador_col += m[fila][columna]
        resultado.append(contador_col)
    return resultado

def valor_extremo (cotizaciones_diarias:dict) -> dict:
    diccionario :dict ={}
    for k,v in cotizaciones_diarias.items():
        maximo_actual = v[0][1]
        minimo_actual = v[0][1]
        for i in v:
            segundo = i[1]
            if segundo > maximo_actual:
                maximo_actual = segundo
            if segundo < minimo_actual:
                minimo_actual = segundo
        diccionario[k] = (minimo_actual,maximo_actual)
    return diccionario

def convertir_a_diccionario (lista:List[int]) -> dict:
    diccionario = dict()
    for i in lista:
        if not i in diccionario.keys():
            diccionario[i] = 1
        else:
            diccionario[i] += 1
    return diccionario