<%-- 
    Document   : editarRespuesta
    Created on : 13-ene-2020, 17:43:20
    Author     : luis
--%>

<%@page import="encuestas.entity.Respuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edición de respuesta</h1>
        <% 
            Respuesta respuesta = (Respuesta) request.getAttribute("respuesta");
            String id_pregunta = (String) request.getAttribute("id_pregunta");
        %>
        
        <form action ="ServletGuardarRespuestaAdmin">
            El id de la pregunta es: <%= respuesta.getId() %><br>
            <input type="hidden" name = "id" value="<%= respuesta.getId() %>">
            <input type="hidden" name = "id_pregunta" value="<%= id_pregunta%>">
            Respuesta: <input type="text" name="respuesta" value="<%= respuesta.getRespuesta() %>" required ><br><br>
            <input type="submit" value="Guardar datos">
        </form>
    </body>
</html>
