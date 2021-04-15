package lab.presentacion;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lab.dominio.Cancion;
import lab.servicio.CancionService;

@WebServlet(
        name = "ListadoCancionController", 
        urlPatterns = {"/listado/cancion.html"}
)
public class ListadoCancionController extends HttpServlet {
    // inyeccion de dependencia
    @EJB
    private CancionService servicio;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // procesar peticion inicial de la pagina
        // recibir datos de canciones
        List<Cancion> listado = servicio.buscarTodas();
        // registrar listado con nombre logico 'listadoCancion'
        request.setAttribute("listadoCancion", listado);
        // selecionar la vista para continuar con el proceso.
        request.getRequestDispatcher("/listado_cancion.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // procesar formulario (hoy no....)
    }


}
