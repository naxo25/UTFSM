package mvc.presentacion;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mvc.dominio.Mensaje;
import mvc.servicio.SaludoService;

@WebServlet(name = "SaludoController", urlPatterns = {"/saludo.html"})
public class SaludoController extends HttpServlet {
    
    // inyeccion de dependencia
    @EJB
    private SaludoService servicio;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // carga estado inicial de la vista
        // YA NO...String mensaje  = "Hola, estoy en un Servlet >> JSP.";
        // se delega la cracion del mensaje al servicio
        Mensaje mensaje = servicio.crearMensaje();
        
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/saludo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // procesa envío de datos de formulario html
    }    
}












