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
import encuestas.ejb.EncuestaFacade;
import encuestas.ejb.PreguntaFacade;
import encuestas.entity.Encuesta;
import encuestas.entity.Pregunta;

/**
 *
 * @author luis
 */
@WebServlet(name = "ServletBorrarPregunta", urlPatterns = {"/ServletBorrarPregunta"})
public class ServletBorrarPregunta extends HttpServlet {

    @EJB
    private EncuestaFacade encuestaFacade;

    @EJB
    private PreguntaFacade preguntaFacade;

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
        String id_pregunta = request.getParameter("id");
        String id_encuesta = request.getParameter("id_encuesta");
        
        Pregunta pregunta = this.preguntaFacade.find(new Integer(id_pregunta));
        Encuesta encuesta = this.encuestaFacade.find(new Integer(id_encuesta));
        List<Pregunta> lista = encuesta.getPreguntaList();
        lista.remove(pregunta);
        encuesta.setPreguntaList(lista);
        this.preguntaFacade.remove(pregunta);
        RequestDispatcher rd = request.getRequestDispatcher("ServletRedireccionarModificarEncuesta");
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
