package lexerone;
import static lexerone.Tokens.*;
%% 
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
B=[0-1]+
O=[0-7]+
H=[0-9A-F]+
R = [0-9]+"/"[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexema;
%}
%%
{espacio} {/*ignore*/}
if|else|int|float|while|for {lexema=yytext(); return Reservada;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"=" {return Asignacion;}
";" {return Delimitador;}
{L}({L}|{D})* {lexema=yytext(); return Identificador;}
{B}+ {lexema=yytext(); return Binario;}
{O}+ {lexema=yytext(); return Octal;}
("(-"{D}+")")|{D}+ {lexema=yytext(); return Decimal;}
{H}+ {lexema=yytext(); return Hexadecimal;}
{R}+ {lexema=yytext(); return Fraccion;}
 . {return ERROR;}
