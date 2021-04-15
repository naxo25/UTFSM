Public Class Sudoku_PDI_init

    Private Sub Btn_jugar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_jugar.Click
        Dim sudoku As New Sudoku_PDI_Game(Me)
        Me.Hide()
        sudoku.ShowDialog()

    End Sub

    Private Sub Btn_salir_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_salir.Click
        Me.Dispose()
    End Sub
End Class