package calculadora.edad.dominio;

public class Raza {

    private Integer id;
    private String nombre;
    private TipoRaza tipo;

    public Raza() {
    }

    public Raza(Integer id, String nombre, TipoRaza tipo) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public TipoRaza getTipo() {
        return tipo;
    }

    public void setTipo(TipoRaza tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Raza{" + "id=" + id + ", nombre=" + nombre + ", tipo=" + tipo + '}';
    }

    
}
