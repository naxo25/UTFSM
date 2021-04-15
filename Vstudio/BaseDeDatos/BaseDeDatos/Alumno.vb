Public Class Alumno
    Inherits Persona

    Protected _rol As String


    Public Sub New(nombre As String, apellido As String, fechaNacimiento As Date, rut As String, genero As Integer)

        MyBase.New()

        _nombre = nombre
        _apellido = apellido
        _fechaNacimiento = fechaNacimiento
        _rut = rut
        _genero = genero

    End Sub

    Public Sub New()

        MyBase.New()

    End Sub

   

End Class
