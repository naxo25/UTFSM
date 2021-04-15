<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmPrincipal
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
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

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.msPrincipal = New System.Windows.Forms.MenuStrip()
        Me.InicioToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VentasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MarcasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ModelosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ConsultasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.UsuariosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.GenerarVentaToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IngresarMarcaToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ActualizarMarcaToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.IngresarModeloToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ActualizarModeloToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.msPrincipal.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'msPrincipal
        '
        Me.msPrincipal.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.InicioToolStripMenuItem, Me.VentasToolStripMenuItem, Me.MarcasToolStripMenuItem, Me.ModelosToolStripMenuItem})
        Me.msPrincipal.Location = New System.Drawing.Point(0, 0)
        Me.msPrincipal.Name = "msPrincipal"
        Me.msPrincipal.Size = New System.Drawing.Size(557, 24)
        Me.msPrincipal.TabIndex = 0
        Me.msPrincipal.Text = "MenuStrip1"
        '
        'InicioToolStripMenuItem
        '
        Me.InicioToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ConsultasToolStripMenuItem, Me.UsuariosToolStripMenuItem})
        Me.InicioToolStripMenuItem.Name = "InicioToolStripMenuItem"
        Me.InicioToolStripMenuItem.Size = New System.Drawing.Size(48, 20)
        Me.InicioToolStripMenuItem.Text = "Inicio"
        '
        'VentasToolStripMenuItem
        '
        Me.VentasToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.GenerarVentaToolStripMenuItem})
        Me.VentasToolStripMenuItem.Name = "VentasToolStripMenuItem"
        Me.VentasToolStripMenuItem.Size = New System.Drawing.Size(54, 20)
        Me.VentasToolStripMenuItem.Text = "Ventas"
        '
        'MarcasToolStripMenuItem
        '
        Me.MarcasToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.IngresarMarcaToolStripMenuItem, Me.ActualizarMarcaToolStripMenuItem})
        Me.MarcasToolStripMenuItem.Name = "MarcasToolStripMenuItem"
        Me.MarcasToolStripMenuItem.Size = New System.Drawing.Size(57, 20)
        Me.MarcasToolStripMenuItem.Text = "Marcas"
        '
        'ModelosToolStripMenuItem
        '
        Me.ModelosToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.IngresarModeloToolStripMenuItem, Me.ActualizarModeloToolStripMenuItem})
        Me.ModelosToolStripMenuItem.Name = "ModelosToolStripMenuItem"
        Me.ModelosToolStripMenuItem.Size = New System.Drawing.Size(65, 20)
        Me.ModelosToolStripMenuItem.Text = "modelos"
        '
        'ConsultasToolStripMenuItem
        '
        Me.ConsultasToolStripMenuItem.Name = "ConsultasToolStripMenuItem"
        Me.ConsultasToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.ConsultasToolStripMenuItem.Text = "consultas"
        '
        'UsuariosToolStripMenuItem
        '
        Me.UsuariosToolStripMenuItem.Name = "UsuariosToolStripMenuItem"
        Me.UsuariosToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.UsuariosToolStripMenuItem.Text = "usuarios"
        '
        'GenerarVentaToolStripMenuItem
        '
        Me.GenerarVentaToolStripMenuItem.Name = "GenerarVentaToolStripMenuItem"
        Me.GenerarVentaToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.GenerarVentaToolStripMenuItem.Text = "generar venta"
        '
        'IngresarMarcaToolStripMenuItem
        '
        Me.IngresarMarcaToolStripMenuItem.Name = "IngresarMarcaToolStripMenuItem"
        Me.IngresarMarcaToolStripMenuItem.Size = New System.Drawing.Size(160, 22)
        Me.IngresarMarcaToolStripMenuItem.Text = "ingresar marca"
        '
        'ActualizarMarcaToolStripMenuItem
        '
        Me.ActualizarMarcaToolStripMenuItem.Name = "ActualizarMarcaToolStripMenuItem"
        Me.ActualizarMarcaToolStripMenuItem.Size = New System.Drawing.Size(160, 22)
        Me.ActualizarMarcaToolStripMenuItem.Text = "actualizar marca"
        '
        'IngresarModeloToolStripMenuItem
        '
        Me.IngresarModeloToolStripMenuItem.Name = "IngresarModeloToolStripMenuItem"
        Me.IngresarModeloToolStripMenuItem.Size = New System.Drawing.Size(168, 22)
        Me.IngresarModeloToolStripMenuItem.Text = "ingresar modelo"
        '
        'ActualizarModeloToolStripMenuItem
        '
        Me.ActualizarModeloToolStripMenuItem.Name = "ActualizarModeloToolStripMenuItem"
        Me.ActualizarModeloToolStripMenuItem.Size = New System.Drawing.Size(168, 22)
        Me.ActualizarModeloToolStripMenuItem.Text = "actualizar modelo"
        '
        'PictureBox1
        '
        Me.PictureBox1.Location = New System.Drawing.Point(13, 78)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(532, 172)
        Me.PictureBox1.TabIndex = 1
        Me.PictureBox1.TabStop = False
        '
        'FrmPrincipal
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Red
        Me.ClientSize = New System.Drawing.Size(557, 262)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.msPrincipal)
        Me.MainMenuStrip = Me.msPrincipal
        Me.Name = "FrmPrincipal"
        Me.Text = "Bienvenido"
        Me.msPrincipal.ResumeLayout(False)
        Me.msPrincipal.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents msPrincipal As System.Windows.Forms.MenuStrip
    Friend WithEvents InicioToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ConsultasToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents UsuariosToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VentasToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents GenerarVentaToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MarcasToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents IngresarMarcaToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ActualizarMarcaToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ModelosToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents IngresarModeloToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ActualizarModeloToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
End Class
