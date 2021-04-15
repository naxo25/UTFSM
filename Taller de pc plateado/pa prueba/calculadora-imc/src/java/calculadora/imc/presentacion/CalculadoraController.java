
package calculadora.imc.presentacion;

import calculadora.imc.dominio.Persona;
import calculadora.imc.servicio.CalculadoraService;
import calculadora.imc.dominio.IndiceMasaCorporal;
import calculadora.imc.dominio.Registro;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

@ManagedBean(name="calc")
@ViewScoped

public class CalculadoraController implements Serializable {
    
    @EJB
    private CalculadoraService service;
    private String correo;
    private double peso;
    private double altura;

    public void calcular(){
        Persona persona = new Persona();
        persona.setAltura(altura);
        persona.setCorreo(correo);
        persona.setMasa(peso);
        
        IndiceMasaCorporal resultados = service.calcular(persona);
        
        
        //mensajes para conversar con JSF
        FacesContext ctx = FacesContext.getCurrentInstance();
        FacesMessage msg;
        
        Registro personas = service.guardar(persona, resultados);

        msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                                            "ALTURA: ",
                                            String.valueOf(persona.getAltura()));
        ctx.addMessage(null, msg);  
        
        msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                                            "PESO: ",
                                            String.valueOf(persona.getMasa()));
        ctx.addMessage(null, msg);  

        msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                                            "CÁLCULO: ",
                                            String.valueOf(resultados.getCalculo()));
        ctx.addMessage(null, msg);          
        
        if(resultados.getDescripcion() == "Obesidad"){
            msg = new FacesMessage(FacesMessage.SEVERITY_FATAL,
                                                "IMC: ",
                                                String.valueOf(resultados.getDescripcion()));  
            ctx.addMessage(null, msg);                          
        }else if(resultados.getDescripcion() == "Sobrepeso"){
                msg = new FacesMessage(FacesMessage.SEVERITY_FATAL,
                                                    "IMC: ",
                                                    String.valueOf(resultados.getDescripcion()));  
                ctx.addMessage(null, msg);         
                }else if(resultados.getDescripcion() == "Bajo Peso"){
                        msg = new FacesMessage(FacesMessage.SEVERITY_FATAL,
                                                            "IMC: ",
                                                            String.valueOf(resultados.getDescripcion()));  
                        ctx.addMessage(null, msg);                          
                        }else{
                            msg = new FacesMessage(FacesMessage.SEVERITY_INFO,
                                                                "IMC: ",
                                                                String.valueOf(resultados.getDescripcion()));  
                            ctx.addMessage(null, msg);   
                            
            
        }
                        
    }
    
    
    
    
    
    

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }
    
    
    
    
    
    

    
    
    
    
}





