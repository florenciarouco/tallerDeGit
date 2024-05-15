#guia6
#1.1
def imprimir_hola_mundo():
    print ('hola mundo')

imprimir_hola_mundo ()
imprimir_hola_mundo ()

#1.5
import math
def perimetro () -> float: #el float no hace que no compile es solo para saber con que tipo estamos trabajando
    #return 2 *3.141592
    return 2 * math.pi #esta froma es mejor
a = perimetro () #a variable
print (a) 

#2.5
def esmultiplode (n:int, m:int) -> bool:
    return  (n % m) == 0   # % hace modulo

#3.3
def esnombrelargo (nombre:str) -> bool : #str=string
    return (3 <= len(nombre)) and len(nombre) <= 8

#5.1
def devolvereldoblesiespar (un_numero:int) -> int:
    if (un_numero % 2) == 0:
        return un_numero *2
    else:
        return un_numero

#6.2
def numerodel10al40 ():
    i:int = 10
    while i <= 40:
        print (i)
        i +=2 #i=i+2

#while ver bien
#for i in range (10,41,2) el 10 es desde, el 41 es hasta y el 2 es cuanto incremento
 
def num ():
    for i in range (10,41,2):
        print (i)

#6.4
def despegue (i:int):
   for i in range (i,0,-1):
       print (i)
   print ("despegue")

#con while
#def despegue (i:int):
#    while i >= 1:
#        print(i)
#        i -=1 
#    print ("despegue")
    