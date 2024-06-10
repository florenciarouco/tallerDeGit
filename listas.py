from typing import List

def eliminar_repetidos (s:str) -> str:
    textonsinrepetidos: str = ""
    aparecidos :int = 0

    for i in range (len(s)):
        caracter:chr = s[i]
        if not caracter in textonsinrepetidos:
            aparecidos += 1
            textonsinrepetidos += caracter
    return textonsinrepetidos

#print (eliminar_repetidos ("holaa como estas"))

def eliminar (lista:List[int]) -> List[int]:
    listasinrepetidos: List[int] = []
    for i in lista:
        if not i in listasinrepetidos:
            listasinrepetidos.append(i)
    return listasinrepetidos

#print (eliminar ([2,3,4,1,2,6,3]))


