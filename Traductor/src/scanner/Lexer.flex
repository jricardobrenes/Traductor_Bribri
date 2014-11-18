package scanner;
import static scanner.Token.*;
%%

%class Lexer
%type Token
%public
%line
%column
%{
    public int line;
    public int column;
    public String text;
%}
L = [a-zA-Z_]

S=[ -.:-@Z-`z-■]
S1=[ -',-/:-@Z-`z-■]
S2=[ -/:-@Z-`|~-■]

D = [0-9]

E = [ \t\n\r]

LITERAL = {STRING} | {CHAR} |  {FLOAT} | {SCIENTIFIC}

STRING = "'" ({L}|{D}|{E}|{S})+ "'" 

CHAR = "#" ([0-1]{0,1} {D}{1,2}| [2]{1} [0-4]{1} {D}{1}| [2]{1} [5]{1} [5]{1})

FLOAT = {D}+ "." {D}+

SCIENTIFIC = {D}+ "." {D} "E" "-"? {D}+

VERBS = "estar" | "está" | "ser" | "llamar" | "vivir" | "ayudar" | "hacer" | "estudiar" |
        "tener" | "tomar" | "ir" | "ir a" | "trabajar" | "leer" | "correr" | 
        "descansar" | "bailar" | "comer" | "querer" | "ayudar" |
        "Estar" | "Está" | "Ser" | "Llamar" | "Vivir" | "Ayudar" | "Hacer" | "Estudiar" |
        "Tener" | "Tomar" | "Ir" | "Ir a" | "Trabajar" | "Leer" | "Correr" | 
        "Descansar" | "Bailar" | "Comer" | "Querer" | "Ayudar" 

PRONOUNS = "yo" | "tú" | "usted" | "él" | "ella" | "ellos" | "ellas" | "nosotros" |
           "ustedes" | "Yo" | "Tú" | "Usted" | "Él" | "Ella" | "Ellos" | "Ellas" | "Nosotros" |
           "Ustedes"

NOUNS = "casa" | "papá" | "mamá" | "padre" | "madre" | "lugar" | "pariente" | 
        "médico" | "danta" | "familia" | "río" | "limón" | "rama" | "árbol" | 
        "banano" | "bolsito" | "piedra" | "nube" | "planta" | "diente" | 
        "carne" | "pie" | "piel" | "esposa" | "anciana" | "gallina" | "pájaro" |
        "tigre" | "cazador" | "libro" | "café" | "cacao" | "chocolate" | "abuelo" | 
        "tío" | "madre" | "hermano" | "hermana" | "primo" | "prima" | "años" |

        "Casa" | "Papá" | "Mamá" | "Padre" | "Madre" | "Lugar" | "Pariente" | 
        "Médico" | "Danta" | "Familia" | "Río" | "Limón" | "Rama" | "Árbol" | 
        "Banano" | "Bolsito" | "Piedra" | "Nube" | "Planta" | "Diente" | 
        "Carne" | "Pie" | "Piel" | "Esposa" | "Anciana" | "Gallina" | "Pájaro" |
        "Tigre" | "Cazador" | "Libro" | "Café" | "Cacao" | "Chocolate" | "Abuelo" | 
        "Tío" | "Madre" | "Hermano" | "Hermana" | "Primo" | "Prima" | "Años"

ADJECTIVES =    "mi" | "mis" | "tu" | "tus" | "su" | "sus" | "nuestro" | "nuestros" | 
                "nuestra" | "nuestras" | "mío" | "mía" | "míos" | "mías" | "tuyo" | "tuyos" | 
                "tuya" | "tuyas" | "suyo" |  "suyos" | "suya" | "suyas" | "aquel" | "aquella" | 
                "aquellos" | "aquellas" | "esto" | "esta" | "estos" | "estas" | "bueno" | 
                "malo" | "uno" | "dos" | "tres" | "cuatro" | "cinco" | "seis" | "siete" | 
                "ocho" | "nueve" | "diez" |

                "Mi" | "Mis" | "Tu" | "Tus" | "Su" | "Sus" | "Nuestro" | "Nuestros" | 
                "Nuestra" | "Nuestras" | "Mío" | "Mía" | "Míos" | "Mías" | "Tuyo" | "Tuyos" | 
                "Tuya" | "Tuyas" | "Suyo" |  "Suyos" | "Suya" | "Suyas" | "Aquel" | "Aquella" | 
                "Aquellos" | "Aquellas" | "Esto" | "Esta" | "Estos" | "Estas" | "Bueno" | 
                "Malo" | "Uno" | "Dos" | "Tres" | "Cuatro" | "Cinco" | "Seis" | "Siete" | 
                "Ocho" | "Nueve" | "Diez"

ADVERBS =   "como" | "muy" | "bien" | "qué" | "dónde" | "mal" | "luego" | "hasta" | 
            "cuánto" | "cuántos" | "Como" | "Muy" | "Bien" | "Qué" | "Dónde" | 
            "Mal" | "Luego" | "Hasta" | "Cuánto" | "Cuántos"

PREPOSITIONS = "en" | "para" | "sobre" | "dentro" | "desde" | "hacia" | "con" | "contra" |
                "En" | "Para" | "Sobre" | "Dentro" | "Desde" | "Hacia" | "Con" | "Contra"

ARTICLES =  "un" | "una" | "unos" | "unas" | "el" | "la" | "los" | "las"
            "Un" | "Una" | "Unos" | "Unas" | "El" | "La" | "Los" | "Las"

SYMBOLS =   "." | "," | ";" | "¡" | "!" | "¿" | "?"

NEGACION = "no" | "No"

%%

{E} {/*Ignore*/}



{LITERAL} { line = yyline; column = yycolumn; text = yytext(); return LITERAL; }

{E}* {VERBS} {E}* { line = yyline; column = yycolumn; text = yytext(); return VERBO; }

{E}* {PRONOUNS} {E}* { line = yyline; column = yycolumn; text = yytext(); return PRONOMBRE; }

{E}* {NOUNS} {E}* { line = yyline; column = yycolumn; text = yytext(); return SUSTANTIVO; }

{E}* {ADJECTIVES} {E}* { line = yyline; column = yycolumn; text = yytext(); return ADJETIVO; }

{E}* {ADVERBS} {E}* { line = yyline; column = yycolumn; text = yytext(); return ADVERBIO; }

{E}* {PREPOSITIONS} {E}* { line = yyline; column = yycolumn; text = yytext(); return PREPOSICION; }

{E}* {ARTICLES} {E}* { line = yyline; column = yycolumn; text = yytext(); return ARTICULO; }



{E}* [¿] {E}* { line = yyline; column = yycolumn; text = yytext(); return SIGNO_PREGUNTA_ABRE; }
{E}* [?] {E}* { line = yyline; column = yycolumn; text = yytext(); return SIGNO_PREGUNTA_CIERRA; }

{E}* [.] {E}* { line = yyline; column = yycolumn; text = yytext(); return PUNTO; }

{E}* [,] {E}* { line = yyline; column = yycolumn; text = yytext(); return COMA; }

{E}* [A-Z][a-z]* {E}* { line = yyline; column = yycolumn; text = yytext(); return NOMBRE_PROPIO; }

{E}* {L}+ {E}* { line = yyline; column = yycolumn; text = yytext(); return ERROR;}

. {line = yyline; column = yycolumn; text = yytext(); return ERROR;}


     