from queue import LifoQueue as Pila
import random

#1.1
def contarlineas (nombrearchivo:str) -> int:
    archivo = open(nombrearchivo, 'r')
    archivo_lineas = archivo.readlines ()
    archivo.close()
    return len (archivo_lineas)

print (contarlineas ("flor8.txt"))

#get saca el ultimo q llego y te lo devuelve tmb 
#put(-1) agrega -1
#empty() pregunta si esta vacia 

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
esta_bien_balanceada (s:str) -> bool:

