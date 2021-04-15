/*1*/SELECT nom_emp,salario_sem FROM empleado
     WHERE salario_sem > (SELECT salario_sem FROM empleado
                          WHERE nom_emp = 'Cecilia');

/*2*/SELECT nom_emp,salario_sem FROM empleado
     WHERE salario_sem > = (SELECT SUM(salario_sem) FROM empleado
                            WHERE empleo = 'Productor');
     /*Productor???*/

/*3*/SELECT nom_emp FROM empleado
     WHERE salario_sem > ANY (SELECT salario_sem FROM empleado
                          WHERE empleo = 'supervisor');

/*4*/SELECT COUNT (nom_emp) "N° de empleados x Depto",cod_depto FROM empleado
     WHERE salario_sem > (SELECT AVG(salario_sem) FROM empleado)     
     GROUP BY cod_depto;
     /*Creo que ésta forma de visualizar los datos se comprende mas
     que si dejo solo el numero de empleados por departamento de forma solitaria*/
     
/*5*/SELECT COUNT (nom_emp) "N° de empleado work en Kilpue" FROM empleado
     WHERE cod_depto IN (SELECT cod_depto FROM depto
                         WHERE ubicacion = 'Quilpué');

/*6*/SELECT nom_emp,empleo,nom_depto,ubicacion FROM empleado 
     JOIN depto ON empleado.cod_depto=depto.cod_depto;
     
/*7*/SELECT nom_emp,cod_supervisor,nom_emp AS nom_supervisor FROM empleado  
     WHERE cod_supervisor IN (SELECT cod_emp FROM empleado);
      /*-------------------NO FUNCIONA----------------*/
      /*---------Corregiré ésto a la brevedad---------*/
     
/*8*/SELECT nom_emp,nom_depto,sueldo_minimo,sueldo_maximo FROM empleado
     JOIN depto  ON empleado.cod_depto = depto.cod_depto
     JOIN sueldo ON empleado.grado     = sueldo.grado;

/*9*/SELECT nom_emp FROM empleado
     WHERE EXISTS (SELECT * from depto WHERE empleado.cod_depto = depto.cod_depto
                                             AND depto.ubicacion = 'Valpo');
                                             
/*10*/SELECT cod_depto,nom_depto FROM depto
      WHERE 4 < (SELECT COUNT(nom_emp) FROM empleado WHERE depto.cod_depto = empleado.cod_depto);
      
/*11*/SELECT nom_emp,empleo,fecha_ingreso FROM empleado
      WHERE fecha_ingreso <= (SELECT MIN(fecha_ingreso) FROM empleado);
      
/*12*/SELECT nom_emp,nom_depto,empleo,salario_sem FROM empleado
      JOIN depto on empleado.cod_depto = depto.cod_depto
      WHERE empleado.cod_depto = (SELECT cod_depto FROM empleado
                                  WHERE nom_emp = 'Cecilia')
      GROUP BY NOM_EMP
      HAVING salario_sem > (SELECT AVG(salario_sem) FROM empleado
                                     WHERE cod_depto = 30);
     /*-----No comprendo que es lo que no funciona acá------*/
     /*----------arreglar :S -------------------------------*/
     
/*13*/SELECT nom_emp,empleo,nom_depto,ubicacion,salario_sem FROM empleado
      JOIN depto on empleado.cod_depto = depto.cod_depto
      WHERE depto.ubicacion = ('Valpo') or depto.ubicacion = ('Quilpué');
      
      HAVING salario_sem > 2500;
      
      /*MI SQL DEVELOPER SE VOLVIO LOCO EN EL ITEM 13*/