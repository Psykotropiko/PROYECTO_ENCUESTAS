drop database if exists encuestas;
create database encuestas;
use encuestas;

create table usuarios(
id int PRIMARY KEY auto_increment not null,
correo varchar(75),
password varchar(50),
status char(10) default 1
) Engine = InnoDB;

create table encuesta(
id int PRIMARY KEY auto_increment not null,
id_admin int,
nombre varchar(100),
descripcion varchar(200),
FOREIGN KEY(id_admin) references usuarios(id)
ON UPDATE CASCADE ON DELETE CASCADE
) Engine = InnoDB;

create table pregunta(
id int PRIMARY KEY auto_increment not null,
titulo_pregunta varchar(200),
es_multiple boolean
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

insert into usuarios(correo,password,status) values ("manuel@dev.es",1234,2);
insert into usuarios(correo,password,status) values ("javi@dev.es",1234,2);
insert into usuarios(correo,password,status) values ("luis@dev.es",1234,2);
insert into usuarios(correo,password,status) values ("rene@dev.es",1234,2);

insert into encuesta(id_admin,nombre,descripcion) values (1,"informatica","Realiza una encuesta sobre los distintos campos de éste tema.");
insert into encuesta(id_admin,nombre,descripcion) values (2,"balonmano","Realiza una encuesta a cerca de éste deporte popular.");
insert into encuesta(id_admin,nombre,descripcion) values (3,"salud","Realiza una encuesta detallada sobre un tema tan importante como es la salud.");
insert into encuesta(id_admin,nombre,descripcion) values (4,"diseño","Realiza una encuesta para facilitarnos tu conocimiento a cerca del diseño web.");

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Utilizas mas Linux o Windows?",true);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Te gusta programar?",false);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Has roto algun ordenador por trastearlo demas?",false);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Cuantos años llevas jugando?",true);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Has tenido alguna lesion?",true);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Te parece un deporte minoritario?", true);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Fumas?",false);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Con que frecuencia?",true);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿A que edad empezaste?",true);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Piensas dejarlo este año?",false);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Prefieres GIMP o Photoshop?",true);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Utilizas paint?",false);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Usas Photoshop para crear animaciones?",false);
insert into pregunta(titulo_pregunta,es_multiple) values ("¿Eres usuario de boostrap?",false);


