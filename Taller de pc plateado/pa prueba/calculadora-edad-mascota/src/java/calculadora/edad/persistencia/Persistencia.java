package calculadora.edad.persistencia;

import calculadora.edad.dominio.Raza;
import calculadora.edad.dominio.TipoRaza;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.ejb.Singleton;

@Singleton
public class Persistencia {

    private Map<Integer, Raza> mapRaza;

    @PostConstruct
    public void iniciar() {
        mapRaza = new LinkedHashMap<>();
        int id = 0;

        mapRaza.put(++id, new Raza(id, "Chihuahua", TipoRaza.a));
        mapRaza.put(++id, new Raza(id, "Fox Terrier Toy", TipoRaza.a));
        mapRaza.put(++id, new Raza(id, "Bulldog Francés", TipoRaza.a));
        mapRaza.put(++id, new Raza(id, "Otra raza pequeña", TipoRaza.a));

        mapRaza.put(++id, new Raza(id, "Bull Terrier", TipoRaza.b));
        mapRaza.put(++id, new Raza(id, "Labrador", TipoRaza.b));
        mapRaza.put(++id, new Raza(id, "Bulldog", TipoRaza.b));
        mapRaza.put(++id, new Raza(id, "Otra raza mediana", TipoRaza.b));

        mapRaza.put(++id, new Raza(id, "Akita Inu", TipoRaza.c));
        mapRaza.put(++id, new Raza(id, "Pastor Alemán", TipoRaza.c));
        mapRaza.put(++id, new Raza(id, "Boxer", TipoRaza.c));
        mapRaza.put(++id, new Raza(id, "Otra raza grande", TipoRaza.c));

        mapRaza.put(++id, new Raza(id, "Bullmastiff", TipoRaza.d));
        mapRaza.put(++id, new Raza(id, "Fila Brasileiro", TipoRaza.d));
        mapRaza.put(++id, new Raza(id, "San Bernardo", TipoRaza.d));
        mapRaza.put(++id, new Raza(id, "Otra raza gigante", TipoRaza.d));

    }

    public Raza buscarPorId(Integer id) {
        return mapRaza.get(id);
    }

    public List<Raza> buscarTodas() {
        return new ArrayList<>(mapRaza.values());
    }

}
