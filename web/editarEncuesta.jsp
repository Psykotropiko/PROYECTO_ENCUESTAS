<%-- 
    Document   : editarEncuesta
    Created on : 09-ene-2020, 17:45:21
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar encuesta</h1>
        <form action ="ServletEditarEncuesta">
            El id de la pregunta es: <%= request.getAttribute("id") %><br>
            <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
            Nombre: <input type="text" name="nombre" value ="<%= request.getAttribute("nombre") %> " required><br>
            Descripción de la pregunta: <input type="text" name="descripcion" value ="<%= request.getAttribute("descripcion") %>" required><br>
            <input type="submit" value="Guardar cambios">
        </form>
          
    </body>
</html>
