package aed;

import java.util.*;

public class ListaEnlazada<T> implements Secuencia<T> {
    private Nodo primero;
    private int longitud; 

    
    private class Nodo {
        Nodo anterior;
        T valor;
        Nodo siguiente;
        Nodo (T v) {valor = v;}
        
    }

    public ListaEnlazada() {
        primero = null;
        longitud = 0;
        }

    public int longitud() {
        return longitud;
    }

    public void agregarAdelante(T elem) {
        Nodo nuevo = new Nodo(elem);
        nuevo.siguiente = primero;
        if (primero != null) {
            primero.anterior = nuevo;
        }
        primero = nuevo;
        longitud += 1;
    }

    public void agregarAtras(T elem) {
        Nodo nuevo = new Nodo(elem);
        if (primero == null) {
            primero = nuevo;
        }else{
            Nodo actual = primero;
            while (actual.siguiente != null) {
                actual = actual.siguiente;
            }
            actual.siguiente = nuevo;
            nuevo.anterior = actual;
        }
        longitud += 1;
    }

    public T obtener(int i) { ////////////////////////////////////////////////////////////////////////////////////////
        T Encontre = null;
        Nodo act = primero;
        for (int j = 0; j<i; j++) {
            act = act.siguiente;
        }
        Encontre = act.valor;
        return Encontre;
    }

    public void eliminar(int i) { ///////////////////////////////////////////////////////////////////////////7
        Nodo act = primero;
        Nodo siguiente = act.siguiente;
        Nodo anterior = act.anterior;
        if (i == 0 && longitud == 1){
            primero = null;
        }else if (i == 0 && longitud > 1){
            siguiente.anterior = null;
            primero = siguiente;
        }else if (i == longitud-1){
            for (int j = 0; j<longitud; j++){
                anterior = act.anterior;
                act = act.siguiente;
            }
        }else{
            for (int j = 0; j<i; j++){
                act = act.siguiente;
            }
            anterior = act.anterior;
            siguiente = act.siguiente;
            anterior.siguiente = siguiente;
            siguiente.anterior = anterior;
        }
        longitud -= 1;
    }

    public void modificarPosicion(int indice, T elem) { ///////////////////////////////////////////////////////////////
        Nodo act = primero;
        for (int j = 0; j < indice; j++) {
            act = act.siguiente;
            }
        act.valor = elem;
    }

    public ListaEnlazada(ListaEnlazada<T> lista) {
        Nodo actual = lista.primero;
        while (actual != null) {
            agregarAtras(actual.valor);
            actual = actual.siguiente;
        }

    }
    
    @Override
    public String toString() {
        String str = "[";
        Nodo act = primero;
        for (int j = 0; j < longitud -1; j++) {
            str  = str + act.valor + ", ";
            act = act.siguiente;
        }
        str = str + act.valor + "]";
        return str;
    }

    private class ListaIterador implements Iterador<T> {
    	int indicador;
        ListaIterador(){
            indicador = 0;
        }

        public boolean haySiguiente() {
	        return indicador != longitud();
        }
        
        public boolean hayAnterior() {
	        return (indicador != 0) && (indicador <= longitud());
        }

        public T siguiente() {
	        int i = indicador;
            indicador = indicador +1;
            return obtener(i);
        }
        
        public T anterior() {
	        indicador = indicador - 1;
            return obtener(indicador);
        }
    }

    public Iterador<T> iterador() {
        return new ListaIterador();
    }
}
