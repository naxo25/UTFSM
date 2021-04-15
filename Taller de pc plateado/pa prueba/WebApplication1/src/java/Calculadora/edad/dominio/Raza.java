/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculadora.edad.dominio;

/**
 *
 * @author naxo
 */
public class Raza {
    private Integer id;
    private String nombre;
    private TipoRaza tipo;

    public Raza(Integer id, String nombre, TipoRaza tipo) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
    }
    
    public Raza() {
        
    }

    @Override
    public String toString() {
        return "Raza{" + "id=" + id + ", nombre=" + nombre + ", tipo=" + tipo + '}';
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
    
    
}
