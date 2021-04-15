Imports BaseDeDatos.Conexion
Imports BaseDeDatos.user
Imports BaseDeDatos.alumno
Imports BaseDeDatos.ingresar
Imports System.Data
Imports System.Data.OleDb
Imports System.Math
Public Class Datos
    Protected conexion As New conexion()

    Public Function validar(ByVal User As user)
        Dim command As New OleDbCommand

        Dim dataset As New DataSet

        command.Connection = conexion.GetConexion()

        conexion.abrirconexion()

        command.CommandText = "select * from Usuarios where NombreUsuario = '" & User.nombre & "' and Password = '" & User.Pass & "'"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)

        conexion.cerrarConexion()

        Return dataset.Tables(0).Rows.Count
    End Function

    Public Function validarAlumno(ByVal alumno As alumno)
        Dim command As New OleDbCommand

        Dim dataset As New DataSet
        command.Connection = conexion.GetConexion()

        conexion.abrirconexion()
        command.CommandText = "select * from Alumno where Rut = '" & alumno.Rut & "'"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)

        conexion.cerrarConexion()

        Return dataset.Tables(0).Rows.Count
    End Function

    Function GetAlumno()
        Dim command As New OleDbCommand

        Dim dataset As New DataSet

        command.Connection = conexion.GetConexion()

        conexion.abrirconexion()

        command.CommandText = "select * from alumno"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)

        conexion.cerrarConexion()

        Return dataset.Tables(0)
    End Function

    Function insertar(ByVal alumno As alumno)

        Dim command As New OleDbCommand
        command.Connection = conexion.GetConexion()

        conexion.abrirconexion()

        command.CommandText = "Insert into Alumno (Nombre, Apellido, Rut, FechaNacimiento, Genero) values ('" & alumno.Nombre & "','" & alumno.Apellido & "','" & alumno.Rut & "','" & alumno.FechaNacimiento.ToString() & "'," & alumno.Genero & ") "
        command.ExecuteNonQuery()

        conexion.cerrarConexion()

        Return alumno

    End Function

End Class
