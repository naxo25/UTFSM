Imports BaseDeDatos.alumno
Public Class Lista
    Dim inicial As principal
    Dim datos As New Datos
    Public Sub New(inicial as principal)

        ' Llamada necesaria para el Diseñador de Windows Forms.
        InitializeComponent()

        ' Agregue cualquier inicialización después de la llamada a InitializeComponent().
        Me.inicial = inicial
    End Sub
    Private Sub Lista_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        dgv.DataSource = datos.GetAlumno()
    End Sub
End Class