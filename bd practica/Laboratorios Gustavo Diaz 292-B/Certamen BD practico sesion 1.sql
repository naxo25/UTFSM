/*1*/
DROP TABLE Sueldo

ALTER SESSION  SET NLS_DATE_FORMAT = 'dd/mm/yyyy';


DROP TABLE TITULO
CREATE TABLE Titulo(
        cod_titulo    number(3),
        nom_titulo    varchar(30),
        id_director   number(8),  
        id_pais       number(8),  
        id_categoria  number(8),  
        genero        char(1),
        anno          number(4),
        descripcion   varchar2(50)
);

DROP TABLE Copia
CREATE TABLE Copia(
        cod_copia     number(3),
        cod_titulo    number(3),
        estado        char(1)
);

DROP TABLE Prestamo
CREATE TABLE Prestamo(
        rut_socio         number(8),
        fecha_inicio      date,
        cod_copia         number(3),
        fecha_termino     date,
        fecha_devolucion  date,
        estado            char(1)
);

DROP TABLE socio;
CREATE TABLE socio(
	rut_socio 	      NUMBER(8),
  rut_socio_ppal    NUMBER(8) NULL,   
	nombre 		        VARCHAR2(30),
	direccion 	      VARCHAR2(30),
	fono 		          NUMBER(9),
	valor_max_prest   number(8),
	tipo		          char(1)
);

DROP TABLE pais;
CREATE TABLE pais(
	id_pais		        NUMBER(8),
	nom_pais	        VARCHAR2(30)
	);

DROP TABLE director;
CREATE TABLE director(
	id_director	      NUMBER(8),
	nom_director	    varchar2(30)
);

DROP TABLE categoria;
CREATE TABLE categoria(
	id_categoria	    NUMBER(8),
	nom_categoria	    VARCHAR2(30),
	precio	          number(8),
	dias_prestamo	    number(2)
);


ALTER TABLE socio 
      ADD CONSTRAINT pk_rut_soc PRIMARY KEY (rut_socio);

ALTER TABLE pais
       ADD CONSTRAINT pk_pais PRIMARY KEY (id_pais);

ALTER TABLE director
      ADD CONSTRAINT pk_director PRIMARY KEY (id_director);

ALTER TABLE categoria
      ADD CONSTRAINT pk_categoria PRIMARY KEY (id_categoria);
      
ALTER TABLE Titulo
      ADD CONSTRAINT pk_titulo PRIMARY KEY (cod_titulo);
      
ALTER TABLE Copia
      ADD CONSTRAINT pk_copia PRIMARY KEY (cod_copia);
      
ALTER TABLE Prestamo
      ADD CONSTRAINT pk_prestamo PRIMARY KEY (rut_socio,fecha_inicio,cod_copia);
      
/*---------------CLAVES FORANEA SOCIO-------------------------------------*/
ALTER TABLE socio
	ADD CONSTRAINT fk_soc_socp FOREIGN KEY (rut_socio_ppal)
	REFERENCES socio(rut_socio);
/*---------------CLAVE FORANEA COPIA--------------------------------------*/
ALTER TABLE Copia
  ADD CONSTRAINT fk_copia_titulo FOREIGN KEY (cod_titulo)
  REFERENCES Titulo (cod_titulo);
/*---------------CLAVE FORANEA PRESTAMO(SOCIO)----------------------------*/
ALTER TABLE Prestamo
  ADD CONSTRAINT fk_prest_socio FOREIGN KEY (rut_socio)
  REFERENCES socio (rut_socio);
/*---------------CLAVE FORANEA PRESTAMO(COPIA)----------------------------*/ 
ALTER TABLE Prestamo
  ADD CONSTRAINT fk_prest_copia FOREIGN KEY (cod_copia)
  REFERENCES Copia (cod_copia);
/*---------------CLAVE FORANEA TITULO(DIRECTOR)---------------------------*/
ALTER TABLE Titulo
  ADD CONSTRAINT fk_titulo_director FOREIGN KEY (id_director)
  REFERENCES director (id_director);
/*---------------CLAVE FORANEA TITULO(PAIS)-------------------------------*/
ALTER TABLE Titulo
  ADD CONSTRAINT fk_titulo_pais FOREIGN KEY(id_pais)
  REFERENCES pais (id_pais);
/*---------------CLAVE FORANEA TITULO(CATEGORIA)--------------------------*/
ALTER TABLE Titulo
  ADD CONSTRAINT fk_titulo_categoria FOREIGN KEY(id_categoria)
  REFERENCES categoria (id_categoria);

/*---------------RESTRICCIONES--------------------------------------------*/
ALTER TABLE prestamo
	ADD  CHECK (estado in ('P','D','A'));

ALTER TABLE copia
	ADD  CHECK (estado in ('P','D'));

ALTER TABLE titulo
	ADD  CHECK (genero BETWEEN 1 AND 5);


ALTER TABLE prestamo
	ADD  CHECK (fecha_termino >= fecha_inicio)
	ADD  CHECK (fecha_devolucion >= fecha_inicio);

ALTER TABLE socio
	ADD CHECK (tipo IN ('P','A'));




/*2*/
SELECT p.rut_socio "principal", COUNT (ad.rut_socio_ppal)"adicional", SUM (ad.valor_max_prest) "monto"
FROM socio p, socio ad
WHERE p.tipo ='P'
	  AND p.rut_socio = ad.rut_socio_ppal
	  AND p.valor_max_prest BETWEEN (SELECT AVG (valor_max_prest) FROM socio) AND 10000
	  AND p.nombre LIKE '%SE%'
GROUP BY p.rut_socio
HAVING COUNT (ad.rut_socio_ppal)>1

