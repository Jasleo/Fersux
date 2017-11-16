package model.bd;

public class Comentario {
    private int id;
    private String comentario;
    private int usuario_FK_Comenta;
    private int  publicacion_FK;

    public Comentario() {
    }

    public Comentario(int id, String comentario, int usuario_FK_Comenta, int publicacion_FK) {
        this.id = id;
        this.comentario = comentario;
        this.usuario_FK_Comenta = usuario_FK_Comenta;
        this.publicacion_FK = publicacion_FK;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getUsuario_FK_Comenta() {
        return usuario_FK_Comenta;
    }

    public void setUsuario_FK_Comenta(int usuario_FK_Comenta) {
        this.usuario_FK_Comenta = usuario_FK_Comenta;
    }

    public int getPublicacion_FK() {
        return publicacion_FK;
    }

    public void setPublicacion_FK(int publicacion_FK) {
        this.publicacion_FK = publicacion_FK;
    }
    
    
}
