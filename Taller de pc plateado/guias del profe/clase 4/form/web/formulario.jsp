<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
    </head>
    <body>
        <h1>Formulario</h1>
        <form action="<c:url value="/formulario.html" />" 
              method="post">
            Nombre: <input type="text" name="nombre" />
            <input type="submit" value="Saludar" />        
        </form>
        <h2 style="color: blue">
            <c:out value="${mensajeSaludo}" />
        </h2>
    </body>
</html>
