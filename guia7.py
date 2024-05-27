#guia7
import math
from typing import List 

#1.1
def pertenece (s:List[int], e:int) -> bool: 
    indice : int = 0
    longitud : int = len(s)

    while (indice < longitud):
        if s[indice] == e:
            return True
        else: 
            indice += 1
    return False

print (pertenece ([4,7,2,8,5],4))

#1.2
def divideatodos (dividendo:List[int], divisor:int) -> bool:
    for i in range (len(dividendo)):
        if dividendo [i] % divisor != 0:
            return False 
        return True
print (divideatodos ([4,7,8,10],2))

#1.3
#conwhile
def sumatotal (s:List[int]) -> int:
    total: int = 0
    ind_actual : int = 0
    longitud : int = len(s)

    while (ind_actual < longitud):
        valor_actual:int = s[ind_actual]
        total= total + valor_actual
        ind_actual += 1

    print (total)
sumatotal ([1,2,3,4,5,6])

#con for i in range
def sumatotal2 (s:List[int]) -> int:
    suma: int= 0
    for indice in range (len(s)):
        suma= suma + s [indice]
    return suma

print (sumatotal2 ([1,2,3,4,5,6]))

#1.4
def ordenados (numeros:List[int]) -> bool:
    for i in range (len(numeros)-1):
        if numeros [i] > numeros [i+1]:
            return False
        return True
print (ordenados ([2,3,4,5,6]))

#1.5
def esmayora7 (palabras:List[str]) -> bool:
    for i in range (len(palabras)):
        if len (palabras [i]) > 7:
            return True
        return False
print (esmayora7 (["florenciaa","hola","como estas"]))

#1.6
def palindromo (palabras:str) -> bool:
    for i in range (len(palabras)):
        if palabras [i] != palabras [len(palabras)-1-i]:
            return False
        return True
print (palindromo ("anita lava la tinta")) #ver

#1.7
def hayminuscula (texto:str) -> bool:
    indice : int = 0
    minuscula : str = "abcdefghijklmnopqrstuvwxyz"

    while (indice < len (texto)):
        if (pertenece (minuscula, texto[indice])): 
            return True
        else:
            indice += 1
    return False


def haymayusc (texto:str) -> bool:
    indice : int = 0
    mayus : str = "ABCDEFGHOJKLMNOPQRSTUVWXYZ"

    while (indice < len(texto)):
        if (pertenece (mayus, texto[indice])): 
            return True
        else:
            indice += 1
    return False

def haynumero (texto:str) -> bool:
    for i in range(len(texto)):
        if pertenece("0123456789",texto[i]):
            return True
    return False
    

def contraseña (contraseña:str) -> str:
    if (len (contraseña) > 8 and hayminuscula (contraseña) and haymayusc (contraseña) and haynumero (contraseña)):
        return "VERDE"
    if (len (contraseña) < 5): 
        return "ROJO"
    return "AMARILLO"

print (contraseña ("HOLACOMOESTASbienyvostodobien12345"))


#1.8
def saldoactual (movimientos:list[(str,int)]) -> int:
    saldo:int= 0
    for i in range (0,len(movimientos)):
        if (movimientos [i][0] == "I"):
            saldo += movimientos [i][1]
        elif (movimientos [i][0] == "R"):
            saldo -= movimientos [i][1]
        return saldo

print (saldoactual ([("I",300),("R",3),("I",50)]))
#pregunttar luqui

#1.9
def vocalesdistintas (frase:str) -> bool:
    cont = 0
    vocales = ['a','e','i','o','u']
    for i in frase:
        if (i in vocales):
            cont += 1
            vocales.remove(i)
    return (cont>=3)

print (vocalesdistintas ("holaaaaaaaaa"))

#2.1
def coloca0 (num:list[int]) -> None:
    i: int = 0
    while (i < len (num)):
        num[i] = 0
        i+= 2
coloca0 ([2,1,4,3,6,7,5,9])

def coloca0_2 (num:list[int]) -> list[int]:
    res:list[int] = num.copy ()
    i:int = 0
    while (i < len (res)):
        res[i] = 0
        i+= 2
    return res
print (coloca0_2 ([1,2,3,4,5]))


    



    