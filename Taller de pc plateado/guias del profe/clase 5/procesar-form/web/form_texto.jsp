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
        <form action="<c:url value="/form/texto.html" />" 
              method="post">
            Nombre: 
            <input type="text" name="nombre" 
                   value="<c:out value="${mapDatos['nombre']}" />" />
            <br />
            Apellido Paterno:
            <input type="text" name="apellidoPaterno" 
                   value="<c:out value="${mapDatos['apellidoPaterno']}" />" />
            <br />
            Apellido Materno:
            <input type="text" name="apellidoMaterno" 
                   value="<c:out value="${mapDatos['apellidoMaterno']}" />" />
            <br />

            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
