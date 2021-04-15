Public Class frmInicial

    Private Sub btnAceptar_Click(sender As System.Object, e As System.EventArgs) Handles btnAceptar.Click

        Dim bool As Boolean
        Dim int As Integer


        bool = Integer.TryParse(txtNombre.Text, int)


        If (bool) Then
            MessageBox.Show("Alerta", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            txtNombre.Focus()
            Exit Sub


        End If

        lblMensaje.Text = txtNombre.Text + " " + txtApellido.Text

        If rbMasculino.Checked Then
            lblMensaje.Text = lblMensaje.Text + " (" + rbMasculino.Text + ")"
        Else
            lblMensaje.Text = lblMensaje.Text + "(" + rbFemenino.Text + ")"
        End If

        If chkSoltero.Checked Then
            lblMensaje.Text = lblMensaje.Text + " (" + chkSoltero.Text + ")"
        ElseIf chkCasado.Checked Then
            lblMensaje.Text = lblMensaje.Text + " (" + chkCasado.Text + ")"
        Else
            lblMensaje.Text = lblMensaje.Text + " (" + chkViudo.Text + ")"
        End If

        btnCerrar.Visible = True

        MessageBox.Show("Alerta", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)


        'Dim form As New FrmPrincipal()

        'form.Show()

    End Sub

    Private Sub frmInicial_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        lblMensaje.Text = "Hola mundo"
        rbMasculino.Checked = True
        btnCerrar.Visible = False
    End Sub

    Private Sub btnCerrar_Click(sender As System.Object, e As System.EventArgs) Handles btnCerrar.Click
        Me.Close()
    End Sub


    Private Sub chkCasado_MouseClick(sender As Object, e As System.Windows.Forms.MouseEventArgs) Handles chkCasado.MouseClick
        chkSoltero.Checked = False
        chkViudo.Checked = False
    End Sub

    Private Sub chkSoltero_MouseClick(sender As Object, e As System.Windows.Forms.MouseEventArgs) Handles chkSoltero.MouseClick
        chkCasado.Checked = False
        chkViudo.Checked = False
    End Sub

    Private Sub chkViudo_MouseClick(sender As Object, e As System.Windows.Forms.MouseEventArgs) Handles chkViudo.MouseClick
        chkCasado.Checked = False
        chkSoltero.Checked = False
    End Sub

    Private Sub txtApellido_Resize(sender As Object, e As System.EventArgs) Handles txtApellido.Resize

    End Sub

    Public Sub algo()

    End Sub
End Class
