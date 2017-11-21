<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    </head>
    <style>
        .navbar-nav.navbar-center {
            position: absolute;
            left: 50%;
            transform: translatex(-50%);
        }

        .navbar-brand{
            padding: 33px 40px;
        }
        body{    
            background-image: url("img/dulce.png");
        }
    </style>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #9D7CAD">
            <a class="navbar-brand" href="#"><h1 style="color: #F1B05C;">Fersux</h1></a>
            <img src="img/caramelo.png" width="70" height="70">
           
            <div class="collapse navbar-collapse" id="navbarNav">

                <ul class="navbar-nav navbar-right">
                    <li class="nav-item">
                        <form action="iniciarSesion.do" method="post" class="form-inline my-2 my-lg-0">
                            <small id="emailHelp" class="form-text text-muted">RELLENOOOO</small>
                            <input class="form-control mr-sm-2" type="email" name="correoIniciar" required="required" placeholder="Ingrese correo">                                                  
                            <input  class="form-control mr-sm-2" type="password" name="contrasniaIniciar" required="required" placeholder="Ingrese contraseña" aria-describedby="emailHelp">   

                            <input type="submit" value="Entrar" class="btn btn-warning">
                        </form>
                    </li>
                </ul>
            </div>
        </nav>
    <center>
        <div class="container mt-2">
            <div class="row justify-content-xl-center">
                <div class="col-md-6 col-md-offset-3">
                    <div class="row">
                        <form action="crearUsuario.do" method="POST" class="form-control">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>
                                    <h3 style="color:#EFB352">¿No tienes una cuenta?</h3>
                                    <h3 style="color:#EFB352">¡Registrate aqui!</h3>
                                </strong> 
                            </div>
                            <div class="form-group">
                                <label class="form-inline" for="inputNombre">Nombre  :</label>
                                <input name="txtNombreUsuario" type="text" class="form-control" placeholder="Ingrese:" required="required">
                            </div>

                            <div class="form-group">
                                <label class="form-inline" for="inputNombre">Apellido : </label>
                                <input name="txtApellido" type="text" class="form-control" placeholder="Ingrese:" required="required">
                            </div>

                            <div class="form-group">
                                <label class="form-inline" for="inputNombre"> E-Mail : </label>
                                <input name="txtEmail" type="email" class="form-control" placeholder="ejemplo@hotmail.com" required="required">
                            </div>

                            <div class="form-group">
                                <label class="form-inline"for="inputNombre">Nombre Usuario :  </label>
                                <input name="txtNombreUsuario" type="text" class="form-control" placeholder="Ingrese:" required="required">
                            </div>

                            <div class="form-group">
                                <label class="form-inline" for="inputNombre">Contraseña :  </label>
                                <input name="txtContrasena" type="password" class="form-control" placeholder="Ingrese:" required="required" minlength="8">
                            </div>

                            <div class="form-group">
                                <label class="form-inline" for="inputNombre"> Fecha Nacimiento :  </label>
                                <input name="txtFechaNacimiento" type="date" class="form-control" placeholder="DD/MM/AAAA" required="required">
                            </div>
                            <center>
                                <div class="form-inline" style="margin-right: 50px;">
                                    <label class="form-inline" for="inputNombre"> Mujer : </label>
                                    <input name="opSexo" type="radio" class="form-control" value="f"> 
                                </div>

                                <div class="form-inline">
                                    <label class="form-inline" for="inputNombre">  Hombre :  </label>
                                    <input name="opSexo" type="radio" class="form-control" value="m" required="required">
                                </div>
                            </center>
                            <br>
                            <input type="submit" value="Crear Cuenta" class="btn btn-warning" style="width: 300px; height: 70px;">                           
                            <br><br>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </center>
</body>       
</html>
