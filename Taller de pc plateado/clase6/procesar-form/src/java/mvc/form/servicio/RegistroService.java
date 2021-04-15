package mvc.form.servicio;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import mvc.form.dominio.Zona;
import mvc.form.dominio.Pasatiempo;

@Stateless
public class RegistroService {

    public List<Zona> buscarZonas() {
        // simula acceso a base de datos retornando zonas de chile
        List<Zona> lstZonas = new ArrayList<>();
        lstZonas.add(new Zona("ZN", "ZONA NORTE"));
        lstZonas.add(new Zona("ZC", "ZONA CENTRO"));
        lstZonas.add(new Zona("ZS", "ZONA SUR"));

        return lstZonas;
    }

    public List<Pasatiempo> buscarPasatiempos() {
        // simula acceso a base de datos retornando Pasatiempo
        List<Pasatiempo> lista = new ArrayList<>();
        lista.add(new Pasatiempo(1, "DORMIR"));
        lista.add(new Pasatiempo(2, "COMER"));
        lista.add(new Pasatiempo(3, "JUGAR"));

        return lista;
    }
}
