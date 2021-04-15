package calculadora.edad.servicio;

import calculadora.edad.vo.CalculoEdad;
import calculadora.edad.dominio.Mascota;
import calculadora.edad.dominio.Raza;
import calculadora.edad.persistencia.Persistencia;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless
public class CalculadoraEdadService {

    private static final Logger LOG = Logger.getLogger(CalculadoraEdadService.class.getName());

    @EJB
    private Persistencia persistencia;

    /**
     * Calcula la edad de la mascota segun la fecha actual del sistema
     * @param mascota
     * @return 
     */
    public CalculoEdad calcular(Mascota mascota) {
        return calcular(mascota, new Date());
    }

    /**
     * Calcula la edad de la mascota
     * @param mascota
     * @param fecha fecha que se utliza para calcular la edad
     * @return 
     */
    public CalculoEdad calcular(Mascota mascota, Date fecha) {
        LOG.log(Level.INFO, "CALCULAR-EDAD-MASCOTA: {0}", mascota);

        final double factorMiliHaciaAnno = 1000.0 * 60.0 * 60.0 * 24.0 * 365.0;
        final double factorEquivalenciaPrimerosAnnos = 12;

        long dif = fecha.getTime() - mascota.getFechaNacimiento().getTime();

        double edadHumana = dif / factorMiliHaciaAnno;
        LOG.log(Level.INFO, "EDAD-HUMANA: {0}", edadHumana);

        double edadMascota;
        if (edadHumana <= 2.0) {
            edadMascota = edadHumana * factorEquivalenciaPrimerosAnnos;
        } else {
            int factorEquivalenciaSiguientesAnnos = 0;
            switch (mascota.getRaza().getTipo()) {
                case a:
                    factorEquivalenciaSiguientesAnnos = 4;
                    break;
                case b:
                    factorEquivalenciaSiguientesAnnos = 5;
                    break;
                case c:
                    factorEquivalenciaSiguientesAnnos = 6;
                    break;
                case d:
                    factorEquivalenciaSiguientesAnnos = 7;
                    break;
            }
            edadMascota = (factorEquivalenciaPrimerosAnnos * 2) + ((edadHumana - 2) * factorEquivalenciaSiguientesAnnos);
        }
        LOG.log(Level.INFO, "EDAD-MASCOTA: {0}", edadMascota);

        CalculoEdad resultado = new CalculoEdad();
        resultado.setEdadHumana(edadHumana);
        resultado.setEdadMascota(edadMascota);
        return resultado;
    }

    /**
     * Busca una raza por el id
     * @param id
     * @return objeto Raza o null si no se encuentra
     */
    public Raza buscarRazaPorId(Integer id) {
        return persistencia.buscarPorId(id);
    }

    /**
     * Buscar todos los objetos Raza
     * @return coleccion de objetos Raza
     */
    public List<Raza> buscarRazaTodas() {
        return persistencia.buscarTodas();
    }

}
