CREATE DATABASE zumate_db;
USE zumate_db;

CREATE TABLE entrega_presencial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    tipo_donacion VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE recoleccion_domicilio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    departamento VARCHAR(30) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    distrito VARCHAR(30) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    tipo_donacion VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE patrocinar_proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombreEmpresa VARCHAR(50) NOT NULL,
    ruc VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    razonSocial VARCHAR(50) NOT NULL,
    nombreRep VARCHAR(50) NOT NULL,
    apellidosRep VARCHAR(50) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    proyecto VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE participar_chocolatada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    preferencia VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE participar_evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    eventos VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE programa_pasantia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    dni VARCHAR(8) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    institucion VARCHAR(50) NOT NULL,
    carrera VARCHAR(50) NOT NULL,
    ciclo VARCHAR(10) NOT NULL,
    horas VARCHAR(20) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE libro_reclamaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipoDocumento VARCHAR(10) NOT NULL,
    numeroDocumento VARCHAR(12) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidoPaterno VARCHAR(20) NOT NULL,
    apellidoMaterno VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    distrito VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    subtipo VARCHAR(20) NOT NULL,
    motivo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM libro_reclamaciones;

CREATE TABLE contacto (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellidos VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
telefono VARCHAR(9) NOT NULL,
mensaje TEXT,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  rol ENUM('admin', 'usuario', 'supervisor') NOT NULL DEFAULT 'usuario',
  estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);


INSERT INTO usuarios (usuario, password, nombre, apellidos, email, rol, estado) 
VALUES ('jimenez', '123456789', 'Juan', 'Jiménez', 'jimenez@gmail.com', 'admin', 'activo');

INSERT INTO usuarios (usuario, password, nombre, apellidos, email, rol, estado) 
VALUES ('risco', '23456789', 'Manuel', 'Risco', 'risco@gmail.com', 'admin', 'activo');


CREATE TABLE imagenes (	
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_archivo VARCHAR(255) NOT NULL,
  ruta_archivo VARCHAR(255) NOT NULL,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  url_aliado VARCHAR(255) NOT NULL
);





