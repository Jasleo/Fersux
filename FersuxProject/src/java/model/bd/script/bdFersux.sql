CREATE DATABASE fersux;

USE fersux;

CREATE TABLE usuario(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(50),
    nombreUsuario VARCHAR(50),
    contrasena VARCHAR (200),
    genero VARCHAR(1),
    fecha DATE,
    PRIMARY KEY(id)  
);

CREATE TABLE publicacion(
    id INT AUTO_INCREMENT,
    texto VARCHAR(100),
    fecha DATETIME,
    usuarioFK INT,
    PRIMARY KEY(id),
    FOREIGN KEY(usuarioFK) REFERENCES usuario(id)
);

CREATE TABLE seguimiento(
    id INT AUTO_INCREMENT,
    usuarioFK_Actual INT,
    usuarioFK_Seguido INT,
    PRIMARY KEY(id),
    FOREIGN KEY(usuarioFK_Actual) REFERENCES usuario(id),
    FOREIGN KEY(usuarioFK_Seguido) REFERENCES usuario(id)
);

CREATE TABLE comentario(
    id INT AUTO_INCREMENT,
    comentario VARCHAR(500),
    usuario_FK_Comenta INT,
    publicacion_FK INT,
    PRIMARY KEY(id),
    FOREIGN KEY(usuario_FK_Comenta) REFERENCES usuario(id),
    FOREIGN KEY(publicacion_FK) REFERENCES publicacion(id)
);

-- DROP DATABASE fersux;

SELECT * FROM usuario;
SELECT * FROM publicacion;
SELECT * FROM seguimiento;
SELECT * FROM comentario;

SELECT * FROM usuario WHERE nombre LIKE '%hila%' OR apellido LIKE '%hila%' AND id NOT LIKE '1'