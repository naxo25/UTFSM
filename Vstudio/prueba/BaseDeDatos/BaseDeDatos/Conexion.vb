Imports System.Data.OleDb
Public Class Conexion

    Protected conexion As New OleDbConnection
    Protected stringConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\naxo\Desktop\U\taller de sw\1\prueba\BaseDeDatos\Database\Database.accdb"


    Public Sub AbrirConexion()
        conexion.ConnectionString = stringConexion
        conexion.Open()
    End Sub

    Public Sub CerrarConexion()
        conexion.Close()
    End Sub

    Public Function GetConexion()

        conexion.ConnectionString = stringConexion

        Return conexion
    End Function


End Class
