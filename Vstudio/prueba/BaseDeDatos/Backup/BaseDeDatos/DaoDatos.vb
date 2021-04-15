Imports BaseDeDatos.Alumno
Imports BaseDeDatos.notas
Imports System.IO
Imports System.Data.OleDb
Imports System.Data
Imports BaseDeDatos.Conexion

Public Class DaoDatos

    Dim conexion As New Conexion()

    Function GetAlumnos()
        Dim command As New OleDbCommand

        Dim dataset As New DataSet

        command.Connection = conexion.GetConexion()

        conexion.AbrirConexion()

        command.CommandText = "select * from Alumno"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)

        conexion.CerrarConexion()

        Return dataset.Tables(0)

    End Function

    Function GetDatosDeAlumno(alumno As Alumno, rut As String)

        Return alumno
    End Function

    Function AlumnoExiste(rut As String)


        Return True
    End Function

    Function InsertarAlumno(alumno As Alumno)


        Dim command As New OleDbCommand
        command.Connection = conexion.GetConexion()

        conexion.AbrirConexion()

        command.CommandText = "Insert into Alumno (Nombre, Apellido, Rut, FechaNacimiento, Genero) values ('" & alumno.Nombre & "','" & alumno.Apellido & "','" & alumno.Rut & "','" & alumno.FechaNacimiento.ToString() & "'," & alumno.Genero & ") "
        command.ExecuteNonQuery()

        conexion.CerrarConexion()

        Return alumno

    End Function

    Function EliminarAlumno(alumno As Alumno)


        Dim command As New OleDbCommand
        command.Connection = conexion.GetConexion()

        conexion.AbrirConexion()

        command.CommandText = "Delete from Alumno where ID = " & alumno.ID & ""
        command.ExecuteNonQuery()

        conexion.CerrarConexion()

        Return alumno

    End Function

    Function ModificarAlumno(alumno As Alumno)


        Dim command As New OleDbCommand
        command.Connection = conexion.GetConexion()

        conexion.AbrirConexion()

        command.CommandText = "Update Alumno set Nombre = '" & alumno.Nombre & "' , Apellido = '" & alumno.Apellido & "', Rut = '" & alumno.Rut & "', FechaNacimiento = '" & alumno.FechaNacimiento.ToString() & "', Genero = " & alumno.Genero & " where ID = " & alumno.ID & ""
        command.ExecuteNonQuery()

        conexion.CerrarConexion()

        Return alumno

    End Function

    Function promedio()
        Dim command As New OleDbCommand

        Dim dataset As New DataSet

        command.Connection = conexion.GetConexion()

        conexion.AbrirConexion()

        command.CommandText = "select * from Notas"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)

        conexion.CerrarConexion()

        Return dataset.Tables(0)
    End Function

End Class

