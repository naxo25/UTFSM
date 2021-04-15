Public Class FrmPrincipal

    Private Sub ConsultasToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ConsultasToolStripMenuItem.Click
        Dim formConsultas As New frmConsultas()

        Me.Hide()
        formConsultas.ShowDialog()

    End Sub
End Class