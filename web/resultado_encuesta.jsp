<%-- 
    Document   : resultado_encuesta
    Created on : 14-ene-2020, 17:11:55
    Author     : luis
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="encuestas.entity.Respuesta"%>
<%@page import="encuestas.entity.Pregunta"%>
<%@page import="encuestas.entity.Resultados"%>
<%@page import="encuestas.entity.Encuesta"%>
<%@page import="encuestas.entity.Logs"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src ="https://d3js.org/d3.v5.min.js"></script>
        <style>
            text{
                font-size: 14px;
                font-weight: bold;
                fill: black;
            }
        </style>
    </head>
    <body>
        <script>
            function definir_array(lista_nombre, lista_resultado){
                var array = [];
                for(var i = 0; i<lista_nombre.length; i++){
                    var elemento = {grade:lista_nombre[i],number:lista_resultado[i]};
                    array.push(elemento);
                }
                return array;
            }
            function grafico(lista_nombre, lista_resultado, nombre_pregunta){
                var width = 710;
                var height= 500;
                var colors = d3.scaleOrdinal(d3.schemeSet3);
                var svg = d3.select("body").append("svg")
                        .attr("width", width).attr("height", height)
                        .style("background", "white");
                svg.append("text")
                .attr("x", 150)
                .attr("y", 40)
                .style("font-size", "20px") 
                .text(nombre_pregunta);
                details = definir_array(lista_nombre, lista_resultado);
                var data = d3.pie().sort(null).value(function(d){return d.number})
                (details);
                var segments = d3.arc()
                        .innerRadius(0)
                        .outerRadius(150)
                        .padAngle(.05)
                        .padRadius(50);
                var sections = svg.append("g").attr("transform", "translate(220, 250)")
                        .selectAll("path").data(data);
                sections.enter().append("path").attr("d", segments).attr("fill", function(d){return colors(d.data.grade);});

                var  content = d3.select("g").selectAll("text").data(data);
                content.enter().append("text").each(function(d){
                    var center = segments.centroid(d);
                    d3.select(this).attr("x", center[0]).attr("y", center[1]).text();
                });
                
                var legends = svg.append("g").attr("transform", "translate(400,100)").selectAll(".legends").data(data);
                var legend = legends.enter().append("g").classed("legends", true).attr("transform", function(d,i){
                    return "translate(0,"+(i+1)*30+ ")";});
                legend.append("rect").attr("width",20).attr("height",20).attr("fill",function(d){return colors(d.data.grade);});
                legend.append("text").text(function(d){return d.data.grade + " " + d.data.number+"%" ;}).attr("fill", function(d){return colors(d.data.number);})
                        .attr("x", 20)
                        .attr("y", 20);
            }
            
        </script>
        <%
            Encuesta encuesta = (Encuesta) request.getAttribute("encuesta");
            Integer n_veces = (Integer) request.getAttribute("n_veces");
            List<String> lista_nombre = new ArrayList();
            List<Double> lista_valores = new ArrayList();
        %>
        
        <h1>La encuesta se titula <%= encuesta.getNombre() %> y se ha realizado <%= n_veces %> veces.</h1>
        <ul>
        <%
            List<Logs> logs = encuesta.getLogsList();
            for(Pregunta pregunta : encuesta.getPreguntaList()){
                
        %>
        <li>  <%= pregunta.getTituloPregunta() %> <br>
        <%
            for(Respuesta respuesta : pregunta.getRespuestaList()){
        %>
        <br>
        <ul>
            <li>
                <% 
                    int cnt = 0;
                    for(Logs log : logs){
                        for(Resultados resultado : log.getResultadosList()){
                            if(resultado.getIdRespuesta().getId().equals(respuesta.getId())){
                                cnt = cnt+1;
                            }
                        }
                    }
                %>

                <%= respuesta.getRespuesta() %>  :  <%
                    double porcentaje=((float)cnt)/n_veces*100;
                    NumberFormat nf = NumberFormat.getInstance();
                    nf.setMaximumFractionDigits(2);
                    lista_nombre.add("'"+respuesta.getRespuesta()+"'");
                    lista_valores.add(porcentaje);
                    
                    
                %><%= nf.format(porcentaje) %>%
                
            </li>
            
        </ul>
                
                
        </li>
        
        
        <br>
            
        <%
             }
                
        %>
        <script> grafico(<%= lista_nombre %>, <%= lista_valores %>, "<%= pregunta.getTituloPregunta() %>")</script>
        <%
                    lista_nombre.clear();
                    lista_valores.clear();
            }
            



        %>
        
    </ul>
        
    </body>
</html>
