drop database if exists encuestas;
create database encuestas;
use encuestas;

create table usuarios(
id int PRIMARY KEY auto_increment not null,
correo varchar(75),
password varchar(50),
status char(10)
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
fecha date,
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
insert into usuarios(correo,password,status) values ("pruebas@survey.es",1234,1);

insert into encuesta(id_admin,nombre,descripcion) values (1,"informatica","Realiza una encuesta sobre los distintos campos de éste tema.");
insert into encuesta(id_admin,nombre,descripcion) values (2,"balonmano","Realiza una encuesta a cerca de éste deporte popular.");
insert into encuesta(id_admin,nombre,descripcion) values (3,"salud","Realiza una encuesta detallada sobre un tema tan importante como es la salud.");
insert into encuesta(id_admin,nombre,descripcion) values (4,"diseño","Realiza una encuesta para facilitarnos tu conocimiento a cerca del diseño web.");

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Utilizas mas Linux o Windows?",true);
insert into respuesta(id_pregunta,respuesta) values (1,"Linux");
insert into respuesta(id_pregunta,respuesta) values (1,"Windows");
insert into respuesta(id_pregunta,respuesta) values (1,"Ninguna de las anteriores.");

insert into r_encuesta_pregunta values(1,1);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Te gusta programar?",false);
insert into respuesta(id_pregunta,respuesta) values (2,"Si");
insert into respuesta(id_pregunta,respuesta) values (2,"No");

insert into r_encuesta_pregunta values(1,2);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Has roto algun ordenador por trastearlo demas?",false);
insert into respuesta(id_pregunta,respuesta) values (3,"Si");
insert into respuesta(id_pregunta,respuesta) values (3,"No");

insert into r_encuesta_pregunta values(1,3);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Cuantos años llevas jugando?",true);
insert into respuesta(id_pregunta,respuesta) values (4,"3");
insert into respuesta(id_pregunta,respuesta) values (4,"4");
insert into respuesta(id_pregunta,respuesta) values (4,"5");
insert into respuesta(id_pregunta,respuesta) values (4,"+8");

insert into r_encuesta_pregunta values(2,4);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Has tenido alguna lesion grave?",false);
insert into respuesta(id_pregunta,respuesta) values (5,"Si");
insert into respuesta(id_pregunta,respuesta) values (5,"No");

insert into r_encuesta_pregunta values(2,5);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Te parece un deporte minoritario?", false);
insert into respuesta(id_pregunta,respuesta) values (6,"Si");
insert into respuesta(id_pregunta,respuesta) values (6,"No");

insert into r_encuesta_pregunta values(2,6);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Fumas?",false);
insert into respuesta(id_pregunta,respuesta) values (7,"Si");
insert into respuesta(id_pregunta,respuesta) values (7,"No");

insert into r_encuesta_pregunta values(3,7);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Cuantos cigarros fumas al dia?",true);
insert into respuesta(id_pregunta,respuesta) values (8,"Entre 0 y 5.");
insert into respuesta(id_pregunta,respuesta) values (8,"Entre 6 y 10.");
insert into respuesta(id_pregunta,respuesta) values (8,"Entre 10 y 20");
insert into respuesta(id_pregunta,respuesta) values (8,"20+");

insert into r_encuesta_pregunta values(3,8);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿A que edad empezaste?",true);
insert into respuesta(id_pregunta,respuesta) values (9,"Antes de los 15 años.");
insert into respuesta(id_pregunta,respuesta) values (9,"Entre 16 y 25.");
insert into respuesta(id_pregunta,respuesta) values (9,"25+.");
insert into respuesta(id_pregunta,respuesta) values (9,"No fumo.");

insert into r_encuesta_pregunta values(3,9);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Piensas dejarlo este año?",false);
insert into respuesta(id_pregunta,respuesta) values (10,"Si");
insert into respuesta(id_pregunta,respuesta) values (10,"No");

insert into r_encuesta_pregunta values(3,10);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Prefieres GIMP o Photoshop?",true);
insert into respuesta(id_pregunta,respuesta) values (11,"GIMP.");
insert into respuesta(id_pregunta,respuesta) values (11,"Photoshop.");

insert into r_encuesta_pregunta values(4,11);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Utilizas paint?",false);
insert into respuesta(id_pregunta,respuesta) values (12,"Si");
insert into respuesta(id_pregunta,respuesta) values (12,"No");

insert into r_encuesta_pregunta values(4,12);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Usas Photoshop para crear animaciones?",false);
insert into respuesta(id_pregunta,respuesta) values (13,"Si");
insert into respuesta(id_pregunta,respuesta) values (13,"No");

insert into r_encuesta_pregunta values(4,13);

insert into pregunta(titulo_pregunta,es_multiple) values ("¿Eres usuario de boostrap?",false);
insert into respuesta(id_pregunta,respuesta) values (14,"Si");
insert into respuesta(id_pregunta,respuesta) values (14,"No");

insert into r_encuesta_pregunta values(4,14);

