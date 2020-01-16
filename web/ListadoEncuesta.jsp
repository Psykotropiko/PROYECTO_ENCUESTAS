<%-- 
    Document   : home
    Created on : 09-ene-2020, 13:45:43
    Author     : Manuel
--%>
<%@page import="encuestas.entity.Encuesta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        List<Encuesta> lista = (List)request.getAttribute("listado");
        String str = request.getParameter("id");
    %>
    <body style="text-align: center;">
        <h1 style="padding: 20px;text-align: center;background: #1abc9c;color: white;font-size: 30px;">Listado de encuestas disponibles para contestar</h1>
        <input type="hidden" value="<%= str %>" />
        <br>
        <ul>
            <%
                for (Encuesta enc: lista) {
            %>
            <ul><a name="id" href="ServletPreguntas?id=<%= enc.getId()  %>"><button style="background: #1abc9c;border-radius: 4px;border: 2px solid #1abc9c; color:white; padding: 12px 28px;"><%= enc.getNombre() %></button></a><br><br><%= enc.getDescripcion()%></ul><br><br>
            
            <%
                }
            %>
        </ul>
        
    </body>
</html>