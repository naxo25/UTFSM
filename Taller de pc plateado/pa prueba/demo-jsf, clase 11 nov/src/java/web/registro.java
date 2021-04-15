package web;

import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

@ManagedBean(name="registro")
@ViewScoped
public class registro {
    @EJB
    private RegistroService service;
    private List<ciudad> listaCiudades;
    private String nombre;
    private String ciudad;
    private Date fechaNacimiento;
    
    @PostConstruct
    public void iniciar(){
            listaCiudades = service.buscarCiudadTodas();
    }
    
    public void registrar(){
            //informar al usuario todo ok
            FacesContext ctx = FacesContext.getCurrentInstance();
            //Crear mensaje
            String mensaje = "Sus datos fueron registrados";
            FacesMessage msgInfo;
            msgInfo = new FacesMessage(FacesMessage.SEVERITY_INFO, "REGIST", mensaje);
            ctx.addMessage(null, msgInfo);
    }
    
    public String getNombre(){
            return nombre;
    }
    
    public void setNombre(String nombre){
            this.nombre=nombre;
    }
    
    public String getCiudad(){
            return ciudad;
    }
    
    public void setCiudad(String ciudad){
            this.ciudad=ciudad;
    }
    
    public Date getFechaNacimiento(){
            return fechaNacimiento;
    }
     
    public void setFechaNacimiento(Date fechaNacimiento){
            this.fechaNacimiento=fechaNacimiento;
    }

    public List<ciudad> getListaCiudades() {
        return listaCiudades;
    }

    public void setListaCiudades(List<ciudad> listaCiudades) {
        this.listaCiudades = listaCiudades;
    }
    
    
}
