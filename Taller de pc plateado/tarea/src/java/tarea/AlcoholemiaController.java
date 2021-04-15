package tarea;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AlcoholemiaController", 
            urlPatterns = {"/alcoholemia-resultados.usm"})

public class AlcoholemiaController extends HttpServlet {

    @EJB
    private AlcoholemiaService service;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String> mapDatos = new HashMap<>();
        // establecer un valor iniciar para el input radio sexo
        mapDatos.put("sexo", "M");
        request.setAttribute("mapDatos", mapDatos);       
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String ml = request.getParameter("ml");
        String grados = request.getParameter("grados");
        String kilos = request.getParameter("kilos");
        String sexo = request.getParameter("sexo");
       
        //crear el almacen de datos del formulario
        Map<String, String> mapDatos = new HashMap<>();
        mapDatos.put("email", email);
        mapDatos.put("ml", ml);
        mapDatos.put("grados", grados);
        mapDatos.put("kilos", kilos);
        mapDatos.put("sexo",sexo);
                                      
        //validaciones y calcular
        Map<String, String> mapMensajes = new HashMap<>();
        String mensaje;
        try {
            //Si el campo Email está vacío
            if (email.isEmpty()) {
                mapMensajes.put("correoElectronico", "Campo de Email vacío");
            }

            //validar ml
            int mililitros;
            try {
                mililitros = Integer.parseInt(ml);
                
                // Validacion que sea mayor o igual a 0
                if ((mililitros <= 0)) {
                    // lanzar la excepcion
                    
                    mapMensajes.put("ml", "Favor, ingrese un número válido mayor que 0");                    
                }
            } catch (NumberFormatException ex) {
                //relanzar la excepcion con mensaje personalizado
                mapMensajes.put("ml", "Revisar que el dato ingresado sea un número válido");                
            }
        
           int gradosAlcoholicos;            
            //validar grados
            try {
                gradosAlcoholicos = Integer.parseInt(grados);
                // Validacion que sea mayor o igual a 0
                if ((gradosAlcoholicos < 0)) {
                    // lanzar la excepcion                    
                    mapMensajes.put("grados", "Favor, ingrese un número válido mayor o igual a 0");                    
                }
            } catch (NumberFormatException ex) {
                //relanzar la excepcion con mensaje personalizado
                mapMensajes.put("grados", "Revisar que el dato ingresado sea un número válido");                
            }            
            
            //validar kilos
            int pesoEnKg;
            try {
                pesoEnKg = Integer.parseInt(kilos);
                // Validacion que sea mayor a 0
                if ((pesoEnKg < 1)) {
                    // lanzar la excepcion                    
                    mapMensajes.put("kilos", "Favor, ingrese un número válido mayor a 0");                    
                }
            } catch (NumberFormatException ex) {
                //relanzar la excepcion con mensaje personalizado
                mapMensajes.put("kilos", "Revisar que el dato ingresado sea un número válido");                
            }       
            
        //validar sexo vacio
        if(null ==(sexo)){
            mapMensajes.put("sexo", "Debe escoger un sexo");    
        }            
            // aqui hay que verificar si existe un error acumulado
            if (mapMensajes.isEmpty()) {

                int m = Integer.parseInt(ml);
                int g = Integer.parseInt(grados);
                double alcohol = (m*g*0.8)/100;                
                //diferenciar por sexo
                //procedemos al calculo final...
                double factorSexo;
                if("M".equals(sexo)){
                    factorSexo = 0.7;
                    }else{factorSexo = 0.6;                    
                    }    
             
                int pesoEnKG = Integer.parseInt(kilos);
                double alcoholemia = alcohol/(pesoEnKG * factorSexo);                    
                if(alcoholemia < 0.3){
                   mapMensajes.put("mensajeComplementario", "Sin sanción al conductor");                       
                }else if((alcoholemia >= 0.3) && (alcoholemia < 0.8)){
                        mapMensajes.put("mensajeComplementario", "Bajo la influencia de alcohol");
                }else{
                    mapMensajes.put("mensajeComplementario", "Estado de Ebriedad");
                }                                        
                DecimalFormat df = new DecimalFormat("##.##");
                df.setRoundingMode(RoundingMode.DOWN);
                String valor = df.format(alcoholemia);
                mensaje = "Valor de la Alcoholemia: " + valor; 
                        
                Alcohol informacion = new Alcohol();
                informacion.setCorreoElectronico(email);
                informacion.setEstadoCalculo(grados);
                informacion.setGradosAlcohol(alcohol);
                informacion.setMlAlcohol(m);
                informacion.setPesoPersona(pesoEnKG);
                informacion.setResultadosCalculo(alcoholemia);
                informacion.setSexoPersona(sexo);

                service.guardar(informacion);
                                                          
            } else {
                mensaje = "Favor, revise el formulario";
            }

        } catch (Exception ex) {
            // mensaje obtenido de la excepcion
            mensaje = ex.getMessage();
        }

            
            
        //preparar el(los) mensaje(s) de salida
        mapMensajes.put("alcoholemia", mensaje);
        request.setAttribute("mapDatos", mapDatos);
        request.setAttribute("mapMensajes", mapMensajes);
        request.getRequestDispatcher("/index.jsp").forward(request, response);           
  
    //que no se pierda el parentesis de llave de abajo pls            
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
