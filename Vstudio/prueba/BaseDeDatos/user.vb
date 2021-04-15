Public Class user
    Protected _usuario As String
    Protected _password As String

    Public Sub New(ByVal usuario As String, ByVal password As String)
        MyBase.New()
        _usuario = usuario
        _password = password
    End Sub
    Public Property usuario() As String
        Get
            Return _usuario
        End Get
        Set(ByVal value As String)
            _usuario = value
        End Set
    End Property
    Public Property password() As String
        Get
            Return _password
        End Get
        Set(ByVal value As String)
            _password = value
        End Set
    End Property
End Class
