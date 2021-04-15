Public Class notas
    Protected _nota As Integer
    Protected _id As String

    Public Sub New(ByVal nota As String, ByVal id As String)

        MyBase.New()

        _nota = nota
        _id = id
    End Sub
    Public Property nota() As String
        Get
            Return _nota
        End Get
        Set(ByVal value As String)
            _nota = value
        End Set
    End Property

    Public Property id() As String
        Get
            Return _id
        End Get
        Set(ByVal value As String)
            _id = value
        End Set
    End Property

End Class
