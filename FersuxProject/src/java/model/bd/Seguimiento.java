package model.bd;

public class Seguimiento {

    private int id;
    private int usuarioFK_Actual; //usuario que le da a seguir, (usuario actual)
    private int usuarioFK_Seguido; // usuario al cual esta siguiendo

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuarioFK_Actual() {
        return usuarioFK_Actual;
    }

    public void setUsuarioFK_Actual(int usuarioFK_Actual) {
        this.usuarioFK_Actual = usuarioFK_Actual;
    }

    public int getUsuarioFK_Seguido() {
        return usuarioFK_Seguido;
    }

    public void setUsuarioFK_Seguido(int usuarioFK_Seguido) {
        this.usuarioFK_Seguido = usuarioFK_Seguido;
    }

    
    
    
}
