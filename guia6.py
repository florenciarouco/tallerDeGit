#guia6
import math
#1.1
def imprimir_hola_mundo():
    print ('hola mundo')

imprimir_hola_mundo ()

#1.2
def imprimir_un_verso():
    print ("siento el viento de las 6 que no para de soplar\nahora estoy chill, nada es personal\na mis amigas quiero llamar\nse siente bien poder perdonar")

imprimir_un_verso ()


#1.3
def raizDe2() -> float:
    print (round(math.sqrt(2),4))

raizDe2()

#1,4
def factorialdedos() -> int:
   return (math.factorial(2))

print (factorialdedos())

#1.5
def perimetro () -> float: #el float no hace que no compile es solo para saber con que tipo estamos trabajando
    #return 2 *3.141592
    return 2 * math.pi #esta froma es mejor
a = perimetro () #a variable
print (a) 

#2.1
def imprimirsaludo(nombre:str):
    print ("Hola", nombre)

nombre = "Floppy"
imprimirsaludo(nombre)

#2.2
def raizcuadradade(numero:float) -> float:
    return math.sqrt(numero) 
numero = 81

print (raizcuadradade(numero))

#2.3
def fahrenheit_a_celsius(temp_far:float) -> float:
    return ((temp_far-32)*5)/9
temp_far = 100

print (fahrenheit_a_celsius(temp_far))

#2.4
def imprimirdosveces(estibillo:str):
    return (estibillo*2)
estribillo = "gracias a todos ustedes por venir\ny a la familia que no elegi\ngracias al cielo\npor la tormenta que aunque te atormenta es un mechon de pelo\n"

print (imprimirdosveces(estribillo))

#2.5
def esmultiplode (n:int, m:int) -> bool:
    return  (n % m) == 0   # % hace modulo
print (esmultiplode(10,5))
print (esmultiplode(7,3))

#2.6
def espar (numero:int) -> bool:
    return (esmultiplode (numero,2))
print (espar (6))
print (espar (7))

#2.7
def cantidaddepizzas (comensales:int, mincantdeporc:int) -> int:
    return math.ceil ((comensales*mincantdeporc)/8)
comensales = 20
mincantdeporc = 3

print (cantidaddepizzas (comensales,mincantdeporc))

#3.1
def algunoes0 (n1:float, n2:float) -> bool:
    return (n1 == 0) or (n2 == 0)
print (algunoes0 (6,7)) 
print (algunoes0 (0,45))
print (algunoes0 (5,0))

#3.2
def amboson0 (n1:float, n2:float) -> bool:
    return (n1 == 0) and (n2 == 0)
print (amboson0 (6,7)) 
print (amboson0 (0,45))
print (amboson0 (5,0))
print (amboson0 (0,0))

#3.3
def esnombrelargo (nombre:str) -> bool : #str=string
    return (3 <= len(nombre)) and len(nombre) <= 8
print (esnombrelargo ("florenc"))
print (esnombrelargo ("lu"))

#3.4
def esbisiesto (año:int) -> bool:
    return (año%4==0) and ((año%100!=0) or (año%400==0))
print (esbisiesto (2024))

#4
def peso_pino(altura:int)->int:
      return min (altura,300) *3 + max (altura-300, 0) *2

def es_peso_util (peso: int) -> bool: 
    return peso <= 1000 and peso >= 400

def sirve_pino (altura:int) -> bool:
    return es_peso_util (peso_pino (altura))

print (sirve_pino (2)) #creo que me da mal, ver

#5.1
def devolvereldoblesiespar (un_numero:int) -> int:
    if (un_numero % 2) == 0:
        return un_numero *2
    else:
        return un_numero

print (devolvereldoblesiespar (42))

#5.2
def devolver_valor_si_es_par_sino_el_que_sigue(numero:int) -> int:
    if (numero % 2) == 0:
        return (numero)
    else:
        return (numero+1)
print (devolver_valor_si_es_par_sino_el_que_sigue (43))

#5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero:int) -> int:
    if (esmultiplode (numero,3)):
        return (numero*2)
    else:
        if (esmultiplode (numero,9)):
            return (numero*3)
        else:
            return numero 
print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (27))

#5.4
def lindonombre (nombre:str):
    if (len (nombre) >= 5):
        print ("Tu nombre tiene muchas letras!")
    else:
        print ("Tu nombre tiene menos de 5 caracteres")

lindonombre ("Florencia")

#5.5
def elrango (numero:int):
    if (numero <5):
        print ("Menor a 5") 
    else:
        if (numero > 20):
            print ("Mayor a 20")
        else:
            if (numero >= 10):
                print ("Entre 10 y 20")

elrango (15)

#5.6
def  queletoca (sexo:chr, edad:int):
    if (edad < 18 or edad >= 65 or (edad >= 60 and sexo == 'F')):
        print ("Andá de vacaciones")
    else:
        print ("Te toca trabajar")
queletoca ('F', 13)

#6.1
def numerosdel1al10 ():
    x: int = 1
    while (x <= 10):
        print (x)
        x = x + 1
numerosdel1al10 ()

#6.2
def numerodel10al40 ():
    x:int = 10
    while x <= 40:
        print (x)
        x +=2 #x=x+2
numerodel10al40 ()

#while ver bien
#for i in range (10,41,2) el 10 es desde, el 41 es hasta y el 2 es cuanto incremento
def num ():
    for i in range (10,41,2):
        print (i)

#6.3
def eco ():
    x: int = 1
    while (x <= 10):
        print ("eco")
        x = x + 1
eco()

#6.4
def despegue (i:int):
   for i in range (i,0,-1):
       print (i)
   print ("despegue")

despegue (3)
#con while
#def despegue (i:int):
#    while i >= 1:
#        print(i)
#        i -=1 
#    print ("despegue")

#6.5
def monitorear_viaje_en_tiempo(año_partida:int, año_llegada:int):
    for año in range(año_partida, año_llegada, -1):
        print("Viajó un año al pasado, estamos en el año:", año)

monitorear_viaje_en_tiempo(2050,2045)

#6.6
def aristoteles (añoDeSalida:int):
    while(añoDeSalida>=384):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))
        añoDeSalida-=20
    if(añoDeSalida>=374):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))
aristoteles (389)
#verno entendi mucho

#7
#besito

#8


