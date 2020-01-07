drop database if exists encuestas;
create database encuestas;
use encuestas;

create table usuarios(
id int PRIMARY KEY auto_increment not null,
correo varchar(75),
status char(10) default 1
) Engine = InnoDB;

create table encuesta(
id int PRIMARY KEY auto_increment not null,
id_admin int,
nombre varchar(100),
FOREIGN KEY(id_admin) references usuarios(id)
ON UPDATE CASCADE ON DELETE CASCADE
) Engine = InnoDB;

create table pregunta(
id int PRIMARY KEY auto_increment not null,
texto_pregunta varchar(200),
tipo_pregunta varchar(5)
) Engine = InnoDB;

create table r_encuesta_pregunta(
id_encuesta int,
id_pregunta int,
FOREIGN KEY (id_encuesta) references encuesta(id),
FOREIGN KEY (id_pregunta) references pregunta(id)
ON UPDATE CASCADE ON DELETE CASCADE
) Engine = InnoDB;

create table respuesta(
id int auto_increment PRIMARY KEY,
id_pregunta int,
respuesta varchar(75),
FOREIGN KEY (id_pregunta) references pregunta(id)
ON UPDATE CASCADE ON DELETE CASCADE
) Engine = InnoDB;

create table logs(
id int auto_increment PRIMARY KEY,
id_usuario int,
id_encuesta int,
fechate date,
FOREIGN KEY (id_usuario) references usuarios(id),
FOREIGN KEY (id_encuesta) references encuesta(id)
ON UPDATE CASCADE ON DELETE CASCADE
) Engine = InnoDB;

create table resultados(
id_log int,
id_pregunta int,
id_respuesta int,
FOREIGN KEY (id_log) references logs(id),
FOREIGN KEY (id_pregunta) references pregunta(id),
FOREIGN KEY (id_respuesta) references respuesta(id)
ON UPDATE CASCADE ON DELETE CASCADE
) Engine = InnoDB;