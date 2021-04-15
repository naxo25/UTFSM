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
public enum TipoRaza {
    PEQUENNO("Pequeño"),
    MEDIANO("Mediano"),
    GRANDE("Grande"),
    GIGANTE("Gigante");
    
    private final String descripcion;

    private TipoRaza(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return descripcion;
    }
    
    
}
