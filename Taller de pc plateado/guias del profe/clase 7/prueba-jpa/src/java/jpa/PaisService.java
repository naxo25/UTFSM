package jpa;

import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author alumnosinf
 */
@Stateless
public class PaisService {

    private static final Logger LOG = Logger.getLogger(PaisService.class.getName());
    
    // inyectar el Administrador de entidades
    @PersistenceContext
    private EntityManager em;
    
    // metodo de negocio
    public Pais buscarPorCodigo(String codigo){
        Pais pais = em.find(Pais.class, codigo);
        LOG.info("buscarPorCodigo: " + codigo + " : " + pais);
        return pais;
    }
    
}
