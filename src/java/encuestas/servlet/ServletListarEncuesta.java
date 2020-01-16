
package encuestas.servlet;

import encuestas.ejb.EncuestaFacade;
import encuestas.ejb.LogsFacade;
import encuestas.ejb.UsuariosFacade;
import encuestas.entity.Encuesta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "ServletListarEncuesta", urlPatterns = {"/ServletListarEncuesta"})
public class ServletListarEncuesta extends HttpServlet {

    @EJB
    private UsuariosFacade usuariosFacade;

    @EJB
    private LogsFacade logsFacade;

    @EJB
    private EncuestaFacade encuestaFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String str = request.getParameter("id");
        List<Encuesta> lista = this.encuestaFacade.findAll();
        request.setAttribute("listado", lista);
        
        RequestDispatcher rd = request.getRequestDispatcher("ListadoEncuesta.jsp");
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
