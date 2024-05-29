#guia7
import math
from typing import List 
from typing import Tuple
import random
#import numpy as np

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
def saldoactual (movimientos:List[Tuple[str,int]]) -> int:
    saldo:int= 0
    for i in range (0,len(movimientos)):
        if (movimientos [i][0] == "I"):
            saldo += movimientos [i][1]
        elif (movimientos [i][0] == "R"):
            saldo -= movimientos [i][1]
        return saldo

print (saldoactual ([("I",2000),("R",20),("R",1000),("I",300)]))
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
def coloca0 (num:List[int]) -> None:
    i: int = 0
    while (i < len (num)):
        num[i] = 0
        i+= 2
coloca0 ([2,1,4,3,6,7,5,9])

#2.2
def coloca0_2 (num:List[int]) -> List[int]:
    res:list[int] = num.copy ()
    i:int = 0
    while (i < len (res)):
        res[i] = 0
        i+= 2
    return res
print (coloca0_2 ([1,2,3,4,5]))

#2.3
def sinvocales (texto:str) -> str:
    vocales:str = "aeiouAEIOU"
    textosinvocales:str = ""
    for i in range (len(texto)):
        if pertenece (vocales,texto[i]):
            textosinvocales += ''
        else: 
            textosinvocales += texto [i]
    return textosinvocales
print (sinvocales ("hola como estas"))

#2.4
def reemplazar_vocales (texto:str) -> str:
    vocales:str= "aeiou"
    textosinvocales:str= ""
    for i in range (len(texto)):
        if pertenece (vocales,texto[i]):
            textosinvocales += ''
        else: 
            textosinvocales += texto [i]
    return textosinvocales
text = "hola como"
print (text)

print (reemplazar_vocales (text))
print (text)

#2.5
def dar_vuelta_str (texto: str) -> str:
    reverso: str = ""
    for i in range (len(texto)-1,-1,-1):
        reverso += texto [i]
    return reverso 
text = "hi how are you"

print (dar_vuelta_str (text))

#2.6
def eliminar_repetidos (texto: str) -> str:
    aparecidos: str = ""
    textoSinRepeticiones: str = ""
    for i in range (len(texto)):
        caracter: chr = texto[i]
        if not pertenece (aparecidos,caracter):
            textoSinRepeticiones += caracter
            aparecidos += caracter
    return textoSinRepeticiones

print (eliminar_repetidos ("hola como estas"))

#3
def todosmayoresoiguales (numeros:List[int]) -> bool:
    for i in range (len(numeros)):
        if numeros[i] < 4:
            return False
    return True

print (todosmayoresoiguales ([8,9,17]))

def promedio (notas:List[int]) -> float:
    suma:int = 0
    for i in range (len(notas)):
        suma += notas[i]
    return suma/len(notas)
print (promedio ([7,8,9]))

def aprobado (notas:List[int]) -> int:
    todoaprobado: bool = todosmayoresoiguales (notas)
    notapromedio: float = promedio(notas) 
    if todoaprobado and notapromedio >= 7:
        return 1
    elif (todoaprobado and (notapromedio >= 4 and notapromedio < 7)):
        return 2 
    else:
        return 3
print (aprobado ([6,7,8]))

#4.1
def nombres_estudiantes () -> List[str]:
    nombres:List[str] = []
    while (True):
        print ("Ingresa un nombre a registrar o 'list' para salir:")
        ingresando = input()
        if ingresando != "listo":
            nombres.append(ingresando)
        else:
            return nombres
#print (nombres_estudiantes ())
#4.2
def monedero () -> List[Tuple[str,int]]:
    operaciones: List[Tuple[str,int]] = []
    while (True):
        print ("Ingresá el tipo de operación: 'C'argar, 'D'escontar o 'X' (salir)")
        operacion = input ()
        if operacion == "X":
            return operaciones 
        if operacion == "C" or operacion == "D":
            print ("Ahora,  ingresa el monto de la operacion:")
            monto: int = int(input(()))
            operaciones.append((operacion,monto))

#print (monedero())

#4.3
def sieteymedio ():
    baraja:List[int] = [1,2,3,4,5,6,7,10,11,12]
    mano: List[int] = []
    suma:float = 0
    ultimacarta:int
    eleccion:str

    while(True):
        ultimacarta = random.choice (baraja)
        mano.append (ultimacarta)
        if ultimacarta <10:
            suma += ultimacarta 
        else: 
            suma+= 0.5
        print ("Agregaste una carta a tu mano")
        if suma >7.5:
            print ("Perdiste")
            break

        eleccion = ""
        while(eleccion != "sigo" and eleccion != "me planto"):
            print ("Elegi: 'sigo' o 'me planto'")
            eleccion = input()
        if eleccion == 'me planto':
            print("Ganaste!")
            break
    print(mano)
    print(suma)

#print (sieteymedio ())

#5.1
def pertenece_a_cada_uno_version_1 (s:List[List[int]], e:int, res:List[bool]):
    res.clear ()
    for sublista in s:
        if pertenece (sublista,e):
            res.append(True)
        else:
            res.append(False)
resultado:List[bool] = []
pertenece_a_cada_uno_version_1 ([[1,2,3],[3,4,1],[4,5,6,2]],2,resultado)
print (f"lista de bool: {resultado}")

#5.2

#no entendi

#5.3
def es_matriz (matriz:List[List[int]]) -> bool:
    filas:int = len(matriz)
    if filas == 0:
        return False
    columnas: int = (len(matriz[0]))
    if columnas == 0:
        return False
    
    for i in range (1,filas):
        if not len(matriz[i]) == columnas:
            return False
    return True 

print (es_matriz ([[0,5,6,7],[1,2,3,4]]))

#5.4
def filas_ordenadas (matriz: List[List[int]]) -> bool:
    for i in range (len(matriz)):
        if not ordenados (matriz[i]):
            return False
    return True

print (filas_ordenadas ([[5,6,7],[1,2,3]]))

#5.5
#def elevar_matriz_azar (d:int, p: int) -> List[List[int]]:
 #   m = np.random.random ((d,d))**2
#
 #   print (f"se creo la siguiente matriz: \n {m}")
#
 #   resultado = np.linalg.matriz_power(m,p)
#
 #   print (f"el resulatado de la matriz elevada a {p}: \n {resultado}")

#elevar_matriz_azar(4,2)
#no entendi

