package mvc.servicio;

import java.util.Date;
import javax.ejb.Stateless;
import mvc.dominio.Mensaje;

@Stateless
public class SaludoService {
    // metodos de negocio
    public Mensaje crearMensaje(){
        // hacer cosas asombrosas...
        Mensaje mensaje = new Mensaje();
        mensaje.setTexto("Hola, estoy en un EJB");
        mensaje.setFechaCreacion(new Date());
        // finalmente, se retorna el objeto
        return mensaje;
    }
}
