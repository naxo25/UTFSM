<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color:greenyellow">
            <c:out value="${mensaje.texto}" />
            <br />
            <fmt:formatDate value="${mensaje.fechaCreacion}" 
                            pattern="dd-MM-yyyy HH:mm:ss" />
        </h1>
    </body>
</html>
