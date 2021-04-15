<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validaciones</title>
    </head>
    <body>
        <h1>Validaciones</h1>
        <form action="<c:url value="/form/rango.html" />" 
              method="post">
            Ingrese un número entre 1 y 100: 
            <input type="text" name="numero" 
                   value="<c:out value="${mapDatos['numero']}" />" />

            <br />
            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
