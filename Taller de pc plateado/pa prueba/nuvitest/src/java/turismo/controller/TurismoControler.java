package turismo.control;

import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;
import turismo.dominio.Cliente;
import turismo.dominio.Destino;
import turismo.dominio.Periodo;
import turismo.dominio.Viaje;
import turismo.servicio.TurismoService;

@ManagedBean(name = "tur")
@ViewScoped
public class TurismoControler{

    @EJB
    private TurismoService service;
    private String rut;
    private String nombre;
    private Integer id;
    private Date inicio;
    private Date termino;
    private List<Destino> lista;
    private boolean vip;

    @PostConstruct
    public void iniciar() {
        lista = service.buscarDestinosTodos();
    }

    public void reservar() {
        Cliente cliente = new Cliente();
        Periodo periodo = new Periodo();
        cliente.setRut(rut);
        cliente.setNombre(nombre);
        periodo.setInicio(inicio);
        periodo.setTermino(termino);
        Destino destino = service.buscarDestino(id);
        try {

            Viaje viaje = service.reservar(cliente, destino, periodo, vip);
            FacesContext ctx = FacesContext.getCurrentInstance();
            FacesMessage msg;
            msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "rut",
                    String.valueOf(cliente.getRut()));
            ctx.addMessage(null, msg);

            msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "nombre",
                    String.valueOf(cliente.getNombre()));
            ctx.addMessage(null, msg);

            msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "fechaI",
                    String.valueOf(periodo.getInicio()));
            ctx.addMessage(null, msg);

            msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "fechaD",
                    String.valueOf(periodo.getTermino()));
            ctx.addMessage(null, msg);

            msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "Costo Total",
                    String.valueOf(viaje.getCostoTotal()));
            ctx.addMessage(null, msg);

        } catch (Exception e) {

            FacesContext ctx = FacesContext.getCurrentInstance();
            FacesMessage msg;
            msg = new FacesMessage(FacesMessage.SEVERITY_WARN,
                    "Error, verifique las fechas. Fecha final debe superar la inicial en 5 días",
                    "");
            ctx.addMessage(null, msg);
        }

    }

    public void validar(FacesContext arg0, UIComponent arg1, Object arg2)
            throws ValidatorException {
        if (((String) arg2).length() < 10) {
            throw new ValidatorException(new FacesMessage("Debe tener minimo 10 caracteres"));
        }
    }

    public void validar_minimo(FacesContext arg0, UIComponent arg1, Object arg2)
            throws ValidatorException {
        if (((String) arg2).length() < 5) {
            throw new ValidatorException(new FacesMessage("Debe ser minimo 5 caracteres"));
        }
    }

    public TurismoService getService() {
        return service;
    }

    public void setService(TurismoService service) {
        this.service = service;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getTermino() {
        return termino;
    }

    public void setTermino(Date termino) {
        this.termino = termino;
    }

    public List<Destino> getLista() {
        return lista;
    }

    public void setLista(List<Destino> lista) {
        this.lista = lista;
    }

    public boolean isVip() {
        return vip;
    }

    public void setVip(boolean vip) {
        this.vip = vip;
    }
}