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
        <form action="<c:url value="/form/multicheckbox.html" />" 
              method="post">
            Zonas de Chile <br />
            <c:forEach var="zona" items="${listaZonas}">
                <input id="chkZona${zona.codigo}" type="checkbox" name="zona" 
                       value="<c:out value="${zona.codigo}" />" 
                       ${mapDatos['zona_'.concat(zona.codigo)] eq zona.codigo ? 'checked' : ''} 
                       />
                <label for="chkZona${zona.codigo}">
                    <c:out value="${zona.nombre}" />
                </label>            
                <br />
            </c:forEach>

            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
