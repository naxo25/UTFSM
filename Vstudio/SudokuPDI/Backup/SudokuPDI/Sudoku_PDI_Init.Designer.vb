<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Sudoku_PDI_init
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Sudoku_PDI_init))
        Me.Btn_salir = New System.Windows.Forms.Button
        Me.Btn_jugar = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Btn_salir
        '
        Me.Btn_salir.BackColor = System.Drawing.Color.CadetBlue
        Me.Btn_salir.Font = New System.Drawing.Font("Kristen ITC", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Btn_salir.Location = New System.Drawing.Point(479, 320)
        Me.Btn_salir.Name = "Btn_salir"
        Me.Btn_salir.Size = New System.Drawing.Size(93, 40)
        Me.Btn_salir.TabIndex = 0
        Me.Btn_salir.Text = "Salir"
        Me.Btn_salir.UseVisualStyleBackColor = False
        '
        'Btn_jugar
        '
        Me.Btn_jugar.BackColor = System.Drawing.Color.Orange
        Me.Btn_jugar.Font = New System.Drawing.Font("Kristen ITC", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Btn_jugar.Location = New System.Drawing.Point(479, 274)
        Me.Btn_jugar.Name = "Btn_jugar"
        Me.Btn_jugar.Size = New System.Drawing.Size(93, 40)
        Me.Btn_jugar.TabIndex = 1
        Me.Btn_jugar.Text = "Jugar"
        Me.Btn_jugar.UseVisualStyleBackColor = False
        '
        'Sudoku_PDI_init
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.LawnGreen
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Image)
        Me.CausesValidation = False
        Me.ClientSize = New System.Drawing.Size(584, 372)
        Me.Controls.Add(Me.Btn_jugar)
        Me.Controls.Add(Me.Btn_salir)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(600, 410)
        Me.MinimizeBox = False
        Me.MinimumSize = New System.Drawing.Size(600, 410)
        Me.Name = "Sudoku_PDI_init"
        Me.Text = "Sudoku Inicio"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents Btn_salir As System.Windows.Forms.Button
    Friend WithEvents Btn_jugar As System.Windows.Forms.Button
End Class
