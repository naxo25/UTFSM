<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
    </head>
    <body>
        <h1>Formulario</h1>
        <form action="<c:url value="/form/checkbox.html" />" 
              method="post">
            Correo: 
            <input type="text" name="correo" 
                   value="<c:out value="${mapDatos['correo']}" />" />
            <br />
            <input id="chkNotificacion" type="checkbox" name="notificacion" 
                   value="S" ${mapDatos['notificacion'] eq 'S' ? 'checked' : ''} />
            <label for="chkNotificacion">
                Deseo recibir Notificaciones
            </label>            

            <br />
            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
