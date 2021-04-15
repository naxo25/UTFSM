package web;

import javax.ejb.Stateless;
import java.util.Date;

@Stateless
public class SaludoService {
    public Mensaje CrearMensaje(){
        // aqui se escribe la logica del negocio
        Mensaje mensaje = new Mensaje();
        mensaje.setTexto("hola, fui creado en un <<EJB>>");
        mensaje.setFechaCreacion(new Date());
        
        return mensaje;
    }
}
