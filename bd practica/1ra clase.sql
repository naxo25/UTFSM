create table clase
(cod_clase varchar2(5) not null,
 tiempo_de_prestamo varchar2(5) not null);
 
 alter table clase
 add (constraint pk_cod_clase primary key(cod_clase));
 
create table libro
(cod_libro varchar2(10) not null,
 autor varchar2(20) not null,
 titulo varchar2(20) not null,
 editor varchar2(20) not null,
 cod_clase varchar2(20) not null);
 
 alter table libro
 add (constraint pk_libro primary key(cod_libro)); 
 
 alter table libro
 add (constraint fk_libro_clase foreign key(cod_clase)
 references clase(cod_clase));
 
create table usuario
(rut varchar2(10) not null,
 nombre varchar2(20) not null,
 direccion varchar2(20) not null);
 
alter table usuario
add (constraint pk_usuario primary key(rut));
 
 create table prestamo
(cod_libro varchar2(10) not null,
 rut varchar2(20) not null,
 fecha_inicio varchar2(20) not null,
 fecha_fin varchar2(20) not null);
 
alter table prestamo
add (constraint pk_prestamo primary key(cod_libro,rut));

alter table prestamo
add (constraint fk_libro foreign key(cod_libro)
references libro);

alter table usuario
add (constraint fk_usuario foreign key(rut)
references usuario);
 
 alter table usuario 
 add fecha_ingreso number(8) not null;
 
 alter table libro
 add prestado number(10) not null;
 
 alter table libro
 modify prestado default 1;
 
 alter table prestamo
 modify check (fecha_fin >= fecha_inicio);
 
 drop table prestamo;
 drop table usuario;
 drop table libro;
 drop table clase;
 
/*create table areas 
(codigo char(3) not null, 
nombre char (55) not null, 
departamento char(3) not null,
primary key(codigo), 
foreign key(departamento) references departamentos 
on delete set null on update cascade);
si borro algun dpto de la referencia quedara el campo null, 
si modifico el cod_dpto en departamento queda modificado*/
