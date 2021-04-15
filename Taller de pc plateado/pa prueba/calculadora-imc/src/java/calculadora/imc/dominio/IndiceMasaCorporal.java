package calculadora.imc.dominio;

import java.io.Serializable;

public class IndiceMasaCorporal implements Serializable {

    private double calculo;
    private String descripcion;

    public IndiceMasaCorporal() {
    }

    public double getCalculo() {
        return calculo;
    }

    public void setCalculo(double calculo) {
        this.calculo = calculo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "IndiceMasaCorporal{" + "calculo=" + calculo + ", descripcion=" + descripcion + '}';
    }

}
