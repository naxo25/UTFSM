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
        name = "FormularioController", 
        urlPatterns = {"/formulario.html"}
)
public class FormularioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // estado inicial del formulario
        request.setAttribute("mensajeSaludo", "Dime tu nombre...");
        request.getRequestDispatcher("/formulario.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // procesar el formulario
        
        // recibir datos de usuario
        String nombre = request.getParameter("nombre");
        String apellidoM = request.getParameter("apellidoM");
        String apellidoP = request.getParameter("apellidoP");
        
        //crear almacen de datos para restaurar formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("nombre",nombre);
        mapDatos.put("apellidoM",apellidoM);
        mapDatos.put("apellidoP",apellidoP);
        
        String mensaje = "Hola " + nombre + " " + apellidoM + " " + apellidoP + " !!";
        
        request.setAttribute("mensajeSaludo", mensaje);
        request.setAttribute("mapDatos", mapDatos);
        request.getRequestDispatcher("/formulario.jsp")
                .forward(request, response);
        
    }

}
