<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hola Servlet</title>
    </head>
    <body>
        <h1 style="color:blue">
            <c:out value="${mensaje.texto}" /> 
            <br />
            <fmt:formatDate value="${mensaje.fechaCreacion}"
                            pattern="dd-MM-YYYY hh:mm:ss" />
            
        </h1>
    </body>
</html>

