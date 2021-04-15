<%-- 
    Document   : tablas_matriz
    Created on : 19-ago-2016, 18:32:08
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
        <h1>Matrix</h1>
        <table>
        <c:forEach var="i" begin="1" end="10">
          <tr>
            <c:forEach var="b" begin="1" end="10">
                    <td> ${i * b} </td>
            </c:forEach>
          </tr>
        </c:forEach>
        </table> 
        
    <a href="<c:url value="/index.jsp" />">
        Volver
    </a>    
        
    </body>
    
</html>
