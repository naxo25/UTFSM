<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class principal
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
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip
        Me.ConsulatToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ConsultarClubes = New System.Windows.Forms.ToolStripMenuItem
        Me.ConsultarIngresoEgresoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.IngresarIngresoEgresoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ModificarIngresoEgresoToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem
        Me.EliminarIngresoEgresoToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem
        Me.CerrarSesionToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ConsulatToolStripMenuItem, Me.CerrarSesionToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(568, 24)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'ConsulatToolStripMenuItem
        '
        Me.ConsulatToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ConsultarClubes, Me.ConsultarIngresoEgresoToolStripMenuItem, Me.IngresarIngresoEgresoToolStripMenuItem, Me.ModificarIngresoEgresoToolStripMenuItem1, Me.EliminarIngresoEgresoToolStripMenuItem1})
        Me.ConsulatToolStripMenuItem.Name = "ConsulatToolStripMenuItem"
        Me.ConsulatToolStripMenuItem.Size = New System.Drawing.Size(58, 20)
        Me.ConsulatToolStripMenuItem.Text = " Clubes"
        '
        'ConsultarClubes
        '
        Me.ConsultarClubes.Name = "ConsultarClubes"
        Me.ConsultarClubes.Size = New System.Drawing.Size(207, 22)
        Me.ConsultarClubes.Text = "Consultar clubes"
        '
        'ConsultarIngresoEgresoToolStripMenuItem
        '
        Me.ConsultarIngresoEgresoToolStripMenuItem.Name = "ConsultarIngresoEgresoToolStripMenuItem"
        Me.ConsultarIngresoEgresoToolStripMenuItem.Size = New System.Drawing.Size(207, 22)
        Me.ConsultarIngresoEgresoToolStripMenuItem.Text = "Consultar Ingreso/Egreso"
        '
        'IngresarIngresoEgresoToolStripMenuItem
        '
        Me.IngresarIngresoEgresoToolStripMenuItem.Name = "IngresarIngresoEgresoToolStripMenuItem"
        Me.IngresarIngresoEgresoToolStripMenuItem.Size = New System.Drawing.Size(207, 22)
        Me.IngresarIngresoEgresoToolStripMenuItem.Text = "Ingresar Ingreso/Egreso"
        '
        'ModificarIngresoEgresoToolStripMenuItem1
        '
        Me.ModificarIngresoEgresoToolStripMenuItem1.Name = "ModificarIngresoEgresoToolStripMenuItem1"
        Me.ModificarIngresoEgresoToolStripMenuItem1.Size = New System.Drawing.Size(207, 22)
        Me.ModificarIngresoEgresoToolStripMenuItem1.Text = "Modificar Ingreso/Egreso"
        '
        'EliminarIngresoEgresoToolStripMenuItem1
        '
        Me.EliminarIngresoEgresoToolStripMenuItem1.Name = "EliminarIngresoEgresoToolStripMenuItem1"
        Me.EliminarIngresoEgresoToolStripMenuItem1.Size = New System.Drawing.Size(207, 22)
        Me.EliminarIngresoEgresoToolStripMenuItem1.Text = "Eliminar Ingreso/Egreso"
        '
        'CerrarSesionToolStripMenuItem
        '
        Me.CerrarSesionToolStripMenuItem.Name = "CerrarSesionToolStripMenuItem"
        Me.CerrarSesionToolStripMenuItem.Size = New System.Drawing.Size(87, 20)
        Me.CerrarSesionToolStripMenuItem.Text = "Cerrar sesión"
        '
        'principal
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(568, 183)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "principal"
        Me.Text = "principal"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents ConsulatToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ConsultarClubes As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ConsultarIngresoEgresoToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents IngresarIngresoEgresoToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents CerrarSesionToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ModificarIngresoEgresoToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents EliminarIngresoEgresoToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
End Class
