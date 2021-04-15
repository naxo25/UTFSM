<%-- 
    Document   : etiquetas
    Created on : 01-08-2016, 07:32:13 PM
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .titulo-par { color : red; font-style: italic; }
            .titulo-impar { color : blue; }
        </style>
    </head>
    <body>
        <h1>Java con JSTL + EL</h1>
        <c:forEach var="i" begin="1" end="6" step="1">
            <h${i} class="${i%2==0 ? 'titulo-par' : 'titulo-impar'}">
                CICLO CON JSTL + EL: i = ${i}
            </h${i}>             
        </c:forEach>
    </body>
</html>
