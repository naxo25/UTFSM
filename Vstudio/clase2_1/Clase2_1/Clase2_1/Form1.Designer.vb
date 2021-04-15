<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmInicial
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
        Me.components = New System.ComponentModel.Container()
        Me.btnAceptar = New System.Windows.Forms.Button()
        Me.lblMensaje = New System.Windows.Forms.Label()
        Me.btnCerrar = New System.Windows.Forms.Button()
        Me.txtNombre = New System.Windows.Forms.TextBox()
        Me.txtApellido = New System.Windows.Forms.TextBox()
        Me.lblNombre = New System.Windows.Forms.Label()
        Me.lblApellido = New System.Windows.Forms.Label()
        Me.rbMasculino = New System.Windows.Forms.RadioButton()
        Me.rbFemenino = New System.Windows.Forms.RadioButton()
        Me.gboxGenero = New System.Windows.Forms.GroupBox()
        Me.chkSoltero = New System.Windows.Forms.CheckBox()
        Me.chkCasado = New System.Windows.Forms.CheckBox()
        Me.chkViudo = New System.Windows.Forms.CheckBox()
        Me.ErrorProvider1 = New System.Windows.Forms.ErrorProvider(Me.components)
        Me.gboxGenero.SuspendLayout()
        CType(Me.ErrorProvider1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'btnAceptar
        '
        Me.btnAceptar.Location = New System.Drawing.Point(288, 300)
        Me.btnAceptar.Name = "btnAceptar"
        Me.btnAceptar.Size = New System.Drawing.Size(75, 23)
        Me.btnAceptar.TabIndex = 7
        Me.btnAceptar.Text = "Aceptar"
        Me.btnAceptar.UseVisualStyleBackColor = True
        '
        'lblMensaje
        '
        Me.lblMensaje.Location = New System.Drawing.Point(25, 167)
        Me.lblMensaje.Name = "lblMensaje"
        Me.lblMensaje.Size = New System.Drawing.Size(236, 50)
        Me.lblMensaje.TabIndex = 1
        '
        'btnCerrar
        '
        Me.btnCerrar.Location = New System.Drawing.Point(40, 300)
        Me.btnCerrar.Name = "btnCerrar"
        Me.btnCerrar.Size = New System.Drawing.Size(75, 23)
        Me.btnCerrar.TabIndex = 6
        Me.btnCerrar.Text = "Cerrar"
        Me.btnCerrar.UseVisualStyleBackColor = True
        '
        'txtNombre
        '
        Me.txtNombre.Location = New System.Drawing.Point(81, 31)
        Me.txtNombre.MaxLength = 8
        Me.txtNombre.Name = "txtNombre"
        Me.txtNombre.Size = New System.Drawing.Size(180, 20)
        Me.txtNombre.TabIndex = 1
        '
        'txtApellido
        '
        Me.txtApellido.Location = New System.Drawing.Point(81, 75)
        Me.txtApellido.MaxLength = 8
        Me.txtApellido.Name = "txtApellido"
        Me.txtApellido.Size = New System.Drawing.Size(180, 20)
        Me.txtApellido.TabIndex = 2
        '
        'lblNombre
        '
        Me.lblNombre.AutoSize = True
        Me.lblNombre.Location = New System.Drawing.Point(28, 37)
        Me.lblNombre.Name = "lblNombre"
        Me.lblNombre.Size = New System.Drawing.Size(47, 13)
        Me.lblNombre.TabIndex = 5
        Me.lblNombre.Text = "Nombre:"
        '
        'lblApellido
        '
        Me.lblApellido.AutoSize = True
        Me.lblApellido.Location = New System.Drawing.Point(31, 75)
        Me.lblApellido.Name = "lblApellido"
        Me.lblApellido.Size = New System.Drawing.Size(47, 13)
        Me.lblApellido.TabIndex = 6
        Me.lblApellido.Text = "Apellido:"
        '
        'rbMasculino
        '
        Me.rbMasculino.AutoSize = True
        Me.rbMasculino.Location = New System.Drawing.Point(6, 34)
        Me.rbMasculino.Name = "rbMasculino"
        Me.rbMasculino.Size = New System.Drawing.Size(73, 17)
        Me.rbMasculino.TabIndex = 4
        Me.rbMasculino.TabStop = True
        Me.rbMasculino.Text = "Masculino"
        Me.rbMasculino.UseVisualStyleBackColor = True
        '
        'rbFemenino
        '
        Me.rbFemenino.AutoSize = True
        Me.rbFemenino.Location = New System.Drawing.Point(104, 34)
        Me.rbFemenino.Name = "rbFemenino"
        Me.rbFemenino.Size = New System.Drawing.Size(71, 17)
        Me.rbFemenino.TabIndex = 5
        Me.rbFemenino.TabStop = True
        Me.rbFemenino.Text = "Femenino"
        Me.rbFemenino.UseVisualStyleBackColor = True
        '
        'gboxGenero
        '
        Me.gboxGenero.Controls.Add(Me.rbMasculino)
        Me.gboxGenero.Controls.Add(Me.rbFemenino)
        Me.gboxGenero.Location = New System.Drawing.Point(34, 101)
        Me.gboxGenero.Name = "gboxGenero"
        Me.gboxGenero.Size = New System.Drawing.Size(200, 63)
        Me.gboxGenero.TabIndex = 3
        Me.gboxGenero.TabStop = False
        Me.gboxGenero.Text = "Género"
        '
        'chkSoltero
        '
        Me.chkSoltero.AutoSize = True
        Me.chkSoltero.Location = New System.Drawing.Point(40, 242)
        Me.chkSoltero.Name = "chkSoltero"
        Me.chkSoltero.Size = New System.Drawing.Size(59, 17)
        Me.chkSoltero.TabIndex = 8
        Me.chkSoltero.Text = "Soltero"
        Me.chkSoltero.UseVisualStyleBackColor = True
        '
        'chkCasado
        '
        Me.chkCasado.AutoSize = True
        Me.chkCasado.Location = New System.Drawing.Point(138, 242)
        Me.chkCasado.Name = "chkCasado"
        Me.chkCasado.Size = New System.Drawing.Size(62, 17)
        Me.chkCasado.TabIndex = 9
        Me.chkCasado.Text = "Casado"
        Me.chkCasado.UseVisualStyleBackColor = True
        '
        'chkViudo
        '
        Me.chkViudo.AutoSize = True
        Me.chkViudo.Location = New System.Drawing.Point(236, 242)
        Me.chkViudo.Name = "chkViudo"
        Me.chkViudo.Size = New System.Drawing.Size(53, 17)
        Me.chkViudo.TabIndex = 10
        Me.chkViudo.Text = "Viudo"
        Me.chkViudo.UseVisualStyleBackColor = True
        '
        'ErrorProvider1
        '
        Me.ErrorProvider1.ContainerControl = Me
        '
        'frmInicial
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(401, 365)
        Me.Controls.Add(Me.chkViudo)
        Me.Controls.Add(Me.chkCasado)
        Me.Controls.Add(Me.chkSoltero)
        Me.Controls.Add(Me.gboxGenero)
        Me.Controls.Add(Me.lblApellido)
        Me.Controls.Add(Me.lblNombre)
        Me.Controls.Add(Me.txtApellido)
        Me.Controls.Add(Me.txtNombre)
        Me.Controls.Add(Me.btnCerrar)
        Me.Controls.Add(Me.lblMensaje)
        Me.Controls.Add(Me.btnAceptar)
        Me.Name = "frmInicial"
        Me.Text = "234"
        Me.gboxGenero.ResumeLayout(False)
        Me.gboxGenero.PerformLayout()
        CType(Me.ErrorProvider1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnAceptar As System.Windows.Forms.Button
    Friend WithEvents lblMensaje As System.Windows.Forms.Label
    Friend WithEvents btnCerrar As System.Windows.Forms.Button
    Friend WithEvents txtNombre As System.Windows.Forms.TextBox
    Friend WithEvents txtApellido As System.Windows.Forms.TextBox
    Friend WithEvents lblNombre As System.Windows.Forms.Label
    Friend WithEvents lblApellido As System.Windows.Forms.Label
    Friend WithEvents rbMasculino As System.Windows.Forms.RadioButton
    Friend WithEvents rbFemenino As System.Windows.Forms.RadioButton
    Friend WithEvents gboxGenero As System.Windows.Forms.GroupBox
    Friend WithEvents chkSoltero As System.Windows.Forms.CheckBox
    Friend WithEvents chkCasado As System.Windows.Forms.CheckBox
    Friend WithEvents chkViudo As System.Windows.Forms.CheckBox
    Friend WithEvents ErrorProvider1 As System.Windows.Forms.ErrorProvider

End Class
