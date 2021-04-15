package jpa;

import java.util.List;
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
    public Pais buscarPorCodigo(String codigo) {
        Pais pais = em.find(Pais.class, codigo);
        LOG.info("buscarPorCodigo: " + codigo + " : " + pais);
        return pais;
    }

    // OP-1: Actualiza toda la fila PAIS
    public void actualizar(Pais pais) {
        em.merge(pais);
    }

    // OP-2: actualiza solo los atributos modificados 
    public void actualizar(String codigo, String nuevoNombre) {
        Pais pais = em.find(Pais.class, codigo);
        pais.setNombre(nuevoNombre);
    }

    public List<Pais> buscarTodos() {
        String jpql = "SELECT p FROM Pais p ORDER BY p.nombre";
        return em.createQuery(jpql, Pais.class)
                .getResultList();
    }

}
