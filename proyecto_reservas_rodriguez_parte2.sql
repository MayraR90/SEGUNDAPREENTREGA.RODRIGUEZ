-- BORRAMOS LA BASE DE DATOS SOLO SI YA EXISTE PREVIAMENTE
drop database if EXISTS PROYECTO_RESERVAS;

-- CREAMOS LA BASE DE DATOS
create database PROYECTO_RESERVAS;

use PROYECTO_RESERVAS;

-- CREAMOS LA TABLA SOCIOS
create table SOCIOS (
	ID_SOCIO INT primary key not null AUTO_INCREMENT 
,	NOMBRE VARCHAR (50) not null
,	APELLIDO VARCHAR (50) not null
,	DNI INT unique not null
,	TELEFONO INT not NULL
,	MAIL VARCHAR (60) not null unique 
,	FECHA_ALTA datetime
);

-- CREAMOS LA TABLA RESERVAS
create table RESERVAS(
	ID_RESERVA int primary key not null auto_increment
,	FECHA_HORA datetime
,	CANCELACION DATETIME
,	ID_SOCIO int 
,	ID_ACTIVIDAD int
,	ID_PROFESOR int
,	ID_SEDE int
);

-- CREAMOS LA TABLA ACTIVIDADES
create table ACTIVIDADES (
	ID_ACTIVIDAD int unique primary key not null auto_increment
,	NOMBRE varchar (50) not null
,	DISPONIBILIDAD boolean not null
, 	FECHA_HORA DATETIME
,	ID_PROFESOR int
);

-- CREAMOS LA TABLA SEDE
create table SEDE (
	ID_SEDE INT primary key not null AUTO_INCREMENT
,	DIRECCION VARCHAR (100)
,	TELEFONO INT 
,	ID_DUENO INT
);

-- CREAMOS LA TABLA DUEÑO
create table DUENO (
	ID_DUENO INT primary key not null AUTO_INCREMENT
,	NOMBRE VARCHAR (50) 
,	APELLIDO VARCHAR (50)
,	TELEFONO INT not NULL
);

-- CREAMOS LA TABLA PROFESORES
create table PROFESORES (
	ID_PROFESOR INT unique primary key not null auto_increment 
,	NOMBRES VARCHAR (50) not null
,   APELLIDO VARCHAR (50) not null
,	DNI INT unique
,	TELEFONO int
,	ALTA datetime
,	ID_ACTIVIDAD INT
,	ID_SEDE int
);


-- DEFINIMOS LAS FOREIGN KEYS DE CADA UNA DE LAS TABLAS

-- TABLA RESERVAS

ALTER TABLE RESERVAS
    ADD CONSTRAINT FK_RESERVAS_SOCIO
    FOREIGN KEY (ID_SOCIO) REFERENCES SOCIOS(ID_SOCIO);

ALTER TABLE RESERVAS
    ADD CONSTRAINT FK_RESERVAS_ACTIVIDAD
    FOREIGN KEY (ID_ACTIVIDAD) REFERENCES ACTIVIDADES(ID_ACTIVIDAD);
    
ALTER TABLE RESERVAS
    ADD CONSTRAINT FK_RESERVAS_PROFESOR
    FOREIGN KEY (ID_PROFESOR) REFERENCES PROFESORES(ID_PROFESOR);
    
ALTER TABLE RESERVAS
    ADD CONSTRAINT FK_RESERVAS_SEDE
    FOREIGN KEY (ID_SEDE) REFERENCES SEDE(ID_SEDE);

-- TABLA DUENO

ALTER TABLE SEDE
	ADD CONSTRAINT FK_SEDE_DUENO
    FOREIGN KEY (ID_DUENO) REFERENCES DUENO(ID_DUENO);

-- TABLA PROFESORES

ALTER TABLE PROFESORES
    ADD CONSTRAINT FK_PROFESOR_ACTIVIDAD
    FOREIGN KEY (ID_ACTIVIDAD) REFERENCES ACTIVIDADES(ID_ACTIVIDAD);
    
ALTER TABLE PROFESORES
    ADD CONSTRAINT FK_PROFESOR_SEDE
    FOREIGN KEY (ID_SEDE) REFERENCES SEDE(ID_SEDE);

-- TABLA ACTIVIDADES

ALTER TABLE ACTIVIDADES
    ADD CONSTRAINT FK_ACTIVIDAD_PROFESOR
    FOREIGN KEY (ID_PROFESOR) REFERENCES PROFESORES(ID_PROFESOR);
    
-- SHOW tables FROM proyecto_reservas;

-- ------------------------------------

-- "2° PREENTREGA"

-- Vamos a insertar datos

-- desactivamos la validación de clave foranea
-- SET foreign_key_checks = 0;

-- vamos a insertar datos en las tablas con el siguiente orden: dueno, sede, socios, profesores, actividades y reservas.

use proyecto_reservas;

-- insertamos datos en la tabla dueno
INSERT INTO DUENO (ID_DUENO, NOMBRE, APELLIDO, TELEFONO) VALUES
(1, 'Roberto', 'Jiménez', 45345601),
(2, 'Santiago', 'Paredes', 45345602),
(3, 'Mónica', 'Castillo', 45345603),
(4, 'Raúl', 'Guzmán', 45345604),
(5, 'Sara', 'Soto', 45345605),
(6, 'Tomás', 'Campos', 45345606),
(7, 'Lorena', 'Suárez', 45345607),
(8, 'David', 'Vargas', 45345608),
(9, 'Elena', 'Muñoz', 45345609),
(10, 'Clara', 'Ibáñez', 45345610);

-- insertamos datos en la tabla sede
INSERT INTO SEDE (ID_SEDE, DIRECCION, TELEFONO, ID_DUENO) VALUES
(1, 'Av. Siempre Viva 123', 36345601, 1),
(2, 'Calle Falsa 456', 36345602, 2),
(3, 'Pasaje Verdadero 789', 36345603, 3),
(4, 'Boulevard Principal 101', 36345604, 4),
(5, 'Camino Real 102', 36345605, 5),
(6, 'Ruta 103', 36345606, 6),
(7, 'Avenida Central 104', 36345607, 7),
(8, 'Callejón 105', 36345608, 8),
(9, 'Plaza Mayor 106', 36345609, 9),
(10, 'Parque 107', 36345610, 10);

-- insertamos datos en la tabla socios
INSERT INTO SOCIOS (ID_SOCIO, NOMBRE, APELLIDO, DNI, TELEFONO, MAIL, FECHA_ALTA) VALUES
(1, 'Pedro', 'Ramírez', 12345601, 23456701, 'pedro1@example.com', '2023-01-01 10:00:00'),
(2, 'Juan', 'González', 12345602, 23456702, 'juan2@example.com', '2023-02-01 11:00:00'),
(3, 'María', 'López', 12345603, 23456703, 'maria3@example.com', '2023-03-01 12:00:00'),
(4, 'Ana', 'Martínez', 12345604, 23456704, 'ana4@example.com', '2023-04-01 13:00:00'),
(5, 'Luis', 'Hernández', 12345605, 23456705, 'luis5@example.com', '2023-05-01 14:00:00'),
(6, 'Carlos', 'Gómez', 12345606, 23456706, 'carlos6@example.com', '2023-06-01 15:00:00'),
(7, 'Laura', 'Díaz', 12345607, 23456707, 'laura7@example.com', '2023-07-01 16:00:00'),
(8, 'Jorge', 'Pérez', 12345608, 23456708, 'jorge8@example.com', '2023-08-01 17:00:00'),
(9, 'Sofía', 'Sánchez', 12345609, 23456709, 'sofia9@example.com', '2023-09-01 18:00:00'),
(10, 'Marta', 'Romero', 12345610, 23456710, 'marta10@example.com', '2023-10-01 19:00:00'),
(11, 'Hugo', 'Torres', 12345611, 23456711, 'hugo11@example.com', '2023-11-01 20:00:00'),
(12, 'Lucas', 'Mendoza', 12345612, 23456712, 'lucas12@example.com', '2023-12-01 21:00:00'),
(13, 'Daniela', 'Cruz', 12345613, 23456713, 'daniela13@example.com', '2024-01-01 22:00:00'),
(14, 'Emilia', 'Reyes', 12345614, 23456714, 'emilia14@example.com', '2024-02-01 23:00:00'),
(15, 'Iván', 'Ruiz', 12345615, 23456715, 'ivan15@example.com', '2024-03-01 10:00:00'),
(16, 'Nicolás', 'Ortega', 12345616, 23456716, 'nicolas16@example.com', '2024-04-01 11:00:00'),
(17, 'Camila', 'Silva', 12345617, 23456717, 'camila17@example.com', '2024-05-01 12:00:00'),
(18, 'Gabriela', 'Ramos', 12345618, 23456718, 'gabriela18@example.com', '2024-06-01 13:00:00'),
(19, 'Valeria', 'Moreno', 12345619, 23456719, 'valeria19@example.com', '2023-01-01 14:00:00'),
(20, 'Martín', 'Rojas', 12345620, 23456720, 'martin20@example.com', '2023-02-01 15:00:00'),
(21, 'Fernando', 'Peña', 12345621, 23456721, 'fernando21@example.com', '2023-03-01 16:00:00'),
(22, 'Paula', 'Navarro', 12345622, 23456722, 'paula22@example.com', '2023-04-01 17:00:00'),
(23, 'Andrea', 'Rivera', 12345623, 23456723, 'andrea23@example.com', '2023-05-01 18:00:00'),
(24, 'Manuel', 'Román', 12345624, 23456724, 'manuel24@example.com', '2023-06-01 19:00:00'),
(25, 'Inés', 'Flores', 12345625, 23456725, 'ines25@example.com', '2023-07-01 20:00:00'),
(26, 'Julieta', 'Aguilar', 12345626, 23456726, 'julieta26@example.com', '2023-08-01 21:00:00'),
(27, 'Santiago', 'Molina', 12345627, 23456727, 'santiago27@example.com', '2023-09-01 22:00:00'),
(28, 'Victoria', 'Ortiz', 12345628, 23456728, 'victoria28@example.com', '2023-10-01 23:00:00'),
(29, 'Esteban', 'Blanco', 12345629, 23456729, 'esteban29@example.com', '2023-11-01 10:00:00'),
(30, 'Isabel', 'Castro', 12345630, 23456730, 'isabel30@example.com', '2023-12-01 11:00:00');

-- insertamos datos en la tabla profesores
INSERT INTO PROFESORES (ID_PROFESOR, NOMBRES, APELLIDO, DNI, TELEFONO, ALTA, ID_ACTIVIDAD, ID_SEDE) VALUES
(1, 'Laura', 'García', 22345601, 32345601, '2023-01-01 10:00:00', 1, 1),
(2, 'Pedro', 'Martínez', 22345602, 32345602, '2023-02-01 11:00:00', 2, 2),
(3, 'Juan', 'Pérez', 22345603, 32345603, '2023-03-01 12:00:00', 3, 3),
(4, 'Ana', 'López', 22345604, 32345604, '2023-04-01 13:00:00', 4, 4),
(5, 'Luis', 'Gómez', 22345605, 32345605, '2023-05-01 14:00:00', 5, 5),
(6, 'Carlos', 'Rodríguez', 22345606, 32345606, '2023-06-01 15:00:00', 6, 6),
(7, 'Laura', 'Fernández', 22345607, 32345607, '2023-07-01 16:00:00', 7, 7),
(8, 'Jorge', 'Sánchez', 22345608, 32345608, '2023-08-01 17:00:00', 8, 8),
(9, 'Sofía', 'Ramírez', 22345609, 32345609, '2023-09-01 18:00:00', 9, 9),
(10, 'Marta', 'Díaz', 22345610, 32345610, '2023-10-01 19:00:00', 10, 10),
(11, 'Hugo', 'Cruz', 22345611, 32345611, '2023-11-01 20:00:00', 11, 1),
(12, 'Lucas', 'Morales', 22345612, 32345612, '2023-12-01 21:00:00', 12, 2),
(13, 'Daniela', 'Herrera', 22345613, 32345613, '2024-01-01 22:00:00', 13, 3),
(14, 'Emilia', 'Reyes', 22345614, 32345614, '2024-02-01 23:00:00', 14, 4),
(15, 'Iván', 'Ruiz', 22345615, 32345615, '2024-03-01 10:00:00', 15, 5),
(16, 'Nicolás', 'Ortega', 22345616, 32345616, '2024-04-01 11:00:00', 16, 6),
(17, 'Camila', 'Silva', 22345617, 32345617, '2024-05-01 12:00:00', 17, 7),
(18, 'Gabriela', 'Ramos', 22345618, 32345618, '2024-06-01 13:00:00', 18, 8),
(19, 'Valeria', 'Moreno', 22345619, 32345619, '2023-01-01 14:00:00', 19, 9),
(20, 'Martín', 'Rojas', 22345620, 32345620, '2023-02-01 15:00:00', 20, 10),
(21, 'Fernando', 'Peña', 22345621, 32345621, '2023-03-01 16:00:00', 21, 1),
(22, 'Paula', 'Navarro', 22345622, 32345622, '2023-04-01 17:00:00', 22, 2),
(23, 'Andrea', 'Rivera', 22345623, 32345623, '2023-05-01 18:00:00', 23, 3),
(24, 'Manuel', 'Román', 22345624, 32345624, '2023-06-01 19:00:00', 24, 4),
(25, 'Inés', 'Flores', 22345625, 32345625, '2023-07-01 20:00:00', 25, 5),
(26, 'Julieta', 'Aguilar', 22345626, 32345626, '2023-08-01 21:00:00', 26, 6),
(27, 'Santiago', 'Molina', 22345627, 32345627, '2023-09-01 22:00:00', 27, 7),
(28, 'Victoria', 'Ortiz', 22345628, 32345628, '2023-10-01 23:00:00', 28, 8),
(29, 'Esteban', 'Blanco', 22345629, 32345629, '2023-11-01 10:00:00', 29, 9),
(30, 'Isabel', 'Castro', 22345630, 32345630, '2023-12-01 11:00:00', 30, 10);

-- insertamos datos en la tabla actividades
INSERT INTO ACTIVIDADES (ID_ACTIVIDAD, NOMBRE, DISPONIBILIDAD, FECHA_HORA, ID_PROFESOR) VALUES
(1, 'Yoga', TRUE, '2023-01-01 10:00:00', 1),
(2, 'Pilates', TRUE, '2023-02-01 11:00:00', 2),
(3, 'Zumba', TRUE, '2023-03-01 12:00:00', 3),
(4, 'Crossfit', TRUE, '2023-04-01 13:00:00', 4),
(5, 'Spinning', TRUE, '2023-05-01 14:00:00', 5),
(6, 'Karate', TRUE, '2023-06-01 15:00:00', 6),
(7, 'Boxeo', TRUE, '2023-07-01 16:00:00', 7),
(8, 'Natación', TRUE, '2023-08-01 17:00:00', 8),
(9, 'Aerobics', TRUE, '2023-09-01 18:00:00', 9),
(10, 'Baile', TRUE, '2023-10-01 19:00:00', 10),
(11, 'Tennis', TRUE, '2023-11-01 20:00:00', 11),
(12, 'Fútbol', TRUE, '2023-12-01 21:00:00', 12),
(13, 'Vóley', TRUE, '2024-01-01 22:00:00', 13),
(14, 'Basketball', TRUE, '2024-02-01 23:00:00', 14),
(15, 'Rugby', TRUE, '2024-03-01 10:00:00', 15),
(16, 'Hockey', TRUE, '2024-04-01 11:00:00', 16),
(17, 'Gimnasia', TRUE, '2024-05-01 12:00:00', 17),
(18, 'Ciclismo', TRUE, '2024-06-01 13:00:00', 18),
(19, 'Atletismo', TRUE, '2023-01-01 14:00:00', 19),
(20, 'Escalada', TRUE, '2023-02-01 15:00:00', 20),
(21, 'Judo', TRUE, '2023-03-01 16:00:00', 21),
(22, 'Taekwondo', TRUE, '2023-04-01 17:00:00', 22),
(23, 'Kickboxing', TRUE, '2023-05-01 18:00:00', 23),
(24, 'Capoeira', TRUE, '2023-06-01 19:00:00', 24),
(25, 'Patinaje', TRUE, '2023-07-01 20:00:00', 25),
(26, 'Escalada', TRUE, '2023-08-01 21:00:00', 26),
(27, 'Senderismo', TRUE, '2023-09-01 22:00:00', 27),
(28, 'Surf', TRUE, '2023-10-01 23:00:00', 28),
(29, 'Esquí', TRUE, '2023-11-01 10:00:00', 29),
(30, 'Snowboard', TRUE, '2023-12-01 11:00:00', 30);

-- insertamos datos en la tabla reservas
INSERT INTO RESERVAS (ID_RESERVA, FECHA_HORA, CANCELACION, ID_SOCIO, ID_ACTIVIDAD, ID_PROFESOR, ID_SEDE) VALUES
(1, '2023-01-01 10:00:00', NULL, 1, 1, 1, 1),
(2, '2023-02-01 11:00:00', NULL, 2, 2, 2, 2),
(3, '2023-03-01 12:00:00', NULL, 3, 3, 3, 3),
(4, '2023-04-01 13:00:00', NULL, 4, 4, 4, 4),
(5, '2023-05-01 14:00:00', NULL, 5, 5, 5, 5),
(6, '2023-06-01 15:00:00', NULL, 6, 6, 6, 6),
(7, '2023-07-01 16:00:00', NULL, 7, 7, 7, 7),
(8, '2023-08-01 17:00:00', NULL, 8, 8, 8, 8),
(9, '2023-09-01 18:00:00', NULL, 9, 9, 9, 9),
(10, '2023-10-01 19:00:00', NULL, 10, 10, 10, 10),
(11, '2023-11-01 20:00:00', NULL, 11, 11, 11, 1),
(12, '2023-12-01 21:00:00', NULL, 12, 12, 12, 2),
(13, '2024-01-01 22:00:00', NULL, 13, 13, 13, 3),
(14, '2024-02-01 23:00:00', NULL, 14, 14, 14, 4),
(15, '2024-03-01 10:00:00', NULL, 15, 15, 15, 5),
(16, '2024-04-01 11:00:00', NULL, 16, 16, 16, 6),
(17, '2024-05-01 12:00:00', NULL, 17, 17, 17, 7),
(18, '2024-06-01 13:00:00', NULL, 18, 18, 18, 8),
(19, '2023-01-01 14:00:00', NULL, 19, 19, 19, 9),
(20, '2023-02-01 15:00:00', NULL, 20, 20, 20, 10),
(21, '2023-03-01 16:00:00', NULL, 21, 21, 21, 1),
(22, '2023-04-01 17:00:00', NULL, 22, 22, 22, 2),
(23, '2023-05-01 18:00:00', NULL, 23, 23, 23, 3),
(24, '2023-06-01 19:00:00', NULL, 24, 24, 24, 4),
(25, '2023-07-01 20:00:00', NULL, 25, 25, 25, 5),
(26, '2023-08-01 21:00:00', NULL, 26, 26, 26, 6),
(27, '2023-09-01 22:00:00', NULL, 27, 27, 27, 7),
(28, '2023-10-01 23:00:00', NULL, 28, 28, 28, 8),
(29, '2023-11-01 10:00:00', NULL, 29, 29, 29, 9),
(30, '2023-12-01 11:00:00', NULL, 30, 30, 30, 10);

-- activamos la validación de clave foranea
-- SET foreign_key_checks = 1;

-- Luego de insertar los datos vamos a verificar las tablas

-- select * from  dueno;
-- select * from  sede;
-- select * from  profesores;
-- select * from  actividades;
-- select * from  socios;
-- select * from  reservas;



