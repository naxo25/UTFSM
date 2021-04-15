package lab.persistencia;

import lab.dominio.Cancion;
import lab.dominio.Duracion;
import java.util.Random;
import javax.ejb.Singleton;

@Singleton
public class FabricaCancionesSingleton {

    private static final String LISTA_CANCIONES = ""
            + "1.	Intro - El Viaje	2:01\n"
            + "2.	Vive (Respira el momento)	5:29\n"
            + "3.	Interludio - Un buen día para morir	0:41\n"
            + "4.	El Aguante	4:49\n"
            + "5.	Ojos color sol	3:36\n"
            + "6.	Multi Viral	4:22\n"
            + "7.	Cuando los pies besan el piso	3:54\n"
            + "8.	Adentro 	4:53\n"
            + "9.	Interludio - Stupid is as stupid does	0:59\n"
            + "10.	Los idiotas	4:30\n"
            + "11.	Fuera de la atmósfera del cráneo	3:54\n"
            + "12.	Perseguidos	4:45\n"
            + "13.	Gato que avanza, perro que ladra	5:06\n"
            + "14.	Me vieron cruzar	3:53\n"
            + "15.	Así de grande son las ideas	5:11";

    private Cancion crearCancion(String linea) {
        String[] data = linea.split("\t");
        int numero = Integer.parseInt(data[0].replaceAll("\\D", ""));
        String nombre = data[1].trim();
        String duracion = data[2].trim();

        String[] dataDuracion = duracion.split(":");
        int minuto = Integer.parseInt(dataDuracion[0]);
        int segundo = Integer.parseInt(dataDuracion[1]);

        return new Cancion(numero, nombre, new Duracion(minuto, segundo));
    }

    public Cancion[] obtenerArregloCanciones() {
        String lineas[] = LISTA_CANCIONES.split("\n");
        Cancion[] alumnos = new Cancion[lineas.length];
        int idx = 0;
        for (String linea : lineas) {
            alumnos[idx++] = crearCancion(linea);
        }
        return alumnos;
    }

    public Cancion obtenerCancionAletaroria() {
        String lineas[] = LISTA_CANCIONES.split("\n");
        Random rnd = new Random();
        int idx = rnd.nextInt(lineas.length);
        return crearCancion(lineas[idx]);
    }

}
