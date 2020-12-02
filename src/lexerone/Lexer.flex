package lexerone;
import static lexerone.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexema;
%}
%%
{espacio} {/*ignore*/}
if |
int |
while {lexema=yytext(); return Reservada;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"=" {return Asignacion;}
";" {return Delimitador;}
{L}({L}|{D})* {lexema=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexema=yytext(); return Numero;}
 . {return ERROR;}