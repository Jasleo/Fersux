<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fersux</title>
    </head>

    <form action="iniciarSesion.do" method="post">
        <input type="email" name="correoIniciar" required="required">                                                  
        <input type="text" name="contrasniaIniciar" required="required">   
        <%
            Error e = (Error) request.getSession().getAttribute("error");
            if (e != null) {
                out.println("<p>" + e.getMessage() + "</p>");
                request.getSession().removeAttribute("error");
            }
        %>

        <input type="submit" value="Entrar"><br>
    </form>

    <form action="crearUsuario.do" method="POST">
        Nombre : <input type="text" name="txtNombreUsuario" required="required">
        Apellido : <input type="text" name="txtApellido" required="required">
        E-Mail : <input type="email" name="txtEmail" required="required">
        Fecha Nacimiento : <input type="date" name="txtFechaNacimiento" required="required">
        Mujer : <input type="radio" name="opSexo" required="required" value="femenino">
        Hombre : <input type="radio" name="opSexo" required="required" value="masculino">
        Contraseña : <input type="text" name="txtContraseña" required="required" min="6">

        <input type="submit" value="Crear Cuenta">
    </form>
</html>
