<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Canciones</title>
    </head>
    <body>
        <h1>Listado de Canciones</h1>
        <table border="1">
            <tr>
                <th>NRO</th>
                <th>CANCION</th>
                <th>DURACION</th>
            </tr>
            <c:forEach var="cancion" items="${listadoCancion}">
                <tr>
                    <td>${cancion.numero}</td>
                    <td><c:out value="${cancion.nombre}" /></td>
                    <td>
                        <fmt:formatNumber value="${cancion.duracion.minuto}"
                                          minIntegerDigits="2" />
                        :
                        <fmt:formatNumber value="${cancion.duracion.segundo}"
                                          minIntegerDigits="2"/>
                    </td>
                </tr>
            </c:forEach>
        </table>      

    </body>
</html>
