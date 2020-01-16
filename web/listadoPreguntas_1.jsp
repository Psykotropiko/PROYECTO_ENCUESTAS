<%-- 
    Document   : listadoPreguntas
    Created on : 09-ene-2020, 19:07:27
    Author     : luis
--%>

<%@page import="java.util.List"%>
<%@page import="encuestas.entity.Pregunta"%>
<%@page import="encuestas.entity.Encuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% 
        Encuesta encuesta = (Encuesta) request.getAttribute("encuesta");
        String es_multiple = "MÚLTIPLE";
        
    %>
    <body>
        <h1>Listado de preguntas asociados a la <%= encuesta.getNombre() %></h1>
        <table>
            <%
                for(Pregunta p : encuesta.getPreguntaList()){
                   
            %>
            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getTituloPregunta()%></td>
                <td><%
                    if(p.getEsMultiple()==false){
                        es_multiple="NO MÚLTIPLE";
                    }else{
                        es_multiple= "MÚLTIPLE";
                    }
                    %>
                    <%= es_multiple %></td> 
                <td><a href="ServletEditarPregunta?id=<%= p.getId() %>&id_encuesta=<%=encuesta.getId()%>">Editar</a></td>
                <td><a href="ServletBorrarPregunta?id=<%=p.getId()%>&id_encuesta=<%=encuesta.getId()%>">Borrar</a></td>
                <td><a href="ServletRedireccionarRespuesta?id=<%=p.getId()%>">Ver listado de respuestas</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
