<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alcoholemia</title>
    </head>
    <body>        
        <h1><strong>Busqueda de Alcoholemia</strong></h1>
        <h3>Ingrese correo electrónico asociado a la alcoholemia buscada:</h3>
        <br><br>        
        <form method="post" action="<c:url value="/alcoholemia-busqueda.usm" />">
            <label>Correo electrónico: </label>
            <input type="text" name="email" value="<c:out value="${email}" />">
            <span>
                <c:out value="${mensaje}" />
            </span>
            <br>
            <br>
            <input type="submit" value="Calcular">        
            <span>
                <c:out value="${mapMensajes['mensaje']}" />
            </span>
            <BR>            
            <span>
                Estado: <c:out value="${mapMensajes['mensajeComplementario']}" />
            </span>             
            <BR>
            <BR>
            <BR>
            <h2>Coincidencias</h2>
            <table border="1">
                <tr> 
                    <th>Correo</th>                    
                </tr>
            <c:forEach var="registro"
                       items="${listadoRegistro}">
            <tr>
                <td><c:out value="${registro.correoElectronico}"></c:out></td>                               
            </tr>
            
            </c:forEach> 



                
            </table>
        </form>
        <BR>
        <br>
        <a href="<c:url value="/index.jsp"/> ">
            Volver
        </a>
</html>
