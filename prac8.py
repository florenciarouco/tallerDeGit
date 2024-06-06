from typing import List

#ARCHIVOS

#1
def contarlineas(nombre_del_archivo: str) -> int:
    file = open(nombre_del_archivo, 'r')
    lines: list[str] = file.readlines()
    file.close()
    return len(lines)

#print (contarlineas("pruebadict.txt"))

#2
def pertenecepalabra (linea: str,palabra: str)->bool:
    listapalabras: List[str] = []
    palabras: str = ""
    for i in range (len(linea)):
        if linea[i] != ' ':
            palabras += linea[i]
        else:
            listapalabras.append(palabras)
            palabras = ""
    for i in range (len(listapalabras)):
        if listapalabras[i] == palabra:
            return True 
    return False 
 
def existe_palabra (palabra: str, nombrearch: str)->bool:
    archivo = open(nombrearch)
    lineas= archivo.readlines()
    archivo.close()
    for i in range(len(lineas)):
        if pertenecepalabra(lineas[i],palabra):
            return True 
    return False 

#3
def cuantasvecespertenece (linea: str,palabra: str)->int:
    listapalabras: List[str] = []
    palabras: str = ""
    cantidad: int = 0
    for i in range (len(linea)):
        if linea[i] != ' ':
            palabras += linea[i]
        else:
            listapalabras.append(palabras)
            palabras = ""
    for i in range (len(listapalabras)):
        if listapalabras[i] == palabra:
            cantidad += 1
    return cantidad

def cantidadapariciones (nomarchivo: str,palabra: str)->int:
    archivo = open(nomarchivo)
    lineas= archivo.readlines()
    cantidad: int = 0 
    archivo.close()
    for i in range(len(lineas)):
        if pertenecepalabra(lineas[i],palabra):
            cantidad += cuantasvecespertenece(lineas[i],palabra)
    return cantidad 

 #4
def clonarsincomentarios (nomarchivo: str):
    archivo = open(nomarchivo)
    lineas = archivo.readlines()
    archivo.close()
    lineassincomentarios = lineasnocomentadas(lineas)
    nuevoarchivo =  open("archivo_clonado",'w')
    nuevoarchivo.writelines(lineassincomentarios)
    nuevoarchivo.close()

def lineasnocomentadas (lineas: List[str]):
    nueva: List[str] = []
    for i in range (len(lineas)):
        if not lineacomentada(lineas[i]):
            nueva.append(lineas[i])
    return nueva

def lineacomentada (linea: str)->bool:
    for i in range(len(linea)):
        if linea[i] == '#':
            return True
        if linea[i] != ' ':
            return False 

#5
def invertirlineas (nombrearchivo: str):
    archivo = open(nombrearchivo)
    lineas = archivo.readlines()
    archivo.close()
    lineasinvertidas = invertirlista (lineas)
    nuevoarch = open("nuevoarch",'w')
    nuevoarch.writelines(lineasinvertidas)
    nuevoarch.close()

def invertirlista (lista: List[str])->List[str]:
    invertida: List[str] = []
    for i in range (len(lista)):
        invertida.append(lista[len(lista) - i - 1])
    return invertida

#6
def agregaralfinal (nombrearch: str,frase:str):
    archivo = open(nombrearch,'a')
    archivo.write(frase)
    archivo.close()

#7
def agregaralprincipio (nombrearch:str, frase: str):
    archivo = open(nombrearch)
    lineas = archivo.readlines()
    frase += '\n'
    lineas_nuevas = [frase]
    for i in range(len(lineas)):
        lineas_nuevas.append(lineas[i])
    archivo2 = open(nombrearch,'w')
    archivo2.writelines(lineas_nuevas)
    archivo.close()
    archivo2.close()


#PILAS
