/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encuestas.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author javie
 */
@Embeddable
public class ResultadosPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "id_log")
    private int idLog;
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_pregunta")
    private int idPregunta;

    public ResultadosPK() {
    }

    public ResultadosPK(int idLog, int idPregunta) {
        this.idLog = idLog;
        this.idPregunta = idPregunta;
    }

    public int getIdLog() {
        return idLog;
    }

    public void setIdLog(int idLog) {
        this.idLog = idLog;
    }

    public int getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idLog;
        hash += (int) idPregunta;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ResultadosPK)) {
            return false;
        }
        ResultadosPK other = (ResultadosPK) object;
        if (this.idLog != other.idLog) {
            return false;
        }
        if (this.idPregunta != other.idPregunta) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "encuestas.entity.ResultadosPK[ idLog=" + idLog + ", idPregunta=" + idPregunta + " ]";
    }
    
}
