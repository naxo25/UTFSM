package mvc.form.presentacion;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mvc.form.servicio.RegistroService;

@WebServlet(
        name = "RegistroController",
        urlPatterns = {"/registro.html"}
)
public class RegistroController extends HttpServlet {

    // inyeccion de depencia
    @EJB
    private RegistroService servicio; // OJO: no se debe crear instancia (new ....)

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // estado inicial formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("sexo", "M"); // estado inicial del radio buttom
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("listaZonas", servicio.buscarZonas());
        request.setAttribute("listaPasatiempos", servicio.buscarPasatiempos());
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // procesar formulario
        // siempre primero, codificacion UTF-8
        request.setCharacterEncoding("UTF-8");
        // 1. recibir parametros
        // Key : nombre del input html
        // Value: valor digitado por el usuario
        Map<String, String> mapDatos = new HashMap<>();
        String nombre = request.getParameter("nombre");
        mapDatos.put("nombre", nombre);
        String strFechaNacimiento = request.getParameter("fechaNacimiento");
        mapDatos.put("fechaNacimiento", strFechaNacimiento);
        // recibir el sexo
        mapDatos.put("sexo", request.getParameter("sexo"));
        // recibir el zona
        mapDatos.put("zona", request.getParameter("zona"));
        // recibir los pasatiempo desde los checkbox
        String[] arrPasatiempo = request.getParameterValues("pasatiempo");
        if (arrPasatiempo != null) {
            // el usuario selecciono algo...
            for (String pasatiempo : arrPasatiempo) {
                // se crean claves basado en el texto constante: pasatiempo_
                // y se concatena el valor de pasatiempo con objetivo de crear
                // una clave unica.
                // Ej: clave: pasatiempo_1
                mapDatos.put("pasatiempo_" + pasatiempo, pasatiempo);
                // OJO: se debe volver a crear la misma clave en el Vista (jsp)
                // para recupear los valores.
            }
        }
        // variable que almacenara el mensaje de usuario
        String mensaje;
        try {
            // 2. convertir - sintaxis
            Date fechaNacimiento = null;
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                sdf.setLenient(false); //<-- evita que convierta las fechas 32-ENE  >> 01-FEB
                fechaNacimiento = sdf.parse(strFechaNacimiento);
            } catch (ParseException ex) {
                // relanzar con mensje propio
                throw new IllegalArgumentException("Ingrese una fecha en formato dd-mm-aaaa", ex);
            }
            // 3. validar - sematica
            if (nombre.trim().isEmpty()) {
                // error de nombre vacio...
                throw new IllegalArgumentException("Nombre no debe estar vacio");
            }
            // la fecha de nacimiento debe ser menor a la actual
            Calendar c = Calendar.getInstance();
            if (c.after(fechaNacimiento)) {
                throw new IllegalArgumentException("Fecha de nacimiento debe ser menor a la actual");
            }
            // por lo menos un pasatiempo
            if (arrPasatiempo == null) {
                throw new IllegalArgumentException("Seleccione al menos un pasatiempo");
            }
            mensaje = "Datos ingresados OK";
        } catch (Exception ex) {
            // en caso de excepcion, se recupera el mensaje de ésta.
            mensaje = ex.getMessage();
        }
        // 4. preparar datos para proxima vista (jsp)
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("listaZonas", servicio.buscarZonas());
        request.setAttribute("listaPasatiempos", servicio.buscarPasatiempos());
        // 4.1 despachar...
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

}
