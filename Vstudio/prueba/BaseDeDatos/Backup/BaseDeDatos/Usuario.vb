Public Class Usuario

    Protected _nombreUsuario As String
    Protected _password As String

    Public Sub New(nombreUsuario As String, password As String)

        MyBase.New()

        _nombreUsuario = nombreUsuario
        _password = password

    End Sub

    Public Property NombreUsuario As String
        Get
            Return _nombreUsuario
        End Get
        Set(value As String)
            _nombreUsuario = value
        End Set
    End Property

    Public Property Password As String
        Get
            Return _password
        End Get
        Set(value As String)
            _password = value
        End Set
    End Property

End Class
