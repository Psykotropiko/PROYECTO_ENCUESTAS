/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encuestas.entity;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author javie
 */
@Entity
@Table(name = "resultados")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Resultados.findAll", query = "SELECT r FROM Resultados r")
    , @NamedQuery(name = "Resultados.findByIdLog", query = "SELECT r FROM Resultados r WHERE r.resultadosPK.idLog = :idLog")
    , @NamedQuery(name = "Resultados.findByIdPregunta", query = "SELECT r FROM Resultados r WHERE r.resultadosPK.idPregunta = :idPregunta")})
public class Resultados implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ResultadosPK resultadosPK;
    @JoinColumn(name = "id_log", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Logs logs;
    @JoinColumn(name = "id_pregunta", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Pregunta pregunta;
    @JoinColumn(name = "id_respuesta", referencedColumnName = "id")
    @ManyToOne
    private Respuesta idRespuesta;

    public Resultados() {
    }

    public Resultados(ResultadosPK resultadosPK) {
        this.resultadosPK = resultadosPK;
    }

    public Resultados(int idLog, int idPregunta) {
        this.resultadosPK = new ResultadosPK(idLog, idPregunta);
    }

    public ResultadosPK getResultadosPK() {
        return resultadosPK;
    }

    public void setResultadosPK(ResultadosPK resultadosPK) {
        this.resultadosPK = resultadosPK;
    }

    public Logs getLogs() {
        return logs;
    }

    public void setLogs(Logs logs) {
        this.logs = logs;
    }

    public Pregunta getPregunta() {
        return pregunta;
    }

    public void setPregunta(Pregunta pregunta) {
        this.pregunta = pregunta;
    }

    public Respuesta getIdRespuesta() {
        return idRespuesta;
    }

    public void setIdRespuesta(Respuesta idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (resultadosPK != null ? resultadosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Resultados)) {
            return false;
        }
        Resultados other = (Resultados) object;
        if ((this.resultadosPK == null && other.resultadosPK != null) || (this.resultadosPK != null && !this.resultadosPK.equals(other.resultadosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "encuestas.entity.Resultados[ resultadosPK=" + resultadosPK + " ]";
    } 
}
