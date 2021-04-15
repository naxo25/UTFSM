<%-- 
    Document   : galeria
    Created on : 19-ago-2016, 19:26:43
    Author     : alumnosinf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>galeria</h1>
        <table>
            <tr>
                <td>
                    <c:forEach var="i" begin="1" end="10">
                    <li>
                        <img src="imagenes/${i}.jpg" style="width: 150px; height:100px">
                        <p>imagenes/${i}.txt</p>
                    </li>
                    </c:forEach>>
                </td>
            </tr>
        </table>
    </body>
</html>
