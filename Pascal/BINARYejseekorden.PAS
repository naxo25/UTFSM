PROGRAM BURBUJA;
USES CRT;

TYPE  TIPO_ARCH = RECORD
                     CODIGO:BYTE;
                     NOMBRE:STRING[15];
                  END;

VAR  ARCH    :  FILE OF TIPO_ARCH;
     CODIGO  :  BYTE;
     BUF     :  TIPO_ARCH;
     POSI    :  INTEGER;

PROCEDURE ORDENAR;
VAR I,J        :  BYTE;
    BUF,BUF2   :  TIPO_ARCH;
BEGIN
     FOR I:=1 TO FILESIZE(ARCH)-1 DO
         FOR J:=0 TO FILESIZE(ARCH)-2 DO
         BEGIN
              SEEK(ARCH,J);     { j = 0}
              READ(ARCH,BUF);   {buf contiene el registro que esta en la posicion j (ej:1) del archivo}
              SEEK(ARCH,J+1);   { j = 1}
              READ(ARCH,BUF2);  {buf2 contiene el registro que esta en la posicion j+1 (ej:2) del archivo}
              IF BUF.CODIGO>BUF2.CODIGO THEN
              BEGIN
                   SEEK(ARCH,J);   {se agrega al registro en posicion j lo guardado en buf2}
                   WRITE(ARCH,BUF2);
                   SEEK(ARCH,J+1); {se agrega al registro en posicion j+1 lo guardado en buf}
                   WRITE(ARCH,BUF);
              END;
         END;
END;

PROCEDURE MOSTRAR;
VAR BUF : TIPO_ARCH;
BEGIN
     RESET(ARCH);
     WHILE NOT EOF (ARCH) DO
     BEGIN
          READ(ARCH,BUF);
          WRITELN(buf.nombre,' ',BUF.CODIGO);
     END;
END;

PROCEDURE BUSQUEDA_BINARIA;
VAR MITAD, NUMERO, MAX, MIN, MEDIO, EXISTE :  INTEGER;
    BUF                                    :  TIPO_ARCH;
BEGIN
     RESET(ARCH);
     MAX    :=  FILESIZE(ARCH)-1;
     MITAD  :=  MAX DIV 2;
     MEDIO  :=  MITAD;
     MIN    :=  0;
     EXISTE :=  0;
     WRITE  ('NUMERO A BUSCAR: ');
     READLN (NUMERO);
     SEEK   (ARCH,MAX);
     READ   (ARCH,BUF);
     IF BUF.CODIGO = NUMERO THEN
     BEGIN
          MITAD  := MAX;
          EXISTE := 1;
     END;
     IF NUMERO > BUF.CODIGO THEN
        EXISTE := 1;
     IF EXISTE = 0 THEN
     BEGIN
          SEEK(ARCH,0);
          READ(ARCH,BUF);
          IF BUF.CODIGO = NUMERO THEN
          BEGIN
               MITAD  := MIN;
               EXISTE := 1;
          END;
          IF NUMERO < BUF.CODIGO THEN
             EXISTE := 1;
     END;
     WHILE EXISTE <> 1 DO
     BEGIN
          SEEK(ARCH,MITAD);
          READ(ARCH,BUF);
          IF (NUMERO > BUF.CODIGO) THEN
          BEGIN
               MIN   :=  MITAD;
               MEDIO :=  MEDIO DIV 2;
               IF MEDIO = 0 THEN
                  MEDIO:= 1;
{ESTO ES PARA TERMINAR DE BUSCAR SI FALTO UN REGISTRO ENTRE MITAD Y EL MAX O MIN}
               MITAD := MITAD+MEDIO;
          END;
          IF (NUMERO < BUF.CODIGO) THEN
          BEGIN
               MAX   :=  MITAD;
               MEDIO :=  MEDIO DIV 2;
               IF MEDIO = 0 THEN
                  MEDIO:= 1;
               MITAD := MITAD-MEDIO;
          END;
          IF (MITAD = MIN) OR (MITAD = MAX) OR (NUMERO=BUF.CODIGO) THEN
              EXISTE := 1;
          WRITELN('MIN ',MIN,' MAX ',MAX,' MITAD ',MITAD,' BUF ',BUF.CODIGO);
     END;
     IF (NUMERO <> BUF.CODIGO) THEN
         WRITELN('NUMERO NO EXISTE');
     IF NUMERO = BUF.CODIGO THEN
        WRITELN(NUMERO,' ESTA EN LA POSICION ',MITAD+1,' NOMBRE ',BUF.NOMBRE);
END;

BEGIN
CLRSCR;
       ASSIGN(ARCH,'DATOS.DAT');
       RESET(ARCH);
       ORDENAR;
       MOSTRAR;
       BUSQUEDA_BINARIA;
       READLN;
END.

{PROCEDURE agregar;
var name:string; alumno:tipo_arch;
BEGIN
     RESET(ARCH);
     read(name);
     read(buffer.datos);
     posicion := -1;
     WHILE NOT EOF(ARCH_ALUMNO) DO
     BEGIN
          READ(ARCH_ALUMNO,ALUMNO);
          IF ALUMNO.NOMBRES=NAME
             THEN POSICION:=0;
     END;	
     if posicion = -1 then mensaje de error
     else
     begin
	  alumno.name := name;	
          READ(ARCH,alumno);
          write(arch,buffer.codigo)
     END;
END;

PROCEDURE modificar;
VAR BUF : TIPO_ARCH;
BEGIN
     RESET(ARCH);
     read(buffer.datos);
     POSICION:=-1;
     CONT:=-1;
     WHILE NOT EOF(ARCH_ALUMNO) AND (POSICION=-1) DO
     BEGIN
          READ(ARCH_ALUMNO,ALUMNO);
          CONT:=CONT+1;
          IF ALUMNO.NOMBRES=NAME
             THEN POSICION:=CONT;
     END;	
     if posicion = -1 then mensaje de error
     else
     begin	
          READ(ARCH,buffer.datos);
	  seek(arch,posicion);
          write(arch,buffer.codigo)
     END;
END;
}



































