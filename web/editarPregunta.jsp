<%-- 
    Document   : editarPregunta
    Created on : 09-ene-2020, 19:52:52
    Author     : luis
--%>

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
            String id_encuesta = (String) request.getAttribute("id_encuesta");
        %>
        <h1>Modificación de la pregunta <%= pregunta.getTituloPregunta() %></h1>
        <form action="ServletGuardarPregunta">
            El id de la pregunta es: <%= pregunta.getId()%> <br>
            <input type="hidden" name="id" value ="<%= pregunta.getId() %>">
            <input type="hidden" name="id_encuesta" value ="<%= id_encuesta %>">
            Título: <input type="text" name="titulo" value = "<%=pregunta.getTituloPregunta()%>" required><br>
            Tipo de pregunta: <select name="tipo">
                <% 
                    String selected = "";
                    String no_multiple = "NO MULTIPLE";
                    String multiple = "MULTIPLE";
                    String tipo = no_multiple;
                    if(pregunta.getEsMultiple().equals(true)){
                        tipo = multiple;
                    }
                %>
                <option value = "false" <% 
                    if(pregunta.getEsMultiple()==false){
                        selected="selected";
                    }
                    else{
                        selected="";
                    }
                %>
                    <%= selected %> ><%= no_multiple %></option>
                <option value = "true"<% 
                    if(pregunta.getEsMultiple()==true){
                        selected="selected";
                    }else{
                        selected = "";
                    }
                %>
                <%= selected %> > <%= multiple %></option>
            </select><br>
            
            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
