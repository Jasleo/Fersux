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
}
