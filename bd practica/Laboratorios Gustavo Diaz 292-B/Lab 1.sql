CREATE TABLE libro(
			cod_libro number(2) not null,
			autor varchar2(20),
			titulo varchar2(20),
			editorial varchar2(30),
			cod_clase number(2) not null);

CREATE TABLE USUARIO(
			rut number(9) not null,
			nombre varchar2(20),
			direccion varchar(30));

CREATE TABLE CLASE(
			cod_clase number(2) not null,
			tiempo_de_prestamo number (2));

CREATE TABLE PRESTAMO(
			cod_libro number(2) not null,
			rut number (9) not null,
			fecha_incio date,
			fecha_fin date);

ALTER TABLE Libro
			add (constraint pk_libro primary key (cod_libro));

ALTER TABLE CLASE
			Add (constraint pk_clase primary key (cod_clase));

ALTER TABLE USUARIO
			Add (constraint pk_rut primary key (rut));

ALTER TABLE PRESTAMO
			Add (constraint pk_prestame primary key (cod_libro,rut));

ALTER TABLE LIBRO
			add (constraint fk_libro_clase foreign key (cod_clase)
				references clase (cod_clase));

ALTER TABLE PRESTAMO
			Add (constraint fk_prestamo_libro foreign key (cod_libro)
				references LIBRO (cod_libro));

ALTER TABLE PRESTAMO
			Add (constraint fk_prestamo_usuario foreign key (rut)
				references USUARIO (rut));

ALTER TABLE USUARIO
			Add Fecha_Ingreso date not null

ALTER TABLE LIBRO
			Add Prestado number(2) default(1) not null 

ALTER TABLE PRESTAMO
			Add check (fecha_fin >= fecha_incio);