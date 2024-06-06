import math
from typing import List 
from typing import Tuple
import random

#1.1
def pertenece (s:List[int], e:int) -> bool:
    inicio:int = 0
    while (inicio < len(s)):
        if s[inicio] == e:
            return True
        else:
            inicio += 1
    return False

#print (pertenece ([1,23,5,7,34],7))

#1.2
def divide_a_todos (s:List[int],e:int) -> bool:
    for i in range (len(s)):
        if s[i] % e != 0:
            return False
    return True
    
#print (divide_a_todos ([4,6,8,10],2))

#1.3
def suma_total (s:List[int])-> int :
    suma:int = 0
    for i in range (len(s)):
        suma = suma + s[i]
    return suma

#print (suma_total ([2,3,4,5,6,7]))

#1.4
def ordenados (s:List[int]) -> bool:
    for i in range (len(s)-1):
        if s[i] > s[i+1]:
            return False
    return True
    
#print (ordenados ([1,2,3,4,5,7,2]))

#1.5
def esmayora7 (palabra:List[str])->int:
    for i in range(len(palabra)):
        if len(palabra[i]) > 7:
            return True
        return False
#print (esmayora7 (["como estas","esta","fl"])) #ver porque me da true

#1.6
def es_palindromo (texto:str) -> bool:
    for i in range (len(texto)):
        if texto[i] != texto [len(texto) -1 -i]:
            return False
    return True
#print (es_palindromo("neuquen"))

#1.7
def es_minuscula (s:str) -> bool:
    minuscula:str = 'abcdefghijklmnopqrstuvwxyz'
    indice:int = 0
    while indice < len(s):
        if s[indice] in minuscula :
            return True
        else:
            indice += 1
    return False

#print (es_minuscula("Hola como estas "))

def haymayus (s:str) -> bool:
    mayus:str = 'ABCDEFGHIJKLMNOPQRTUVWXYZ'
    indice:int = 0

    while indice < len(s):
        if s[indice] in mayus:
            return True
        else:
            indice += 1
    return False

#print (haymayus ("Hokla como estas "))

def haynumero (s:str) -> bool:
    numero:str = '0123456789'
    indice: int = 0
    while indice < len(s):
        if s[indice] in numero:
            return True
        else: 
            indice += 1
    return False

#print (haynumero ("hola com232estas ebie"))

def contraseña (texto:str) -> str:
    if ((len(texto) > 8) and es_minuscula (texto) and haymayus (texto) and haynumero (texto)):
        return "VERDE"
    elif (len(texto) < 5):
        return "ROJO"
    else:
        return "AMARILLO"
    
#print (contraseña ("Florencia2004"))

# 1.8
def saldo_actual (saldo:List[Tuple[str,int]]) -> int:
    inicio:int = 0
    for i in range (0,len(saldo)):
        if saldo [i][0] == 'I':
            inicio += saldo [i][1]
        elif saldo [i][0] == 'R':
            inicio -= saldo[i][1]
    return inicio
#print (saldo_actual ([("I",300),("I",80),("R",30)]))

#1.9
def vocales (palabra:str) -> bool:
    cont = 0
    vocales = ['a','e','i','o','u']
    for i in palabra:
        if (i in vocales):
            cont += 1
            vocales.remove(i)
    return (cont>=3)
#print (vocales ("hola como estas bien y vus"))

#2.1
#2.1
"""def coloca0 (num:List[int]) -> None:
    i: int = 0
    while (i < len (num)):
        num[i] = 0
        i+= 2
coloca0 ([2,1,4,3,6,7,5,9])
"""
#2.2
def coloca0 (numeros:List[int])-> List[int]:
    inicio:int = 0
    listanueva:List[int] = numeros.copy()
    while inicio < len(listanueva):
        listanueva[inicio] = 0
        inicio+=2
    return listanueva 
#print (coloca0([0,1,2,3,4,5]))

#2.3
def sinvocales(texto:str) -> str:
    vocales:str = "aeiouAEIOU"
    textosinvocales:str = ""
    for i in range (len(texto)):
        if texto[i] in vocales:
            textosinvocales += ''
        else:
            textosinvocales += texto[i]
    return textosinvocales 
#print (sinvocales("hola como estas"))

#2.4
def reemplaza_vocales (s:str) -> str:
    vocales:str = "aeiou"
    textosinvocales:str = ""
    for i in range (len(s)):
        if s[i] in vocales:
            textosinvocales += '-'
        else: 
            textosinvocales += s[i]
    return textosinvocales
#print (reemplaza_vocales("hola como esta"))

#2.5
def dar_vuelta_str (texto: str) -> str:
    reverso:str = ""
    for i in range (len(texto)-1,-1,-1):
        reverso += texto[i] 
    return  reverso
#print (dar_vuelta_str ("florencia y neuquen"))

#2.6
def eliminar_repetidos (s:str) -> str:
    textosinrepetidos:str = ""
    aparecidos:str = ""
    for i in range(len(s)):
        caracter:chr = s[i]
        if not caracter in aparecidos:
            textosinrepetidos += caracter
            aparecidos += caracter
    return textosinrepetidos

#print (eliminar_repetidos ("hoooolllllaaaaaaaa tdiiii"))

#3
def esaporbado (notas:List[int]) -> bool:
    for i in range (len(notas)):
        if notas[i] < 4:
            return False
    return True
#print (esaporbado ([6,7,5,4]))

def promedio (notas:List[int]) -> float:
    suma:int = 0
    for i in range (len(notas)):
        suma += notas[i]
    return suma / len(notas)
#print (promedio ([1,2,3]))

def aprobado (s:List[int]) -> int:
    notas:List[int] = s.copy()
    if esaporbado (notas) and promedio (notas) >= 7:
        return 1
    elif esaporbado (notas) and (promedio(notas) >= 4 and promedio(notas) < 7):
        return 2
    elif (not esaporbado(notas)) or promedio(notas) < 4:
        return 3
#print (aprobado([6,7,5]))

#4.1
def estudiantes () -> List[str]:
    lista:List[str] = []
    while True:
        print ("ingresa nombre o 'listo' para salir:")
        nombres = input()
        if nombres != "listo":
            lista.append(nombres)
        else:
            return lista
#print (estudiantes())

#4.2
def monedero () -> List[Tuple[str,int]]:
    lista:List[Tuple[str,int]] = []
    while True:
        print ("ingrese 'C'argar, 'D'escotar o 'X' en caso de finalizar:")
        ingreso = input()
        if ingreso == "X":
            return lista
        else: 
            print("ahora decime cuanto queres cargar:")
            monto:int = int(input()) #aca es int(inmput()) porque input da string y para convertirlo en int
            lista.append((ingreso,monto))

#print (monedero())

#4.3
def sieteymedio ():
    cartas:List[int] = [0,1,2,3,4,5,6,7,10,11,12]
    lista:List[int] = []
    ultimacarta:int
    suma:float = 0
    eleccion:str
    while True:
        ultimacarta = random.choice (cartas)
        if ultimacarta < 10:
            suma += ultimacarta
        else: 
            suma += 0.5
        print ("agregaste una carta")
        if suma > 7.5:
            print ("perdiste")
            break

        eleccion = ""
        while eleccion != "sigo" and eleccion != "me planto":
            print ("elegi 'sigo' o 'me planto'")
            eleccion = input()
        if eleccion == "me planto":
            print ("ganaste")
            break
    print (lista)
    print (suma)
#print (sieteymedio ()) 

#5.1
def es_matriz (matriz:List[List[int]]) -> bool:
    lista= [[]]
    if len(matriz) == 0 or len(matriz[0]) == 0:
        return False
    for fila in matriz:
        if len(fila) != len(matriz[0]):
            return False
    return True
#print (es_matriz([[1,2,3],[3,4],[5,6,7]]))

def suma_matriz (matriz:List[List[int]]) -> int:
    suma:int = 0
    for fila in matriz:
        for elemento in fila:
            suma += elemento
    return suma 
#print (suma_matriz([[1,2,3],[3,4,5],[5,6,7]]))

def suma_cada_fila(m:List[List[int]]) -> List[int]:
    listasumas:List[int] = []
    for fila in m:
        suma:int = 0
        for elemento in fila:
            suma += elemento
        listasumas.append(suma)
    return listasumas
#print (suma_cada_fila([[1,2,3],[3,4,5],[5,6,7]]))

def suma_cada_columna (m:List[List[int]]) -> List[int]:
    listassuma:List[int] = []
    fila0: List[int] = m[0]
    for columna in range (len(fila0)):
        suma:int = 0
        for fila in range (len(m)):
            suma+= m [fila][columna]
        listassuma.append(suma)
    return listassuma
#print (suma_cada_columna([[1,2,3],[3,4,5],[5,6,7]]))

def columna_matriz(m: List[List[int]], num_col: int) -> List[int]:
    columna: List[int] = []
    for fila in m:
        columna.append(fila[num_col]) # de cada fila agarro el elemento que esta en la posicion igual que el numero de columna
    return columna

#print (columna_matriz ([[1,2,3],[3,4,5]], 2))

def minimo_columna(col: List[int]) -> int:
    minimo_actual: int = col[0]
    for i in range(1,len(col)):
        if col[i] < minimo_actual:
            minimo_actual = col[i]
    return minimo_actual
#print (minimo_columna ([2,3,4,3,4,2,19,3,9]))


def maximo_columna(col: List[int]) -> int:
    maximo_actual: int = 0
    for i in range (len(col)):
        if col[i] > maximo_actual:
            maximo_actual = col[i]
    return maximo_actual

def min_max(col: List[int]) -> Tuple[int,int]:
    min = minimo_columna(col)
    max = maximo_columna(col)
    return min, max
#print (min_max ([4,83,9,2,1,0,-2,6,23]))


def min_max_de_cada_columna_matriz (m:List[List[int]]) -> List[Tuple[int, int]]:
    res: List[(int, int)] = []
    for num_col in range(len(m[0])):
        col: List[int] = columna_matriz(m,num_col)
        res.append(min_max(col))
    return res

matriz = [[1,2,3],[4,5,6],[7,8,9],[9,8,1]]
#print(min_max_de_cada_columna_matriz(matriz))