from typing import List 
from typing import Tuple
import random

def pertenece (s:List[int], e:int) -> bool:
    indice:int = 0
    for indice in range (len(s)):
        if s[indice] == e:
            return True
    return False
#print (pertenece ([1,2,3,4,5,6,7],5))

def divide_a_todos (s:List[int], e:int) -> bool:
    indice:int = 0
    for indice in range (len(s)):
        if s[indice] % e != 0:
            return False
    return True
#print (divide_a_todos ([12,2,32,4,54,6,70,8],2))

def suma_total (s:List[int]) -> int:
    total:int = 0
    for indice in range (len(s)):
        valor: int = s[indice]
        total += valor
    return total
#print (suma_total ([1,2,3]))

def maximo (s:List[int]) -> int:
    maximo:int = s[0]
    for i in range (len(s)):
        segundo:int = s[i]
        if segundo > maximo:
            maximo = segundo
    return maximo  
#print (maximo ([1,2,3,4,2,1,5,3,2]))

def minimo (s:List[int]) -> int:
    minim:int = s[0]
    for i in s:
        segundo: int = i
        if segundo < minim:
            minim = segundo
    return minim
#print (minimo ([5,4,19,2,7,16,3,8,3]))        

def ordenados (s:List[int]) -> bool:
    for i in range (len(s)-1):
        if s[i] > s[i+1]:
            return False
    return True
#print (ordenados ([3,4,5,6,7]))

def pos_maximo (s:List[int]) -> int:
    if len(s) == 0:
        return -1

    maximo:int = s[0]
    indice = 0
    for i in range(len(s)):
        segundo:int =s[i]
        if maximo < segundo:
            maximo = segundo
            indice = i
    return indice 
#print (pos_maximo([1,2,38,2,34,6,200,3,5,8,23,9,4,6,1]))

def pos_minimo (s:List[int]) -> int:
    if len(s) == 0:
        return -1
    minimo:int = s[0]
    indice:int = 0
    for i in range (len(s)):
        segundo:int = s[i]
        if segundo < minimo:
            minimo = segundo
            indice = i 
    return indice
#print (pos_minimo ([10,2,38,2,34,1,200,3,5,8,23,9,4,6,1]))   

def mayora7 (s:List[List[chr]]) -> bool:
    for i in s:
        if len(i) > 7 :
            return True
    return False

#print (mayora7 (["termo", "jirafas", "gato"]))

def reverso (palabras:str) -> str:
    nueva:str = ""
    for i in range (len(palabras)-1,-1,-1):
        nueva += palabras[i]
    return nueva

def palindromo (texto:str) -> bool:
    if texto == reverso (texto):
        return True
    return False
#print (palindromo ("neuquen"))

def tresconsecutivos (s:List[int]) -> bool:
    for i in range (len(s)-2):
        if s[i] == s[i+1] and s[i] == s[i+2]:
            return True
    return False
#print (tresconsecutivos ([1,2,3,3,3,5,4,7,2,2]))



def quitar (texto:str, c:chr) -> str:
    nuevo:str = ""
    for i in range(len(texto)):
        iesimo:str = texto[i]
        if iesimo != c:
            nuevo += iesimo 
    return nuevo

def vocalesdistintas (texto:str) -> bool:
    vocales:str = "aeiou"
    cant:int = 0 
    for i in texto:
        iesimo: str = i
        if i in vocales:
            quitar (vocales,iesimo)
            cant += 1
            if cant >= 3:
                return True
    return False
#print (vocalesdistintas ("flora"))

def secuencia_mas_larga (s:List[int]) -> int:
    inicio_larga:int = 0
    longitud_larga:int = 1
    inicio_Candidata:int = 0
    long_candidata:int = 1
    for i in range (1,len(s)):
        if s[i] >s[i-1]:
            long_candidata += 1
        else:
            inicio_Candidata = i
            longitud_larga = 0
        if long_candidata > longitud_larga:
            inicio_larga = inicio_Candidata
            longitud_larga = long_candidata
    return inicio_larga
#print (secuencia_mas_larga ([1,2,3,4,2,7,3,8,9,10,11,12,13,14,15]))

def cantidad_digitos_impares (s:List[int]) -> int:
    cantidad:int = 0
    for i in s:
        string = str(i) # para poder tratar en cada digito, convertirlo en un string 
        for digito in string:
            if int(digito) % 2 != 0:
                cantidad += 1
    return cantidad
#print (cantidad_digitos_impares ([57,2383,812,246]))

def coloca0 (s:List[int]) -> None:
    for i in range (len(s)):
        if i % 2 == 0:
            s[i] = 0

def coloca0_2 (s:List[int]) -> List[int]:
    nueva:List[int] = []
    for i in s:
        nueva.append(i)
    for i in range(len(nueva)):
        if i % 2 == 0:
            nueva[i] = 0
    return nueva
#print (coloca0_2 ([0,1,2,3,4,5,6,7,8,9]))

def sinvocales (texto:str) -> str:
    vocales: str = "aeiou"
    textonuevo: str = ""
    for i in texto:
        if not i in vocales:
            textonuevo += i 
        else: 
            textonuevo += ''
    return textonuevo
#print (sinvocales ("florencia"))

def da_vuelta_Str (s:str) -> str:
    reverso: str = ""
    for i in range (len(s)-1,-1,-1):
        reverso += s[i]
    return reverso
#print (da_vuelta_Str ("florencia como"))

def eliminar_repetidos (s:str) -> str:
    sinrepetidos:str = ""
    for i in s:
        if not i in sinrepetidos:
            sinrepetidos += i
    return sinrepetidos
#print (eliminar_repetidos ("telefono"))

def mayora4 (s:List[int]) -> bool:
    for i in s:
        if not i >= 4:
            return False
    return True

def promedio (s:List[int]) -> float:
    total: int = 0
    for i in s:
        total += i
    return total / len(s)

def aporbado (notas:List[int]) -> int:
    res:int = 0
    if mayora4 (notas) == True and promedio (notas) >= 7:
        res = 1
    elif mayora4 (notas) == True and (promedio (notas) >= 4 and promedio (notas) < 7):
        res = 2
    elif mayora4 (notas) == False or promedio (notas) < 4:
        res = 3
    return res
#print (aporbado ([4,7,10]))

def movimientos (s:List[Tuple[str,int]]) -> int:
    saldo_Actual:int = 0
    for i in range(len(s)):
        letra:str = s[i][0]
        numero:int = s[i][1]
        if letra == "I":
            saldo_Actual += numero
        if letra == "R":
            saldo_Actual -= numero
    return saldo_Actual 
#print (movimientos ([("I",2000),("R",20),("R",1000),("I",300)]))

def pertenece_a_cada_uno_v3 (s:List[List[int]], e:int ) -> List[bool]:
    lista:List[bool] = []
    for lis in s:
        if e in lis:
            lista.append(True)
        else:
            lista.append (False)
    return lista
#print (pertenece_a_cada_uno_v3 ([[1,2,3],[4,5,8],[8,7,8],[9,2,3]], 6)) 

def es_matriz (s:List[List[int]]) -> bool:
    for i in range (len(s)):
        if len(s[i]) == 0:
            return False
        
        if len(s[0]) != len (s[i]):
            return False 
    return True
#print (es_matriz ([[1,2,3],[4,5,6],[7,8,9]]))

def filas_ordenadas (m:List[List[int]], res:List[bool]):
    res.clear()
    for i in m:
        if ordenados(i) == True:
            res.append(True)
        else:
            res.append(False)
#resultado:List[bool] = []
#filas_ordenadas ([[1,2,3],[3,4,1],[4,5,6]],resultado)
#print (resultado)

def columna (m:List[List[int]], c:int) -> List[int]:
    columna = []
    for fila in m:
        columna.append(fila[c])
    return columna
#print (columna ([[1,2,3],[4,5,6],[7,8,9]], 2))

def problema_columnas_ordenadas(m: List[List[int]]) -> List[bool]:
    res = []
    for c in range(len(m[0])): 
        col = columna(m, c)
        res.append(ordenados(col))
    return res
#print(problema_columnas_ordenadas([[1,2,3],[9,5,6],[7,8,9]]))

def transponer (m:List[List[int]]) -> List[List[int]]:
    trans:List[List[int]] = []

    for fila in range(len(m[0])):
        col = columna (m,fila)
        trans.append(col)
    return trans
#print (transponer ([[1,2,3],[4,5,6],[7,8,9]]))

#otra forma 
def columnas (matriz :List[List[int]]) -> List[List[int]]:
    columna = []
    aux = []
    for i in range (len(matriz)): 
        for fila in matriz:
            aux.append(fila [i])
        columna.append(aux)
        aux = []
    return columna


def quien_gana_tateti(m: List[List[str]]) -> int:
    res:int = 2
    for i in range (3):
        if m[i][0] == m[i][1] and m[i][0] == m[i][2] and m[i][0] == 'X':
            res = 1
        if m[i][0] == m[i][1] and m[i][0] == m[i][2] and m[i][0] == 'O':
            res = 0
    colum = transponer(m)
    for i in range (3):
        if colum[i][0] == colum [i][1] == colum [i][2] and colum[i][0] == 'X':
            res = 1
        if colum[i][0] == colum [i][1] == colum [i][2] and colum[i][0] == 'O':
            res = 0
    if m[0][0] == m[1][1] == m[2][2] and m[0][0] == 'X':
        res = 1
    if m[0][0] == m[1][1] == m[2][2] and m[0][0] == 'O':
        res = 0
    if m[0][2] == m[1][1] == m[2][0] and m[0][2] == 'X':
        res = 1
    if m[0][2] == m[1][1] == m[2][0] and m[0][2] == 'O':
        res = 0
    return res

#print (quien_gana_tateti ([['O', ' ', 'O'],
#                           ['X', 'O', ' '],
#                           ['O', 'O', 'O']]))

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

def monedero () -> List[Tuple[chr,int]]:
    lista = []
    while (True):
        print ("ingrese c para cargar, d para descontar o x para salir:")
        ingreso= input()
        if ingreso == 'C' or ingreso == 'D':
            print ("ahora decime cuanto")
            monto = int(input())
            lista.append((ingreso,monto))
        if ingreso == 'X':
            return lista
#print (monedero ())

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











"""def hay_tres_consecutivas(tablero, letra):
    n = len(tablero)
    for j in range(n):
        for i in range(n - 2):
            if tablero[i][j] == tablero[i + 1][j] == tablero[i + 2][j] == letra:
                return True
    return False


def decidir_quien_gano(hay_tres_x, hay_tres_o):
    if hay_tres_x and hay_tres_o:
        resultado = 3
    elif hay_tres_x:
        resultado = 1
    elif hay_tres_o:
        resultado = 2
    else:
        resultado = 0
    return resultado


def quien_gano_el_tateti_facilito(tablero):
    hay_tres_x = hay_tres_consecutivas(tablero, 'X')
    hay_tres_o = hay_tres_consecutivas(tablero, 'O')
    
    resultado = decidir_quien_gano(hay_tres_x, hay_tres_o)

    return resultado

print (quien_gano_el_tateti_facilito([[' ', 'O', ' ', ' ', ' '],
                                      [' ', 'X', 'X', ' ', ' '],
                                      [' ', ' ', 'X', ' ', 'O'],
                                      [' ', ' ', ' ', 'X', 'O'],
                                      [' ', ' ', ' ', ' ', 'O']]
))
"""
