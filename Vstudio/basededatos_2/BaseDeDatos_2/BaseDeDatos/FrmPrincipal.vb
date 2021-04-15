Imports BaseDeDatos.Usuario
Imports BaseDeDatos.FrmLogin
Public Class FrmPrincipal

    Dim usuario As Usuario
    Dim formInicial As FrmLogin

    Public Sub New(formInicial As FrmLogin, usuario As Usuario)
        InitializeComponent()

        Me.usuario = usuario
        Me.formInicial = formInicial

    End Sub

    Public Sub New()
        InitializeComponent()

    End Sub

    Private Sub FrmPrincipal_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub CerrarSesiónToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles CerrarSesiónToolStripMenuItem.Click
        formInicial.Show()
        Me.Dispose()
    End Sub

    Private Sub DatosAlumnoToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles DatosAlumnoToolStripMenuItem.Click
        Dim formConsultarAlumno As New FrmConsultarAlumno(Me)

        formConsultarAlumno.ShowDialog()

    End Sub

    Private Sub InsertarToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles InsertarToolStripMenuItem.Click
        Dim frmInsertarAlumno As New FrmInsertarAlumno()

        frmInsertarAlumno.ShowDialog()
    End Sub

    Private Sub EliminarToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles EliminarToolStripMenuItem.Click
        Dim formConsultarAlumno As New FrmConsultarAlumno(Me)

        formConsultarAlumno.BtnModificar.Visible = False
        formConsultarAlumno.BtnNuevo.Visible = False
        formConsultarAlumno.ShowDialog()
    End Sub

    Private Sub ModficarToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ModficarToolStripMenuItem.Click
        Dim formConsultarAlumno As New FrmConsultarAlumno(Me)

        formConsultarAlumno.BtnEliminar.Visible = False
        formConsultarAlumno.BtnNuevo.Visible = False
        formConsultarAlumno.ShowDialog()
    End Sub

    Private Sub NotasToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles NotasToolStripMenuItem.Click

    End Sub
End Class