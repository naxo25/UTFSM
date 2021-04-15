package lab.dominio;

import java.util.List;

public class Alumno {

    private Rut rut;
    private String nombre;
    private Double promedio;
    private String estado;
    private List<Double> listaNotas;

    public Alumno() {
    }

    public Alumno(Rut rut, String nombre) {
        this.rut = rut;
        this.nombre = nombre;
    }

    public Rut getRut() {
        return rut;
    }

    public void setRut(Rut rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Double> getListaNotas() {
        return listaNotas;
    }

    public void setListaNotas(List<Double> listaNotas) {
        this.listaNotas = listaNotas;
    }

    public Double getPromedio() {
        return promedio;
    }

    public void setPromedio(Double promedio) {
        this.promedio = promedio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Alumno{" + "rut=" + rut + ", nombre=" + nombre + ", promedio=" + promedio + ", estado=" + estado + ", listaNotas=" + listaNotas + '}';
    }

}
