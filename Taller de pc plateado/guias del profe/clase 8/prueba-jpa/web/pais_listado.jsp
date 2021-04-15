<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Pais</title>
    </head>
    <body>
        <%@include file="/menu.jsp" %>

        <h1>Listado Pais</h1>
        <table border="1">
            <tr>
                <th>CODIGO</th>
                <th>NOMBRE</th>
                <th>ACCION</th>
            </tr>
            <c:forEach var="pais" items="${listado}">
                <tr>
                    <td><c:out value="${pais.codigo}" /></td>
                    <td><c:out value="${pais.nombre}" /></td>
                    <td>
                        <!-- GENERA URL: /pais/formulario.html?codigo=XX -->
                        <c:url var="urlEditar" value="/pais/formulario.html">
                            <c:param name="codigo" value="${pais.codigo}" />
                        </c:url>
                        <a href="${urlEditar}">[actualizar]</a>
                    </td>
                </tr>                
            </c:forEach>
        </table>
    </body>
</html>
