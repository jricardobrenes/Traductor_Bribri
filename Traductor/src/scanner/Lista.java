
package scanner;

import java.util.ArrayList;


public class Lista {
    public ArrayList<Cadena> tokenes;

    public Lista() {
        this.tokenes = new ArrayList<Cadena>();
    }

    @Override
    public String toString() {
        return  tokenes.toString() ;
    }

    public void encolar(String palabra,String tipo,int linea){
        palabra=modificaString(palabra,tipo);
        for(int i = 0; i < tokenes.size(); i ++){
            if(tokenes.get(i).cadena.equals(palabra) && tokenes.get(i).tipo.equals(tipo)){
                tokenes.get(i).agregarAparicion(linea);
                return;
            }
        }
        Cadena cadena = new Cadena(palabra,tipo,linea);
        tokenes.add(cadena);
    }
    
     public String modificaString(String cadena,String Tipo){ 
        //if(Tipo.equals("IDENTIFICADOR")){
            cadena=cadena.toUpperCase(); 
            cadena= cadena.trim();
            cadena=cadena.replaceAll("\t", ""); 
            cadena=cadena.replaceAll("\n", ""); 
            cadena=cadena.replaceAll("\r", ""); 
       // }
        return cadena;
    }
    
}
