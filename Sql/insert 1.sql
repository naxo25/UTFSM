alter session set nls_date_format = 'dd/mm/yyyy';

insert into depto values (10,'Finanzas','Valpo');
insert into depto  values (20,'Desarrollo','Stgo');
insert into depto  values (30,'Ventas','Viña');
insert into depto  values (40,'Operación','Quilpué');


insert into empleado  values (7839, 'Karla', 'Gerente','','17/11/1981',5000,0,10);
insert into empleado  values (7566, 'Juan P.', 'supervisor',7839,'02/04/1981',2975,0,20);
insert into empleado  values (7902, 'Fabián', 'analista',7566,'03/12/1981',3000,0,20);
insert into empleado  values (7369, 'Juan', 'prog',7902,'17/12/1980',800,0,20);
insert into empleado  values (7698, 'Blanca', 'supervisor',7839,'01/05/1981',2850,0,30);
insert into empleado  values (7499, 'Allen', 'vendedor',7698,'20/02/1981',1600,300,30);
insert into empleado  values (7521, 'Williams', 'vendedor',7698,'22/02/1981',1250,500,30);
insert into empleado  values (7654, 'Martín', 'vendedor',7698,'28/10/1981',1250,1400,30);
insert into empleado  values (7782, 'Carlos', 'supervisor',7839,'09/06/1981',2450,0,10);
insert into empleado  values (7788, 'Silvia', 'analista',7566,'09/12/1981',3000,0,20);
insert into empleado  values (7844, 'Tomás', 'vendedor',7698,'08/10/1981',1500,0,30);
insert into empleado  values (7876, 'Alvaro', 'prog',7788,'12/01/1983',1100,0,20);
insert into empleado  values (7900, 'Jaime', 'prog',7698,'03/12/1981',950,0,30);
insert into empleado  values (7934, 'Miguel', 'prog',7782,'23/01/1982',1300,0,10);


insert into sueldo values (1,700,1200);
insert into sueldo values (2,1201,1400);
insert into sueldo values (3,1401,2000);
insert into sueldo values (4,2001,3000);
insert into sueldo values (5,3001,9999);


