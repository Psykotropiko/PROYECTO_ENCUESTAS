<%-- 
    Document   : ListadoPreguntas
    Created on : 09-ene-2020, 20:17:42
    Author     : Manuel
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="encuestas.entity.Resultados"%>
<%@page import="encuestas.entity.Usuarios"%>
<%@page import="encuestas.entity.Respuesta"%>
<%@page import="encuestas.entity.Encuesta"%>
<%@page import="java.util.List"%>
<%@page import="encuestas.entity.Pregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
        
    </head>
    <%
        Encuesta encuesta = (Encuesta)request.getAttribute("formulario");
        HttpSession id_pregunta = request.getSession();
        HttpSession id_respuesta = request.getSession();
        HttpSession listadoresp = request.getSession();
        
    %>
    <body style="text-align: center;">
        <h1 style="padding: 20px;text-align: center;background: #1abc9c;color: white;font-size: 30px;">Encuesta de <%= encuesta.getNombre()%></h1>
        <input type="hidden" name="<%= encuesta.getId()%>">
        
        <form action="ServletGuardarRespuesta">
                <%
                for (Pregunta pre: encuesta.getPreguntaList()) {
                List<Respuesta> respuesta2 = pre.getRespuestaList();
                List<Integer> listaresp = new ArrayList();
                %>
                <br><%= pre.getTituloPregunta() %><br>
                
                <%
                for (Respuesta resp: respuesta2) {
                %>
                <br><input type="radio" name="<%= pre.getId()%>" value="<%= resp.getId() %>"><%= resp.getRespuesta() %><br>
                
                <%
                id_respuesta.setAttribute("idrespuesta", resp.getId());
                listaresp.add(resp.getId());
                listadoresp.setAttribute("listadoresp",listaresp);
                }  
                id_pregunta.setAttribute("idpregunta", pre.getId());
                }
                
                %>
                <br><input type="submit" value="Enviar Respuestas" style="background: #1abc9c;border-radius: 4px;border: 2px solid #1abc9c; color:white;">
        </form>
    </body>
</html>