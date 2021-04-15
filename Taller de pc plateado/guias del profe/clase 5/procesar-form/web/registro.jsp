<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registro</h1>
        <form action="<c:url value="/registro.html" />" method="post">

            Nombre: 
            <input type="text" name="nombre" 
                   value="<c:out value="${mapDatos['nombre']}" />" />
            <br />
            Fecha Nacimiento:
            <input type="text" name="fechaNacimiento" 
                   placeholder="dd-mm-aaaa"
                   value="<c:out value="${mapDatos['fechaNacimiento']}" />" />
            <br />
            Sexo: 
            <label>
                <input type="radio" name="sexo" value="M"
                       ${mapDatos['sexo'] eq 'M' ? 'checked' : ''} 
                       />
                Masculino
            </label>
            <label>
                <input type="radio" name="sexo" value="F" 
                       ${mapDatos['sexo'] eq 'F' ? 'checked' : ''} 
                       />
                Femenino
            </label>
            <br />
            Zona de Chile Favorita:
            <select name="zona">
                <c:forEach var="zona" items="${listaZonas}">
                    <option value="<c:out value="${zona.codigo}" />"
                            ${mapDatos['zona'] eq zona.codigo ? 'selected' : ''} >
                        <c:out value="${zona.nombre}" />
                    </option>
                </c:forEach>
            </select>
            <br />
            Pasatiempos:
            <br />
            <c:forEach var="pasatiempo" items="${listaPasatiempos}">
                <label>
                    <input type="checkbox" 
                           name="pasatiempo"
                           value="<c:out value="${pasatiempo.codigo}" />"
                           ${mapDatos['pasatiempo_'.concat(pasatiempo.codigo)] eq pasatiempo.codigo ? 'checked' : ''}
                           />
                    <c:out value="${pasatiempo.descripcion}" />
                </label>
                <br />
            </c:forEach>
            <input type="submit" value="Enviar" />
            <h2 style="color:blue">
                <c:out value="${mensaje}" />
            </h2>
        </form>
    </body>
</html>
