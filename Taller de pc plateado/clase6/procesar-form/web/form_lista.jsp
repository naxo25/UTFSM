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
        <form action="<c:url value="/form/lista.html" />" 
              method="post">
            Nombre: 
            <input type="text" name="nombre" 
                   value="<c:out value="${mapDatos['nombre']}" />" />
            <br />
            Zona de Chile: 
            <select name="zona">
                <c:forEach var="zona" items="${listaZonas}">
                    <option value="<c:out value="${zona.codigo}" />" 
                            ${mapDatos['zona'] eq zona.codigo ? 'selected' : ''}>

                        <c:out value="${zona.nombre}" />
                    </option>               
                </c:forEach>
            </select>

            <br />
            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
