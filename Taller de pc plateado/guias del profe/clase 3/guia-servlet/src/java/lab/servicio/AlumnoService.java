package lab.servicio;

import lab.dominio.Alumno;
import lab.persistencia.FabricaAlumnosService;
import java.util.Arrays;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless
public class AlumnoService {

    @EJB
    private FabricaAlumnosService service;

    public int getCantidadNotas() {
        // Define el total de notas por alumno
        return 3;
    }

    public List<Alumno> buscarTodos() {
        return Arrays.asList(service.obtenerArregloAlumnos(getCantidadNotas()));
    }
}
