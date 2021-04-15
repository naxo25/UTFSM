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
        name = "FormRangoController",
        urlPatterns = {"/form/rango.html"}
)
public class FormRangoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/form_rango.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // definir la codificacion de caracteres a UTF-8
        request.setCharacterEncoding("UTF-8");
        // recibir los parametros de usuario
        String strNumero = request.getParameter("numero");
        // crear el almacen de datos de formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("numero", strNumero);
        // mensaje para el usuario
        String mensaje;
        try {
            // validacion sintactica: convertir String --> int
            int numero;
            try {
                numero = Integer.parseInt(strNumero);
            } catch (NumberFormatException ex) {
                //relanzar la excepcion con mensaje personalizado
                String mensajeError = "Favor, ingrese un número válido";
                throw new IllegalArgumentException(mensajeError, ex);
            }
            // validacion semantica, numero entre rango 1 .. 100
            if (!(numero >= 1 && numero <= 100)) {
                // lanzar la excepcion
                String mensajeError = "Favor, ingrese un número entre 1 y 100";
                throw new IllegalArgumentException(mensajeError);
            }
            // si llegamos aqui, es porque no hay excepciones
            mensaje = "El número ingresado fue: " + numero;
        } catch (Exception ex) {
            // mensaje obtenido de la excepcion
            mensaje = ex.getMessage();
        }
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("/form_rango.jsp").forward(request, response);
    }

}
