﻿Public Class Form1
    Class sudoku_textbox
        Inherits TextBox
        Protected Overrides Sub OnKeyPress(ByVal e As System.Windows.Forms.KeyPressEventArgs)
            If Char.IsDigit(e.KeyChar) Or e.KeyChar = " " Or e.KeyChar = ControlChars.Back Then
                e.Handled = False
            Else
                e.Handled = True
            End If
            If e.KeyChar = " " Or e.KeyChar = "0" Then
                e.KeyChar = ControlChars.Back
            End If
        End Sub
    End Class
    Dim cell(0 To 8, 0 To 8) As sudoku_textbox
    Dim grid(0 To 8, 0 To 8) As String
    Dim backtracking As Boolean = False

    Private Sub Form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim xxtra As Integer
        Dim yxtra As Integer
        For x As Integer = 0 To 8
            For y As Integer = 0 To 8
                cell(x, y) = New sudoku_textbox
                cell(x, y).Text = ""
                cell(x, y).Width = 20
                cell(x, y).Height = 20
                cell(x, y).MaxLength = 1
                cell(x, y).TextAlign = HorizontalAlignment.Center
                xxtra = 0
                yxtra = 0
                If x > 2 Then
                    xxtra = 4
                End If
                If x > 5 Then
                    xxtra = 8
                End If
                If y > 2 Then
                    yxtra = 4
                End If
                If y > 5 Then
                    yxtra = 8
                End If
                cell(x, y).Location = New Point(45 + x * 20 + xxtra, 15 + y * 20 + yxtra)
                Me.Controls.Add(cell(x, y))
                AddHandler cell(x, y).TextChanged, AddressOf cell_changed


            Next
        Next
    End Sub

    Private Sub cell_changed()
        If backtracking Then Return
        For x As Integer = 0 To 8
            For y As Integer = 0 To 8
                grid(x, y) = cell(x, y).Text
                cell(x, y).ForeColor = Color.Black
            Next
        Next
        For x = 0 To 8
            For y = 0 To 8
                If check_rows(x, y) Then
                    If check_columns(x, y) Then
                        If Not check_box(x, y) Then
                            cell(x, y).ForeColor = Color.Red
                        End If
                    Else
                        cell(x, y).ForeColor = Color.Red
                    End If
                Else
                    cell(x, y).ForeColor = Color.Red
                End If
            Next
        Next
    End Sub

    Function check_rows(ByVal xsender, ByVal ysender) As Boolean
        Dim noclash As Boolean = True
        For x As Integer = 0 To 8
            If grid(x, ysender) <> "" Then
                If x <> xsender Then
                    If grid(x, ysender) = grid(xsender, ysender) Then
                        noclash = False
                    End If
                End If
            End If
        Next
        Return noclash
    End Function

    Function check_columns(ByVal xsender, ByVal ysender) As Boolean
        Dim noclash As Boolean = True
        For y As Integer = 0 To 8
            If grid(xsender, y) <> "" Then
                If y <> ysender Then
                    If grid(xsender, y) = grid(xsender, ysender) Then
                        noclash = False
                    End If
                End If
            End If
        Next
        Return noclash
    End Function

    Function check_box(ByVal xsender, ByVal ysender) As Boolean
        Dim noclash As Boolean = True
        Dim xstart As Integer
        Dim ystart As Integer
        If xsender < 3 Then
            xstart = 0
        ElseIf xsender < 6 Then
            xstart = 3
        Else
            xstart = 6
        End If
        If ysender < 3 Then
            ystart = 0
        ElseIf ysender < 6 Then
            ystart = 3
        Else
            ystart = 6
        End If
        For y As Integer = ystart To (ystart + 2)
            For x As Integer = xstart To (xstart + 2)
                If grid(x, y) <> "" Then
                    If Not (x = xsender And y = ysender) Then
                        If grid(x, y) = grid(xsender, ysender) Then
                            noclash = False
                        End If
                    End If
                End If
            Next
        Next
        Return noclash
    End Function

    Function backtrack(ByVal x As Integer, ByVal y As Integer) As Boolean
        'create variable for each tested number
        Dim numbers As Integer = 1
        'if element is empty string fill with next number until no clashes then
        If grid(x, y) = "" Then
            Do
                grid(x, y) = CStr(numbers)
                If check_rows(x, y) Then
                    If check_columns(x, y) Then
                        If check_box(x, y) Then
                            y = y + 1
                            If y = 9 Then
                                y = 0
                                x = x + 1
                                If x = 9 Then Return True
                            End If
                            If backtrack(x, y) Then Return True
                            y = y - 1
                            If y < 0 Then
                                y = 8
                                x = x - 1
                            End If
                            '1.call backtracking function with next element index (if the next element is the 82nd - ie grid(9,8) then return true, as the solution 
                            '  as been found.

                            '2.at this point, if there is a return value of true, then a true value should return from this instance of the function and all instance
                            '  will be removed from the stack, as the puzzle must be solved

                            '3.if a return value of false then we should try the next number in the numbers variable

                            '4.if numbers goes through every possibility, ie 1 to 9 then backtrack - return from the  function with a result of false
                        End If
                    End If
                End If

                numbers = numbers + 1
            Loop Until numbers = 10
            grid(x, y) = ""
            Return False
            'if the grid() element is not an empty string then just do step 2 from above. and return true if true and false if false
        Else
            y = y + 1
            If y = 9 Then
                y = 0
                x = x + 1
                If x = 9 Then Return True
            End If
            Return backtrack(x, y)
        End If

    End Function

    Private Sub ButtonClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonClear.Click
        Dim result As MsgBoxResult = MessageBox.Show("Are you sure you want to clear the puzzle?", "Clear", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
        If result = vbYes Then
            For x As Integer = 0 To 8
                For y As Integer = 0 To 8
                    cell(x, y).Text = ""
                Next
            Next
        End If
    End Sub

    Private Sub ButtonSolve_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSolve.Click
        backtracking = True
        For x As Integer = 0 To 8
            For y As Integer = 0 To 8
                grid(x, y) = cell(x, y).Text
            Next
        Next
        backtrack(0, 0)
        For x = 0 To 8
            For y = 0 To 8
                cell(x, y).Text = grid(x, y)
            Next
        Next
        backtracking = False
    End Sub
End Class