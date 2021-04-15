Imports BaseDeDatos.principal
Imports BaseDeDatos.Datos
Public Class ConsultarIngresoEgreso

    Dim datos As New Datos
    Dim principal As New principal()
    Dim ingresoegreso As New IngresoEgreso

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
        dgv.DataSource = datos.getDatosIngresoEgreso()
        dgv.Columns(0).Visible = False

        cmbtipo.DisplayMember = "Text"
        cmbtipo.ValueMember = "Value"
        Dim tb As New DataTable
        tb.Columns.Add("Text", GetType(String))
        tb.Columns.Add("value", GetType(Integer))
        tb.Rows.Add("Colo-Colo", 0)
        tb.Rows.Add("Universidad de Chile", 1)
        tb.Rows.Add("Santiago Wanderers", 2)
        cmbtipo.DataSource = tb

        cmbid.DisplayMember = "Text"
        cmbid.ValueMember = "Value"
        Dim tb2 As New DataTable
        tb2.Columns.Add("Text", GetType(String))
        tb2.Columns.Add("value", GetType(Integer))
        tb2.Rows.Add("Ingreso", 0)
        tb2.Rows.Add("Egreso", 1)
        cmbid.DataSource = tb2

        grupo.Visible = False
        Button1.Visible = True
        If Me.Text = "Modificando" Or Me.Text = "Eliminando" Then
            grupo.Visible = True
        End If
        
    End Sub

    Private Sub eliminar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles eliminar.Click
        datos.EliminarIngresoEgreso(ingresoegreso)
    End Sub

    Private Sub modificar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles modificar.Click
        datos.ModificarIngresoEgreso(ingresoegreso)
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

    Private Sub dgv_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgv.CellContentClick
        ingresoegreso.nombre = dgv.SelectedRows.Item(0).Cells(0).Value.ToString()
        ingresoegreso.detalle = dgv.SelectedRows.Item(0).Cells(1).Value.ToString()
        ingresoegreso.fecha = Date.Parse(dgv.SelectedRows.Item(0).Cells(2).Value)
        ingresoegreso.monto = Integer.Parse(dgv.SelectedRows.Item(0).Cells(3).Value)
        ingresoegreso.idtipomovimiento = Integer.Parse(dgv.SelectedRows.Item(0).Cells(4).Value)
        ingresoegreso.idclub = Integer.Parse(dgv.SelectedRows.Item(0).Cells(5).Value)

        If Me.Text = "Modificando" Then
            nombre.Text = ingresoegreso.nombre
            detalle.Text = ingresoegreso.detalle
            fecha.Value = ingresoegreso.fecha
            monto.Text = ingresoegreso.monto
            cmbtipo.SelectedValue = ingresoegreso.idtipomovimiento
            cmbid.SelectedValue = ingresoegreso.idclub
        End If

        If Me.Text = "Eliminando" Then
            nombre.Text = ingresoegreso.nombre
        End If
    End Sub
End Class