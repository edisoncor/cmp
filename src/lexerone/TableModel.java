/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexerone;

import javax.swing.table.DefaultTableModel;

/**
 *
 * @author edisoncor
 */
public class TableModel extends DefaultTableModel{

    public TableModel() {
        addColumn("Lexema");
        addColumn("Token");
        addColumn("Patrón");
        addColumn("Columna");
        addColumn("Fila");
    }
    
    public void addRowLexer(Row row){
        addRow(row.getObjects());
    }
    
}
