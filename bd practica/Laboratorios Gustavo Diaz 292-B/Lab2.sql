/*(1)*/SELECT * FROM empleado;
       SELECT * FROM depto;
       SELECT * FROM sueldo;

/*(2)*/SELECT cod_emp, salario_sem, comision, cod_depto, fecha_ingreso
       FROM empleado;

/*(3)*/SELECT nom_emp "empleado" 
       FROM empleado;

/*(4)*/SELECT nom_emp, empleo 
       FROM empleado
       ORDER BY empleo ASC;

/*(5)*/SELECT empleo, nom_emp, salario_sem 
       FROM empleado
       ORDER BY empleo ASC, salario_sem DESC;

/*(6)*/SELECT cod_depto 
       FROM empleado;

/*(7)*/SELECT nom_emp 
       FROM empleado
       WHERE empleo = 'vendedor';

/*(8)*/SELECT nom_emp 
       FROM empleado
       WHERE cod_depto <> '20'; 


/*(9)*/SELECT nom_emp 
       FROM empleado
       WHERE fecha_ingreso > '01/01/82';

/*(10)*/INSERT INTO DEPTO (cod_depto,nom_depto,ubicacion)
        VALUES (50,'Estudio','Stgo');
        INSERT INTO DEPTO (cod_depto,nom_depto,ubicacion)
        VALUES (60,'RRHH','Rancagua');        
        INSERT INTO DEPTO (cod_depto,nom_depto,ubicacion)
        VALUES (70,'Servicio','Valpo');        

/*(11)*/INSERT INTO empleado
        VALUES (7389,'Gustavo Diaz','prog',7902,'15/10/14',9000,0,40);
        
/*(12)*/
/*Me la salto ya que el objetivo de este item era ver que se puede arrastrar
un block de notas con texto plano y serìa importado casi automaticamente al
Developer. Aparecera en un apartado distinto, bastaria solo con cambiar la
extension del .txt al .sql y podrìa inmediatamente trabajar desde texto plano*/

/*(13)*/UPDATE sueldo
        SET sueldo_maximo = 4000
        WHERE grado = 5;
        
/*(14)*/INSERT INTO sueldo
        VALUES (6,4001,5000);
        INSERT INTO sueldo
        VALUES (7,5001,9999);
        
/*(15)*/UPDATE empleado
        SET comision = comision * 1.1
        WHERE cod_depto = 30;
        
/*(16)*/ALTER TABLE sueldo ADD Descripcion char(20);
        UPDATE sueldo
        SET sueldo_maximo = 6000
              descripcion = 'TRAMO7'
        WHERE grado = 7;
/*No se porque el Seteo funciona haciendo una cosa a la vez y no
las dos cosas como deberìa ser :/  /*

/*(17)*/UPDATE depto
        SET nom_depto = 'Produccion'
        WHERE cod_depto = 30;
        
        UPDATE empleado
        SET empleo = 'Productor'
        WHERE empleo = 'vendedor';
        
/*(18)*/DELETE FROM DEPTO
        WHERE cod_depto = 50;
        DELETE FROM DEPTO
        WHERE cod_depto = 60;
        DELETE FROM DEPTO
        WHERE cod_depto = 70;
/*Agregare otro depto mas para que me tire el error del que corresponde
el ejercicio, ya que la gracia era que me diera errores la FK*/
        DELETE FROM DEPTO
        WHERE cod_depto = 30;        
/*ahi si tira el error de la FK*/

/*(19)*/ALTER TABLE empleado ADD grado number(38);
       
        ALTER TABLE empleado 
        ADD CONSTRAINT fk_grado 
        FOREIGN KEY (grado) 
        REFERENCES sueldo (grado) 
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION ;
/*Error con el tema de la clave foranea :S tratare de solucionarlo*/

/*(20)*/


