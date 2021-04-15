<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Pais</title>
    </head>
    <body>
                <%@include file="/menu.jsp" %>

        <h1>Formulario Pais</h1>
        <form action="<c:url value="/pais/formulario.html" />"
              method="post">
            Codigo: <c:out value="${mapDatos['codigo']}" />
            <input type="hidden" name="codigo" 
                   value="<c:out value="${mapDatos['codigo']}" />"
                   />
            <br />
            Nombre: 
            <input type="text" name="nombre" 
                   value="<c:out value="${mapDatos['nombre']}" />"
                   />
            <br/>
            <input type="submit" value="Actualizar Pais" />
            <c:out value="${mensaje}" />
        </form>
            
    </body>
</html>
