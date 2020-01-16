
package encuestas.servlet;


import encuestas.ejb.LogsFacade;
import encuestas.ejb.PreguntaFacade;
import encuestas.ejb.RespuestaFacade;
import encuestas.ejb.ResultadosFacade;
import encuestas.entity.Logs;
import encuestas.entity.Pregunta;
import encuestas.entity.Respuesta;
import encuestas.entity.Resultados;
import java.io.IOException;
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

@WebServlet(name = "ServletGuardarRespuesta", urlPatterns = {"/ServletGuardarRespuesta"})
public class ServletGuardarRespuesta extends HttpServlet {

    @EJB
    private RespuestaFacade respuestaFacade;

    

    @EJB
    private PreguntaFacade preguntaFacade;

    @EJB
    private ResultadosFacade resultadosFacade;

    @EJB
    private LogsFacade logsFacade;

   

    

    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        
        Integer id_log = (Integer)sesion.getAttribute("id_log");
        Integer idrespuesta = (Integer)sesion.getAttribute("idrespuesta");
        Integer idpregunta = (Integer)sesion.getAttribute("idpregunta");
//        List<Integer> listado = (List)sesion.getAttribute("listaresp");
//        
        Logs log = this.logsFacade.find(id_log);
        Pregunta pregunta = this.preguntaFacade.find(idpregunta);
        Respuesta respuesta = this.respuestaFacade.find(idrespuesta);
//        
//        for(Integer id:listado){
//        Resultados results2= new Resultados(id_log,idpregunta);
//        results2.setLogs(log);
//        results2.setPregunta(idpregunta);
//        results2.setIdRespuesta(respuesta);
//        this.resultadosFacade.create(results2);
//        }
        
        Resultados results = new Resultados(id_log,idpregunta);
        results.setLogs(log);
        results.setPregunta(pregunta);
        results.setIdRespuesta(respuesta);
        this.resultadosFacade.create(results);     
        
        
        RequestDispatcher rd = request.getRequestDispatcher("ServletListarEncuesta");
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
