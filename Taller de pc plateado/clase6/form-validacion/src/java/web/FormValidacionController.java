package web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        name = "FormRangoController",
        urlPatterns = {"/form/validacion.html"}
)
public class FormValidacionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/form_validacion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // definir la codificacion de caracteres a UTF-8
        request.setCharacterEncoding("UTF-8");
        // recibir los parametros de usuario
        String nombre = request.getParameter("nombre");
        String strNumero = request.getParameter("numero");
        // crear el almacen de datos de formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("nombre", nombre);
        mapDatos.put("numero", strNumero);
        // crear el almacen de mensajes
        Map<String, String> mapMensajes = new HashMap<>();
        String mensaje;
        try {
            if (nombre.isEmpty()) {
                mapMensajes.put("nombre", "Debe ingresar un nombre");
            }

            // validacion sintactica: convertir String --> int
            int numero;
            try {
                numero = Integer.parseInt(strNumero);
                // validacion semantica, numero entre rango 1 .. 100
                if (!(numero >= 18 && numero <= 65)) {
                    // lanzar la excepcion
                    String mensajeError = "Favor, ingrese un número entre 18 y 65";
                    mapMensajes.put("numero", mensajeError);
                }
            } catch (NumberFormatException ex) {
                //relanzar la excepcion con mensaje personalizado
                String mensajeError = "Favor, ingrese un número válido";
                mapMensajes.put("numero", mensajeError);
            }
            // aqui hay que verificar si existe un error acumulado
            if (mapMensajes.isEmpty()) {
                mensaje = "Los datos ingresados : " + nombre + " " + strNumero;
            } else {
                mensaje = "Favor, revise el formulario";
            }

        } catch (Exception ex) {
            // mensaje obtenido de la excepcion
            mensaje = ex.getMessage();
        }
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mapMensajes", mapMensajes);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/form_validacion.jsp").forward(request, response);
    }

}
