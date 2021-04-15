package calculadora.imc.dominio;

import java.io.Serializable;
import java.util.Date;

public class Registro implements Serializable {

    private Long id;
    private Persona persona;
    private IndiceMasaCorporal imc;
    private Date fechaCreacion;

    public Registro() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public IndiceMasaCorporal getImc() {
        return imc;
    }

    public void setImc(IndiceMasaCorporal imc) {
        this.imc = imc;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    @Override
    public String toString() {
        return "Registro{" + "id=" + id + ", persona=" + persona + ", imc=" + imc + ", fechaCreacion=" + fechaCreacion + '}';
    }

}
