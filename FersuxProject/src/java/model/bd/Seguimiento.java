package model.bd;

public class Seguimiento {

    private int id;
    private String texto;
    private int usuarioFK_Seguidor;
    private int usuarioFK_Seguido;

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

    public int getUsuarioFK_Seguidor() {
        return usuarioFK_Seguidor;
    }

    public void setUsuarioFK_Seguidor(int usuarioFK_Seguidor) {
        this.usuarioFK_Seguidor = usuarioFK_Seguidor;
    }

    public int getUsuarioFK_Seguido() {
        return usuarioFK_Seguido;
    }

    public void setUsuarioFK_Seguido(int usuarioFK_Seguido) {
        this.usuarioFK_Seguido = usuarioFK_Seguido;
    }
    
    
    
}
