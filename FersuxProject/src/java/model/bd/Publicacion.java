package model.bd;
import java.sql.Timestamp;

public class Publicacion {
    
    private int id;
    private String texto;
    private int usuarioFK;
    private Timestamp fechaPublicacion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public int getUsuarioFK() {
        return usuarioFK;
    }

    public void setUsuarioFK(int usuarioFK) {
        this.usuarioFK = usuarioFK;
    }

    public Timestamp getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Timestamp fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }
}
