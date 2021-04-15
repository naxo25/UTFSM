Imports basededatos.user
Imports BaseDeDatos.login
Public Class principal
    Dim User As user
    Dim inicial As Login

    Public Sub New(ByVal inicial As Login)
        InitializeComponent()
        Me.inicial = Login

    End Sub

    Private Sub principal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub SalirToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SalirToolStripMenuItem.Click
        inicial.Show()
        Me.Dispose()

    End Sub

    Private Sub IngresarToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles IngresarToolStripMenuItem.Click
        Dim insertar As New ingresar(Me)

        insertar.ShowDialog()
    End Sub

    Private Sub ListaToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListaToolStripMenuItem.Click
        Dim Lista As New Lista(Me)

        Lista.ShowDialog()
    End Sub
End Class