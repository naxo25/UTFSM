Imports System.Data.OleDb
Public Class Conexion

    Protected conexion As New OleDbConnection
    Protected stringConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\lPixel\Documents\Visual Studio 2005\Projects\WindowsApplication2\Database\Bd.accdb"

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