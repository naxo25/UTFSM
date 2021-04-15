package calculadora.edad.presentacion;

import calculadora.edad.dominio.Mascota;
import calculadora.edad.dominio.Raza;
import calculadora.edad.servicio.CalculadoraEdadService;
import calculadora.edad.vo.CalculoEdad;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

@ManagedBean(name = "calc")
@ViewScoped
public class CalculadoraController implements Serializable {

    @EJB
    private CalculadoraEdadService service;

    private String nombre;
    private Date fechaNacimiento;
    private Integer idRaza;
    private List<Raza> listaRaza;

    @PostConstruct
    public void iniciar() {
        // tareas de inicializacion
        listaRaza = service.buscarRazaTodas();
    }
    
    public void calcular(){
        // ya se encuentran con valores los atributos
        Mascota mascota = new Mascota();
        mascota.setNombre(nombre);
        mascota.setFechaNacimiento(fechaNacimiento);
        Raza raza = service.buscarRazaPorId(idRaza);
        mascota.setRaza(raza);
        CalculoEdad edades = service.calcular(mascota);
        // mediante el objeto FacesContext podemos "conversar" con JSF
        FacesContext ctx = FacesContext.getCurrentInstance();
        // crear el mensaje de respuesta
        FacesMessage msg;
        msg = new FacesMessage(FacesMessage.SEVERITY_INFO, 
                "EDAD HUMANA", 
                String.valueOf(edades.getEdadHumana()));
        ctx.addMessage(null, msg); // agrega primer mensaje
        
        msg = new FacesMessage(FacesMessage.SEVERITY_INFO, 
                "EDAD MASCOTA", 
                String.valueOf(edades.getEdadMascota()));
        ctx.addMessage(null, msg); // agrega el segundo mensaje
        
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Integer getIdRaza() {
        return idRaza;
    }

    public void setIdRaza(Integer idRaza) {
        this.idRaza = idRaza;
    }

    public List<Raza> getListaRaza() {
        return listaRaza;
    }

    public void setListaRaza(List<Raza> listaRaza) {
        this.listaRaza = listaRaza;
    }

}
