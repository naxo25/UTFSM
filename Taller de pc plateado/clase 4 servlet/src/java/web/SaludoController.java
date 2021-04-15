package web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SaludoController", urlPatterns = {"/saludo.html"})
public class SaludoController extends HttpServlet {
    @EJB
    private SaludoService service;

    @Override
    // solo son necesarios doget y post
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // viene la peticion de usuario y se delegar a la capa de negocio
        
        // en vez de esto String mensaje = "Hola, esto es un <<servlet>>";
        Mensaje mensaje = service.CrearMensaje();
        
        // prepara datos para la vista
        request.setAttribute("mensaje", mensaje);
        // ahora, pasamos el control hacia la vista
        request.getRequestDispatcher("/saludo.jsp").forward(request, response);
    
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("mensaje", response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
