Imports BaseDeDatos.BsnNegocio
Imports BaseDeDatos.Alumno
Imports BaseDeDatos.notas
Public Class FrmConsultarAlumno
    Dim bsnNegocio As New BsnNegocio()
    Dim formPrincipal As New FrmPrincipal()

    Public Sub New(ByVal formPrincipal As FrmPrincipal)
        InitializeComponent()

        Me.formPrincipal = formPrincipal
    End Sub

    Public Sub New()
        InitializeComponent()

    End Sub
    Private Sub BtnNuevo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnNuevo.Click
        Dim frmInsertarAlumno As New FrmInsertarAlumno(Me, Operaciones.insertar)

        frmInsertarAlumno.ShowDialog()
    End Sub

    Public Sub ConsultarAlumno_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        DgvAlumno.DataSource = bsnNegocio.Promedio()

        DgvAlumno.Columns(0).Visible = False
        DgvAlumno.Columns(5).Visible = False

    End Sub

    Private Sub BtnModificar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnModificar.Click
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

    Private Sub BtnEliminar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnEliminar.Click
        Dim alumno As New Alumno()

        alumno.ID = Integer.Parse(DgvAlumno.SelectedRows.Item(0).Cells(0).Value)

        If MessageBox.Show("¿ Está seguro de Eliminar el Alumno ?", "Alerta", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) = Windows.Forms.DialogResult.OK Then

            bsnNegocio.EliminarAlumno(alumno)
            MsgBox("Alumno eliminado correctamente", MsgBoxStyle.Information, "Alerta")
            Me.ConsultarAlumno_Load(Me, Nothing)
        End If
    End Sub

    Private Sub BtnCerrar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnCerrar.Click
        Me.Dispose()
    End Sub

    Private Sub notas_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Label1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label1.Click

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim promedio As Double
        Dim x As Integer
        For x = 0 To DgvAlumno.Rows.Count - 1
            Dim nota As Integer = DgvAlumno.Rows(x).Cells(1).Value
            promedio = promedio + nota
        Next

        MsgBox(promedio / x)
        notas.Text = Convert.ToString(promedio / x)
        Label1.Text = Convert.ToString(promedio / x)
    End Sub
End Class