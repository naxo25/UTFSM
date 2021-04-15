Imports System.Data
Imports System.Data.OleDb
Imports BaseDeDatos.Datos
Public Class Login


    Dim datos As New Datos()
    Private Sub BtnAceptar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnAceptar.Click
        Dim user As New user(nombre.Text, pass.Text)
        Dim principal As New principal(Me, user)

        If Datos.validarUser(user) Then
            Me.Hide()
            principal.Show()
        Else
            MsgBox("Usuario invalido", MsgBoxStyle.Information, "Error")
            nombre.Text = ""
            pass.Text = ""
            nombre.Focus()
        End If



    End Sub

    Private Sub BtnSalir_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnSalir.Click
        Application.Exit()
    End Sub

    Private Sub FrmLogin_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        nombre.Text = ""
        pass.Text = ""
        nombre.Focus()
    End Sub
End Class
