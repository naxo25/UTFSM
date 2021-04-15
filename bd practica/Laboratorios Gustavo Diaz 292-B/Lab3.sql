/*1*/ SELECT * FROM empleado
      WHERE empleo = 'supervisor';
/*Es un poco amplio lo que se pide, osea, seleccionar a todos los que tengan
un supervisor (casi todos) o a los que tengan como empleo el ser supervisor?
Supondré que se me pide lo último. Espero estar en lo correcto*/

/*2*/ SELECT * FROM empleado
      WHERE (grado = 1) or (grado = 3) or (grado = 4);

/*3*/ SELECT * FROM empleado
      WHERE NOT empleo = 'supervisor' and NOT empleo = 'prog';

/*4*/ SELECT nom_emp FROM empleado
      WHERE cod_depto = 10;
      
/*5*/ UPDATE sueldo
      SET descripcion = 'sin info'
      WHERE grado BETWEEN 1 AND 7;

/*6*/ SELECT * FROM empleado
      WHERE NOT fecha_ingreso BETWEEN '01/01/1982' and '31/12/1982';
     
/*7*/ SELECT * FROM empleado
      WHERE nom_emp LIKE '__r%';
/*nota: si busco el tercer caracter, debo colocar _ _ _ y el caracter buscado
mas el simbolo % que denota que no importa lo que viene despues*/

/*8*/ SELECT COUNT (comision), 
             AVG(comision)
      FROM empleado
     where comision <> 0;
  
/*9*//*No Existe*/

/*10*/SELECT AVG((salario_sem / 7) * 30.5) "Salario Mensual"
      FROM empleado
      WHERE empleo = 'supervisor';
      /*puse 30,5 como el promedio de dias que puede tener un mes*/
      
/*11*/SELECT MIN((salario_sem / 7) * 30.5)"Salario minimo",
             MAX((salario_sem / 7) * 30.5)"Salario Maximo",
             MAX((salario_sem / 7) * 30.5) - MIN((salario_sem / 7) * 30.5)"Diferencias"
      FROM empleado
      GROUP BY cod_depto; 

/*12*/SELECT COUNT(DISTINCT(grado)) FROM empleado
      WHERE cod_depto IN (SELECT cod_depto FROM depto WHERE nom_depto = 'Produccion');
                          
/*13*/SELECT COUNT(DISTINCT(empleo)) "Empleos distintos x Grado"
      FROM empleado
      GROUP BY grado;
      
/*14*/SELECT MAX(salario_sem)
      FROM EMPLEADO
      GROUP BY cod_depto;
      
/*15*/SELECT MIN(comision / 2) "mitad de la comision minima"
      FROM empleado
      WHERE comision <> 0;

/*16*/SELECT SUM((salario_sem /7) * 365) "Salario Total Anual",
             SUM(comision * 12) "Total Comision Anual"
      FROM empleado
      GROUP BY empleo
      ORDER BY SUM((salario_sem /7) * 365);

/*17*/SELECT COUNT(nom_emp) "Empleados en Rango"
      FROM empleado
      WHERE cod_depto in (SELECT cod_depto FROM depto WHERE nom_depto = 'Producción')
            AND ((salario_sem /7) *30.5) BETWEEN 5000 AND 7000;
      /*Mensual??????  Creo que el rango es muy grande... Quizás quizo decir "semanal"?*/ 
      
/*18*/SELECT cod_depto,
             MAX(salario_sem) "Salario Maximo Semanal",
             MIN(salario_sem) "Salario Minimo Semanal",
             AVG(salario_sem) "Promedo Salarios"
      FROM empleado
      GROUP BY cod_depto
      HAVING AVG(salario_sem) > 2500;
    /*Solo depto 40 y 10 cumplen el rango*/
    
/*19*/SELECT COUNT (empleo)
      FROM empleado
      WHERE (empleo = 'supervisor') AND ((cod_depto = 10) OR (cod_depto = 40))
      GROUP BY cod_depto
      HAVING count(empleo) > 2;
   /*Me arroja un resultado en cero, no se si corresponderá*/
   
   