package calculadora.edad.dominio;

import java.util.Date;

public class Mascota {
    private String nombre;
    private Date fechaNacimiento;
    private Raza raza;

    public Mascota() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Raza getRaza() {
        return raza;
    }

    public void setRaza(Raza raza) {
        this.raza = raza;
    }

    @Override
    public String toString() {
        return "Mascota{" + "nombre=" + nombre + ", fechaNacimiento=" + fechaNacimiento + ", raza=" + raza + '}';
    }
    
    
}
