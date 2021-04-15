Imports System.Data
Imports System.Data.OleDb
Imports WindowsApplication2.algo
Imports WindowsApplication2.principal

Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub aceptar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles aceptar.Click

        Dim user As New user(t1.Text, t2.Text)
        user.mostrar(user)

        Dim principal As New principal()
    End Sub
End Class
