package lab.servicio;

import lab.persistencia.FabricaCancionesSingleton;
import lab.dominio.Cancion;
import lab.persistencia.FabricaAlumnosService;
import java.util.Arrays;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless
public class CancionService {
    
   @EJB
    private FabricaCancionesSingleton service;

    public List<Cancion> buscarTodas() {
        return Arrays.asList(service.obtenerArregloCanciones());
    }
}
