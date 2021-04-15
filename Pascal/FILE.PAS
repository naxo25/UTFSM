PROGRAM AMALIA;
USES CRT;

TYPE ST30 = STRING[30];

TYPE DATOS = RECORD
        NOMBRE : ST30;
        EDAD   : BYTE;
     END;


VAR  ARCH   : FILE OF DATOS;
     OP     : BYTE;

PROCEDURE LISTAR;
VAR BUFFER : DATOS;
BEGIN
     RESET(ARCH);
     WHILE NOT EOF (ARCH) DO
     BEGIN
          READ(ARCH,BUFFER);
          IF BUFFER.NOMBRE <> '' THEN
          BEGIN
               WRITELN(BUFFER.NOMBRE);
               WRITELN(BUFFER.EDAD)
          END;
     END;
END;

FUNCTION EXISTE (NOM : ST30) : INTEGER;
VAR BUFFER : DATOS;
    POS    : INTEGER;
BEGIN
     RESET(ARCH);
     EXISTE := -1;
     POS := -1;
     WHILE NOT EOF (ARCH) AND (BUFFER.NOMBRE <> NOM) DO
     BEGIN
          READ(ARCH,BUFFER);
          POS := POS + 1;
          IF BUFFER.NOMBRE = NOM THEN
             EXISTE := POS;
     END;
END;

PROCEDURE AGREGAR;
VAR NOM    : ST30;
    BUFFER : DATOS;
BEGIN
     LISTAR;
     WRITE('NOMBRE : ');
     READLN(NOM);
       IF EXISTE(NOM) = -1 THEN
       BEGIN
          WRITE('EDAD : ');
          READLN(BUFFER.EDAD);
          BUFFER.NOMBRE := NOM;
          WRITE(ARCH,BUFFER)
       END
       ELSE
           WRITELN('NOMBRE YA EXISTE');
       READLN;
END;

{SOLO ES ELIMINACION LOGICA, NO FISICA}
PROCEDURE BORRAR;
VAR BUFFER : DATOS;
    NOM    : ST30;
BEGIN
     RESET(ARCH);
     WRITE('NOMBRE A ELIMINAR : ');
     READLN(NOM);
     IF EXISTE(NOM) > -1 THEN
     BEGIN
          SEEK(ARCH,EXISTE(NOM));
     {CON EL SEEK UBICO EL ARCHIVO EN LA POSICION DONDE ENCUENTRO EL NOMBRE}
     {POR ESO PONGO SI EXISTE(NOM) > -1 ASI NO ENTRA SI NO EXISTE}
          BUFFER.NOMBRE := '';
          WRITE(ARCH,BUFFER)
     END;
END;

BEGIN
       ASSIGN(ARCH,'EMPLEADOS.DAT');
       {$I-}
       RESET(ARCH);
       IF IORESULT <> 0 THEN
          REWRITE(ARCH);
       {$I+}

       REPEAT

       CLRSCR;
       WRITELN('1 : AGREGAR');
       WRITELN('2 : ELIMINAR');
       WRITELN('0 : SALIR');
       WRITE('OPCION : ');
       READLN(OP);
          CASE OP OF
          1 : AGREGAR;
          2 : BORRAR;
          END;

       UNTIL OP = 0;

       CLOSE(ARCH);
       READLN;
END.