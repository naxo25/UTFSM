Public Class alumno
    Inherits persona

    Protected _rol As String


    Public Sub New(ByVal nombre As String, ByVal apellido As String, ByVal fechaNacimiento As Date, ByVal rut As String, ByVal genero As Integer)

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
