<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validación por Componente Web</title>
        <style>
            .msg-error {
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Validación por Componente Web</h1>
        <form action="<c:url value="/form/validacion.html" />" 
              method="post">
            Nombre: 
            <input type=text name="nombre"
                   value="<c:out value="${mapDatos['nombre']}" />" />
            <span style="color:red">
                <c:out value="${mapMensajes['nombre']}" />
            </span>
            <br />
            Ingrese un número entre 18 y 65: 
            <input type="text" name="numero" 
                   value="<c:out value="${mapDatos['numero']}" />" />
            <span style="color:red">
                <c:out value="${mapMensajes['numero']}" />
            </span>
            <br />

            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
