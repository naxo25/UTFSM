<%-- 
    Document   : index
    Created on : 01-08-2016, 06:57:32 PM
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola TDC USM 2016-2</h1>
        
        <% for (int i = 1; i <= 6; i++ ){ %>
            <h<%=i %> 
                style="color: <%=((i%2 == 0) ? "red" : "blue") %>" >
                HOLA, VALOR DE i = <%=i %>
            </h<%=i%>>
        <% } %>
        
    </body>
</html>
