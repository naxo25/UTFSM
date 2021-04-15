<%-- 
    Document   : listado
    Created on : 19-ago-2016, 18:32:36
    Author     : alumnosinf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listado de nombres!</h1>
        <%
            String[] listado = new String[3];
            listado[0] = "Pedro";
            listado[1] = "Juan";
            listado[2] = "Diego";
            request.setAttribute("listadito",listado);
        %>
        <table>
            <tr>
                <th>Nro</th>
                <th>Nombre</th>
            </tr>
            <c:forEach varStatus="status"
                       var="nombres"
                       items="${listadito}">
                <tr>
                    <td>${status.count}</td>
                    <td><c:out value="${nombres}"/></td>
                </tr>       
            </c:forEach>
        </table>
        
        <hr />
        <a href="<c:url value="/index.jsp" />">
            Volver
        </a>
            
    </body>
</html>
