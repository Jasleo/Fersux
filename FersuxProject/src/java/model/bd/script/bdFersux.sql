CREATE DATABASE fersux;

USE fersux;

CREATE TABLE genero(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE usuario(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(50),
    generoFK INT,
    fecha date,
    nombreUsuario VARCHAR(50),
    contrasena VARCHAR (200),
    PRIMARY KEY(id)
    FOREIGN KEY(generoFK) REFERENCES genero(id)
);

CREATE TABLE publicacion(
    id INT AUTO_INCREMENT,
    texto VARCHAR(100),
    usuarioFK INT,
    PRIMARY KEY(id),
    FOREIGN KEY(usuario) REFERENCES usuario(id)
);

CREATE TABLE seguimiento(
    id INT AUTO_INCREMENT,
    usuarioFK_Seguidor INT,
    usuarioFK_Seguido INT,
    PRIMARY KEY(id),
    FOREIGN KEY(usuarioFK_Seguidor) REFERENCES usuario(id)
    FOREIGN KEY(usuarioFK_Seguido) REFERENCES usuario(id)
);