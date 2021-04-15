Public Class IngresoEgreso
    Protected _nombre As String
    Protected _detalle As String
    Protected _fecha As String
    Protected _monto As String
    Protected _idtipomovimiento As String
    Protected _idclub As String

    Public Sub New(ByVal nombre As String, ByVal fecha As Date, ByVal detalle As String, ByVal monto As Integer, ByVal idtipomovimiento As Integer, ByVal idclub As Integer)
        MyBase.New()
        _nombre = nombre
        _detalle = detalle
        _fecha = fecha
        _monto = monto
        _idtipomovimiento = idtipomovimiento
        _idclub = idclub
    End Sub

    Public Sub New()

    End Sub
    Public Property nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property
    Public Property detalle() As String
        Get
            Return _detalle
        End Get
        Set(ByVal value As String)
            _detalle = value
        End Set
    End Property
    Public Property fecha() As Date
        Get
            Return _fecha
        End Get
        Set(ByVal value As Date)
            _fecha = value
        End Set
    End Property
    Public Property monto() As Integer
        Get
            Return _monto
        End Get
        Set(ByVal value As Integer)
            _monto = value
        End Set
    End Property
    Public Property idtipomovimiento() As Integer
        Get
            Return _idtipomovimiento
        End Get
        Set(ByVal value As Integer)
            _idtipomovimiento = value
        End Set
    End Property
    Public Property idclub() As Integer
        Get
            Return _idclub
        End Get
        Set(ByVal value As Integer)
            _idclub = value
        End Set
    End Property
End Class
