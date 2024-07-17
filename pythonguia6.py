import math 


def raizDe2() -> float:
    print (round(math.sqrt(2),4))
#round es para redondear, round(numero, digitos), numero que quieres redondear, y digitos al cantidad de decimales que quieres 
#raizDe2()

def facotrial_dos () -> int:
    return (math.factorial (5))

#print (facotrial_dos ())

def perimetro () -> float:
    return (math.pi *2)
#print (perimetro())

def imprimir_saludo (nombre:str) -> None:
    print ("hola", nombre)

#imprimir_saludo ("floppy")

def raiz_cuadrada_de_dos (numero:int) -> float:
    return (math.sqrt (numero) )

#print (raiz_cuadrada_de_dos (4))

def fahrenheit_a_c (t:float) -> float:
    return ((t -32) *5)/9
#print (fahrenheit_a_c (49))

def imprimir_dos_veces (estribillo:str) -> None:
    return estribillo *2

#print (imprimir_dos_veces ("y no le pongas precio ni valor a mi honor\nque sin idelizaciones no hay dolor\ny eso es bueno para mi\nque no ando en busca del amor\nando en busca de una turra y si es de zona sur mejor\n"))

def esmultiplo_de (n:int, m:int) -> bool:
    if n % m == 0:
        return True 
    return False
#print (esmultiplo_de (79,5))

def es_par (numero:int) -> bool:
    if esmultiplo_de (numero,2) == True:
        return True
    return False
#print (es_par (68))

def cantidad_de_pizzas (comensales: int, min_cant:int) -> int:
    return math.ceil((comensales*min_cant) /8)
#print (cantidad_de_pizzas (16,2))

def alguno_es_0 (n:int, n2:int) -> bool:
    return n == 0 or n2 == 0
#print (alguno_es_0 (0,3))

def ambos_son_0 (n:int, n2:int) -> bool:
    return n== 0 and n2== 0
#print (ambos_son_0 (3,0))

def es_nombre_largo (nombre:str) -> bool:
    return 3 <= len(nombre) and len(nombre) <= 8
#print (es_nombre_largo ("flor"))

def es_bisiesto (año:int) -> bool:
    return (año % 400 == 0) or (año % 4 == 0 and año %100 != 0)   
#print (es_bisiesto (2008))

def peso_pino (altura:int) -> int:
    return min (altura,300) *3 + max (altura-300, 0) *2
#print (peso_pino (200))

def es_peso_util (peso:int) -> bool:
    return peso >= 400 and peso <= 1000
#print (es_peso_util (400))

def sirve_pino (altura:int) -> bool:
    return peso_pino (altura) >= 400 and peso_pino (altura) <= 1000
#print (sirve_pino (200)) 

def devolver_el_doble_si_Espar (numero:int) -> int:
    if es_par (numero) == True:
        return numero*2
    else:
        return numero
#print (devolver_el_doble_si_Espar (5))

def devolver_valor_si_es_par_sino_el_que_sigue (numero:int) -> int:
    if es_par (numero) == True:
        return numero
    else:
        return numero+1
    
#print (devolver_valor_si_es_par_sino_el_que_sigue (500))

def devoler_el_doble_si_esmulde3_eltriple_siesmultde9 (numero:int) -> int:
    if numero % 3== 0:
        return numero *2
    elif numero %9 == 0 :
        return numero *3
    else:
        return numero
#print (devoler_el_doble_si_esmulde3_eltriple_siesmultde9 (15))

def lindo_nombre (nombre:str) -> None:
    if len (nombre) >= 5:
        print ("tu nombre tiene muchas letras")
    else: 
        print ("tu nombre tiene menos de 5")

#lindo_nombre ("florencia")

def elrango (numero:int) -> None:
    if numero < 5:
        print ("numero menor a 5")
    elif numero <= 20 and numero >= 10:
        print("entre 10 y 20")
    elif numero > 20:
        print ("mayor a 20")
#elrango (45)

def que_Te_toca (sexo:str, edad:int) -> None:
    if sexo == "M" and (edad >= 65 or edad < 18):
        print ("anda de vacaciones")
    elif sexo == "F" and (edad >= 60 or edad < 18):
        print ("anda de vacaciones")
    else:
        print ("te toca trabajar")
#que_Te_toca ("M",2)

def del1_al_10 () -> None:
    numeros:int = 1
    while numeros <= 10:
        print (numeros)
        numeros += 1 
#del1_al_10 ()

def pares_del_10_al_40 () -> None:
    numeros:int = 10
    while numeros <= 40:
        print (numeros)
        numeros += 2
#pares_del_10_al_40 ()

def paresdel10al40 () -> None:
    for i in range (10,41,2):
        print (i)
#paresdel10al40 ()

def eco ():
    x: int = 1
    while (x <= 10):
        print ("eco")
        x = x + 1
#eco()

def cohete (numero:int) -> None:
    for i in range (numero,1,-1):
        print (i)
    print ("despegue")
#cohete (10)

def cohe (numero:int) -> None:
    while numero >= 1:
        print (numero)
        numero -= 1
    print ("despegue")
#cohe( 3)

def viaje_en_el_tiempo (partida:int, llegada:int) -> None:
    for i in range (partida,llegada,-1):
        print ("viajamos un año al pasado, estamos en el año:", i)
#viaje_en_el_tiempo (10,8)      

def aristoteles (añoDeSalida:int):
    while(añoDeSalida>=384):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))
        añoDeSalida-=20
    if(añoDeSalida>=374):
        print("Viajó 20 años al pasado, estamos en el "+str(añoDeSalida))
#aristoteles (500)

