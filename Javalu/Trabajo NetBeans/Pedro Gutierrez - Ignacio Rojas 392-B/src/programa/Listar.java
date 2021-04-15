
package programa;

import Sql.SqlConnection;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class Listar extends javax.swing.JFrame {
    private final String nomBD="motos_bd";
    private final String usuario="root";
    private final String password="";
    private String msj;
    
    SqlConnection sql = new SqlConnection(nomBD, usuario, password);
    
    public Listar() {
        initComponents();
        setTitle("Listado de alumnos");
        this.setLocationRelativeTo(null);
        sql.startConnection();
        llenarLista();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnVolver = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        Table = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(450, 310));
        setResizable(false);
        getContentPane().setLayout(null);

        btnVolver.setText("Salir");
        btnVolver.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVolverActionPerformed(evt);
            }
        });
        getContentPane().add(btnVolver);
        btnVolver.setBounds(350, 250, 73, 23);

        Table.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, "", null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "ID_Moto", "Id_Marca", "Modelo", "Valor", "Stock"
            }
        ));
        Table.setEnabled(false);
        jScrollPane2.setViewportView(Table);

        getContentPane().add(jScrollPane2);
        jScrollPane2.setBounds(10, 10, 440, 220);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnVolverActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVolverActionPerformed
        sql.closeConnection();
        Menu inicial = new Menu();  
        inicial.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnVolverActionPerformed

    public void llenarLista(){
        ResultSet Result;
        
        try{
            sql.startConnection();
            Result = sql.querySelect("SELECT * FROM `motos`, `marcas`;");
            Table.removeRowSelectionInterval(0, Table.getRowCount() - 1);
            int col = Result.getMetaData().getColumnCount();
            while (Result.next()){
                Object[] row = new Object[col];
                for (int i = 0; i < col; ++i){
                    row[i] = Result.getObject(i + 1);
                }
                ((DefaultTableModel) Table.getModel()).insertRow(Result.getRow() - 1,row);
            }
            Result.close();
        }
        catch (Exception e){
            JOptionPane.showMessageDialog(this, e, "Exception!", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Listar().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable Table;
    private javax.swing.JButton btnVolver;
    private javax.swing.JScrollPane jScrollPane2;
    // End of variables declaration//GEN-END:variables
}
