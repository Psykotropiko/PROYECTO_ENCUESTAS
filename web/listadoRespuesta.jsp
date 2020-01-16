<%-- 
    Document   : listadoRespuesta
    Created on : 10-ene-2020, 19:32:23
    Author     : luis
--%>

<%@page import="encuestas.entity.Respuesta"%>
<%@page import="java.util.List"%>
<%@page import="encuestas.entity.Pregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            Pregunta pregunta = (Pregunta) request.getAttribute("pregunta");
            List<Respuesta> respuestas = pregunta.getRespuestaList();    
        %>
        <h1>Listado</h1>
        <table>
            <% 
                for(Respuesta respuesta : respuestas){
            %>
            <tr>
                <td>ID: <%= respuesta.getId() %></td>
                <td><%= respuesta.getRespuesta() %></td>
                <td><a href="ServletEditarRespuesta?id=<%=respuesta.getId()%>&id_pregunta=<%=pregunta.getId()%>">Editar</a></td>
                <td><a href="ServletBorrarRespuesta?id=<%=respuesta.getId()%>&id_pregunta=<%=pregunta.getId()%>">Borrar</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
