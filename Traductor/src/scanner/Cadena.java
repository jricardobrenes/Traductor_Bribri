
package scanner;

import java.util.ArrayList;


public class Cadena {
    public String cadena;
    public String tipo;
    public ArrayList<Integer> lineas;
    public ArrayList<Integer> cantidadlineas;

    public Cadena(String cadena,String tipo,int lineas) { 
        this.cadena=this.modificaString(cadena,tipo);
        ArrayList<Integer> linea = new ArrayList<Integer>(); // se guarda la linea en que se encuentra el token
        ArrayList<Integer> cantidad = new ArrayList<Integer>(); // se guarda la cantidad del token en la línea, tiene la misma posición que en la línea
        this.tipo = tipo;
        this.lineas = linea;
        this.cantidadlineas=cantidad;
        agregarAparicion(lineas);
    }
    public void agregarAparicion(int linea){
        int posicion=0;
        if(this.lineas.contains(linea)){
            posicion=this.lineas.indexOf(linea);
            this.cantidadlineas.set(posicion,cantidadlineas.get(posicion)+1);
        }
        else{
            this.lineas.add(linea);
            this.cantidadlineas.add(1); //valor inicial
        }
    }
    
    public String modificaString(String cadena,String Tipo){ 
        cadena=cadena.toUpperCase(); 
        cadena= cadena.trim();
        cadena=cadena.replaceAll("\t", ""); 
        cadena=cadena.replaceAll("\n", ""); 
        cadena=cadena.replaceAll("\r", ""); 
        return cadena;
    }

    @Override
    public String toString() {
        String resultado;
        resultado= "Token =" + cadena + ", Tipo de Token =" + tipo +", Línea =" ;
        for(int i=0;i<lineas.size();i++){
            resultado+=" "+lineas.get(i);
            if(cantidadlineas.get(i)>1){
                resultado+=" ("+cantidadlineas.get(i)+"),";
            }
            else{
                resultado+=",";  // caso de que termina el número sin repetición en la línea
            }          
        }
        resultado+="\n";
        return resultado;
    }
}
