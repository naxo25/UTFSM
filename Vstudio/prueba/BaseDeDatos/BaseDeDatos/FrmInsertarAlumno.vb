Imports BaseDeDatos.BsnNegocio
Imports BaseDeDatos.Alumno
Public Class FrmInsertarAlumno

    Dim formConsultarAlumno As New FrmConsultarAlumno()
    Dim bsnNegocia As New BsnNegocio()
    Dim alumnos As New Alumno()
    Dim operacion As Integer = -1

    Public Sub New(ByVal formConsultarAlumno As FrmConsultarAlumno)
        InitializeComponent()

        Me.formConsultarAlumno = formConsultarAlumno

    End Sub

    Public Sub New()
        InitializeComponent()

    End Sub

    Public Sub New(ByVal formConsultarAlumno As FrmConsultarAlumno, ByVal alumno As Alumno, ByVal operacion As Integer)
        InitializeComponent()

        Me.formConsultarAlumno = formConsultarAlumno
        Me.alumnos = alumno
        Me.operacion = operacion

    End Sub

    Public Sub New(ByVal formConsultarAlumno As FrmConsultarAlumno, ByVal operacion As Integer)
        InitializeComponent()

        Me.formConsultarAlumno = formConsultarAlumno
        Me.operacion = operacion

    End Sub

    Private Sub BtnAceptar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnAceptar.Click
        alumnos.Nombre = TxtNombre.Text
        alumnos.Apellido = TxtApellido.Text
        alumnos.Rut = TxtRut.Text
        If Val(TxtRut.Text) > 100 Then
            MsgBox("numero muy grande")
        End If
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

    Private Sub BtnCancelar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnCancelar.Click

        formConsultarAlumno.ConsultarAlumno_Load(Me, Nothing)

        Me.Dispose()
    End Sub

    Private Sub FrmInsertarAlumno_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
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

    Private Sub TxtRut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles TxtRut.Click

    End Sub

    Private Sub TxtRut_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles TxtRut.Disposed

    End Sub

    Private Sub TxtRut_KeyPress1(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TxtRut.KeyPress
        If Char.IsDigit(e.KeyChar) Then
            e.Handled = False
        ElseIf Char.IsControl(e.KeyChar) Then
            e.Handled = False
        ElseIf Char.IsSeparator(e.KeyChar) Then
            e.Handled = False
        Else
            e.Handled = True
        End If
    End Sub

    Private Sub DtpFecha_ValueChanged(sender As Object, e As EventArgs) Handles DtpFecha.ValueChanged

    End Sub
End Class