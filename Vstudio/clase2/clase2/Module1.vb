Imports Clase2.Alumno
Imports Clase2.BsnNegocio
Module Module1

    Sub Main()

        Dim bsnNegocio = New BsnNegocio()
        Dim alumno = New Alumno()

        alumno = bsnNegocio.GetDatosDeAlumno(alumno)

        Console.WriteLine("Datos del Alumno")
        Console.WriteLine(" ")
        Console.WriteLine("Nombre: " + alumno.Nombre)
        Console.WriteLine("Apellido: " + alumno.Apellido)
        Console.WriteLine("Fecha de Nacimiento: " + alumno.FechaNacimiento.Day.ToString() + "/" + alumno.FechaNacimiento.Month.ToString() +
                                              "/" + alumno.FechaNacimiento.Year.ToString())
        Console.WriteLine("Rut: " + alumno.Rut)

        If alumno.Genero = Genero.Masculino Then
            Console.WriteLine("Género: Masculino")
        ElseIf alumno.Genero = Genero.Femenino Then
            Console.WriteLine("Género: Femenino")
        End If

        Console.WriteLine()
        Console.WriteLine()

        Dim alumno2 = New Alumno()

        alumno2 = bsnNegocio.GetDatosDeAlumno(alumno2, "12345678-9")

        If IsNothing(alumno2) Then

            Console.WriteLine("No encontrado, se terminará el proceso ")
            Console.ReadKey()
            Exit Sub

        End If
        Console.WriteLine("Datos del Alumno")
        Console.WriteLine(" ")
        Console.WriteLine("Nombre: " + alumno2.Nombre)
        Console.WriteLine("Apellido: " + alumno2.Apellido)
        Console.WriteLine("Fecha de Nacimiento: " + alumno2.FechaNacimiento.Day.ToString() + "/" + alumno2.FechaNacimiento.Month.ToString() +
                                              "/" + alumno2.FechaNacimiento.Year.ToString())
        Console.WriteLine("Rut: " + alumno2.Rut)

        If alumno2.Genero = Genero.Masculino Then
            Console.WriteLine("Género: Masculino")
        ElseIf alumno2.Genero = Genero.Femenino Then
            Console.WriteLine("Género: Femenino")
        End If

        Console.WriteLine()
        Console.WriteLine()

        Console.WriteLine("Ingrese notas: ")

        Dim notas(9) As Integer
        Dim lista As New List(Of Integer)

        Dim i As Integer
        For i = 0 To 9
            Console.Write("Ingrese nota" + (i + 1).ToString() + ": ")
            Dim consoleValue = Integer.Parse(Console.ReadLine())
            notas(i) = consoleValue
            lista.Add(consoleValue)

            Console.Clear()
        Next

        Console.WriteLine("El promedio es: " + bsnNegocio.SacarPromedio(notas).ToString())
        Console.WriteLine()
        Console.WriteLine("El promedio es: " + bsnNegocio.SacarPromedio(lista).ToString())

        Console.ReadKey()

        If bsnNegocio.EncontrarNota(notas, 100) = True Then
            Console.WriteLine("Nota Encontrada")
        Else
            Console.WriteLine("Nota No encontrada")
        End If

        If bsnNegocio.EncontrarNota(lista, 100) = True Then
            Console.WriteLine("Nota Encontrada -")
        Else
            Console.WriteLine("Nota No encontrada -")
        End If

        Console.ReadKey()

        bsnNegocio.StatusAlumno(bsnNegocio.SacarPromedio(lista))

        Console.ReadKey()

        Console.Clear()

        Dim alumno3 As New Alumno()

        alumno3.Nombre = "Juan"
        alumno3.Apellido = "Perez"
        alumno3.FechaNacimiento = "03/03/1995"
        alumno3.Rut = "12131415-8"
        alumno3.Genero = Genero.Masculino

        If bsnNegocio.InsertarAlumno(alumno3) Then
            Console.WriteLine("Insertado correctamente")
        Else
            Console.WriteLine("No se puedo ingresar, porque ya existe, se terminará el proceso")
            Console.ReadKey()
            Exit Sub
        End If

        alumno3 = New Alumno

        alumno3 = bsnNegocio.GetDatosDeAlumno(alumno2, "12131415-8")

        Console.WriteLine("Datos del Alumno")
        Console.WriteLine(" ")
        Console.WriteLine("Nombre: " + alumno3.Nombre)
        Console.WriteLine("Apellido: " + alumno3.Apellido)
        Console.WriteLine("Fecha de Nacimiento: " + alumno3.FechaNacimiento.Day.ToString() + "/" + alumno3.FechaNacimiento.Month.ToString() +
                                              "/" + alumno3.FechaNacimiento.Year.ToString())
        Console.WriteLine("Rut: " + alumno3.Rut)

        If alumno3.Genero = Genero.Masculino Then
            Console.WriteLine("Género: Masculino")
        ElseIf alumno3.Genero = Genero.Femenino Then
            Console.WriteLine("Género: Femenino")
        End If

        Console.ReadKey()

    End Sub

End Module
