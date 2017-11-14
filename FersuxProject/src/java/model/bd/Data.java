package model.bd;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Data {

    private final Conexion con;
    private ResultSet rs;
    private String query;

    public Data() throws SQLException, ClassNotFoundException {

        con = new Conexion(
                "localhost",
                "fersux",//nombre BD
                "root",
                ""//Password
        );

    }

    public Usuario getUsuario(String cooreo) throws SQLException {
        Usuario u = null;

        rs = con.ejecutarSelect("SELECT * FROM usuario WHERE correo like '" + cooreo + "'");

        if (rs.next()) {
            u = new Usuario();

            u.setId(rs.getInt(1));
            u.setNombre(rs.getString(2));
            u.setApellido(rs.getString(3));
            u.setCorreo(rs.getString(3));
            u.setGenero(rs.getBoolean(5));
            u.setFecha(rs.getTimestamp(6));
            u.setNombreUsuario(rs.getString(7));
            u.setContrasena(rs.getString(8));
        }

        con.close();

        return u;
    }

    public void createUsuario(Usuario u) throws SQLException {

        con.ejecutar("INSERT INTO usuario "
                + "VALUES('" + u.getId() + "',"
                        + "'" + u.getNombre() + "','" + u.getApellido() + "','" + u.getCorreo() + "','" + u.isGenero() + "',"
                + "'" + u.getFecha() + "','" + u.getNombreUsuario() + "','" + u.getContrasena() + "'");
    }
    
    public void createPublicacion(Publicacion p) throws SQLException {

        con.ejecutar("INSERT INTO publicacion VALUES('"+p.getTexto()+"','"+p.getUsuarioFK()+"')");
               
    }
    
    public void createSeguimiento(Seguimiento s) throws SQLException {

        con.ejecutar("INSERT INTO seguimiento VALUES('"+s.getUsuarioFK_Seguidor()+"','"+s.getUsuarioFK_Seguido()+"')");
               
    }
    
    
   
    
}
