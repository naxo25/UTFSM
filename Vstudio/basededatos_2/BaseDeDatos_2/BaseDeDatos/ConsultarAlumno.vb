Imports BaseDeDatos.BsnNegocio
Imports BaseDeDatos.Alumno
Public Class FrmConsultarAlumno

    Dim bsnNegocio As New BsnNegocio()
    Dim formPrincipal As New FrmPrincipal()

    Public Sub New(formPrincipal As FrmPrincipal)
        InitializeComponent()

        Me.formPrincipal = formPrincipal
    End Sub

    Public Sub New()
        InitializeComponent()

    End Sub

    Public Sub FrmConsultarAlumno_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        DgvAlumno.DataSource = bsnNegocio.GetAlumnos()

        DgvAlumno.Columns(0).Visible = False
        DgvAlumno.Columns(5).Visible = False

    End Sub

    Private Sub BtnNuevo_Click(sender As System.Object, e As System.EventArgs) Handles BtnNuevo.Click
        Dim frmInsertarAlumno As New FrmInsertarAlumno(Me, Operaciones.insertar)

        frmInsertarAlumno.ShowDialog()

    End Sub

    Private Sub BtnModificar_Click(sender As System.Object, e As System.EventArgs) Handles BtnModificar.Click

        Dim alumno As New Alumno()

        alumno.ID = Integer.Parse(DgvAlumno.SelectedRows.Item(0).Cells(0).Value)
        alumno.Nombre = DgvAlumno.SelectedRows.Item(0).Cells(2).Value.ToString()
        alumno.Apellido = DgvAlumno.SelectedRows.Item(0).Cells(3).Value.ToString()
        alumno.Rut = DgvAlumno.SelectedRows.Item(0).Cells(1).Value.ToString()
        alumno.FechaNacimiento = Date.Parse(DgvAlumno.SelectedRows.Item(0).Cells(4).Value)
        alumno.Genero = Integer.Parse(DgvAlumno.SelectedRows.Item(0).Cells(5).Value)

        Dim frmInsertarAlumno As New FrmInsertarAlumno(Me, alumno, Operaciones.modificar)

        frmInsertarAlumno.ShowDialog()

    End Sub

    Private Sub BtnEliminar_Click(sender As System.Object, e As System.EventArgs) Handles BtnEliminar.Click
        Dim alumno As New Alumno()

        alumno.ID = Integer.Parse(DgvAlumno.SelectedRows.Item(0).Cells(0).Value)

        If MessageBox.Show("¿ Está seguro de Eliminar el Alumno ?", "Alerta", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) = Windows.Forms.DialogResult.OK Then

            bsnNegocio.EliminarAlumno(alumno)
            MsgBox("Alumno eliminado correctamente", MsgBoxStyle.Information, "Alerta")
            Me.FrmConsultarAlumno_Load(Me, Nothing)
        End If
    End Sub

    Private Sub BtnCerrar_Click(sender As System.Object, e As System.EventArgs) Handles BtnCerrar.Click
        Me.Dispose()
    End Sub
End Class