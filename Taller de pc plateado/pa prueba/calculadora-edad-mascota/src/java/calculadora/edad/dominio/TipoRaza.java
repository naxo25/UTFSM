package calculadora.edad.dominio;

public enum TipoRaza {

    a("Pequeño"),
    b("Mediano"),
    c("Grande"),
    d("Gigante");

    private final String descripcion;

    private TipoRaza(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return descripcion;
    }

}
