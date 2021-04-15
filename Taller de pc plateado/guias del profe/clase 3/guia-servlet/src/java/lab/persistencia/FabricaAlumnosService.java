package lab.persistencia;

import lab.dominio.Alumno;
import lab.dominio.Rut;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Random;
import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless
public class FabricaAlumnosService {

    @EJB
    private FabricaNombresSingleton nombresService;

    public Alumno[] obtenerArregloAlumnos(int cantidadNotas) {
        int cantidadAlumnos = 30;
        Alumno[] arrAlumnos = new Alumno[cantidadAlumnos];
        for (int i = 0; i < arrAlumnos.length; i++) {
            Alumno a = new Alumno();
            arrAlumnos[i] = a;
            a.setNombre(nombresService.crearNombreCompleto());
            a.setRut(crearRut());
            Double[] arrNotas = obtenerArregloNotas(cantidadNotas);
            a.setListaNotas(Arrays.asList(arrNotas));
            double promedio = calcarPromedio(arrNotas);
            a.setPromedio(promedio);
            if (promedio > 4.0) {
                a.setEstado("APROBADO");
            } else {
                a.setEstado("REPROBADO");
            }
        }
        return arrAlumnos;
    }

    public Double[] obtenerArregloNotas(int cantidadNotas) {
        Random rnd = new Random();
        Double[] arrNotas = new Double[cantidadNotas];
        for (int i = 0; i < cantidadNotas; i++) {
            double nota = (rnd.nextInt(60) + 10) / 10.0;
            arrNotas[i] = BigDecimal.valueOf(nota).setScale(1, RoundingMode.HALF_UP).doubleValue();
        }
        return arrNotas;
    }

    public double calcarPromedio(Double[] arrNotas) {
        double suma = 0;
        for (Double n : arrNotas) {
            suma += n;
        }
        double promedio = suma / arrNotas.length;
        BigDecimal b = BigDecimal.valueOf(promedio);

        return b.setScale(1, RoundingMode.HALF_UP).doubleValue();
    }

    private Rut crearRut() {
        Random rnd = new Random();
        String datosDv = "0123456789K";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            sb.append(rnd.nextInt(10));
        }
        char dv = datosDv.charAt(rnd.nextInt(datosDv.length()));
        return new Rut(Integer.parseInt(sb.toString()), dv);
    }

}
