<%-- 
    Document   : inicio
    Created on : 14-nov-2017, 11:33:07
    Author     : dhenriquez
--%>

<%@page import="model.bd.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            Usuario u = new Usuario();
            out.println("<h1>" + u.getNombre() + "</h1>");
        %>
    </body>
</html>
