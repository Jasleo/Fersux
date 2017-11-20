package model.bd;

public class Publicacion {
    
    private int id;
    private String texto;
    private int usuarioFK;
    private String fecha;

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

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
    
    
}
