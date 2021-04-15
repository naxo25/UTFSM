package mvc.form.presentacion;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mvc.form.dominio.Zona;
import mvc.form.servicio.RegistroService;

@WebServlet(name = "FormListaController", urlPatterns = {"/form/lista.html"})
public class FormListaController extends HttpServlet {
    @EJB
    private RegistroService service;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Zona> listaZonas = service.buscarZonas();
        request.setAttribute("listaZonas", listaZonas);
        request.getRequestDispatcher("/form_lista.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // definir la codificacion de caracteres a UTF-8
        request.setCharacterEncoding("UTF-8");
        // recibir los parametros de usuario
        String nombre = request.getParameter("nombre");
        String zona = request.getParameter("zona");
        // crear el almacen de datos de formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("nombre", nombre);
        mapDatos.put("zona", zona);
        // mensaje para el usuario
        String mensaje = "Valores recibidos: " + nombre + " " + zona;
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("listaZonas", service.buscarZonas());
        request.getRequestDispatcher("/form_lista.jsp").forward(request, response);
    }

}
