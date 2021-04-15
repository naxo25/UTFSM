package lab.dominio;

public class Cancion {

    private int numero;
    private String nombre;
    private Duracion duracion;

    public Cancion() {
    }

    public Cancion(int numero, String nombre, Duracion duracion) {
        this.numero = numero;
        this.nombre = nombre;
        this.duracion = duracion;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Duracion getDuracion() {
        return duracion;
    }

    public void setDuracion(Duracion duracion) {
        this.duracion = duracion;
    }

    @Override
    public String toString() {
        return "Cancion{" + "numero=" + numero + ", nombre=" + nombre + ", duracion=" + duracion + '}';
    }

}
