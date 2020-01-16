
package encuestas.servlet;

import encuestas.ejb.UsuariosFacade;
import encuestas.entity.Usuarios;
import java.io.IOException;
import static java.lang.System.out;
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
 * @author Manuel
 */
@WebServlet(name = "ServletGeneral", urlPatterns = {"/ServletGeneral"})
public class ServletGeneral extends HttpServlet {

    @EJB
    private UsuariosFacade usuariosFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String str = request.getParameter("correo");
        String str2 = request.getParameter("pass");
        Usuarios user = this.usuariosFacade.comprobarUsuario(str);  
        
        if (user == null || !user.getPassword().equals(str2)) {
           RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
           rd.forward(request, response);
        } else{    
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", this.usuariosFacade.find(user.getId()));
            sesion.setAttribute("id_usu", user.getId());
            if(user.getStatus().equals("1")){   
            response.sendRedirect("ServletListarEncuesta");
            }else{
            response.sendRedirect("ServletRedireccionarPanelControl");            
            }
        }          
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
