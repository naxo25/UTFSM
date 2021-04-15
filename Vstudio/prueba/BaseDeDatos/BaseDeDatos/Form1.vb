Public Class FrmLogin

    Dim bsnUsuario As New BsnUsuario()

    Private Sub BtnAceptar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnAceptar.Click
        Dim usuario As New Usuario(TxtNombre.Text, TxtPass.Text)

        Dim formPrincipal As New FrmPrincipal(Me, usuario)

        If bsnUsuario.ValidarUsuario(usuario) Then

            Me.Hide()


            FrmPrincipal.Show()

        Else
            MsgBox("El usuario es inválido", MsgBoxStyle.Information, "Alerta")
        End If
    End Sub

    Private Sub BtnSalir_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnSalir.Click
        Application.Exit()
    End Sub

    Private Sub FrmLogin_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        TxtNombre.Text = ""
        TxtPass.Text = ""
    End Sub
End Class
