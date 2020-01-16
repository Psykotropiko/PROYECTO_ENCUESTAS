package encuestas.servlet;

import encuestas.ejb.EncuestaFacade;
import encuestas.ejb.LogsFacade;
import encuestas.ejb.PreguntaFacade;
import encuestas.ejb.RespuestaFacade;
import encuestas.ejb.UsuariosFacade;
import encuestas.entity.Encuesta;
import encuestas.entity.Logs;
import encuestas.entity.Pregunta;
import encuestas.entity.Respuesta;
import encuestas.entity.Usuarios;
import java.io.*;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author javie
 */
@WebServlet(name = "ServletPreguntas", urlPatterns = {"/ServletPreguntas"})
public class ServletPreguntas extends HttpServlet {

    @EJB
    private UsuariosFacade usuariosFacade;

    @EJB
    private LogsFacade logsFacade;

    @EJB
    private RespuestaFacade respuestaFacade;

    @EJB
    private EncuestaFacade encuestaFacade;

    @EJB
    private PreguntaFacade preguntaFacade;
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        Integer id_usuario = (Integer)sesion.getAttribute("id_usu");
        
        String str = request.getParameter("id");        
        Encuesta encuesta = this.encuestaFacade.find(new Integer(str));
        request.setAttribute("formulario", encuesta);
        
        List<Pregunta> pregunta1 = encuesta.getPreguntaList();
        request.setAttribute("encuesta1", pregunta1);
        
        Usuarios user = this.usuariosFacade.find(id_usuario);
        
        // Logs
        Logs nuevo_log = new Logs();
        nuevo_log.setIdUsuario(user);
        nuevo_log.setIdEncuesta(encuesta);
        this.logsFacade.create(nuevo_log);
        sesion.setAttribute("id_log", nuevo_log.getId());
        request.setAttribute("Listapregs", pregunta1);
        
        RequestDispatcher rd = request.getRequestDispatcher("ListadoPreguntas.jsp");
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
