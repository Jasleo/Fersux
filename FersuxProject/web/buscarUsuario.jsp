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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <title>Fersux : Buscar Amigos</title>
        <style>
            .navbar-nav.navbar-center {
                position: absolute;
                left: 50%;
                transform: translatex(-50%);
            }

            .navbar-brand{
                padding: 30px 30px;
            }
            body{    
                background-image: url("img/dulce.png");
            }
        </style>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #9D7CAD">
            <a class="navbar-brand" href="#"><h1 style="color: #F1B05C;">Fersux</h1></a>
            <img src="img/caramelo.png" width="70" height="70">
            <small id="emailHelp" class="form-text text-muted">RELLENOOOOOOOOOOOOOOOOOOOOOO</small>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                    <center><h3 style="color:#EFB352">
                            <%            int idAhora = 0;
                                if (u != null) {
                                    out.print(u.getNombre());
                                    idAhora = u.getId();
                                }
                            %>
                        </h3></center>
                    </li>
                </ul>
                <!Barra para buscar usuarios>
                <small id="emailHelp" class="form-text text-muted">RELLENOOOOOOOOOOOOOOOOOOOOOO</small>
                <form action="buscarUsuario.jsp" method="POST" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar Amigos" name="txtBuscarUsuarios" aria-label="Search">
                    <button class="btn btn btn-warning my-2 my-sm-0" type="submit">Buscar mas amigos</button>
                </form>
                <small id="emailHelp" class="form-text text-muted">REL</small>

                <form action="inicio.jsp">
                    <button class="btn btn btn-warning my-2 my-sm-0" type="submit"> Volver</button>

                </form>
            </div>
        </nav>

        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong><h3 style="color:#EFB352">Amigos encontrados...</h3></strong>
        </div>
    <center>
        <div class="jumbotron" style="border-radius: 10px 10px 10px 10px; width: 700px; background-color: #F7EFE7;">
            <%            String txtBuscar = request.getParameter("txtBuscarUsuarios");
                int idActual = 0;
                if (u != null) {
                    idActual = u.getId();
                }

                if (txtBuscar != null) {
                    Data d = new Data();
                    List<Usuario> usuarios = d.getUsuarios(txtBuscar, idActual);

                    for (Usuario usu : usuarios) {
                        out.println("<tr>");
                        out.println("Nombre:" + usu.getNombre() + "<br>");
                        out.println("Apellido: " + usu.getApellido() + "<br>");

                        out.println("<form action='seguirUsuario.do' method='post'>");
                        out.println("<input type='submit' value='Seguir' class='btn btn-warning'><br>");
                        out.println("<input type='hidden' value='" + usu.getId() + "' name = 'usuarioParaSeguir'>");
                        out.println("<input type='hidden' value='" + idActual + "' name = 'usuarioActual'>");
                        out.println("</form>");
                    }
                }
            %>
        </div>
    </center>
</body>
</html>
