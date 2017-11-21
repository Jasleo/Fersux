package model.bd;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Data {

    private final Conexion con;
    private ResultSet rs;
    private String query;

    public Data() throws SQLException, ClassNotFoundException {

        con = new Conexion(
                "localhost",
                "fersux",//nombre BD
                "root",
                "12345"//Password
        );

    }

    // metodo para el inicio de sesion
    public Usuario getUsuario(String cooreo, String contrasena) throws SQLException {
        Usuario u = null;

        rs = con.ejecutarSelect("SELECT * FROM usuario WHERE correo LIKE '" + cooreo + "' AND contrasena LIKE '" + contrasena + "'");

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
        con.ejecutar("INSERT INTO usuario VALUES (null, '" + u.getNombre() + "', '" + u.getApellido() + "', '" + u.getCorreo() + "', '" + u.getNombreUsuario() + "', '" + u.getContrasena() + "', '" + u.getGenero() + "', '" + u.getFecha() + "')");
    }

    public void createPublicacion(Publicacion p) throws SQLException {
        con.ejecutar("INSERT INTO publicacion VALUES(null, '" + p.getTexto() + "', 'now()' , '" + p.getUsuarioFK() + "')");

    }

    // id, usario actual, usuario a quien sigo
    public void createSeguimiento(Seguimiento s) throws SQLException {
        con.ejecutar("INSERT INTO seguimiento VALUES(null, '" + s.getUsuarioFK_Actual() + "','" + s.getUsuarioFK_Seguido() + "')");
    }

    // id, comentario, usuario que comenta, publicacion que comenta 
    public void createComentario(Comentario c) throws SQLException {
        con.ejecutar("INSERT INTO comentario VALUES(null, '" + c.getComentario() + "', 'now()' ,'" + c.getUsuario_FK_Comenta() + "', '" + c.getPublicacion_FK() + "')");
    }

    public static Timestamp dateToTimeStamp(Date fecha) {
        return new Timestamp(fecha.getTime());
    }

    // retornara la cantidad de publicaciones realizadas
    public int getCantPublicaciones(int idUsuario) throws SQLException {
        int cantPublicaciones = 0;
        Publicacion p;

        rs = con.ejecutarSelect("SELECT COUNT(*) FROM publicacion WHERE usuarioFK = " + idUsuario);

        if (rs.next()) {
            p = new Publicacion();
            p.setId(rs.getInt(1));
            cantPublicaciones = p.getId();
        }
        con.close();

        return cantPublicaciones;
    }

    // metodo que retornara la cantidad de seguidores que tiene el usuario
    public int getCantSeguidores(int idUsuario) throws SQLException {
        int cantSeguidores = 0;
        Seguimiento s;

        rs = con.ejecutarSelect("SELECT COUNT(*) FROM seguimiento WHERE usuarioFK_Seguido = " + idUsuario);

        if (rs.next()) {
            s = new Seguimiento();
            s.setId(rs.getInt(1));
            cantSeguidores = s.getId();
        }
        con.close();

        return cantSeguidores;
    }

    // metodo para saber a cuantas personas sigue el usuario
    public int getCantSeguidos(int idUsuario) throws SQLException {
        int cantSeguidos = 0;
        Publicacion p;

        rs = con.ejecutarSelect("SELECT COUNT(*) FROM seguimiento WHERE usuarioFK_Seguidor = " + idUsuario);

        if (rs.next()) {
            p = new Publicacion();
            p.setId(rs.getInt(1));
            cantSeguidos = p.getId();
        }
        con.close();

        return cantSeguidos;
    }

    // metodo para buscar otros usuarios
    public List<Usuario> getUsuarios(String filtro, int idUsuarioActual) throws SQLException {
        List<Usuario> lista = new ArrayList<>();

        query = "SELECT * FROM usuario "
                + "WHERE nombre LIKE '%" + filtro + "%' OR "
                + "apellido LIKE '%" + filtro + "%' AND id NOT LIKE '" + idUsuarioActual + "'";

        rs = con.ejecutarSelect(query);
        Usuario u;

        while (rs.next()) {
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

            lista.add(u);
        }

        con.close();

        return lista;
    }

    // datos que podran actualizar
    // nombre, apellido, correo, contraseña, fechaNacimiento
    public void actualizarUsuario(int idActual, Usuario u) throws SQLException {
        query = "UPDATE usuario SET nombre = '" + u.getNombre() + "', apellido = '" + u.getApellido() + "', correo = '" + u.getCorreo() + "', contrasena = '" + u.getContrasena() + "', fecha = '" + u.getFecha() + "'";

        con.ejecutar(query);
    }

    public List<Comentario> getComentarios(int id) throws SQLException {
        List<Comentario> lista = new ArrayList<>();
        query = "SELECT * FROM comentario WHERE usuario_FK_Comenta = " + id + " order by fecha desc";

        rs = con.ejecutarSelect(query);

        Comentario c = new Comentario();

        while (rs.next()) {
            c.setId(rs.getInt(1));
            c.setComentario(rs.getString(2));
            c.setFechaComentario(rs.getTimestamp(3));
            c.setUsuario_FK_Comenta(rs.getInt(4));
            c.setPublicacion_FK(rs.getInt(5));
        }
        con.close();
        return lista;
    }
    
    public void publicar(Publicacion p) throws SQLException{
        query ="INSERT INTO publicacion VALUES(null,'"+p.getUsuarioFK()+"','"+p.getTexto()+"',NOW());";
        con.ejecutar(query);
    }
    
}
