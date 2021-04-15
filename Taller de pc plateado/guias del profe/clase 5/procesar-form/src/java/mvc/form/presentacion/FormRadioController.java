package mvc.form.presentacion;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FormRadioController", urlPatterns = {"/form/radio.html"})
public class FormRadioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String> mapDatos = new HashMap<>();
        // establecer un valor iniciar para el input radio sexo
        mapDatos.put("sexo", "M");
        request.setAttribute("mapDatos", mapDatos);
        request.getRequestDispatcher("/form_radio.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // definir la codificacion de caracteres a UTF-8
        request.setCharacterEncoding("UTF-8");
        // recibir los parametros de usuario
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        // crear el almacen de datos de formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("nombre", nombre);
        mapDatos.put("sexo", sexo);
        // mensaje para el usuario
        String mensaje = "Valores recibidos: " + nombre + " " + sexo;
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/form_radio.jsp").forward(request, response);
    }

}
