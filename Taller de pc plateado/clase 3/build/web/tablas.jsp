<%-- 
    Document   : tablas
    Created on : 19-ago-2016, 18:03:47
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
        <h1>ejercicios</h1>
        <ul>
            <li>
                <a href="<c:url value="/titulos.jsp" />">
                    titulos
                </a>
            </li>
            <li>
                <a href="<c:url value="/multiplicar.jsp" />">
                    multiplicar
                </a>
            </li>
            <li>
                <a href="<c:url value="/tablas_matriz.jsp" />">
                    tablas de multiplicación
                </a>
            </li>
            <li>
                <a href="<c:url value="/listado.jsp" />">
                    listado
                </a>
            </li>
            <li>
                <a href="<c:url value="/galeria.jsp" />">
                    galeria de imagenes
                </a>
            </li>
        </ul>             
    </body>
</html>
