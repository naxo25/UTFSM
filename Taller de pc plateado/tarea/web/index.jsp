<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alcoholemia</title>
    </head>
    <body>        
        <h1><strong>Alcoholemia</strong></h1>
        <h3>Ingrese los datos a continuación:</h3>
        <br><br>
        
        <form method="post" action="<c:url value="/alcoholemia-resultados.usm" />">
            <label>Correo electrónico: </label>
            <input type="text" name="email" value="<c:out value="${mapDatos['email']}" />">
            <span>
                <c:out value="${mapMensajes['correoElectronico']}" />
            </span>
            <br>
            <label>Mililitros de bebida alcoholica: </label>
            <input  type="text" name="ml" maxlength="4" size="4" value="<c:out value="${mapDatos['ml']}" />">
            <span>
                <c:out value="${mapMensajes['ml']}" />
            </span>            
            <br>
            <label>Grados(°) de alcohol: </label>
            <input type="text" name="grados" maxlength="3" size="3" value="<c:out value="${mapDatos['grados']}" />">
            <span>
                <c:out value="${mapMensajes['grados']}" />
            </span>           
            <br>
            <label>Peso (en KG): </label>
            <input type="text" name="kilos" maxlength="3" size="3" value="<c:out value="${mapDatos['kilos']}" />">
            <span>
                <c:out value="${mapMensajes['kilos']}" />
            </span>            
            <br>
            <label>Sexo: </label>
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
            <span>
                <c:out value="${mapMensajes['sexo']}" />
            </span>            
            <br>
            <br>
            <input type="submit" value="Calcular">        
            <span>
                <c:out value="${mapMensajes['alcoholemia']}" />
            </span>
            <BR>            
            <span>
                Estado: <c:out value="${mapMensajes['mensajeComplementario']}" />
            </span>             
        </form>
        <BR>
        <br>
        <a href="<c:url value="/busqueda.jsp"/> ">
            Listar/Eliminar
        </a>
</html>
