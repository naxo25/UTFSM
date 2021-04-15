package jpa;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alumnosinf
 */
@WebServlet(name = "PaisListadoController",
        urlPatterns = {"/pais/listado.html"})
public class PaisListadoController extends HttpServlet {
    @EJB
    private PaisService service;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Pais> listado = service.buscarTodos();
        
        request.setAttribute("listado", listado);
        request.getRequestDispatcher("/pais_listado.jsp")
                .forward(request, response);
    }

}
