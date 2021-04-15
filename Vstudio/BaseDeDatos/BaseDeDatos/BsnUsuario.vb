Imports BaseDeDatos.DaoUsuario
Imports BaseDeDatos.Usuario

Public Class BsnUsuario

    Dim daoUsuario As New DaoUsuario

    Public Function ValidarUsuario(usuario As Usuario)

        Return daoUsuario.ValidarUsuario(usuario)
    End Function

End Class
