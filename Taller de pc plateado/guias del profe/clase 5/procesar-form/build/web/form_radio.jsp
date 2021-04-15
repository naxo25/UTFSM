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
        <form action="<c:url value="/form/radio.html" />" 
              method="post">
            Nombre: 
            <input type="text" name="nombre" 
                   value="<c:out value="${mapDatos['nombre']}" />" />
            <br />
            Sexo: 
            <input id="rbSexoM" type="radio" name="sexo" 
                   value="M" ${mapDatos['sexo'] eq 'M' ? 'checked' : ''} />
            <label for="rbSexoM">
                Masculino
            </label>            
            <input id="rbSexoF" type="radio" name="sexo" 
                   value="F" ${mapDatos['sexo'] eq 'F' ? 'checked' : ''} />
            <label for="rbSexoF">
                Femenino
            </label>            

            <br />
            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
