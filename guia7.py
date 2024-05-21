#guia7
#1.3
#conwhile
def sumatotal (s:list[int]) -> int:
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

def sumatotal2 (s:list[int]) -> int:
    suma: int= 0
    for indice in range (len(s)):
        suma= suma + s [indice]
    return suma

print (sumatotal2 ([1,2,3,4,5,6]))

#1.1
def pertenece (s:list[int], e:int) -> bool: 
    indice : int = 0
    longitud : int = len(s)

    while (indice < longitud):
        if s[indice] == e:
            return True
        else: 
            indice += 1
    return False

print (pertenece ([4,7,2,8,5],3))

#1.7


def hayminuscula (s:str) -> bool:
    indice : int = 0
    longitud: int = len (s)
    minuscula : str = "abcdefghijklmnopqrstuvwxyz"

    while (indice < longitud):
        if (pertenecechar (minuscula, s[indice ])): 
            return True
        else:
            indice += 1
        return False


def pertenecechar (s:str, e:chr) -> bool: 
    indice : int = 0
    longitud : int = len(s)

    while (indice < longitud):
        if s[indice] == e:
            return True
        else: 
            indice += 1
    return False

def haymayusc (s:str) -> bool:
    indice : int = 0
    longitud: int = len (s)
    mayus : str = "ABCDEFGHOJKLMNOPQRSTUVWXYZ"

    while (indice < longitud):
        if (pertenecechar (mayus, s[indice ])): 
            return True
        else:
            indice += 1
        return False

def haynumero (s:str) -> bool:
    indice : int = 0
    longitud: int = len (s)
    numero: str = "0123456789"

    while (indice < longitud):
        if (pertenecechar (numero, s[indice ])): 
            return True
        else:
            indice += 1
        return False

def contraseña (s:str) -> str:
    if (len (s) > 8 and hayminuscula (s) and haymayusc (s) and haynumero (s)):
        return "Verde"
    if (len (s) < 5): 
        return "Rojo"
    else:
        "Amarillo"

print (contraseña ("dftghchg"))