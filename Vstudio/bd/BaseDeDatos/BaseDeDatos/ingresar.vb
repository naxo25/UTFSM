Imports BaseDeDatos.alumno
Imports BaseDeDatos.Datos
Public Class ingresar

    Dim inicial As principal
    Dim alumnos As New alumno
    Dim datos As New Datos
    Public Sub New(ByVal inicial As principal)
        InitializeComponent()

        Me.inicial = inicial

    End Sub
    Private Sub BtnAceptar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnAceptar.Click
        alumnos.Nombre = TxtNombre.Text
        alumnos.Apellido = TxtApellido.Text
        alumnos.Rut = TxtRut.Text
        alumnos.FechaNacimiento = DtpFecha.Value
        alumnos.Genero = CmbGenero.SelectedValue

        If datos.validarAlumno(alumnos) Then
            datos.insertar(alumnos)
        Else
            MsgBox("El alumno ya existe")
        End If
    End Sub


    Private Sub BtnCancelar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnCancelar.Click
        inicial.Show()
        Me.Dispose()
    End Sub

    Private Sub ingresar_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

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
End Class