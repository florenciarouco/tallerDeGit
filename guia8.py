from queue import LifoQueue as Pila
import random
from typing import List

#get saca el ultimo q llego y te lo devuelve tmb 
#put(-1) agrega -1
#empty() pregunta si esta vacia 

#1.1
def contarlineas (nombrearchivo:str) -> int:
    archivo = open(nombrearchivo, 'r')
    archivo_lineas = archivo.readlines ()
    archivo.close()
    return len (archivo_lineas)

print (contarlineas ("flor8.txt"))

#otra forma 
#def contar_lineas (nombre_archivo: str) -> int:
#    lineas = obtener_lineas(nombre_archivo)
#    return len(lineas)



#1.2
def obtener_lineas(nombre_archivo: str) -> List[str]:
    archivo = open(nombre_archivo)
    lineas = archivo.readlines()
    archivo.close()
    return lineas

#print (obtener_lineas ("flor8.txt"))
def existe_palabra (palabra:str, nombre_archivo:str) -> bool:
    lineas = obtener_lineas (nombre_archivo)
    for i in range (len(lineas)):
        if contiene_palabra (lineas[i],palabra):
            return True
    return False

def contiene_palabra (texto:str, palabra:str) -> bool:
    caracter:int = 0
    for i in range (len(texto)):
        if texto [i] == palabra [caracter]:
            caracter += 1
            if caracter == len (palabra):
                return True
        else:
            caracter = 0
    return False 

print (existe_palabra ("hola", "flor8.txt"))

#1.3
def cantidad_apariciones (nombre_archivo:str, palabra:str) -> int:
    lineas = obtener_lineas (nombre_archivo)
    cant: int = 0
    for i in range (len(lineas)):
        if contiene_palabra (lineas[i],palabra):
            cant += 1
    return cant

print (cantidad_apariciones ("flor8.txt","hola"))


#2
def clonar_sin_comentarios (nombre_archivo: str) -> None:
    lineas = obtener_lineas(nombre_archivo)
    cantidad_lineas = len(lineas)
    lineas_sin_comentarios: List[str] = []
    for i in range(cantidad_lineas):
        linea = lineas[i]
        if not es_comentario(linea):
            lineas_sin_comentarios.append(linea)
    nuevo_archivo = open(nombre_archivo + " clonado.txt",'w') # 'w' permite crear archivo
    nuevo_archivo.writelines(lineas_sin_comentarios)
    nuevo_archivo.close()

def es_comentario (linea: str) -> bool:
    caracteres_linea = len(linea)
    for c in range(caracteres_linea):
            if linea[c] == ' ':
                continue # Ver el siguiente caracter
            if linea[c] == '#':
                return True
            else:
                return False

def escribir_lineas(nombre_archivo: str, lineas: List[str]) -> None:
    archivo = open(nombre_archivo,'w') # 'w' permite crear archivo
    archivo.writelines(lineas)
    archivo.close()
#preguntar

#clonar_sin_comentarios ("flor8.txt")

#3
def invertir_lineas (nombre_archivo: str) -> None:
    lineas = obtener_lineas(nombre_archivo)
    cantidad_lineas = len(lineas)
    lineas_invertidas: list[str] = []
    for i in range(cantidad_lineas):
        lineas_invertidas.append(lineas[cantidad_lineas-1-i])
    archivo_reverso = open("reverso.txt",'w')
    archivo_reverso.writelines(lineas_invertidas)
    archivo_reverso.close()
#preguntar
#invertir_lineas("flor8.txt")

#4
def agregar_frase_al_final (nombre_archivo:str, frase:str):
    lineas= obtener_lineas(nombre_archivo)
    lineas[-1] = lineas[-1] + '\n'
    lineas.append(frase)
    escribir_lineas (nombre_archivo, lineas)
#agregar_frase_al_final ("flor8.txt", "chauuuuuuuuu")

#5 
def agregar_frase_alprincipio (nombre_archivo:str , frase:str) -> None:
    lineas = obtener_lineas(nombre_archivo)
    cantidad_lineas = len(lineas)
    frase += '\n'
    lineas_nuevas = [frase]
    for i in range(cantidad_lineas):
        lineas_nuevas.append(lineas[i])
    escribir_lineas(nombre_archivo,lineas_nuevas)



#agregar_frase_alprincipio ("flor8.txt", "mi nombre es flor y no se nada")
    
#6
#def listar_palabras_de_archivo (nombre_archivo:str) -> List:
    #ver este

#7
#def calcular_promedio_porestudiante (nombre_archivo_notas:str, nombre_archivo_promedios:str) -> None:
#preguntar


#pilas
#8
def generar_nros_alazar (cant:int, desde:int, hasta:int) -> Pila[int]:
    pila = Pila()
    for _ in range (cant):
        pila.put (random.randint(desde,hasta))
    return pila
p = generar_nros_alazar (5,20,40)
print(p.get())

#9
def cantidad_elementos(p : Pila) -> int:
    pila:Pila = p
    cant:int = 0
    while not pila.empty():
        pila.get()
        cant += 1
    return cant 
h = Pila()

h.put(3)
h.put(2456)
h.put(50)
h.put(10)
h.put(20)
h.put (5)
print (cantidad_elementos (h))

#10
def buscar_el_maximo (p:Pila[int]) -> int:
    pila: Pila[int] = p
    maximo = pila.get()
    while not pila.empty():
        candidato = pila.get()
        if candidato> maximo:
            maximo = candidato
    return maximo
p = Pila()

p.put(3)
p.put(2456)
p.put(50)
p.put(10)
p.put(4)
p.put(20)
p.put (5)

print (buscar_el_maximo (p))

#11
def esta_bien_balanceada (formula:str) -> bool:
    parentesis_abiertos: int = 0
    for c in range(len(formula)):
        caracter: chr = formula[c] 
        if caracter == '(':
            parentesis_abiertos += 1
            continue
        if caracter == ')':
            parentesis_abiertos -=1
            if parentesis_abiertos < 0:
                return False
    return True

#print (esta_bien_balanceada("1 + (2*3 - (20/5))"))
#print(esta_bien_balanceada("10 ∗ ( 1 + ( 2 ∗ ( −1)))"))
#print(esta_bien_balanceada("1 + ) 2 x 3 ( ( )"))

#????

#12

def separar_en_palabras(linea: str) -> List[str]:
    palabras: List[str] = []
    palabra: str = ""
    for caracter in linea:
        if caracter == ' ' or caracter == '"' or caracter == '\n':
            palabras.append(palabra) # Va recorriendo la linea y cuando encuetra un espacio suma la palabra acumulada a la lista de palabras 
            palabra = '' # La reinicia para seguir con la otra palabra
        else: 
            palabra += caracter # Vuelve al if
    palabras.append(palabra) # Agrega la ultima palabra que encuentra
    return palabras

def pertenece(a:str, b: List[str]) -> bool:
    indice: int = 0
    while indice < len(b):
        if b[indice] == a:
            return True
        else: indice += 1
    return False


def es_numero_operando (caracter:str) -> bool:
    numeros:str = "0123456789"
    if caracter in numeros:
        return True
    else:
        return False
#print (es_numero_operando ("34"))

def es_operador (caracter:str) -> bool:
    operadores: List[str] = ["+","-","*","/"]
    if pertenece (caracter, operadores):
        return True
    else:
        return False
#print (es_operador ("+"))

def evaluar_expresion (s:str) -> float:
    pila = Pila()
    separador: List[str] = separar_en_palabras(s)

    for char in separador:
        if es_numero_operando (char):
            pila.put(float(char))
        elif es_operador (char):
            operando2 = pila.get()
            operando1 = pila.get()

            if char == '+':
                res = operando1 + operando2
            elif char == '-':
                res = operando1 - operando2
            elif char == '*':
                res = operando1 * operando2
            elif char == '/':
                res = operando1 / operando2

            pila.put(res)

    return pila.get()

#print (evaluar_expresion ("3 4 + 5 * 2 -"))


#ver, no entendi mucho.


        
