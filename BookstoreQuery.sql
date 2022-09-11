﻿/*CREATE DATABASE BookstoreDB;*/


-- Libro, Autor, Usuario, Venta, Oferta 
use BookstoreDB;


CREATE TABLE Usuario(
	idUsuario int identity(1,1) not null primary key,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL,
	fechaNacimiento date NOT NULL,
	rolUsuario varchar(50) NOT NULL,
	nombreUsuario varchar(100) NOT NULL,
	password varchar(50) NOT NULL
);

CREATE TABLE Autor(
	idAutor int identity(1,1) NOT NULL primary key,
	nombreAutor varchar(50) NOT NULL,
	biografia text NOT NULL,
	twitter varchar(100) NOT NULL,
	instagram varchar(100) NOT NULL,
	fotoAutor varchar(500)
);

CREATE TABLE Oferta(
	idOfertas int identity(1,1) NOT NULL primary key,
	temporada varchar(20) NOT NULL,
	categoria varchar(20) NOT NULL,
	descuento float NOT NULL,
	descripcion text
);

CREATE TABLE Libro(
  idLibro int identity(1,1) NOT NULL primary key,
  idAutor int NOT NULL,
  titulo varchar(15) NOT NULL,
  idOfertas int NOT NULL,
  descripcion text NOT NULL,
  isbn varchar(20) NOT NULL,
  categoria varchar(50) NOT NULL,
  precio float NOT NULL,
  portadaLibro varchar(500)
);

ALTER TABLE Libro ADD CONSTRAINT fk_IdAutor
  FOREIGN KEY (idAutor) REFERENCES Autor(idAutor) ON DELETE CASCADE;

ALTER TABLE Libro ADD CONSTRAINT fk_IdOfertas
  FOREIGN KEY (idOfertas) REFERENCES Oferta(idOfertas) ON DELETE CASCADE;

create table Venta(
	idVenta int identity(1,1) not null primary key,
	idLibro int NOT NULL,
	idUsuario int NOT NULL,
	cantidad int NOT NULL,
	impuesto float NOT NULL,
	subtotal float NOT NULL,
	totalPagar float NOT NULL
);

ALTER TABLE Venta ADD CONSTRAINT fk_IdLibro
  FOREIGN KEY (idLibro) REFERENCES Libro(idLibro) ON DELETE CASCADE;

ALTER TABLE Venta ADD CONSTRAINT fk_IdUsuario
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE;



select l.titulo, U.nombre, U.rolUsuario,v.totalPagar from Venta V 
join Usuario U on v.idUsuario = u.idUsuario 
join Libro l on v.idLibro = l.idLibro;

select * from autor;