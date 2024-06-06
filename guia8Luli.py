from queue import LifoQueue as Pila
from queue import Queue as Cola
import random
import typing
import csv
from typing import List


# print(contar_lineas ("cancion.txt"))

# Ejercicio 1.2
def pertenece(a:str, b: List[str]) -> bool:
    indice: int = 0
    while indice < len(b):
        if b[indice] == a:
            return True
        else: indice += 1
    return False

# EJERCICIOS DICCIONARIOS
# Ejercicio 19
def separar_en_palabras_sin_enter(linea: str) -> list:
    palabras = []
    palabra = ""
    for caracter in linea:
        if caracter == ' ' or caracter == '"' or caracter == '\n' or caracter == '\r' or caracter == '\t':
            if palabra:  # Añade solo si palabra no está vacía (es lo mismo que decir if len(palabra) > 0)
                palabras.append(palabra)
                palabra = ''
        else: 
            palabra += caracter
    if palabra:  # Añadir la última palabra si no está vacía
        palabras.append(palabra)
    return palabras

def agrupar_por_longitud(nombre_archivo:str) -> dict:
    archivo: typing.IO = open(nombre_archivo, "r")
    linea:str 
    diccionario: dict = dict()

    for linea in archivo:
        palabras = separar_en_palabras_sin_enter(linea)
        for palabra in palabras:
            if pertenece(len(palabra), list(diccionario.keys())):
                diccionario[len(palabra)] += 1
            else:
                diccionario[len(palabra)] = 1
    archivo.close()
    return diccionario

print(agrupar_por_longitud("prueba.txt"))
