package lab.persistencia;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.Singleton;

@Singleton
public class FabricaNombresSingleton {

    private static final Logger LOG = Logger.getLogger(FabricaNombresSingleton.class.getName());

    private Random random;
    private List<String> lstNombres;
    private List<String> lstApellidos;

    @PostConstruct
    public void iniciar() {
        random = new Random();
        lstNombres = leerDatos("lab/persistencia/nombres.txt");
        lstApellidos = leerDatos("lab/persistencia/apellidos.txt");
    }

    private List<String> leerDatos(String fuente) {
        Set<String> lstDatos = new HashSet<>();

        try (
                InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(fuente);
                InputStreamReader isr = new InputStreamReader(in, "UTF-8");) {

            Scanner sc = new Scanner(isr);
            while (sc.hasNext()) {
                lstDatos.add(sc.nextLine());
            }
        } catch (IOException ex) {
            LOG.log(Level.SEVERE, null, ex);
        }
        return new ArrayList<>(lstDatos);
    }

    public String crearNombreCompleto() {
        StringBuilder nombreCompleto = new StringBuilder();
        nombreCompleto.append(lstNombres.get(random.nextInt(lstNombres.size())));
        nombreCompleto.append(" ");
        nombreCompleto.append(lstApellidos.get(random.nextInt(lstApellidos.size())));
        nombreCompleto.append(" ");
        nombreCompleto.append(lstApellidos.get(random.nextInt(lstApellidos.size())));

        return nombreCompleto.toString();
    }

}
