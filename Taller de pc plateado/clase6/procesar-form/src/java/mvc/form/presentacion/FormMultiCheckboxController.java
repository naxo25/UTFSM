package mvc.form.presentacion;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mvc.form.servicio.RegistroService;

@WebServlet(name = "FormMultiCheckboxController", urlPatterns = {"/form/multicheckbox.html"})
public class FormMultiCheckboxController extends HttpServlet {

    @EJB
    private RegistroService service;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listaZonas", service.buscarZonas());
        request.getRequestDispatcher("/form_multicheckbox.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // definir la codificacion de caracteres a UTF-8
        request.setCharacterEncoding("UTF-8");
        // recibir los parametros de usuario
        String[] arrZona = request.getParameterValues("zona");
        // crear el almacen de datos de formulario
        Map<String, String> mapDatos = new HashMap<>();
        // sei hay seleccion de al menos un checkbox
        if (arrZona != null) {
            for (String codigoZona : arrZona) {
                // almacenanos en formato: zona_VALOR-CHECKBOX
                mapDatos.put("zona_" + codigoZona, codigoZona);
            }
        }
        // mensaje para el usuario
        String mensaje = "Valores recibidos : " + Arrays.toString(arrZona);
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("listaZonas", service.buscarZonas());
        request.getRequestDispatcher("/form_multicheckbox.jsp").forward(request, response);
    }
}
