Public Class frmConsultas

    Private Sub frmConsultas_Disposed(sender As Object, e As System.EventArgs) Handles Me.Disposed
        
    End Sub

    Private Sub frmConsultas_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'DateTimePicker1.Enabled = False
    End Sub

    Private Sub btnCerrar_Click(sender As System.Object, e As System.EventArgs) Handles btnCerrar.Click
        Dim form As New FrmPrincipal()

        form.Show()
    End Sub

    Private Sub DateTimePicker1_ValueChanged(sender As System.Object, e As System.EventArgs) Handles DateTimePicker1.ValueChanged

    End Sub
End Class