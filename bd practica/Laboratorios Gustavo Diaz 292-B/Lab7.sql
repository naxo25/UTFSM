/*1*/
INSERT INTO socio (rut_socio,rut_socio_ppal,nombre,direccion,fono,valor_max_prest,tipo)
     
       VALUES (14690319,(SELECT rut_socio FROM socio
                        
       WHERE nombre = 'SARA DUARTE'),'PEDRO QUINTANA',
             
       'LIBERTAD 315 VINA DEL MAR',(SELECT fono FROM socio
              
                                    WHERE nombre = 'JOSE DIAZ'),
          
          (SELECT AVG(valor_max_prest)*0.8 FROM socio),'A');



/*Pedido del señor pedro quintana*/
INSERT INTO prestamo (rut_socio,fecha_inicio,cod_copia,fecha_termino,fecha_devolucion,estado)
     
  VALUES (14690319,SYSDATE,(SELECT cod_copia FROM copia 
                               

   WHERE Cod_titulo = (SELECT cod_titulo FROM titulo
                                              
        WHERE nom_titulo = 'GUERRA DE LAS GALAXIAS') AND estado = 'D'),
           
    sysdate + (SELECT dias_prestamo FROM categoria 
                  
        WHERE id_categoria = (SELECT id_categoria FROM titulo
                    
             WHERE nom_titulo = 'GUERRA DE LAS GALAXIAS')),'P');