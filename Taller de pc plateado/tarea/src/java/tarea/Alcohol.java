package tarea;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author tusta
 */
@Entity
//mapear entidades
@Table(name="registro_alcoholemia")
@NamedQueries({
    @NamedQuery(name = "Alcohol.seleccionarTodos",
            //debe ser unico en el proyecto
            query = "SELECT a FROM Alcohol a ORDER BY a.fechaCreacion DESC"
            //JQPL sobre la entidad    
    ),
    @NamedQuery(name = "Alcohol.seleccionarPorEmail",
            query = "SELECT a FROM Alcohol a WHERE a.correoElectronico = :correo ORDER BY a.fechaCreacion DESC"
    ),
    @NamedQuery(name = "Alcohol.eliminarPorEmail",
            query = "DELETE FROM Alcohol a WHERE a.correoElectronico = :correo"
    )    
})
public class Alcohol implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_registro")
    private Long id;

    //mapear campos
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="fecha_creacion")
    private Date fechaCreacion;     
    
    @Column(name="mail")
    private String correoElectronico;
    
    @Column(name="mililitros")
    private Integer mlAlcohol;
    
    @Column(name="graduacion")
    private double gradosAlcohol;
    
    @Column(name="peso")
    private int pesoPersona;
    
    @Column(name="sexo")
    private String sexoPersona;
    
    @Column(name="alcoholemia")
    private double resultadosCalculo;
    
    @Column(name="estado")
    private String estadoCalculo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public Integer getMlAlcohol() {
        return mlAlcohol;
    }

    public void setMlAlcohol(Integer mlAlcohol) {
        this.mlAlcohol = mlAlcohol;
    }

    public double getGradosAlcohol() {
        return gradosAlcohol;
    }

    public void setGradosAlcohol(double gradosAlcohol) {
        this.gradosAlcohol = gradosAlcohol;
    }

    public int getPesoPersona() {
        return pesoPersona;
    }

    public void setPesoPersona(int pesoPersona) {
        this.pesoPersona = pesoPersona;
    }

    public String getSexoPersona() {
        return sexoPersona;
    }

    public void setSexoPersona(String sexoPersona) {
        this.sexoPersona = sexoPersona;
    }

    public double getResultadosCalculo() {
        return resultadosCalculo;
    }

    public void setResultadosCalculo(double resultadosCalculo) {
        this.resultadosCalculo = resultadosCalculo;
    }

    public String getEstadoCalculo() {
        return estadoCalculo;
    }

    public void setEstadoCalculo(String estadoCalculo) {
        this.estadoCalculo = estadoCalculo;
    }
    
    
    
    
    

    
    

    @Override
    public String toString() {
        return "mvc.frm.modelo.Alcohol[ id=" + id + " ]";
    }
    
}
