package calculadora.edad.vo;

public class CalculoEdad {
    private double edadHumana;
    private double edadMascota;

    public CalculoEdad() {
    }

    public double getEdadHumana() {
        return edadHumana;
    }

    public void setEdadHumana(double edadHumana) {
        this.edadHumana = edadHumana;
    }

    public double getEdadMascota() {
        return edadMascota;
    }

    public void setEdadMascota(double edadMascota) {
        this.edadMascota = edadMascota;
    }

    @Override
    public String toString() {
        return "CalculoEdad{" + "edadHumana=" + edadHumana + ", edadMascota=" + edadMascota + '}';
    }
    
    
}
