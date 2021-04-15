package calculadora.imc.persistencia;

import calculadora.imc.dominio.Registro;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.ejb.Singleton;

@Singleton
public class RegistroService {

    private long secuencia;
    private Map<Long, Registro> mapRegistro;
     
    @PostConstruct
    public void iniciar() {
        secuencia = 1;
        mapRegistro = new LinkedHashMap<>();
    }

    public void crear(Registro registro) {
        registro.setId(secuencia++);
        mapRegistro.put(registro.getId(), registro);
    }

    public Registro eliminar(Registro registro) {
        Registro registroEliminado = mapRegistro.remove(registro.getId());
        return registroEliminado;
    }

    public List<Registro> buscarTodos() {
        return new ArrayList<>(mapRegistro.values());
    }

    public Registro buscarPorId(Long id) {
        return mapRegistro.get(id);
    }

}
