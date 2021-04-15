
package tarea;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "BusquedaController", 
            urlPatterns = {"/alcoholemia-busqueda.usm"})
public class BusquedaController extends HttpServlet {
    
    @EJB
    private AlcoholemiaService service;
   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
     //redireccionar al jsp   
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String mensaje = "";


        try {
            //Si el campo Email está vacío
            if (email.isEmpty()) {
                mensaje = "Campo de Email vacío";                
            }else{
            //List<Alcohol> listado = service.seleccionarTodosAlcohol();
            List<Alcohol> listado = service.seleccionarPorMailAlcohol(email);
            
            request.setAttribute("listadoRegistro", listado);
            request.setAttribute("email", email);
            request.setAttribute("mensaje", mensaje);        
            request.getRequestDispatcher("/busqueda.jsp").forward(request, response);
            }
        }catch (Exception ex) {
            // mensaje obtenido de la excepcion
            mensaje = ex.getMessage();
            request.setAttribute("email", email);
            request.setAttribute("mensaje", mensaje);        
            request.getRequestDispatcher("/busqueda.jsp").forward(request, response);            
            }
        
        
        /////////
        //Instanciar el almacen de objetos
        //Arrastrar la busqueda al listado
        //////////////////////////////////

//
        
        
        
           
        
        
        
    ///que no desaparezca la llave de abajo por favore!!!    
    }


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
