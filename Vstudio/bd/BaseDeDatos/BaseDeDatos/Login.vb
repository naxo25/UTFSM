Imports System.Data
Imports System.Data.OleDb
Imports BaseDeDatos.Datos
Imports BaseDeDatos.principal
Public Class Login

    Dim datos As New Datos()

    Private Sub Login_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        nombre.Text = ""
        pass.Text = ""
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim user As New user(nombre.Text, pass.Text)
        Dim principal As New principal(Me)

        If datos.validar(user) Then

            Me.Hide()

            Principal.Show()
        Else
            MsgBox("El usuario es inválido", MsgBoxStyle.Information, "Alerta")
        End If

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Application.Exit()
    End Sub
End Class