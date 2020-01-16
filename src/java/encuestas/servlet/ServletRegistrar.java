
package encuestas.servlet;

import encuestas.ejb.UsuariosFacade;
import encuestas.entity.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * @author Manuel
 */
@WebServlet(name = "ServletRegistrar", urlPatterns = {"/ServletRegistrar"})
public class ServletRegistrar extends HttpServlet {

    @EJB
    private UsuariosFacade usuariosFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correo = request.getParameter("correo2");
        String pass2 = request.getParameter("pass2");
        
        Usuarios user = this.usuariosFacade.comprobarUsuario(correo);
       
        if (user == null || user.getPassword().equals(pass2)) {
        
        Usuarios nuevo = new Usuarios();
        nuevo.setCorreo(correo);
        nuevo.setPassword(pass2);
        nuevo.setStatus("1");
        this.usuariosFacade.create(nuevo);
        Integer id_usu = nuevo.getId();
        request.setAttribute("exito", "Usuario creado con exito.");
        HttpSession sesion = request.getSession();
        response.sendRedirect("ServletListarEncuesta");
       
        }else{         
        request.setAttribute("error", "El usuario no ha sido creado. Vuelve a registrarte.");
        response.sendRedirect("login.jsp");
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
