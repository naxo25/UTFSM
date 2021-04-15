package lab.dominio;

public class Rut {

    private int numero;
    private char dv;

    public Rut() {
    }

    public Rut(int numero, char dv) {
        this.numero = numero;
        this.dv = dv;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public char getDv() {
        return dv;
    }

    public void setDv(char dv) {
        this.dv = dv;
    }

    @Override
    public String toString() {
        return "Rut{" + "numero=" + numero + ", dv=" + dv + '}';
    }

}
