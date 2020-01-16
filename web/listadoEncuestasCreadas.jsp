<%-- 
    Document   : listadoEncuestasCreadas
    Created on : 13-ene-2020, 20:00:26
    Author     : luis
--%>



<%@page import="encuestas.entity.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="encuestas.entity.Encuesta"%>
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
            Usuarios usuario = (Usuarios) sesion.getAttribute("usuario");
            List<Encuesta> lista_encuesta = (List) sesion.getAttribute("encuestas");
        %>
        <h1>Listado de encuestas creadas por el usuario <%= usuario.getCorreo() %></h1>
        <% 
            for(Encuesta encuesta: lista_encuesta){
        %>
        <table>
            <tr>
                <td><%= encuesta.getNombre() %></td>
                <td><%= encuesta.getDescripcion() %></td>
                <!-- En el href hay que introducir el id_usuario y el id_encuesta -->
                <td><a href="ServletRedireccionarResultadoEncuesta?id_encuesta=<%= encuesta.getId() %>">Ver Resultados</a></td>
            </tr>
        </table>
        <%
            }
        %>
    </body>
</html>
