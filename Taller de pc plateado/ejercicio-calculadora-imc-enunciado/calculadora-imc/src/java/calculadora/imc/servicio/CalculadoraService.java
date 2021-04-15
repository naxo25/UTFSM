package calculadora.imc.servicio;

import calculadora.imc.dominio.Persona;
import calculadora.imc.dominio.IndiceMasaCorporal;
import calculadora.imc.dominio.Registro;
import calculadora.imc.persistencia.RegistroService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless
public class CalculadoraService {
    
    @EJB
    private RegistroService persistencia;
    
    public IndiceMasaCorporal calcular(Persona persona) {
        double masa = persona.getMasa();
        double altura = persona.getAltura();
        double calculo = masa / (altura * altura);
        String descripcion;
        if (calculo >= 30) {
            descripcion = "Obesidad";
        } else if (calculo >= 25) {
            descripcion = "Sobrepeso";
        } else if (calculo >= 18.5) {
            descripcion = "Normal";
        } else {
            descripcion = "Bajo Peso";
        }
        IndiceMasaCorporal resultado = new IndiceMasaCorporal();
        resultado.setCalculo(calculo);
        resultado.setDescripcion(descripcion);
        
        return resultado;
    }
    
    public Registro guardar(Persona persona, IndiceMasaCorporal imc) {
        Registro registro = new Registro();
        registro.setPersona(persona);
        registro.setImc(imc);
        registro.setFechaCreacion(new Date());
        
        persistencia.crear(registro);
        
        return registro;
    }
    
    public Registro buscarRegistroPorId(Long id) {
        return persistencia.buscarPorId(id);
    }
    
    public List<Registro> buscarRegistroTodos() {
        return persistencia.buscarTodos();
    }
    
    public List<Registro> buscarRegistroPorCorreo(String correo) {
        List<Registro> lstFiltrada = new ArrayList<>();
        for (Registro registro : persistencia.buscarTodos()) {
            if (registro.getPersona().getCorreo().equals(correo)) {
                lstFiltrada.add(registro);
            }
        }
        return lstFiltrada;
    }
    
    public Registro borrar(Registro registro) {
        Registro registroBorrado = persistencia.eliminar(registro);
        return registroBorrado;
    }
    
}
