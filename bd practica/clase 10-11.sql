SELECT * FROM empleado; 
select * from sueldo;
select * from depto;

select cod_emp, salario_sem, comision, cod_depto, fecha_ingreso from empleado;

select cod_emp "Empleado", salario_sem "Salario Semanal", comision, cod_depto"Codigo del Departamento", fecha_ingreso from empleado;

select cod_emp "Empleado" from empleado;

select empleo, nom_emp from empleado
order by empleo;

select empleo, nom_emp, salario_sem "salario semanal" from empleado order by empleo asc, salario_sem desc; 

select distinct cod_depto from empleado;

select * from empleado where empleo = 'vendedor';

select * from empleado where cod_depto <> 20;

select * from empleado where fecha_ingreso < '01/01/1992';

insert into depto values (50,'Estudio','Stgo');
insert into depto  values (60,'RRHH','Rancagua');
insert into depto  values (70,'Servicio','Valpo');

insert into empleado  values (7739, 'Maikol', 'Gerente','','15/11/1991',4000,0,50);
insert into empleado  values (7466, 'Carlitos', 'supervisor',7839,'02/04/1991',2975,0,50);
insert into empleado  values (7302, 'Marisolo', 'analista',7566,'03/12/1991',3000,0,50);
insert into empleado  values (7259, 'Jhony', 'prog',7902,'17/12/1990',800,0,50);

update sueldo set sueldo_maximo = 4000 where grado = 5;

insert into sueldo values (6,4001,5000);
insert into sueldo values (7,5001,9999);

update empleado set comision = comision *1.1 where cod_depto = 30;

alter table sueldo 
add Descripcion char(10);
update sueldo set sueldo_maximo = 6000, descripcion = 'tramo7' where grado = 7;

update depto set nom_depto = 'produccion' where cod_depto = 30;
update empleado set empleo = 'productor' where empleo = 'vendedor';

delete depto where cod_depto = 50 or cod_depto = 60 or cod_depto = 70;

alter table sueldo
add(grado char(5));
alter table sueldo
add(constraint pk_grado primary key(grado));
alter table empleado
add(constraint fk_grado foreign key(grado)references sueldo(grado));

create table sin_comision_des 
  (cod_emp     int      not null,
   nom_emp     char(15) not null,
   empleo      char(20) not null,
   cod_supervisor int   null,
   fecha_ingreso  date  not null,
   salario_sem int      not null,
   comision    int      null,
   cod_depto   int      not null);
   
insert into sin_comision_des select * from empleado where comision = 0 and cod_depto = 20;   

delete empleado where cod_depto = 20;

select * from depto;