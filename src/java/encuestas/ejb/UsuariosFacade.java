/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encuestas.ejb;

import encuestas.entity.Usuarios;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author javie
 */
@Stateless
public class UsuariosFacade extends AbstractFacade<Usuarios> {

    @PersistenceContext(unitName = "EncuestasPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuariosFacade() {
        super(Usuarios.class);
    }
    
    public Usuarios comprobarUsuario (String user) {
        Query q;
        
        q = this.getEntityManager().createNamedQuery("Usuarios.findByCorreo");
        q.setParameter("correo", user);
        List<Usuarios> lista = q.getResultList();
        if (lista == null || lista.isEmpty()) {
            return null;
        } else {
            return lista.get(0);
        }
        
    }
    
    public Usuarios comprobarPassword (String password) {
        Query q;
        
        q = this.getEntityManager().createNamedQuery("Usuarios.findByPassword");
        q.setParameter("pass", password);
        List<Usuarios> lista = q.getResultList();
        if (lista == null || lista.isEmpty()) {
            return null;
        } else {
            return lista.get(0);
        }
        
    }
    
}
