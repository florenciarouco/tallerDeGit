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
