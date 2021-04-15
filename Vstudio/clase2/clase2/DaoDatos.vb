Imports Clase2.Alumno
Imports System.IO

Public Class DaoDatos

    Function GetDatosDeAlumno(alumno As Alumno)

        Dim lectura As New StreamReader("../../Datos/datos.txt")

        Dim datos() As String

        datos = Split(lectura.ReadLine(), ",")

        alumno.Nombre = Trim(datos(0))
        alumno.Apellido = Trim(datos(1))
        alumno.FechaNacimiento = Date.Parse(Trim(datos(2)))
        alumno.Rut = Trim(datos(3))
        alumno.Genero = Integer.Parse(Trim(datos(4)))

        lectura.Close()

        Return alumno
    End Function

    Function GetDatosDeAlumno(alumno As Alumno, rut As String)

        Dim lectura As New StreamReader("../../Datos/datos.txt")

        Dim datos() As String

        Dim encontrado As Boolean = False

        Do While lectura.EndOfStream = False And encontrado = False

            datos = Split(lectura.ReadLine(), ",")

            If Trim(datos(3)) = Trim(rut) Then
                encontrado = True

                alumno.Nombre = Trim(datos(0))
                alumno.Apellido = Trim(datos(1))
                alumno.FechaNacimiento = Date.Parse(Trim(datos(2)))
                alumno.Rut = Trim(datos(3))
                alumno.Genero = Integer.Parse(Trim(datos(4)))

            End If

        Loop

        lectura.Close()

        Return alumno
    End Function

    Function AlumnoExiste(rut As String)

        Dim lectura As New StreamReader("../../Datos/datos.txt")

        Dim datos() As String

        Dim encontrado As Boolean = False

        Do While lectura.EndOfStream = False And encontrado = False

            datos = Split(lectura.ReadLine(), ",")

            If Trim(datos(3)) = Trim(rut) Then
                encontrado = True
            End If

        Loop

        lectura.Close()

        Return encontrado

    End Function

    Function InsertarAlumno(alumno As Alumno)

        If AlumnoExiste(alumno.Rut) Then
            Return False
        End If

        Dim escritura As New StreamWriter("../../Datos/datos.txt", True)

        escritura.WriteLine(alumno.Nombre + "," + alumno.Apellido + "," + alumno.FechaNacimiento.Month.ToString() + "/" +
                            alumno.FechaNacimiento.Day.ToString() + "/" + alumno.FechaNacimiento.Year.ToString() + "," + alumno.Rut + "," +
                            alumno.Genero.ToString())

        escritura.Close()

        Return True

    End Function

End Class

