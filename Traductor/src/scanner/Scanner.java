package scanner;

import java.io.File;


public class Scanner {


    public static void main(String[] args) {
        String path = "C:/Users/Danny Menendez/Desktop/Compi/Scanner3/src/scanner/Lexer.flex";
                //"C:/Users/Luis Calderon Monge/Documents/NetBeansProjects/Scanner/src/scanner/Lexer.flex";
                //"C:/Users/Sebastián/Downloads/Scanner/src/scanner/Lexer.flex";
        File file = new File(path);
        jflex.Main.generate(file);

    }
}
