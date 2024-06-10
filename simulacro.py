from queue import LifoQueue as Pila
import random
from typing import List
from typing import Tuple
from queue import Queue as Cola
import typing

# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
# se debería devolver res=7

#1
def ultima_aparicion (lista:List[int], elemento:int) -> int:
    for i in range (len(lista)-1,-1,-1):
        if lista[i] == elemento:
            return i
        else:
            i -= 1
        
#print (ultima_aparicion ([-1,4,0,4,100,0,100,0,-1,-1], 0))        

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
# se debería devolver res = [3,4,5] ó res = [3,5,4] ó res = [4,3,5] ó res = [4,5,3] 
# ó res = [5,3,4] ó res = [5,4,3]

def elementos_exclusivos (s:List[int], t:List[int]) -> List[int]:
    syt:List[int] = s + t
    lista:List[int] = []
    for i in syt:
        if not (i in s and i in t):
            if not i in lista:
                lista.append(i)
    return lista
#print (elementos_exclusivos ([-1,4,0,4,3,0,100,0,-1,-1],[0,100,5,0,100,-1,5]))

# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2

#              clave  valor    
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}

def contar_traducciones_iguales (ingles:dict, aleman:dict) -> int:
    total:int = 0
    for palabra in ingles.keys():
        if palabra in aleman.keys() and ingles [palabra] == aleman [palabra]:
            total += 1
    return total

ingles = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}

#print (contar_traducciones_iguales (ingles,aleman))

# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]
#  se debería devolver res={-1:3, 0:1, 4:1, 100:2}
#  
# RECORDAR QUE NO IMPORTA EL ORDEN DE LAS CLAVES EN UN DICCIONARIO


def convertir_a_diccionario (lista:List[int]) -> dict:
    diccionario = dict()
    for i in lista:
        if not i in diccionario.keys():
            diccionario[i] = 1
        else:
            diccionario[i] += 1
    return diccionario
#print (convertir_a_diccionario ([-1,0,4,100,100,-1,-1]))






