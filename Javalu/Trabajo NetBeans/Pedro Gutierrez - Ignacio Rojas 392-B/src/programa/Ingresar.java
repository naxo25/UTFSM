package programa;

import Sql.SqlConnection;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import static javax.swing.text.html.HTML.Tag.SELECT;
import static jdk.nashorn.internal.parser.TokenType.CATCH;
import static jdk.nashorn.internal.parser.TokenType.IF;
import static jdk.nashorn.internal.parser.TokenType.TRY;

public final class Ingresar extends javax.swing.JFrame {
    private final String nomBD="motos_bd";
    private final String usuario="root";
    private final String password="";
    private String msj;
    
    SqlConnection sql = new SqlConnection(nomBD, usuario, password);

    public Ingresar() {
        initComponents();
        setTitle("Ingresando motos");
        this.setLocationRelativeTo(null);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txtMarca = new javax.swing.JTextField();
        txtID = new javax.swing.JTextField();
        label2 = new javax.swing.JLabel();
        label1 = new javax.swing.JLabel();
        btnGuardar = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();
        lblEstado = new javax.swing.JLabel();
        lblTitulo = new javax.swing.JLabel();
        txtStock = new javax.swing.JTextField();
        label3 = new javax.swing.JLabel();
        cmbAyuda = new javax.swing.JComboBox<>();
        txtModelo = new javax.swing.JTextField();
        txtValor = new javax.swing.JTextField();
        label4 = new javax.swing.JLabel();
        label5 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(204, 204, 255));
        setMinimumSize(new java.awt.Dimension(370, 400));
        setPreferredSize(new java.awt.Dimension(370, 400));
        getContentPane().setLayout(null);

        txtMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMarcaActionPerformed(evt);
            }
        });
        txtMarca.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtMarcaKeyTyped(evt);
            }
        });
        getContentPane().add(txtMarca);
        txtMarca.setBounds(110, 110, 220, 20);

        txtID.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtIDActionPerformed(evt);
            }
        });
        txtID.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtIDKeyTyped(evt);
            }
        });
        getContentPane().add(txtID);
        txtID.setBounds(110, 70, 220, 20);

        label2.setText("Modelo");
        getContentPane().add(label2);
        label2.setBounds(30, 150, 50, 20);

        label1.setText("Valor");
        getContentPane().add(label1);
        label1.setBounds(30, 190, 30, 20);

        btnGuardar.setText("Registrar");
        btnGuardar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                btnGuardarMouseClicked(evt);
            }
        });
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        getContentPane().add(btnGuardar);
        btnGuardar.setBounds(60, 270, 100, 23);

        btnSalir.setText("Volver");
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });
        getContentPane().add(btnSalir);
        btnSalir.setBounds(210, 270, 90, 23);
        getContentPane().add(lblEstado);
        lblEstado.setBounds(0, 270, 360, 30);

        lblTitulo.setFont(new java.awt.Font("Times New Roman", 2, 18)); // NOI18N
        lblTitulo.setText("Ingresar datos Motocicleta");
        getContentPane().add(lblTitulo);
        lblTitulo.setBounds(90, 10, 200, 40);

        txtStock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtStockActionPerformed(evt);
            }
        });
        txtStock.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtStockKeyTyped(evt);
            }
        });
        getContentPane().add(txtStock);
        txtStock.setBounds(110, 230, 220, 20);

        label3.setText("Stock");
        getContentPane().add(label3);
        label3.setBounds(30, 230, 50, 20);
        getContentPane().add(cmbAyuda);
        cmbAyuda.setBounds(446, 140, 90, 20);

        txtModelo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtModeloActionPerformed(evt);
            }
        });
        txtModelo.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtModeloKeyTyped(evt);
            }
        });
        getContentPane().add(txtModelo);
        txtModelo.setBounds(110, 150, 220, 20);

        txtValor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtValorActionPerformed(evt);
            }
        });
        txtValor.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtValorKeyTyped(evt);
            }
        });
        getContentPane().add(txtValor);
        txtValor.setBounds(110, 190, 220, 20);

        label4.setText("Marca");
        getContentPane().add(label4);
        label4.setBounds(30, 110, 30, 20);

        label5.setText("ID");
        getContentPane().add(label5);
        label5.setBounds(30, 70, 30, 20);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void txtMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMarcaActionPerformed
    }//GEN-LAST:event_txtMarcaActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        sql.closeConnection();
        Menu inicial = new Menu();    
        inicial.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnSalirActionPerformed

    private void txtStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtStockActionPerformed
    }//GEN-LAST:event_txtStockActionPerformed

    private void btnGuardarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnGuardarMouseClicked
        String modelo, marca, stock, Id, valor;
        
        Id = txtID.getText();
        marca = txtMarca.getText();
        modelo = txtModelo.getText();
        valor = txtValor.getText();
        stock = txtStock.getText();
        
        String sql_query = "INSERT INTO MOTOS(id_moto,id_marca,nombre_modelo,valor,stock)"
        + " VALUES('"+Id+"','"+marca+"','"+modelo+"','"+valor+"','"+stock+"')";
        
        sql.updateTable(sql_query);   
        
        btnSalir.doClick();     
    }//GEN-LAST:event_btnGuardarMouseClicked

    private void txtIDKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtIDKeyTyped
        char c = evt.getKeyChar();
        if(Character.isLetter(c)) { 
              getToolkit().beep(); 
               
              evt.consume();  
               
        } 
    }//GEN-LAST:event_txtIDKeyTyped

    private void txtMarcaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtMarcaKeyTyped
    }//GEN-LAST:event_txtMarcaKeyTyped

    private void txtStockKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtStockKeyTyped
        char c = evt.getKeyChar();
        if(Character.isLetter(c)) { 
              getToolkit().beep(); 
               
              evt.consume();  
               
        } 
    }//GEN-LAST:event_txtStockKeyTyped

    private void txtIDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtIDActionPerformed
    }//GEN-LAST:event_txtIDActionPerformed

    private void txtModeloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtModeloActionPerformed
    }//GEN-LAST:event_txtModeloActionPerformed

    private void txtModeloKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtModeloKeyTyped
    }//GEN-LAST:event_txtModeloKeyTyped

    private void txtValorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtValorActionPerformed
    }//GEN-LAST:event_txtValorActionPerformed

    private void txtValorKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtValorKeyTyped
        char c = evt.getKeyChar();
        if(Character.isLetter(c)) { 
              getToolkit().beep(); 
               
              evt.consume();  
               
        } 
    }//GEN-LAST:event_txtValorKeyTyped
    

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Ingresar().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnSalir;
    private javax.swing.JComboBox<String> cmbAyuda;
    private javax.swing.JLabel label1;
    private javax.swing.JLabel label2;
    private javax.swing.JLabel label3;
    private javax.swing.JLabel label4;
    private javax.swing.JLabel label5;
    private javax.swing.JLabel lblEstado;
    private javax.swing.JLabel lblTitulo;
    private javax.swing.JTextField txtID;
    private javax.swing.JTextField txtMarca;
    private javax.swing.JTextField txtModelo;
    private javax.swing.JTextField txtStock;
    private javax.swing.JTextField txtValor;
    // End of variables declaration//GEN-END:variables
}
