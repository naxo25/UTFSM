<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Ingresar
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
        Me.Button1 = New System.Windows.Forms.Button
        Me.cmbtipo = New System.Windows.Forms.ComboBox
        Me.Button2 = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.fecha = New System.Windows.Forms.DateTimePicker
        Me.label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.nombreUser = New System.Windows.Forms.TextBox
        Me.detalle = New System.Windows.Forms.TextBox
        Me.monto = New System.Windows.Forms.TextBox
        Me.cmbclub = New System.Windows.Forms.ComboBox
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(229, 387)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(82, 23)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "salir"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'cmbtipo
        '
        Me.cmbtipo.FormattingEnabled = True
        Me.cmbtipo.Location = New System.Drawing.Point(168, 298)
        Me.cmbtipo.Name = "cmbtipo"
        Me.cmbtipo.Size = New System.Drawing.Size(175, 21)
        Me.cmbtipo.TabIndex = 1
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(56, 387)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(75, 23)
        Me.Button2.TabIndex = 2
        Me.Button2.Text = "aceptar"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(34, 301)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(99, 13)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Tipo de movimiento"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(34, 247)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(37, 13)
        Me.Label2.TabIndex = 4
        Me.Label2.Text = "Fecha"
        '
        'fecha
        '
        Me.fecha.Location = New System.Drawing.Point(143, 247)
        Me.fecha.Name = "fecha"
        Me.fecha.Size = New System.Drawing.Size(200, 20)
        Me.fecha.TabIndex = 5
        '
        'label3
        '
        Me.label3.AutoSize = True
        Me.label3.Location = New System.Drawing.Point(36, 31)
        Me.label3.Name = "label3"
        Me.label3.Size = New System.Drawing.Size(42, 13)
        Me.label3.TabIndex = 6
        Me.label3.Text = "nombre"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(36, 84)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(38, 13)
        Me.Label4.TabIndex = 7
        Me.Label4.Text = "detalle"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(36, 134)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(36, 13)
        Me.Label5.TabIndex = 8
        Me.Label5.Text = "monto"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(36, 185)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(35, 13)
        Me.Label6.TabIndex = 9
        Me.Label6.Text = "idclub"
        '
        'nombreUser
        '
        Me.nombreUser.Location = New System.Drawing.Point(154, 31)
        Me.nombreUser.Name = "nombreUser"
        Me.nombreUser.Size = New System.Drawing.Size(189, 20)
        Me.nombreUser.TabIndex = 10
        '
        'detalle
        '
        Me.detalle.Location = New System.Drawing.Point(154, 81)
        Me.detalle.Name = "detalle"
        Me.detalle.Size = New System.Drawing.Size(189, 20)
        Me.detalle.TabIndex = 11
        '
        'monto
        '
        Me.monto.Location = New System.Drawing.Point(154, 134)
        Me.monto.Name = "monto"
        Me.monto.Size = New System.Drawing.Size(189, 20)
        Me.monto.TabIndex = 12
        '
        'cmbclub
        '
        Me.cmbclub.FormattingEnabled = True
        Me.cmbclub.Location = New System.Drawing.Point(154, 182)
        Me.cmbclub.Name = "cmbclub"
        Me.cmbclub.Size = New System.Drawing.Size(189, 21)
        Me.cmbclub.TabIndex = 13
        '
        'Ingresar
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(404, 442)
        Me.Controls.Add(Me.cmbclub)
        Me.Controls.Add(Me.monto)
        Me.Controls.Add(Me.detalle)
        Me.Controls.Add(Me.nombreUser)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.label3)
        Me.Controls.Add(Me.fecha)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.cmbtipo)
        Me.Controls.Add(Me.Button1)
        Me.Name = "Ingresar"
        Me.Text = "ingresar"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents cmbtipo As System.Windows.Forms.ComboBox
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents fecha As System.Windows.Forms.DateTimePicker
    Friend WithEvents label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents nombreUser As System.Windows.Forms.TextBox
    Friend WithEvents detalle As System.Windows.Forms.TextBox
    Friend WithEvents monto As System.Windows.Forms.TextBox
    Friend WithEvents cmbclub As System.Windows.Forms.ComboBox
End Class
