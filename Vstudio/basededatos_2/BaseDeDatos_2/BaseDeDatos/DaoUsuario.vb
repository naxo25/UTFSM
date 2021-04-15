Imports BaseDeDatos.Conexion
Imports BaseDeDatos.Usuario
Imports System.Data
Imports System.Data.OleDb
Public Class DaoUsuario

    Protected conexion As New Conexion()

    Public Function ValidarUsuario(usuario As Usuario)

        Dim command As New OleDbCommand

        Dim dataset As New DataSet

        command.Connection = conexion.GetConexion()

        conexion.AbrirConexion()

        command.CommandText = "select * from Usuarios where NombreUsuario = '" & usuario.NombreUsuario & "' and Password = '" & usuario.Password & "'"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)

        conexion.CerrarConexion()

        Return dataset.Tables(0).Rows.Count
    End Function


End Class
