Imports BaseDeDatos.BsnNegocio
Imports BaseDeDatos.Alumno

Public Class FrmInsertarAlumno

    Dim formConsultarAlumno As New FrmConsultarAlumno()
    Dim bsnNegocia As New BsnNegocio()
    Dim alumnos As New Alumno()
    Dim operacion As Integer = -1

    Private Sub FrmInsertarAlumno_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        CmbGenero.DisplayMember = "Text"
        CmbGenero.ValueMember = "Value"
        Dim tb As New DataTable
        tb.Columns.Add("Text", GetType(String))
        tb.Columns.Add("Value", GetType(Integer))
        tb.Rows.Add("Masculino", 0)
        tb.Rows.Add("Femenino", 1)
        CmbGenero.DataSource = tb

        If operacion = Operaciones.modificar Then

            TxtNombre.Text = alumnos.Nombre
            TxtApellido.Text = alumnos.Apellido
            TxtRut.Text = alumnos.Rut
            CmbGenero.SelectedValue = alumnos.Genero
            DtpFecha.Value = alumnos.FechaNacimiento

            Me.Text = "Modificar Alumno"

        End If
    End Sub

    Public Sub New(formConsultarAlumno As FrmConsultarAlumno)
        InitializeComponent()

        Me.formConsultarAlumno = formConsultarAlumno

    End Sub

    Public Sub New()
        InitializeComponent()

    End Sub

    Public Sub New(formConsultarAlumno As FrmConsultarAlumno, alumno As Alumno, operacion As Integer)
        InitializeComponent()

        Me.formConsultarAlumno = formConsultarAlumno
        Me.alumnos = alumno
        Me.operacion = operacion

    End Sub

    Public Sub New(formConsultarAlumno As FrmConsultarAlumno, operacion As Integer)
        InitializeComponent()

        Me.formConsultarAlumno = formConsultarAlumno
        Me.operacion = operacion

    End Sub

    Private Sub BtnCancelar_Click(sender As System.Object, e As System.EventArgs) Handles BtnCancelar.Click

        formConsultarAlumno.FrmConsultarAlumno_Load(Me, Nothing)

        Me.Dispose()
    End Sub

    Private Sub BtnAceptar_Click(sender As System.Object, e As System.EventArgs) Handles BtnAceptar.Click

        alumnos.Nombre = TxtNombre.Text
        alumnos.Apellido = TxtApellido.Text
        alumnos.Rut = TxtRut.Text
        alumnos.FechaNacimiento = DtpFecha.Value
        alumnos.Genero = CmbGenero.SelectedValue

        If operacion = Operaciones.modificar Then

            If MessageBox.Show("¿ Está seguro de modificar el Alumno ?", "Alerta", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) = Windows.Forms.DialogResult.OK Then

                bsnNegocia.ModificarAlumno(alumnos)
                MsgBox("Alumno modificado correctamente", MsgBoxStyle.Information, "Alerta")

            End If
        Else
            bsnNegocia.InsertarAlumno(alumnos)
            MsgBox("Alumno insertado correctamente", MsgBoxStyle.Information, "Alerta")
        End If
    End Sub
End Class