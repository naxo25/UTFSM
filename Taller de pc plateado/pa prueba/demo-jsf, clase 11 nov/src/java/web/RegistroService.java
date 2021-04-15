package web;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;

@Stateless

public class RegistroService {
    
    public List<ciudad> buscarCiudadTodas(){
        //Simula acceso a la base de datos
        List<ciudad> Lista = new ArrayList<>();
        
        Lista.add(new ciudad("QP", "QUILPUE"));
        Lista.add(new ciudad("BT", "BELLOTO"));
        Lista.add(new ciudad("PB", "PEÑA BLANCA"));
        
        return Lista;
    }
}
