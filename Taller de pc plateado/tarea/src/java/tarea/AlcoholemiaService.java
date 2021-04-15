package tarea;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.persistence.Query;
import tarea.Alcohol;

@Stateless
    public class AlcoholemiaService {

//inyectar el administrador de entidades
    @PersistenceContext
    private EntityManager em;
   
    public void guardar(Alcohol alcohol){
        System.out.println("GUARDANDO: "+ alcohol);
        alcohol.setFechaCreacion(new Date());
        em.persist(alcohol);
    }
    
    public void actualizar(Alcohol alcohol){
        em.merge(alcohol);
    }
    
    public void eliminar (long ID){
        Alcohol cm = em.find(Alcohol.class, ID);
        em.remove(cm);
    }
    
    public List<Alcohol> seleccionarTodosAlcohol(){
        Query query = em.createNamedQuery("Alcohol.seleccionarTodos");
        //query.setParameter("nombreParametro", "valor");
        List<Alcohol> resultado = query.getResultList();
        return resultado;
        
        
        //version corta: Query query = em.createNamedQuery("Alcohol.seleccionarTodos").getResultList();
    }
    
    public List<Alcohol> seleccionarPorMailAlcohol(String mail){
        Query query = em.createNamedQuery("Alcohol.seleccionarPorEmail");
        query.setParameter("correo", mail);
        return query.getResultList();
    }
 
}
