Imports System.Data.OleDb
Public Class conexion
    Protected conexion As New OleDbConnection
    Protected stringConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\naxo\Desktop\taller de sw\bd\BaseDeDatos\Database\Database.accdb"

    Public Sub abrirconexion()
        conexion.ConnectionString = stringConexion
        conexion.Open()
    End Sub

    Public Sub cerrarConexion()
        conexion.Close()
    End Sub

    Public Function GetConexion()
        conexion.ConnectionString = stringConexion
        Return conexion
    End Function
End Class
