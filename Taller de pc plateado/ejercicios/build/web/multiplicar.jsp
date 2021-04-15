<%-- 
    Document   : multiplicar
    Created on : 19-ago-2016, 18:32:45
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
        <h1>Multiplicaciones!</h1>
        <table>
        <c:forEach var="i" begin="1" end="10">
            <c:forEach var="b" begin="1" end="10">
                <tr hover:green>
                    <td> ${i} * ${b} = ${i * b} </td>
                </tr>
            </c:forEach>
        </c:forEach>
        </table>
    
    <a href="<c:url value="/index.jsp" />">
        Volver
    </a>
            
    </body>
</html>
