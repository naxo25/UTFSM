Imports BaseDeDatos.principal
Imports BaseDeDatos.Datos
Imports BaseDeDatos.IngresoEgreso

Public Class Ingresar

    Dim datos As New Datos
    Dim principal As New principal()
    Dim IngresoEgreso As New IngresoEgreso()

    Public Sub New(ByVal principal As principal)

        ' Llamada necesaria para el Diseñador de Windows Forms.
        InitializeComponent()
        Me.principal = principal
        ' Agregue cualquier inicialización después de la llamada a InitializeComponent().

    End Sub

    Private Sub Button1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        principal.Show()
        Me.Dispose()
    End Sub

    Private Sub Label1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label1.Click

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click

        IngresoEgreso.nombre = nombreUser.text
        IngresoEgreso.detalle = detalle.text
        IngresoEgreso.fecha = fecha.Value
        IngresoEgreso.monto = monto.text
        IngresoEgreso.idtipomovimiento = cmbtipo.SelectedValue
        IngresoEgreso.idclub = cmbclub.SelectedValue
        datos.insertarIngresoEgreso(IngresoEgreso)

        MsgBox("Operación realizada con exito!!", MsgBoxStyle.Information, "Felicidades!")
    End Sub

    Private Sub Ingresar_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        cmbtipo.DisplayMember = "Text"
        cmbtipo.ValueMember = "Value"
        Dim tb As New DataTable
        tb.Columns.Add("Text", GetType(String))
        tb.Columns.Add("value", GetType(Integer))
        tb.Rows.Add("Colo-Colo", 0)
        tb.Rows.Add("Universidad de Chile", 1)
        tb.Rows.Add("Santiago Wanderers", 2)
        cmbtipo.DataSource = tb

        cmbclub.DisplayMember = "Text"
        cmbclub.ValueMember = "Value"
        Dim tb2 As New DataTable
        tb2.Columns.Add("Text", GetType(String))
        tb2.Columns.Add("value", GetType(Integer))
        tb2.Rows.Add("Ingreso", 0)
        tb2.Rows.Add("Egreso", 1)
        cmbclub.DataSource = tb2
    End Sub

    Private Sub monto_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles monto.KeyPress
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

    Private Sub monto_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles monto.TextChanged

    End Sub
End Class