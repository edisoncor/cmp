package lexerone;
import static lexerone.Tokens.*;
%% 
%class Lexer
%type Row
%column
%line
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
if|else|int|float|while|for {lexema=yytext(); return new Row(lexema, Reservada, yyline, yycolumn);}
"+" {return new Row("+", Suma, yyline, yycolumn);}
"-" {return new Row("-", Resta, yyline, yycolumn);}
"*" {return new Row("*", Multiplicacion, yyline, yycolumn);}
"/" {return new Row("/", Division, yyline, yycolumn);}
"=" {return new Row("=", Asignacion, yyline, yycolumn);}
";" {return new Row(";", Delimitador, yyline, yycolumn);}
{L}({L}|{D})* {lexema=yytext(); return new Row(lexema, Identificador, yyline, yycolumn);}
{B}+ {lexema=yytext(); return new Row(lexema, Binario, yyline, yycolumn);}
{O}+ {lexema=yytext(); return new Row(lexema, Octal, yyline, yycolumn);}
("(-"{D}+")")|{D}+ {lexema=yytext(); return new Row(lexema, Decimal, yyline, yycolumn);}
{H}+ {lexema=yytext(); return new Row(lexema, Hexadecimal, yyline, yycolumn);}
{R}+ {lexema=yytext(); return new Row(lexema, Fraccion, yyline, yycolumn);}
 . {return new Row(lexema, ERROR, yyline, yycolumn);}
