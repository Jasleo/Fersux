<%-- 
    Document   : inicio
    Created on : 14-nov-2017, 11:33:07
    Author     : dhenriquez
--%>

<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <title>Fersux</title>
    </head>
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
                    <center><h3 style="color:#EFB352">Bienvenido
                            <%            int idActual = 0;
                                if (u != null) {
                                    out.print(u.getNombre());
                                    idActual = u.getId();
                                }
                            %>
                        </h3></center>
                    </li>
                </ul>
                <!Barra para buscar usuarios>
                <small id="emailHelp" class="form-text text-muted">RELLENOOOOOOO</small>
                <form action="buscarUsuario.jsp" method="POST" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar Amigos" name="txtBuscarUsuarios" aria-label="Search">
                    <button class="btn btn btn-warning my-2 my-sm-0" type="submit">Buscar</button>
                </form>
                <small id="emailHelp" class="form-text text-muted">REL</small>

                <form action="cerrarSesion.do">
                    <button class="btn btn btn-warning my-2 my-sm-0" type="submit">Cerrar Sesion</button>

                </form>
            </div>
        </nav>
        <!Div en el cual se mostrara la foto de perfil, el nombre, la cantidad de publicaciones 
        cantidad de seguidores y cant de seguidos>
    <%
        int cantPublicaciones = new Data().getCantPublicaciones(u.getId());
        int cantSeguidores = new Data().getCantSeguidores(u.getId());
        int cantSeguidos = new Data().getCantSeguidos(u.getId());
    %>
    <div class="row" style="margin-top:10px; margin-right: 10px; margin-left: 2px;">
        <div class="col-md-5 col-md-offset-3">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong><h3 style="color:#EFB352">Datos personales</h3></strong>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Nombre : <%= u.getNombre()%>
                    </li><li class="list-group-item d-flex justify-content-between align-items-center">
                        Apellido : <%= u.getApellido()%>
                    </li><li class="list-group-item d-flex justify-content-between align-items-center">
                        Nombre de usuario : <%= u.getNombreUsuario()%>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Cantidad de Publicaciones :
                        <span class="badge badge-warning badge-pill align-items-center"><%= cantPublicaciones%></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Cantidad de Seguidores :
                        <span class="badge badge-warning badge-pill"><%= cantSeguidos%></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Cantidad de Seguidos :
                        <span class="badge badge-warning badge-pill"><%= cantSeguidores%></span>
                    </li>      
                </ul>
            </div>

        </div>
        <div style="margin-left: 70px; width: 600px;">
            <center>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong><h3 style="color:#EFB352">Publicaciones</h3></strong>
                    <form action ="crearPublicacion.do" method="POST">
                        <textarea rows="4" cols="50" name="txtPublicacion" required></textarea>
                        <input type="hidden" value="<%= u.getId()%>" name="idUsuario"><br>
                        <center>
                            <input type="submit" value="Publicar" class="btn btn-warning" style="width: 375px;">
                            <br><br>
                        </center>
                    </form>  
                    <%
                        Data d = new Data();
                        for (Publicacion p : d.getTodasLasPublicacion(u.getId())) {
                            out.print("<div>Fecha de Publicacion :" + p.getFechaPublicacion() + "</div>");
                            out.print("<div><textarea rows='2' cols='50' readonly>");
                            out.print(p.getTexto());
                            out.print("</textarea></div><br>");
                        }
                    %> 
                    <br>
                </div>
            </center>
        </div>
    </div>
</body>
</html>
