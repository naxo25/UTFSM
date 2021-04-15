<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
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
        Me.ButtonClear = New System.Windows.Forms.Button()
        Me.ButtonSolve = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'ButtonClear
        '
        Me.ButtonClear.Location = New System.Drawing.Point(46, 212)
        Me.ButtonClear.Name = "ButtonClear"
        Me.ButtonClear.Size = New System.Drawing.Size(75, 23)
        Me.ButtonClear.TabIndex = 0
        Me.ButtonClear.Text = "Clear"
        Me.ButtonClear.UseVisualStyleBackColor = True
        '
        'ButtonSolve
        '
        Me.ButtonSolve.Location = New System.Drawing.Point(165, 212)
        Me.ButtonSolve.Name = "ButtonSolve"
        Me.ButtonSolve.Size = New System.Drawing.Size(75, 23)
        Me.ButtonSolve.TabIndex = 1
        Me.ButtonSolve.Text = "Solve"
        Me.ButtonSolve.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 262)
        Me.Controls.Add(Me.ButtonSolve)
        Me.Controls.Add(Me.ButtonClear)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Text = "Sudoku Solver"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ButtonClear As System.Windows.Forms.Button
    Friend WithEvents ButtonSolve As System.Windows.Forms.Button

End Class
