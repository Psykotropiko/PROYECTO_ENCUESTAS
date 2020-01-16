<%-- 
    Document   : panelcontrol.jsp
    Created on : 16-ene-2020, 9:56:24
    Author     : luis
--%>


<%@page import="encuestas.entity.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            
            HttpSession sesion = request.getSession();
            Usuarios usuario = (Usuarios)sesion.getAttribute("usuario");
        %>
        <h1>Panel de control del usuario: <%= usuario.getCorreo() %></h1>
        <ol>
            <li><a href="">Generar Encuesta</a></li>
            <li><a href="ServletRedireccionarModificarEncuesta?id=<%= usuario.getId() %>">Modificar Encuesta</a></li>
            <li><a href="ServletEncuestasCreadas?id=<%= usuario.getId() %>">Ver Resultados</a></li>
        </ol>
    </body>
</html>
