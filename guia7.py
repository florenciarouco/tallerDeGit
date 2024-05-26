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
#preguntar

#1.8
#def saldoactual (movimientos:List[(str,int)]) -> int:
 #   saldo:int= 0
  #  for i in range (0,len(movimientos)):
   #     if (movimientos [i][0] == "I"):
    #        saldo += movimientos [i][1]
     #   elif (movimientos [i][0] == "R"):
      #      saldo -= movimientos [i][1]
       # return saldo

#ver porque no me da
def calcularBalance(movimientos: List[(str,int)]) -> int:
    balance: int = 0
    for i in range(len(movimientos)):
        tipoDeMovimiento = movimientos[i][0]
        if tipoDeMovimiento == "I":
            balance += movimientos[i][1]
            continue
        if tipoDeMovimiento == "R":
            balance -= movimientos[i][1]
            continue
    return balance

print (calcularBalance ([("I",300),("R",3),("I",50)]))


#1.9
def vocalesdistintas (palabras:str) -> bool:
    vocales:str = "aeiou"
    cantvocales: int= 0
    for i in range (len (palabras)):
        iesimoCaracter: str = palabras[i]
        if pertenece (vocales, iesimoCaracter):
            quitartodocaracter (vocales, iesimoCaracter)  
            cantvocales += 1
            if cantvocales >= 3:
                return True
    return False 

def quitartodocaracter (palabra:str, caracter:chr) -> str:
    textonuevo: str = " "
    for i in range (len(palabra)):
        iesimoCaracter: str = palabra[i]
        if iesimoCaracter != caracter:
            textonuevo += iesimoCaracter 
        return textonuevo 

print (vocalesdistintas ("hlacomoestasotod bien"))

#vereste