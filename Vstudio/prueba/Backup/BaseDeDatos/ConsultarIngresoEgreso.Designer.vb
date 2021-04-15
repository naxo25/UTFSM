<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ConsultarIngresoEgreso
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.dgv = New System.Windows.Forms.DataGridView
        Me.Button1 = New System.Windows.Forms.Button
        Me.modificar = New System.Windows.Forms.Button
        Me.eliminar = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.nombre = New System.Windows.Forms.TextBox
        Me.detalle = New System.Windows.Forms.TextBox
        Me.monto = New System.Windows.Forms.TextBox
        Me.fecha = New System.Windows.Forms.DateTimePicker
        Me.cmbtipo = New System.Windows.Forms.ComboBox
        Me.cmbid = New System.Windows.Forms.ComboBox
        Me.grupo = New System.Windows.Forms.GroupBox
        CType(Me.dgv, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.grupo.SuspendLayout()
        Me.SuspendLayout()
        '
        'dgv
        '
        Me.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgv.Location = New System.Drawing.Point(72, 34)
        Me.dgv.Name = "dgv"
        Me.dgv.Size = New System.Drawing.Size(471, 180)
        Me.dgv.TabIndex = 0
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(402, 372)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "salir"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'modificar
        '
        Me.modificar.Location = New System.Drawing.Point(122, 372)
        Me.modificar.Name = "modificar"
        Me.modificar.Size = New System.Drawing.Size(75, 23)
        Me.modificar.TabIndex = 3
        Me.modificar.Text = "modificar"
        Me.modificar.UseVisualStyleBackColor = True
        '
        'eliminar
        '
        Me.eliminar.Location = New System.Drawing.Point(122, 372)
        Me.eliminar.Name = "eliminar"
        Me.eliminar.Size = New System.Drawing.Size(75, 23)
        Me.eliminar.TabIndex = 4
        Me.eliminar.Text = "eliminar"
        Me.eliminar.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(13, 15)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(44, 13)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Nombre"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(17, 57)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(40, 13)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "Detalle"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(20, 97)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(37, 13)
        Me.Label3.TabIndex = 7
        Me.Label3.Text = "Monto"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(266, 15)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(37, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Fecha"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(266, 50)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(28, 13)
        Me.Label5.TabIndex = 9
        Me.Label5.Text = "Tipo"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(266, 94)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(16, 13)
        Me.Label6.TabIndex = 10
        Me.Label6.Text = "Id"
        '
        'nombre
        '
        Me.nombre.Location = New System.Drawing.Point(110, 12)
        Me.nombre.Name = "nombre"
        Me.nombre.Size = New System.Drawing.Size(115, 20)
        Me.nombre.TabIndex = 11
        '
        'detalle
        '
        Me.detalle.Location = New System.Drawing.Point(110, 50)
        Me.detalle.Name = "detalle"
        Me.detalle.Size = New System.Drawing.Size(115, 20)
        Me.detalle.TabIndex = 12
        '
        'monto
        '
        Me.monto.Location = New System.Drawing.Point(110, 94)
        Me.monto.Name = "monto"
        Me.monto.Size = New System.Drawing.Size(115, 20)
        Me.monto.TabIndex = 13
        '
        'fecha
        '
        Me.fecha.Location = New System.Drawing.Point(330, 15)
        Me.fecha.Name = "fecha"
        Me.fecha.Size = New System.Drawing.Size(200, 20)
        Me.fecha.TabIndex = 14
        '
        'cmbtipo
        '
        Me.cmbtipo.FormattingEnabled = True
        Me.cmbtipo.Location = New System.Drawing.Point(330, 47)
        Me.cmbtipo.Name = "cmbtipo"
        Me.cmbtipo.Size = New System.Drawing.Size(133, 21)
        Me.cmbtipo.TabIndex = 15
        '
        'cmbid
        '
        Me.cmbid.FormattingEnabled = True
        Me.cmbid.Location = New System.Drawing.Point(330, 91)
        Me.cmbid.Name = "cmbid"
        Me.cmbid.Size = New System.Drawing.Size(126, 21)
        Me.cmbid.TabIndex = 16
        '
        'grupo
        '
        Me.grupo.Controls.Add(Me.cmbid)
        Me.grupo.Controls.Add(Me.cmbtipo)
        Me.grupo.Controls.Add(Me.fecha)
        Me.grupo.Controls.Add(Me.monto)
        Me.grupo.Controls.Add(Me.detalle)
        Me.grupo.Controls.Add(Me.nombre)
        Me.grupo.Controls.Add(Me.Label6)
        Me.grupo.Controls.Add(Me.Label5)
        Me.grupo.Controls.Add(Me.Label4)
        Me.grupo.Controls.Add(Me.Label3)
        Me.grupo.Controls.Add(Me.Label2)
        Me.grupo.Controls.Add(Me.Label1)
        Me.grupo.Location = New System.Drawing.Point(61, 236)
        Me.grupo.Name = "grupo"
        Me.grupo.Size = New System.Drawing.Size(532, 130)
        Me.grupo.TabIndex = 17
        Me.grupo.TabStop = False
        '
        'ConsultarIngresoEgreso
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(629, 434)
        Me.Controls.Add(Me.grupo)
        Me.Controls.Add(Me.eliminar)
        Me.Controls.Add(Me.modificar)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.dgv)
        Me.Name = "ConsultarIngresoEgreso"
        Me.Text = "Manipulación de datos"
        CType(Me.dgv, System.ComponentModel.ISupportInitialize).EndInit()
        Me.grupo.ResumeLayout(False)
        Me.grupo.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents dgv As System.Windows.Forms.DataGridView
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents modificar As System.Windows.Forms.Button
    Friend WithEvents eliminar As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents nombre As System.Windows.Forms.TextBox
    Friend WithEvents detalle As System.Windows.Forms.TextBox
    Friend WithEvents monto As System.Windows.Forms.TextBox
    Friend WithEvents fecha As System.Windows.Forms.DateTimePicker
    Friend WithEvents cmbtipo As System.Windows.Forms.ComboBox
    Friend WithEvents cmbid As System.Windows.Forms.ComboBox
    Friend WithEvents grupo As System.Windows.Forms.GroupBox
End Class
