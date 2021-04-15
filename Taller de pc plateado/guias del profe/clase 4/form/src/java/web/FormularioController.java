package web;

import java.io.IOException;
import java.io.PrintWriter;
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
        
        String mensaje = "Hola " + nombre + " !!";
        
        request.setAttribute("mensajeSaludo", mensaje);
        request.getRequestDispatcher("/formulario.jsp")
                .forward(request, response);
        
    }

}
