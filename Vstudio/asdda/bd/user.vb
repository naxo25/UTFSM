Public Class user
    Protected _nombre As String
    Protected _clave As String
    Public Sub New(ByVal nombre As String, ByVal clave As String)
        MyBase.New()
        _nombre = nombre
        _clave = clave
    End Sub

    Public Sub mostrar(ByVal user As user)
        MsgBox("Bienvenido " & _nombre)
    End Sub
End Class
