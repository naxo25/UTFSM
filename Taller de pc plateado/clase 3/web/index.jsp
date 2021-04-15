<%-- 
    Document   : index
    Created on : 19-ago-2016, 17:42:12
    Author     : alumnosinf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>wena shoro!</h1>
        
        <p style="color:blue">
        <%
        out.print("hola, estoy en java");
        %>
        </p>
        <p>
            <a href="<c:url value="/tablas.jsp" />">
                 ir a las tablas
            </a>
        </p>
    </body>
</html>
