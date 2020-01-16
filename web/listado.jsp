<%-- 
    Document   : borrar
    Created on : 09-ene-2020, 13:52:34
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
        <title>Listado de encuestas generadas</title>
    </head>
    <body>
        <% 
            HttpSession sesion = request.getSession();
            Usuarios usuario = (Usuarios) sesion.getAttribute("usuario");
        %>
        <h1>Listado de encuestas que ha creado el usuario <%= usuario.getCorreo() %> </h1>
        <% 
            List<Encuesta> lista = (List)sesion.getAttribute("lista");
        %>
        <table>
            <% 
                for (Encuesta encuesta: lista){
            %>
            <tr>
                <td><%= encuesta.getNombre() %></td>
                <td><%= encuesta.getDescripcion() %></td>
                <td><a href="ServletRedireccionarEditarEncuesta?id=<%= encuesta.getId() %>">Editar</a></td>
                <td><a href="ServletBorrarEncuesta?id=<%=encuesta.getId()%>">Borrar</a></td>
                <td><a href="ServletRedireccionarPreguntas?id=<%= encuesta.getId() %>">Ver Listado Preguntas</a></td>
            </tr>
            <% 
                }
            %>
        </table>
        <br>
        <input type="button" name="buton_atras" value="Volver al panel de control" onclick="window.location.href='ServletRedireccionarPanelControl?id_usuario=<%= usuario.getId() %>'">
    </body>
</html>
