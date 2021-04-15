package mb;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "saludo")
@RequestScoped
public class SaludoController {

    private String nombre;
    private Integer edad;
    private String mensaje;

    public void saludar() {
        // cuando se ejecute el este metodo
        // el atributo nombre ya tendra el valor 
        //ingresado por el usuario
        mensaje = "HOLA " + nombre + " " + edad + " !!";
    }
    
    // de aqui para abajo es codigo generado
    //insertar getter && setter

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

}
