Public Class user

    Protected _nombre, _pass As String

    Public Sub New(ByVal nombre As String, ByVal pass As String)
        MyBase.New()
        _nombre = nombre
        _pass = pass
    End Sub
    Public Property nombre As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Public Property pass As String
        Get
            Return _pass
        End Get
        Set(ByVal value As String)
            _pass = value
        End Set
    End Property

End Class