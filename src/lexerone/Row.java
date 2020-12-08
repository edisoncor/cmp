/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexerone;

import java.util.Vector;

/**
 *
 * @author edisoncor
 */
public class Row {

    private String lexema;
    private Tokens tokens;
    private String patron;
    private int fila;
    private int columna;

    public Row() {
    }

    public Row(String lexema, Tokens tokens, int fila, int columna) {
        this.lexema = lexema;
        this.tokens = tokens;
        this.fila = ++fila;
        this.columna = ++columna;
        this.initPatron();
    }

    private void initPatron() {
        switch (getTokens()) {
            case Identificador:
                patron = "Una letra seguida de 0 o más letras o digitos";
                break;
            case Suma:
                patron = "Signo +";
                break;
            case Resta:
                patron = "Signo -";
                break;
            case Multiplicacion:
                patron = "Signo *";
                break;
            case Division:
                patron = "Signo /";
                break;
            case Decimal:
                patron = "Número decimal [0-9]";
                break;
            case Binario:
                patron = "Número binario [0-1]";
                break;
            case Octal:
                patron = "Número Octal [0-7]";
                break;
            case Hexadecimal:
                patron = "Número hexadecimal [0-9A-F]";
                break;
            case Fraccion:
                patron = "Fraccion N/N";
                break;
            case Asignacion:
                patron = "Signo =";
                break;
            case Delimitador:
                patron = "Delimitador ;";
                break;
            case Reservada:
                patron = "Palabra reservada";
                break;
            default:
                patron = "Error: token no reconocido";
        }
    }

    public Vector getVector(){
        Vector vector = new Vector();
        vector.add(lexema);
        vector.add(tokens);
        vector.add(patron);
        vector.add(columna);
        vector.add(fila);
        return vector;
    }
    
    
    public Object[] getObjects(){
        Object[] objects = {lexema, tokens, patron, columna, fila};
        return objects;
    }
    
    public String getLexema() {
        return lexema;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }

    public Tokens getTokens() {
        return tokens;
    }

    public void setTokens(Tokens tokens) {
        this.tokens = tokens;
    }

    public String getPatron() {
        return patron;
    }

    public void setPatron(String patron) {
        this.patron = patron;
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }

    @Override
    public String toString() {
        return "Row{" + "lexema=" + lexema + ", tokens=" + tokens + ", patron=" + patron + ", fila=" + fila + ", columna=" + columna + '}';
    }

}
