package lab.dominio;

public class Duracion {

    private int minuto;
    private int segundo;

    public Duracion() {
    }

    public Duracion(int minuto, int segundo) {
        this.minuto = minuto;
        this.segundo = segundo;
    }

    public int getMinuto() {
        return minuto;
    }

    public void setMinuto(int minuto) {
        this.minuto = minuto;
    }

    public int getSegundo() {
        return segundo;
    }

    public void setSegundo(int segundo) {
        this.segundo = segundo;
    }

    @Override
    public String toString() {
        return "Duracion{" + "minuto=" + minuto + ", segundo=" + segundo + '}';
    }
}
