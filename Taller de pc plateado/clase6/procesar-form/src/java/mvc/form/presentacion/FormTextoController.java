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
        name = "FormTextoController",
        urlPatterns = {"/form/texto.html"}
)
public class FormTextoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/form_texto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // definir la codificacion de caracteres a UTF-8
        request.setCharacterEncoding("UTF-8");

        // recibir los parametros de usuario
        String nombre = request.getParameter("nombre");
        String apellidoPaterno = request.getParameter("apellidoPaterno");
        String apellidoMaterno = request.getParameter("apellidoMaterno");

        // crear el almacen de datos de formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("nombre", nombre);
        mapDatos.put("apellidoPaterno", apellidoPaterno);
        mapDatos.put("apellidoMaterno", apellidoMaterno);

        // mensaje para el usuario
        String mensaje = "Datos recibidos: " + nombre + " " + apellidoPaterno + " " + apellidoMaterno;

        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/form_texto.jsp").forward(request, response);
    }

}
