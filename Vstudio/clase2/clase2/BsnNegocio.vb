Imports Clase2.Alumno
Imports Clase2.DaoDatos
Imports System.Math


Public Class BsnNegocio

    Dim DaoDatos As New DaoDatos()

    Function GetDatosDeAlumno(alumno As Alumno)

        Return DaoDatos.GetDatosDeAlumno(alumno)

    End Function

    Function GetDatosDeAlumno(alumno As Alumno, rut As String)

        Return DaoDatos.GetDatosDeAlumno(alumno, rut)

    End Function

    Function SacarPromedio(notas() As Integer)

        Dim promedio As Integer = 0

        For Each nota In notas

            promedio = promedio + nota

        Next

        Return Int(Round((promedio / notas.Length)))
    End Function

    Function SacarPromedio(notas As List(Of Integer))

        Dim promedio As Integer = 0

        For Each nota In notas

            promedio = promedio + nota

        Next

        Return Int(Round((promedio / notas.Count)))
    End Function

    Function EncontrarNota(notas() As Integer, nota As Integer)

        Dim encontrado As Boolean = False

        Dim i As Integer = 0

        Do While encontrado = False And i < 10

            If notas(i) = nota Then
                encontrado = True
            End If

            i = i + 1
        Loop

        Return encontrado
    End Function

    Function EncontrarNota(notas As List(Of Integer), nota As Integer)

        Dim encontrado As Boolean = False

        Dim i As Integer = 0

        Do Until encontrado = True Or i > 9

            If notas(i) = nota Then
                encontrado = True
            End If

            i = i + 1
        Loop

        Return encontrado
    End Function

    Function InsertarAlumno(alumno As Alumno)

        Return DaoDatos.InsertarAlumno(alumno)

    End Function

    Sub StatusAlumno(promedio As Integer)

        If promedio > 54 Then
            Console.WriteLine("Aprobé!!!")

        Else
            Console.WriteLine("Reprobé, profe %$.-%&")
        End If

    End Sub

End Class
