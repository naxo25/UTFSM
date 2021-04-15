Imports BaseDeDatos.Conexion
Imports System.IO
Imports System.Data.OleDb
Imports system.data
Imports BaseDeDatos.user
Imports System.Math
Public Class Datos
    Dim conexion As New Conexion()

    Public Function validarUser(ByVal user As user)
        Dim command As New OleDbCommand
        Dim dataset As New DataSet
        command.Connection = conexion.getConexion()
        conexion.AbrirConexion()
        command.CommandText = "select * from Usuarios where Usuario = '" & user.usuario & "' and Password = '" & user.password & "'"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)
        conexion.CerrarConexion()
        Return dataset.Tables(0).Rows.Count

    End Function

    Public Function getDatos()

        Dim command As New OleDbCommand
        Dim dataset As New DataSet
        command.Connection = conexion.GetConexion()
        conexion.AbrirConexion()
        command.CommandText = "select * from Clubes"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)
        conexion.CerrarConexion()
        Return dataset.Tables(0)

    End Function

    Public Function getDatosIngresoEgreso()

        Dim command As New OleDbCommand
        Dim dataset As New DataSet
        command.Connection = conexion.GetConexion()
        conexion.AbrirConexion()
        command.CommandText = "select * from Ingresos_Egresos"
        Dim reader As New OleDbDataAdapter
        reader.SelectCommand = command
        reader.Fill(dataset)
        conexion.CerrarConexion()
        Return dataset.Tables(0)

    End Function

    Public Function insertarIngresoEgreso(ByVal IngresoEgreso As IngresoEgreso)
        Dim command As New OleDbCommand
        command.Connection = conexion.GetConexion()
        conexion.AbrirConexion()
        command.CommandText = "Insert into Ingresos_Egresos(Nombre,Detalle,Fecha,Monto,IDTipoMovimiento,IDClub) values ('" & IngresoEgreso.nombre & "','" & IngresoEgreso.detalle & "','" & IngresoEgreso.fecha.ToString() & "','" & IngresoEgreso.monto & "','" & IngresoEgreso.idtipomovimiento & "','" & IngresoEgreso.idclub & "')"
        command.ExecuteNonQuery()
        conexion.CerrarConexion()
        Return IngresoEgreso
    End Function

    Public Function ModificarIngresoEgreso(ByVal ingresoegreso As IngresoEgreso)
        Dim command As New OleDbCommand
        command.Connection = conexion.GetConexion()
        conexion.AbrirConexion()
        command.CommandText = "update Ingresos_Egresos set Nombre = '" & ingresoegreso.nombre & "',Detalle = '" & ingresoegreso.detalle & "',Fecha = '" & ingresoegreso.fecha.ToString() & "',Monto = '" & ingresoegreso.monto & "',IDTipoMovimiento = '" & ingresoegreso.idclub & "', IDClub = '" & ingresoegreso.idclub & "' where Nombre = " & ingresoegreso.nombre & ""
        command.ExecuteNonQuery()
        conexion.CerrarConexion()
        Return ingresoegreso
    End Function

    Public Function EliminarIngresoEgreso(ByVal ingresoegreso As IngresoEgreso)
        Dim command As New OleDbCommand
        command.Connection = conexion.GetConexion()
        conexion.AbrirConexion()
        command.CommandText = "delete from Ingresos_Egresos where Nombre = " & ingresoegreso.nombre & ""
        command.ExecuteNonQuery()
        conexion.CerrarConexion()
        Return ingresoegreso
    End Function
End Class
