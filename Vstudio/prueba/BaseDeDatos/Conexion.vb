﻿Imports System.Data.OleDb
Public Class Conexion

    Protected conexion As New OleDbConnection
    Protected stringConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\naxo\Desktop\taller de sw\prueba\Database\Prueba2016Database.accdb"

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
