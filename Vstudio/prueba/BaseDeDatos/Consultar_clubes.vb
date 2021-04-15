Imports BaseDeDatos.principal
Imports BaseDeDatos.Datos
Public Class Consultar_clubes

    Dim datos As New Datos
    Dim principal As New principal()
    Public Sub New(ByVal principal As principal)

        ' Llamada necesaria para el Diseñador de Windows Forms.
        InitializeComponent()
        Me.principal = principal
        ' Agregue cualquier inicialización después de la llamada a InitializeComponent().

    End Sub
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        principal.Show()
        Me.Dispose()
    End Sub

    Private Sub Consultar_clubes_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        dgv.DataSource = Datos.getDatos()
        dgv.Columns(0).Visible = False
    End Sub
End Class