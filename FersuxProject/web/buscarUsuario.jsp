<%-- 
    Document   : buscarUsuario
    Created on : 16-11-2017, 23:02:47
    Author     : diego
--%>

<%@page import="model.bd.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="model.bd.Data"%>
<%@include file="validar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fersux : Buscar Amigos</title>
    </head>
    <body>
        <%
            String txtBuscar = request.getParameter("txtBuscarUsuarios");
        %>
        <form action="buscarUsuario.jsp" method="POST">
            <input type="search" name="txtBuscarUsuarios" placeholder="Buscar Amigos" value="<% if(txtBuscar != null){%> <%=txtBuscar%> <%}%>">
            <input type="submit" value="Buscar">
        </form>
        
        <%
            int idActual = 0;
            if(u != null){
                idActual = u.getId();
            }            
            
            if (txtBuscar != null) {
                out.println("<tr>");
                out.println("<th>Nombre</th>");
                out.println("<th>Apellido</th>");
                out.println("<th>Seguir</th>");
                out.println("</tr>");

                Data d = new Data();
                List<Usuario> usuarios = d.getUsuarios(txtBuscar, idActual);

                for (Usuario usu : usuarios) {
                    out.println("<tr>");
                    out.println("<td>" + usu.getNombre() + "</td>");
                    out.println("<td>" + usu.getApellido() + "</td>");

                    out.println("<td>");
                    out.println("<form action='seguirUsuario.do' method='post'>");
                    out.println("<input type='submit' value='Seguir' >");
                    out.println("<input type='hidden' value='" + usu.getId() + "' name = 'usuarioParaSeguir'>");
                    out.println("<input type='hidden' value='"+idActual+"' name = 'usuarioActual'>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                }
            }
        %>
    </body>
</html>
