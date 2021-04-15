package mvc.form.presentacion;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        name = "FormCheckboxController", 
        urlPatterns = {"/form/checkbox.html"}
)
public class FormCheckboxController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/form_checkbox.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // definir la codificacion de caracteres a UTF-8
        request.setCharacterEncoding("UTF-8");

        // recibir los parametros de usuario
        String correo = request.getParameter("correo");
        String notificacion = request.getParameter("notificacion");

        // crear el almacen de datos de formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("correo", correo);
        mapDatos.put("notificacion", notificacion);

        // mensaje para el usuario
        String mensaje = "Valores recibidos : " + correo + " " + notificacion;

        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/form_checkbox.jsp").forward(request, response);
    }
}
