package programa;

import Sql.SqlConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import static java.awt.event.PaintEvent.UPDATE;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Modificar extends javax.swing.JFrame {
    private final String nomBD="motos_bd";
    private final String usuario="root";
    private final String password="";
    private String msj;
 
SqlConnection sql = new SqlConnection(nomBD, usuario, password); 
   public Modificar() {
        initComponents();
        setTitle("Modificacion de dia");
        this.setLocationRelativeTo(null); //centra la ventana
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lbl_Nombre_modelo = new javax.swing.JLabel();
        txt_Nombre_modelo = new javax.swing.JTextField();
        lblTitulo = new javax.swing.JLabel();
        lbl_Id_moto = new javax.swing.JLabel();
        btnRevisar = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();
        lblEstado = new javax.swing.JLabel();
        txt_Id_moto = new javax.swing.JTextField();
        lbl_Id_marca = new javax.swing.JLabel();
        txt_Id_marca = new javax.swing.JTextField();
        lbl_Valor = new javax.swing.JLabel();
        txt_Valor = new javax.swing.JTextField();
        lbl_Valor1 = new javax.swing.JLabel();
        txt_Stock = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(null);

        lbl_Nombre_modelo.setText("Nombre_modelo");
        getContentPane().add(lbl_Nombre_modelo);
        lbl_Nombre_modelo.setBounds(30, 120, 80, 27);

        txt_Nombre_modelo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_Nombre_modeloActionPerformed(evt);
            }
        });
        getContentPane().add(txt_Nombre_modelo);
        txt_Nombre_modelo.setBounds(140, 120, 165, 27);

        lblTitulo.setFont(new java.awt.Font("Times New Roman", 2, 18)); // NOI18N
        lblTitulo.setText("Actualizar Motocicleta");
        getContentPane().add(lblTitulo);
        lblTitulo.setBounds(110, 10, 170, 22);

        lbl_Id_moto.setText("Id_moto");
        getContentPane().add(lbl_Id_moto);
        lbl_Id_moto.setBounds(30, 70, 70, 14);

        btnRevisar.setText("Modificar");
        btnRevisar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRevisarActionPerformed(evt);
            }
        });
        getContentPane().add(btnRevisar);
        btnRevisar.setBounds(70, 240, 100, 23);

        btnSalir.setText("Volver");
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });
        btnSalir.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                btnSalirKeyTyped(evt);
            }
        });
        getContentPane().add(btnSalir);
        btnSalir.setBounds(240, 240, 110, 23);

        lblEstado.setText("jLabel1");
        getContentPane().add(lblEstado);
        lblEstado.setBounds(360, 10, 34, 14);

        txt_Id_moto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_Id_motoActionPerformed(evt);
            }
        });
        getContentPane().add(txt_Id_moto);
        txt_Id_moto.setBounds(140, 60, 165, 27);

        lbl_Id_marca.setText("Id_marca");
        getContentPane().add(lbl_Id_marca);
        lbl_Id_marca.setBounds(30, 90, 53, 27);

        txt_Id_marca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_Id_marcaActionPerformed(evt);
            }
        });
        getContentPane().add(txt_Id_marca);
        txt_Id_marca.setBounds(140, 90, 165, 27);

        lbl_Valor.setText("Valor");
        getContentPane().add(lbl_Valor);
        lbl_Valor.setBounds(30, 150, 40, 27);

        txt_Valor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_ValorActionPerformed(evt);
            }
        });
        getContentPane().add(txt_Valor);
        txt_Valor.setBounds(140, 150, 165, 27);

        lbl_Valor1.setText("Stock");
        getContentPane().add(lbl_Valor1);
        lbl_Valor1.setBounds(30, 180, 40, 27);

        txt_Stock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_StockActionPerformed(evt);
            }
        });
        getContentPane().add(txt_Stock);
        txt_Stock.setBounds(140, 180, 165, 27);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnRevisarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRevisarActionPerformed
    String id_moto, id_marca, nombre_modelo, existe,valor, stock; 
    id_moto= txt_Id_moto.getText();
    
    
    String sql_query = "SELECT id_moto FROM `motos` WHERE '"+id_moto+"' = motos.id_moto"; 
    ResultSet Result = sql.querySelect(sql_query);
    
    if (Result!=null){
        existe="si";
    }else{ 
        existe="no";
        msj="Id mala";
    }
    
        lblEstado.setText(existe);
        if (existe.equals("si")){ 
            id_marca= txt_Id_marca.getText();
            nombre_modelo= txt_Nombre_modelo.getText();
            valor= txt_Valor.getText();
            stock= txt_Stock.getText();
            
            
        String sql_update=("UPDATE motos SET id_marca='"+id_marca+
                "', nombre_modelo='"+nombre_modelo+
                "', valor='"+valor+
                "', valor='"+stock+
                "' WHERE '"+id_moto+"' = motos.id_moto;");
        sql.updateTable(sql_update);
        btnSalir.doClick();        
  
        }
    }//GEN-LAST:event_btnRevisarActionPerformed
    
    private void btnSalirKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_btnSalirKeyTyped
    }//GEN-LAST:event_btnSalirKeyTyped

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
    sql.closeConnection();
    Menu inicial = new Menu();    
    inicial.setVisible(true);
    this.dispose();
    }//GEN-LAST:event_btnSalirActionPerformed

    private void txt_Nombre_modeloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_Nombre_modeloActionPerformed
    }//GEN-LAST:event_txt_Nombre_modeloActionPerformed

    private void txt_Id_motoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_Id_motoActionPerformed
    }//GEN-LAST:event_txt_Id_motoActionPerformed

    private void txt_Id_marcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_Id_marcaActionPerformed
    }//GEN-LAST:event_txt_Id_marcaActionPerformed

    private void txt_ValorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_ValorActionPerformed
    }//GEN-LAST:event_txt_ValorActionPerformed

    private void txt_StockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_StockActionPerformed
    }//GEN-LAST:event_txt_StockActionPerformed

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Modificar().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnRevisar;
    private javax.swing.JButton btnSalir;
    private javax.swing.JLabel lblEstado;
    private javax.swing.JLabel lblTitulo;
    private javax.swing.JLabel lbl_Id_marca;
    private javax.swing.JLabel lbl_Id_moto;
    private javax.swing.JLabel lbl_Nombre_modelo;
    private javax.swing.JLabel lbl_Valor;
    private javax.swing.JLabel lbl_Valor1;
    private javax.swing.JTextField txt_Id_marca;
    private javax.swing.JTextField txt_Id_moto;
    private javax.swing.JTextField txt_Nombre_modelo;
    private javax.swing.JTextField txt_Stock;
    private javax.swing.JTextField txt_Valor;
    // End of variables declaration//GEN-END:variables

}