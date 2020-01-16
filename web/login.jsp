<%-- 
    Document   : login
    Created on : 07-ene-2020, 19:29:36
    Author     : javie
--%>
<%@page import="java.util.List"%>
<%@page import="encuestas.entity.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body style="text-align: center;">
        <h1 style="padding: 20px;text-align: center;background: #1abc9c;color: white;font-size: 30px;">
        Surveys 4 u</h1>
        <div style="text-align: center;margin-left: 42%;">
        <fieldset style="width:25%;" >
        <legend>Login</legend>
        <br>
        <form action="ServletGeneral" method="POST">
        Correo:<br>
        <input type="text" name="correo" style="width: 100%;"><br>
        <br>
        Contrase&ntilde;a:<br>
        <input type="password" name="pass" style="width: 100%;"><br><br>
        <input type="submit" value="Iniciar Sesion" style="background: #1abc9c;border-radius: 4px;border: 2px solid #1abc9c; color:white; ">
        <br>
        </form>
        </fieldset>
            <br>
            <br>
        <fieldset style="width:25%;">
        <legend>Registrarse</legend>
        <form action="ServletRegistrar" method="POST">
        <br>
        Introducir correo:<br>
        <input type="hidden" name="id">
        <input type="text" name="correo2" style="width: 100%;"><br>
        <br>
        Introducir contrase&ntilde;a:<br>
        <input type="password" name="pass2" style="width: 100%;"><br><br>
        <input type="submit" value="Registrar" style="background: #1abc9c;border-radius: 4px;border: 2px solid #1abc9c; color:white; ">
        <br>
        </form>
        </fieldset>
        </div>
    </body>
</html>
