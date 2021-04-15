Imports System.Data
Imports System.Data.OleDb
Imports BaseDeDatos.BsnUsuario
Imports BaseDeDatos.FrmPrincipal


Public Class FrmLogin
    Dim bsnUsuario As New BsnUsuario()

    Private Sub Form1_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        TxtNombre.Text = ""
        TxtPass.Text = ""

    End Sub

    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles BtnSalir.Click
        Application.Exit()
    End Sub

    Private Sub Button2_Click(sender As System.Object, e As System.EventArgs) Handles BtnAceptar.Click

        Dim usuario As New Usuario(TxtNombre.Text, TxtPass.Text)

        Dim formPrincipal As New FrmPrincipal(Me, usuario)

        If bsnUsuario.ValidarUsuario(usuario) Then

            Me.Hide()

            formPrincipal.Show()
        Else
            MsgBox("El usuario es inválido", MsgBoxStyle.Information, "Alerta")
        End If


    End Sub
End Class
