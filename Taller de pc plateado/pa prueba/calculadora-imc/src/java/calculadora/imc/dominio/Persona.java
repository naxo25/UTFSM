package calculadora.imc.dominio;

import java.io.Serializable;

public class Persona implements Serializable {

    private String correo;
    private double masa;
    private double altura;

    public Persona() {
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public double getMasa() {
        return masa;
    }

    public void setMasa(double masa) {
        this.masa = masa;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }


    @Override
    public String toString() {
        return "Persona{" + "correo=" + correo + ", masa=" + masa + ", altura=" + altura + '}';
    }

}
