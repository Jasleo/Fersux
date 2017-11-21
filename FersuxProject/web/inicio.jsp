<%-- 
    Document   : inicio
    Created on : 14-nov-2017, 11:33:07
    Author     : dhenriquez
--%>

<%@page import="model.bd.Publicacion"%>
<%@page import="model.bd.Comentario"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fersux</title>
    </head>
    <body>
        <%            int idActual = 0;
            if (u != null) {
                out.println("<h1>" + u.getNombre() + "</h1>");
                idActual = u.getId();
            }
        %>

        <!Div en el cual se mostrara la foto de perfil, el nombre, la cantidad de publicaciones 
        cantidad de seguidores y cant de seguidos>
    <div>
        <img>
        <input type="text" value="<%= u.getNombre()%>" readonly="readonly">
        <input type="text" value="<%= u.getApellido()%>" readonly="readonly">
        <input type="text" value="<%= u.getNombreUsuario()%>" readonly="readonly">
        Publicaciones :
        <%
            int cantPublicaciones = new Data().getCantPublicaciones(u.getId());
        %>
        <input type="text" value="<%= cantPublicaciones%>" readonly="readonly">
        Seguidores :
        <%
            int cantSeguidores = new Data().getCantSeguidores(u.getId());
        %>
        <input type="text" value="<%= cantSeguidores%>" readonly="readonly">
        Seguidos :
        <%
            int cantSeguidos = new Data().getCantSeguidos(u.getId());
        %>
        <input type="text" value="<%= cantSeguidos%>" readonly="readonly">
    </div>

    <!Barra para buscar usuarios>
    <div>
        <form action="buscarUsuario.jsp" method="POST">
            <input type="search" name="txtBuscarUsuarios" placeholder="Buscar Amigos">
            <input type="submit" value="Buscar">
        </form>
    </div>

    <!Barra para buscar usuarios>
    <div>
        <form action="crearPublicacion.do" method="POST">
            <textarea name="txtPublicacion"></textarea>
            <input type="hidden" value="<%= idActual%>" name="idActual">

            <input type="submit" value="Publicar">
        </form>
    </div>


    <div>
        <table class="table">
            <form action ="crearPublicacion.do" method="POST">
                <tr>
                    <th><textarea rows="4" cols="50" name="txtPublicacion" required></textarea>
                        <input type="hidden" value="<%=u.getId()%>" name="idUsuario">
                        <input type="submit" value="Publicar">
                    </th>
                </tr>
            </form>
            <%
                Data d = new Data();
                for (Publicacion p : d.getPublicacion(u.getId())) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(p.getTexto());
                    out.print("<div class=''>Fecha Publicacion " + p.getFechaPublicacion()+ "</div>");
                    out.print("</td>");
                    out.print("</tr>");
                }
            %>
        </table>
    </div>

</body>
</html>
