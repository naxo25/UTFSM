<%-- 
    Document   : titulos
    Created on : 19-ago-2016, 18:31:49
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
        <c:forEach var="i" begin="1" end="6">
            <h${i}>Titulos kaflsksfalkkfaslk </h${i}>
        </c:forEach>>
        
    <a href="<c:url value="/index.jsp" />">
        Volver
    </a>    
        
    </body>
</html>
