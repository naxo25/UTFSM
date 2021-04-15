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
            Nombre: <input type="text" name="nombre" 
                           value="<c:out value="${mapDatos['nombre']}" />"
                           />
        <br />
                
            Apellido Materno: <input type="text" name="apellidoM"
                             value="<c:out value="${mapDatos['apellidoM']}" />"
                             />
        <br />
                
            Apellido Paterno: <input type="text" name="apellidoP"
                             value="<c:out value="${mapDatos['apellidoP']}" />"
                             />
        <br />
            <input type="submit" value="Saludar" />        
        </form>
        <h2 style="color: blue">
            <c:out value="${mensajeSaludo}" />
        </h2>
    </body>
</html>
