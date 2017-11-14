<%-- 
    Document   : index
    Created on : 14-nov-2017, 9:11:29
    Author     : dhenriquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fersux</title>
    </head>
    
    <form action="" method="POST">
        Nombre Usuario : <input type="text" name="txtNombreUsuario" required="required">
        Contraseña : <input type="text" name="txtContraseña" required="required">
        
        <input type="submit" value="Iniciar Sesion">
    </form>
    
    <form action="" method="POST">
        e-mail : <input type="text" name="txtEMailInicio" required="required">
        Contraseña : <input type="text" name="txtContraseñaInicio" required="required">
        
        <input type="submit" value="Iniciar Sesion">
    </form>
    
    <form action="" method="POST">
        Nombre : <input type="text" name="txtNombreUsuario" required="required">
        Apellido : <input type="text" name="txtApellido" required="required">
        E-Mail : <input type="email" name="txtEmail" required="required">
        Fecha Nacimiento : <input type="date" name="txtFechaNacimiento" required="required">
        Mujer : <input type="radio" name="opSexo" required="required" value="femenino">
        Hombre : <input type="radio" name="opSexo" required="required" value="masculino">
        Contraseña : <input type="text" name="txtContraseña" required="required" min="6">
        Confirme Contraseña : <input type="text" name="txtContraseña" required="required" min="6">
        
        <input type="submit" value="Crear Cuenta">
    </form>
    
    
</html>
