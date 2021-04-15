package juego.presentacion;

import java.io.Serializable;
import java.util.Random;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@ManagedBean(name = "juego")
@SessionScoped
public class JuegoController implements Serializable {

    private int numeroSecreto;
    // para evitar ver el 0 en el form
    @NotNull(message = "Debe ingresar un número")
    @Min(value = 1, message = "Valor minimo para jugar 1")
    @Max(value = 100, message = "Valor maximo para jugar 100")
    private Integer numero;
    private String mensaje;

    @PostConstruct
    public void iniciar() {
        Random rd = new Random();
        numeroSecreto = rd.nextInt(100) + 1;
        mensaje = "";
        numero = null;
    }

    public void adivinar() {
        if (numero == numeroSecreto) {
            mensaje = "GANASTE !!";
        } else if (numero > numeroSecreto) {
            mensaje = "MUY ALTO !!";
        } else {
            mensaje = "MUY BAJO !!";
        }
        FacesContext ctx = FacesContext.getCurrentInstance();

        ctx.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, mensaje, mensaje));
    }

    // insertar getter and setter
    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

}
