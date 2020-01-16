/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encuestas.servlet;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import encuestas.ejb.PreguntaFacade;
import encuestas.ejb.RespuestaFacade;
import encuestas.entity.Pregunta;
import encuestas.entity.Respuesta;

/**
 *
 * @author luis
 */
@WebServlet(name = "ServletBorrarRespuesta", urlPatterns = {"/ServletBorrarRespuesta"})
public class ServletBorrarRespuesta extends HttpServlet {

    @EJB
    private PreguntaFacade preguntaFacade;

    @EJB
    private RespuestaFacade respuestaFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_pregunta = request.getParameter("id_pregunta");
        String id_respuesta = request.getParameter("id");
        
        Pregunta pregunta = this.preguntaFacade.find(new Integer(id_pregunta));
        Respuesta respuesta = this.respuestaFacade.find(new Integer(id_respuesta));
        
        List<Respuesta> respuestas = pregunta.getRespuestaList();
        respuestas.remove(respuesta);
        pregunta.setRespuestaList(respuestas);
        
        this.respuestaFacade.remove(respuesta);
        
        RequestDispatcher rd = request.getRequestDispatcher("ServletRedireccionarRespuesta?id="+id_pregunta);
        rd.forward(request, response); 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
