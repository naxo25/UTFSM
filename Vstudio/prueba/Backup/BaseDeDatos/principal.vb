Imports BaseDeDatos.user
Imports BaseDeDatos.Login

Public Class principal

    Dim user As user
    Dim login As Login
    Public Sub New(ByVal login As Login, ByVal user As user)

        ' Llamada necesaria para el Diseñador de Windows Forms.
        InitializeComponent()

        Me.user = user
        Me.login = login

        ' Agregue cualquier inicialización después de la llamada a InitializeComponent().

    End Sub

    Public Sub New()

        ' Llamada necesaria para el Diseñador de Windows Forms.
        InitializeComponent()

        ' Agregue cualquier inicialización después de la llamada a InitializeComponent().

    End Sub

    Private Sub principal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub CerrarSesionToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CerrarSesionToolStripMenuItem.Click
        login.Show()
        Me.Dispose()
    End Sub

    Private Sub ConsultarIngresoegresoToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ConsultarClubes.Click
        Dim Consulta As New Consultar_clubes(Me)
        Consulta.ShowDialog()
    End Sub

    Private Sub ConsultarIngresoEgresoToolStripMenuItem_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ConsultarIngresoEgresoToolStripMenuItem.Click
        Dim Consulta As New ConsultarIngresoEgreso(Me)
        Consulta.modificar.Visible = False
        Consulta.eliminar.Visible = False
        Consulta.Text = "Lista de Ingresos/Egresos"
        Consulta.ShowDialog()
    End Sub

    Private Sub IngresarIngresoEgresoToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles IngresarIngresoEgresoToolStripMenuItem.Click
        Dim Ingresar As New Ingresar(Me)
        Ingresar.ShowDialog()
    End Sub

    Private Sub ModificarIngresoEgresoToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ModificarIngresoEgresoToolStripMenuItem1.Click
        Dim Consulta As New ConsultarIngresoEgreso(Me)
        Consulta.modificar.Visible = True
        Consulta.eliminar.Visible = False
        Consulta.Text = "Modificando"
        Consulta.ShowDialog()
    End Sub

    Private Sub EliminarIngresoEgresoToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles EliminarIngresoEgresoToolStripMenuItem1.Click
        Dim Consulta As New ConsultarIngresoEgreso(Me)
        Consulta.modificar.Visible = False
        Consulta.eliminar.Visible = True
        Consulta.Text = "Eliminando"
        Consulta.ShowDialog()

    End Sub
End Class