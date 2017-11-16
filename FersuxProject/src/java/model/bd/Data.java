package model.bd;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

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

    public Usuario getUsuario(String cooreo, String contrasena) throws SQLException {
        Usuario u = null;

        rs = con.ejecutarSelect("SELECT * FROM usuario WHERE correo LIKE '" + cooreo + "' AND contrasena LIKE '"+contrasena+"'");
        
        System.out.println("GET USUARIO");
        System.out.println(rs);
        
        if (rs.next()) {
            u = new Usuario();

            u.setId(rs.getInt(1));
            u.setNombre(rs.getString(2));
            u.setApellido(rs.getString(3));
            u.setCorreo(rs.getString(3));            
            u.setNombreUsuario(rs.getString(4));
            u.setContrasena(rs.getString(5));
            u.setGenero(rs.getString(6));
            u.setGenero(rs.getString(7));
            u.setFecha(rs.getTimestamp(8));
        }

        con.close();

        return u;
    }

    public void createUsuario(Usuario u) throws SQLException {

        con.ejecutar("INSERT INTO usuario VALUES (null, '"+u.getNombre()+"', '"+u.getApellido()+"', '"+u.getCorreo()+"', '"+u.getNombreUsuario()+"', '"+u.getContrasena()+"', '"+u.getGenero()+"', '"+u.getFecha()+"')");
    }
    
    public void createPublicacion(Publicacion p) throws SQLException {

        con.ejecutar("INSERT INTO publicacion VALUES('"+p.getTexto()+"','"+p.getUsuarioFK()+"')");
               
    }
    
    public void createSeguimiento(Seguimiento s) throws SQLException {

        con.ejecutar("INSERT INTO seguimiento VALUES('"+s.getUsuarioFK_Seguidor()+"','"+s.getUsuarioFK_Seguido()+"')");
               
    }
    
    public static Timestamp dateToTimeStamp(Date fecha) {
        return new Timestamp(fecha.getTime());
    }
    
    
   
    
}
