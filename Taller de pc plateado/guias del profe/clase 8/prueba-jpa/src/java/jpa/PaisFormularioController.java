package jpa;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alumnosinf
 */
@WebServlet(
        name = "PaisFormularioController", 
        urlPatterns = {"/pais/formulario.html"}
)
public class PaisFormularioController extends HttpServlet {
    @EJB
    private PaisService service;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        
        Pais pais = service.buscarPorCodigo(codigo);
        // llenar el map para el formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("codigo", pais.getCodigo());
        mapDatos.put("nombre", pais.getNombre());
        String mensaje = "Favor, ingrese el nuevo nombre de pais";
        //registrar objetos para la vista
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        //despachar
        request.getRequestDispatcher("/pais_formulario.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        // FIXME: FALTA VALIDAR...
        service.actualizar(codigo, nombre);
        String mensaje = "Se actualizo el pais";
        // llenar el map para el formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("codigo", codigo);
        mapDatos.put("nombre", nombre);
        //registrar objetos para la vista
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mensaje", mensaje);
        //despachar
        request.getRequestDispatcher("/pais_formulario.jsp")
                .forward(request, response);
        
    }

}
