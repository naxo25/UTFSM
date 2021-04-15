Public Class Persona

    Protected _id As Integer
    Protected _nombre As String
    Protected _apellido As String
    Protected _fechaNacimiento As Date
    Protected _rut As String
    Protected _genero As Integer

    Public Property Nombre As String
        Get
            Return _nombre
        End Get
        Set(value As String)
            _nombre = value
        End Set
    End Property

    Public Property Apellido As String
        Get
            Return _apellido
        End Get
        Set(value As String)
            _apellido = value
        End Set
    End Property

    Public Property FechaNacimiento As Date
        Get
            Return _fechaNacimiento
        End Get
        Set(value As Date)
            _fechaNacimiento = value
        End Set
    End Property

    Public Property Rut As String
        Get
            Return _rut
        End Get
        Set(value As String)
            _rut = value
        End Set
    End Property

    Public Property Genero As Integer
        Get
            Return _genero
        End Get
        Set(value As Integer)
            _genero = value
        End Set
    End Property

    Public Property ID As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

End Class
