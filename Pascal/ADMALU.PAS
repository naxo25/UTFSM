PROGRAM ADMALU;
USES CRT,BIBLIO;

TYPE

    REG_ALUMNO= RECORD
                ROL_USM     : STRING[9];
                NOMBRES     : STRING[20];
                APE_PATERNO : STRING[15];
                APE_MATERNO : STRING[15];
                COD_CIUDAD  : STRING[4];
                SEXO        : CHAR;
                FECHA_NAC   : STRING[8];
                COD_CARRERA : BYTE;
              END;

    REG_CARRERA = RECORD
                CODIGO      : BYTE;
                NOMBRE      : STRING[50];
                COD_DEPTO   : STRING[6];
              END;

    REG_DEPTO   = RECORD
                CODIGO      : STRING[6];
                NOMBRE      : STRING[60];
              END;

    REG_CIUDAD  = RECORD
                CODIGO      : STRING[4];
                NOMBRE      : STRING[20];
              END;

VAR
    OPC          : BYTE;
    ARCH_ALUMNO  : FILE OF REG_ALUMNO;
    ALUMNO       : REG_ALUMNO;
    ARCH_CARRERA : FILE OF REG_CARRERA;
    CARRERA      : REG_CARRERA;
    ARCH_DEPTO   : FILE OF REG_DEPTO;
    DEPTO        : REG_DEPTO;
    ARCH_CIUDAD  : FILE OF REG_CIUDAD;
    CIUDAD       : REG_CIUDAD;

FUNCTION VALIDAR_CIUDAD(CODIGO:STRING):INTEGER;

BEGIN

     RESET(ARCH_CIUDAD);
     VALIDAR_CIUDAD:=-1;
     WHILE NOT EOF(ARCH_CIUDAD) DO
     BEGIN
          READ(ARCH_CIUDAD,CIUDAD);
          IF CIUDAD.CODIGO=CODIGO THEN
             VALIDAR_CIUDAD:=FILEPOS(ARCH_CIUDAD)-1;
     END;
     CLOSE(ARCH_CIUDAD);

END;

FUNCTION VALIDAR_CARRERA(COD_CAR:BYTE):INTEGER;

BEGIN

     RESET(ARCH_CARRERA);
     VALIDAR_CARRERA:=-1;
     WHILE NOT EOF (ARCH_CARRERA) DO
     BEGIN
          READ(ARCH_CARRERA,CARRERA);
          IF CARRERA.CODIGO=COD_CAR THEN
             VALIDAR_CARRERA:=FILEPOS(ARCH_CARRERA)-1;
     END;
     CLOSE(ARCH_CARRERA);

END;

FUNCTION VALIDAR_DEPTO(COD_DEPTO:STRING):INTEGER;

BEGIN

     RESET(ARCH_DEPTO);
     VALIDAR_DEPTO:=-1;
     WHILE NOT EOF (ARCH_DEPTO) DO
     BEGIN
          READ(ARCH_DEPTO,DEPTO);
          IF DEPTO.CODIGO=COD_DEPTO THEN
             VALIDAR_DEPTO:=FILEPOS(ARCH_DEPTO)-1;
     END;
     CLOSE(ARCH_DEPTO);

END;

PROCEDURE AGREGAR_ALUMNO;

VAR AUX:REG_ALUMNO;
    SW,COD_CAR:BYTE;
    CODIGO:STRING[4];

BEGIN

     RESET(ARCH_ALUMNO);
     WRITE('NOMBRES DEL ALUMNO: ');
     READLN(AUX.NOMBRES);
     WRITE('INGRESE CODIGO DE LA CIUDAD: ');
     READLN(CODIGO);
     WRITE('INGRESE CODIGO DE LA CARRERA: ');
     READLN(COD_CAR);
     SW:=0; AUX.SEXO:=' ';
     WHILE NOT EOF(ARCH_ALUMNO) DO
     BEGIN
          READ(ARCH_ALUMNO,ALUMNO);
          IF (ALUMNO.NOMBRES)=(AUX.NOMBRES)
             THEN SW:=1; {ESTE SW ES SI ENCUENTRA EL ALUMNO}
     END;
     IF SW=1
        THEN WRITE('EL ALUMNO QUE INGRESO YA SE ENCUENTRA EN EL ARCHIVO.')
        ELSE IF (VALIDAR_CIUDAD(CODIGO)>-1) AND (VALIDAR_CARRERA(COD_CAR)>-1) THEN
             BEGIN
                  AUX.COD_CIUDAD:=CODIGO;
                  AUX.COD_CARRERA:=COD_CAR;
                  WRITE('INGRESESE APELLIDO PATERNO: ');
                  READLN(AUX.APE_PATERNO);
                  WRITE('INGRESE APELLIDO MATERNO: ');
                  READLN(AUX.APE_MATERNO);
                  WRITE('INGRESE ROL DE ALUMNO: ');
                  READLN(AUX.ROL_USM);
                  WRITELN('DIGITO VERIFICADOR: ',VALIDAR_ROL_USM(AUX.ROL_USM));
                  REPEAT
                     WRITE('INGRESE SEXO (DEBE SER M o F): ');
                     READLN(AUX.SEXO);
                     AUX.SEXO:=UPCASE(AUX.SEXO);
                  UNTIL (AUX.SEXO = 'F') OR (AUX.SEXO = 'M');
                  WRITE('INGRESE FECHA DE NACIMIENTO (EJ: (AAAAMMDD): ');
                  READLN(AUX.FECHA_NAC);
                  IF VAL_FECHA(AUX.FECHA_NAC)=0 THEN
                  BEGIN
                       ALUMNO:=AUX;
                       WRITE(ARCH_ALUMNO,ALUMNO);
                       CLOSE(ARCH_ALUMNO);
                  END
                  ELSE WRITE('ERROR, LA FECHA ES INCORRECTA.')
             END
    ELSE IF (VALIDAR_CIUDAD(CODIGO)=-1) AND (VALIDAR_CARRERA(COD_CAR)>=-1) THEN
         WRITELN('ERROR, EL CODIGO DE LA CIUDAD Y LA CARRERA SON INVALIDOS.')
         ELSE IF (VALIDAR_CIUDAD(CODIGO)=-1) THEN
              WRITELN('ERROR, EL CODIGO DE LA CIUDAD NO SE ENCUENTRA EN EL ARCHIVO.')
              ELSE IF (VALIDAR_CARRERA(COD_CAR)>=-1) THEN
                   WRITELN('ERROR, EL CODIGO DE LA CARRERA NO SE ENCUENTRA EN EL ARCHIVO.');

END;

PROCEDURE MODIFICAR_ALUMNO;

VAR AUX:REG_ALUMNO;
    NAME:STRING[20];
    POSICION,CONT:INTEGER;
    COD_CAR:BYTE;

BEGIN

     RESET(ARCH_ALUMNO);
     WRITE('INGRESE NOMBRE DEL ALUMNO A MODIFICAR: ');
     READLN(NAME);
     POSICION:=-1;
     CONT:=-1;
     WHILE NOT EOF(ARCH_ALUMNO) AND (POSICION=-1) DO
     BEGIN
          READ(ARCH_ALUMNO,ALUMNO);
          CONT:=CONT+1;
          IF ALUMNO.NOMBRES=NAME
             THEN POSICION:=CONT;
     END;
     IF POSICION=-1
        THEN WRITE('EL ALUMNO INGRESADO ESTA MAL ESCRITO O NO EXISTE.')
        ELSE BEGIN
                  SEEK(ARCH_ALUMNO,POSICION);
                  WRITE('INGRESE NOMBRES DEL ALUMNO: ');
                  READLN(AUX.NOMBRES);
                  WRITE('INGRESESE APELLIDO PATERNO: ');
                  READLN(AUX.APE_PATERNO);
                  WRITE('INGRESE APELLIDO MATERNO: ');
                  READLN(AUX.APE_MATERNO);
                  WRITE('INGRESE ROL DE ALUMNO: ');
                  READLN(AUX.ROL_USM);
                  WRITELN('DIGITO VERIFICADOR: ',VALIDAR_ROL_USM(AUX.ROL_USM));
                  WRITE('INGRESE CODIGO DE LA CIUDAD: ');
                  READLN(AUX.COD_CIUDAD);
                  WRITE('INGRESE CARRERA DEL ALUMNO:');
                  READLN(AUX.COD_CARRERA);
                  REPEAT
                     WRITE('INGRESE SEXO (DEBE SER M o F): ');
                     READLN(AUX.SEXO);
                     AUX.SEXO:=UPCASE(AUX.SEXO);
                  UNTIL (AUX.SEXO = 'F') OR (AUX.SEXO = 'M');
                  WRITE('INGRESE FECHA DE NACIMIENTO (AAAAMMDD): ');
                  READLN(AUX.FECHA_NAC);
                  IF (VALIDAR_CIUDAD(AUX.COD_CIUDAD)>-1) AND
                     (VALIDAR_CARRERA(AUX.COD_CARRERA)>-1) THEN
                     BEGIN
                          ALUMNO:=AUX;
                          WRITE(ARCH_ALUMNO,ALUMNO);
                          CLOSE(ARCH_ALUMNO);
                     END
                     ELSE WRITELN('ERROR, CIUDAD O CARRERA INEXISTENTES.')
                  END;
END;

PROCEDURE CONSULTAR_ALUMNO;

VAR NAME:STRING[20];
    POSICION,CONT:INTEGER;

BEGIN

     RESET(ARCH_ALUMNO);
     WRITE('INGRESE NOMBRES DE ALUMNO A CONSULTAR: ');
     READLN(NAME);
     POSICION:=(-1);
     CONT:=(-1);
     WHILE NOT EOF(ARCH_ALUMNO) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_ALUMNO,ALUMNO);
          IF (ALUMNO.NOMBRES=NAME)
             THEN POSICION:=CONT;
     END;
     IF POSICION=(-1)
        THEN WRITE('EL NOMBRE ESTA MAL ESCRITO O NO SE ENCUENTRA EN EL ARCHIVO.')
        ELSE BEGIN
                  WRITELN('ROL ALUMNO: ',ALUMNO.ROL_USM);
                  WRITELN('DIGITO VERIFICADOR: ',VALIDAR_ROL_USM(ALUMNO.ROL_USM));
                  WRITELN('APELLIDO PATERNO: ',ALUMNO.APE_PATERNO);
                  WRITELN('APELLIDO MATERNO: ',ALUMNO.APE_MATERNO);
                  WRITELN('COD_CIUDAD: ',ALUMNO.COD_CIUDAD);
                  WRITELN('SEXO: ',ALUMNO.SEXO);
                  WRITELN('FECHA NACIMIENTO: ',ALUMNO.FECHA_NAC);
                  WRITELN('COD_CARRERA: ',ALUMNO.COD_CARRERA);
             END;
             WRITELN;
     IF (VALIDAR_CIUDAD(ALUMNO.COD_CIUDAD)=-1) OR (VALIDAR_CARRERA(ALUMNO.COD_CARRERA)=-1) THEN
        WRITE('EL ALUMNO SE ENCUENTRA EN EL ARCHIVO PERO NO SE LISTARA PORQUE SU CIUDAD O CARRERA HAN SIDO ELIMINADAS.');
     CLOSE(ARCH_ALUMNO);
     READLN;

END;

PROCEDURE ELIMINAR_ALUMNO;

VAR NAME:STRING[20];
    POSICION,CONT:INTEGER;
    ARCH_AUX:FILE OF REG_ALUMNO;

BEGIN

     RESET(ARCH_ALUMNO);
     ASSIGN(ARCH_AUX,'AUX ALUMNOS');
     WRITE('INGRESE NOMBRE DE ALUMNO A ELIMINAR: ');
     READLN(NAME);
     POSICION:=-1;
     CONT:=(-1);
     WHILE NOT EOF(ARCH_ALUMNO) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_ALUMNO,ALUMNO);
          IF NAME=ALUMNO.NOMBRES
             THEN POSICION:=CONT;
     END;
     CLOSE(ARCH_ALUMNO);
     WRITELN;
     IF POSICION=-1
        THEN WRITE('EL ALUMNO NO EXISTE.')
        ELSE BEGIN
                  RESET(ARCH_ALUMNO);
                  REWRITE(ARCH_AUX);
                  WHILE NOT EOF (ARCH_ALUMNO) DO
                  BEGIN
                       READ(ARCH_ALUMNO,ALUMNO);
                       IF ALUMNO.NOMBRES<>NAME THEN
                          WRITE(ARCH_AUX,ALUMNO);
                  END;
                  CLOSE(ARCH_ALUMNO);
                  CLOSE(ARCH_AUX);
                  REWRITE(ARCH_ALUMNO);
                  RESET(ARCH_AUX);
                  WHILE NOT EOF (ARCH_AUX) DO
                  BEGIN
                        READ(ARCH_AUX,ALUMNO);
                        WRITE(ARCH_ALUMNO,ALUMNO);
                  END;
                  WRITELN('EL ALUMNO HA SIDO ELIMINADO.');
                  CLOSE(ARCH_ALUMNO);
                  CLOSE(ARCH_AUX);
                  READLN;
             END;

END;

PROCEDURE LISTAR_ALUMNO;

BEGIN

     RESET(ARCH_ALUMNO);
     WRITELN('ROL          COD_CAR/CIUDAD SEXO FECHA     NOMBRES APELLIDOS');
     WRITELN('----------------------------------------------------------------');
     WHILE NOT EOF(ARCH_ALUMNO) DO
     BEGIN
          READ(ARCH_ALUMNO,ALUMNO);
          IF (VALIDAR_CIUDAD(ALUMNO.COD_CIUDAD)>-1) AND
          (VALIDAR_CARRERA(ALUMNO.COD_CARRERA)>-1)
          THEN BEGIN
                  WRITE(DERECHA(ALUMNO.ROL_USM,9));
                  WRITE('-');
                  WRITE(VALIDAR_ROL_USM(ALUMNO.ROL_USM)+'     ');
                  WRITE(ALUMNO.COD_CARRERA,' / ');
                  WRITE(DERECHA(ALUMNO.COD_CIUDAD,7));
                  WRITE(ALUMNO.SEXO+'   ');
                  WRITE(DERECHA(ALUMNO.FECHA_NAC,10));
                  WRITELN(ALUMNO.NOMBRES+' '+ALUMNO.APE_PATERNO+' '+ALUMNO.APE_MATERNO);
               END;
     END;
     WRITELN;
     WRITELN;
     CLOSE(ARCH_ALUMNO);

END;

PROCEDURE SUBMENU_ALUMNOS;

BEGIN

     CLRSCR;
     TEXTCOLOR(11);
     WRITELN;
     WRITELN('SUBMENU ALUMNOS');
     WRITELN;
     WRITELN('1.AGREGAR');
     WRITELN('2.MODIFICAR');
     WRITELN('3.CONSULTAR');
     WRITELN('4.ELIMINAR');
     WRITELN('5.LISTAR');
     WRITELN;
     WRITELN;
     WRITE('INGRESE SU OPCION: ');
     {$I-}
     READLN(OPC);
     {$I+}
     WRITELN;
     IF IORESULT <> 0
        THEN WRITE('ERROR, INGRESE UNA OPCION VALIDA')
             ELSE
                 CASE OPC OF
                 1 : AGREGAR_ALUMNO;
                 2 : MODIFICAR_ALUMNO;
                 3 : CONSULTAR_ALUMNO;
                 4 : ELIMINAR_ALUMNO;
                 5 : LISTAR_ALUMNO;
                 END;
     READLN;

END;

PROCEDURE AGREGAR_CIUDAD;

VAR AUX:REG_CIUDAD;
    SW:BYTE;

BEGIN

     RESET(ARCH_CIUDAD);
     WRITE('NOMBRE DE CIUDAD: ');
     READLN(AUX.NOMBRE);
     SW:=0;
     WHILE NOT EOF(ARCH_CIUDAD) DO
     BEGIN
          READ(ARCH_CIUDAD,CIUDAD);
          IF (CIUDAD.NOMBRE)=(AUX.NOMBRE)
             THEN SW:=1;
     END;
     IF SW=1
        THEN WRITE('LA CIUDAD QUE INGRESO YA SE ENCUENTRA EN EL ARCHIVO')
        ELSE BEGIN
                  WRITE('INGRESE CODIGO DE CIUDAD: ');
                  READLN(AUX.CODIGO);
                  CIUDAD:=AUX;
                  WRITE(ARCH_CIUDAD,CIUDAD);
             END;
     CLOSE(ARCH_CIUDAD);

END;

PROCEDURE MODIFICAR_CIUDAD;

VAR AUX:REG_CIUDAD;
    NAME:STRING[20];
    POSICION,CONT:INTEGER;

BEGIN

     RESET(ARCH_CIUDAD);
     WRITE('INGRESE NOMBRE DE CIUDAD A MODIFICAR: ');
     READLN(NAME);
     POSICION:=-1;
     CONT:=-1;
     WHILE NOT EOF(ARCH_CIUDAD) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_CIUDAD,CIUDAD);
          IF CIUDAD.NOMBRE=NAME
             THEN POSICION:=CONT;
     END;
     IF POSICION=-1
        THEN WRITE('LA CIUDAD INGRESADA NO SE ENCUENTRA EN EL ARCHIVO.')
        ELSE BEGIN
                  SEEK(ARCH_CIUDAD,POSICION);
                  WRITE('INGRESE NUEVO NOMBRE DE CIUDAD: ');
                  READLN(AUX.NOMBRE);
                  WRITE('INGRESE NUEVO CODIGO DE CIUDAD: ');
                  READLN(AUX.CODIGO);
                  CIUDAD:=AUX;
                  WRITE(ARCH_CIUDAD,CIUDAD);
                  CLOSE(ARCH_CIUDAD);
             END;

END;

PROCEDURE CONSULTAR_CIUDAD;

VAR NAME:STRING[20];
    POSICION,CONT:INTEGER;

BEGIN

     RESET(ARCH_CIUDAD);
     WRITE('INGRESE CIUDAD A CONSULTAR: ');
     READLN(NAME);
     POSICION:=(-1);
     CONT:=(-1);
     WHILE NOT EOF(ARCH_CIUDAD) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_CIUDAD,CIUDAD);
          IF (CIUDAD.NOMBRE=NAME)
             THEN POSICION:=CONT;
     END;
     IF POSICION=(-1)
        THEN WRITE('LA CIUDAD INGRESADA NO SE ENCUENTRA EN EL ARCHIVO.')
        ELSE BEGIN
                  WRITE('CIUDAD: ',CIUDAD.NOMBRE);
                  WRITELN(',  CODIGO DE CIUDAD: ',CIUDAD.CODIGO);
             END;
     CLOSE(ARCH_CIUDAD);
     READLN;

END;

PROCEDURE ELIMINAR_CIUDAD;

VAR COD_CIUDAD:STRING[5];
    POSICION,SW:BYTE;
    ARCH_AUX:FILE OF REG_CIUDAD;

BEGIN

     ASSIGN(ARCH_AUX,'AUXILIAR.DAT');
     RESET(ARCH_CIUDAD);
     WRITE('INGRESE CODIGO DE CIUDAD A ELIMINAR: ');
     READLN(COD_CIUDAD);
     POSICION:=0;
     SW:=0;
     WHILE NOT EOF(ARCH_CIUDAD) DO
     BEGIN
          READ(ARCH_CIUDAD,CIUDAD);
          IF COD_CIUDAD = CIUDAD.CODIGO
             THEN BEGIN
                       POSICION:=FILEPOS(ARCH_CIUDAD)-1;
                       SW:=1;
                  END;
     END;
     CLOSE(ARCH_CIUDAD);
     WRITELN;
     IF SW=0
        THEN WRITE('LA CIUDAD NO EXISTE')
        ELSE BEGIN
                  RESET(ARCH_CIUDAD);
                  REWRITE(ARCH_AUX);
                  WHILE NOT EOF(ARCH_CIUDAD) DO
                  BEGIN
                       READ(ARCH_CIUDAD,CIUDAD);
                       IF COD_CIUDAD<>CIUDAD.CODIGO
                          THEN WRITE(ARCH_AUX,CIUDAD);
                  END;
                  CLOSE(ARCH_CIUDAD);
                  CLOSE(ARCH_AUX);
                  RESET(ARCH_AUX);
                  REWRITE(ARCH_CIUDAD);
                  WHILE NOT EOF(ARCH_AUX) DO
                  BEGIN
                       READ(ARCH_AUX,CIUDAD);
                       WRITE(ARCH_CIUDAD,CIUDAD);
                  END;
                  CLOSE(ARCH_CIUDAD);
                  CLOSE(ARCH_AUX);
                  WRITELN;
                  WRITE('LA CIUDAD HA SIDO ELIMINDADA');
                  READLN;
             END;

END;


PROCEDURE LISTAR_CIUDAD;

BEGIN

     RESET(ARCH_CIUDAD);
     WRITELN('CIUDAD              COD');
     WRITELN('-----------------------');
     WHILE NOT EOF(ARCH_CIUDAD) DO
     BEGIN
          READ(ARCH_CIUDAD,CIUDAD);
          WRITE(DERECHA(CIUDAD.NOMBRE,21));
          WRITELN(DERECHA(CIUDAD.CODIGO,4));
     END;
     CLOSE(ARCH_CIUDAD);

END;

PROCEDURE SUBMENU_CIUDAD;

BEGIN

     CLRSCR;
     TEXTCOLOR(11);
     WRITELN;
     WRITELN('SUBMENU CIUDAD');
     WRITELN;
     WRITELN('1.AGREGAR');
     WRITELN('2.MODIFICAR');
     WRITELN('3.CONSULTAR');
     WRITELN('4.ELIMINAR');
     WRITELN('5.LISTAR');
     WRITELN;
     WRITELN;
     WRITE('INGRESE SU OPCION: ');
     {$I-}
     READLN(OPC);
     {$I+}
     WRITELN;
     IF IORESULT <> 0
        THEN WRITE('ERROR, INGRESE UNA OPCION VALIDA')
             ELSE
                 CASE OPC OF
                 1 : AGREGAR_CIUDAD;
                 2 : MODIFICAR_CIUDAD;
                 3 : CONSULTAR_CIUDAD;
                 4 : ELIMINAR_CIUDAD;
                 5 : LISTAR_CIUDAD;
                 END;
     READLN;

END;

PROCEDURE AGREGAR_CARRERA;

VAR AUX:REG_CARRERA;
    SW:BYTE;

BEGIN

     RESET(ARCH_CARRERA);
     WRITE('NOMBRE DE CARRERA: ');
     READLN(AUX.NOMBRE);
     SW:=0;
     WHILE NOT EOF(ARCH_CARRERA) DO
     BEGIN
          READ(ARCH_CARRERA,CARRERA);
          IF (CARRERA.NOMBRE)=(AUX.NOMBRE)
             THEN SW:=1;
     END;
     IF SW=1
        THEN WRITE('LA CARRERA QUE INGRESO YA SE ENCUENTRA EN EL ARCHIVO')
        ELSE BEGIN
                  WRITE('INGRESE CODIGO DE CARRERA: ');
                  READLN(AUX.CODIGO);
                  WRITE('INGRESE CODIGO DE DEPARTAMENTO: ');
                  READLN(AUX.COD_DEPTO);
                  IF VALIDAR_DEPTO(AUX.COD_DEPTO)>-1 THEN
                  BEGIN
                       CARRERA:=AUX;
                       WRITE(ARCH_CARRERA,CARRERA);
                       CLOSE(ARCH_CARRERA);
                  END
                  ELSE WRITE('EL CODIGO DE DEPARTAMENTO ES INVALIDO.');
             END;

END;

PROCEDURE MODIFICAR_CARRERA;

VAR AUX:REG_CARRERA;
    NAME:STRING[50];
    POSICION,CONT:INTEGER;

BEGIN

     RESET(ARCH_CARRERA);
     WRITE('INGRESE NOMBRE DE CARRERA A MODIFICAR: ');
     READLN(NAME);
     POSICION:=-1;
     CONT:=-1;
     WHILE NOT EOF(ARCH_CARRERA) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_CARRERA,CARRERA);
          IF CARRERA.NOMBRE=NAME
             THEN POSICION:=CONT;
     END;
     IF POSICION=-1
        THEN WRITE('LA CARRERA INGRESADA NO SE ENCUENTRA EN EL ARCHIVO.')
        ELSE BEGIN
                  SEEK(ARCH_CARRERA,POSICION);
                  WRITE('INGRESE NUEVO NOMBRE DE CARRERA: ');
                  READLN(AUX.NOMBRE);
                  WRITE('INGRESE NUEVO CODIGO DE CARRERA: ');
                  READLN(AUX.CODIGO);
                  WRITE('INGRESE NUEVO COD. DEPARTAMENTO: ');
                  READLN(AUX.COD_DEPTO);
                  IF VALIDAR_DEPTO(AUX.COD_DEPTO)>-1 THEN
                  BEGIN
                       CARRERA:=AUX;
                       WRITE(ARCH_CARRERA,CARRERA);
                       CLOSE(ARCH_CARRERA);
                  END
                  ELSE WRITE('EL CODIGO DE DEPARTAMENTO ES INVALIDO.')
             END;

END;

PROCEDURE CONSULTAR_CARRERA;

VAR NAME:STRING[50];
    POSICION,CONT:INTEGER;

BEGIN

     RESET(ARCH_CARRERA);
     WRITE('INGRESE CARRERA A CONSULTAR: ');
     READLN(NAME);
     POSICION:=(-1);
     CONT:=(-1);
     WHILE NOT EOF(ARCH_CARRERA) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_CARRERA,CARRERA);
          IF (CARRERA.NOMBRE=NAME)
             THEN POSICION:=CONT;
     END;
     IF POSICION=(-1)
        THEN WRITE('LA CARRERA INGRESADA NO SE ENCUENTRA EN EL ARCHIVO.')
        ELSE BEGIN
                  WRITELN('CARRERA: ',CARRERA.NOMBRE);
                  WRITELN('CODIGO DE CARRERA: ',CARRERA.CODIGO);
                  WRITELN('CODIGO DE DEPARTAMENTO: ',CARRERA.COD_DEPTO);
             END;
     IF VALIDAR_DEPTO(CARRERA.COD_DEPTO)=-1 THEN
        WRITE('EL DEPARTAMENTO DE LA CARRERA NO EXISTE POR LO TANTO LA CARRERA NO SE LISTARA.');
     CLOSE(ARCH_CARRERA);
     READLN;

END;

PROCEDURE ELIMINAR_CARRERA;

VAR COD_CARRERA,POSICION,SW:BYTE;
    BUF_CARRERA:REG_CARRERA;
    ARCH_AUX:FILE OF REG_CARRERA;

BEGIN

     ASSIGN(ARCH_AUX,'AUXILIAR.DAT');
     RESET(ARCH_CARRERA);
     WRITE('INGRESE CODIGO DE CARRERA A ELIMINAR: ');
     READLN(COD_CARRERA);
     POSICION:=0;
     SW:=0;
     WHILE NOT EOF(ARCH_CARRERA) DO
     BEGIN
          READ(ARCH_CARRERA,BUF_CARRERA);
          IF COD_CARRERA = BUF_CARRERA.CODIGO
             THEN BEGIN
                       POSICION:=FILEPOS(ARCH_CARRERA)-1;
                       SW:=1;
                  END;
     END;
     CLOSE(ARCH_CARRERA);
     WRITELN;
     IF SW=0
        THEN WRITE('LA CARRERA NO EXISTE')
        ELSE BEGIN
                  RESET(ARCH_CARRERA);
                  REWRITE(ARCH_AUX);
                  WHILE NOT EOF(ARCH_CARRERA) DO
                  BEGIN
                       READ(ARCH_CARRERA,BUF_CARRERA);
                       IF COD_CARRERA<>BUF_CARRERA.CODIGO
                          THEN WRITE(ARCH_AUX,BUF_CARRERA);
                  END;
                  CLOSE(ARCH_CARRERA);
                  CLOSE(ARCH_AUX);
                  RESET(ARCH_AUX);
                  REWRITE(ARCH_CARRERA);
                  WHILE NOT EOF(ARCH_AUX) DO
                  BEGIN
                       READ(ARCH_AUX,BUF_CARRERA);
                       WRITE(ARCH_CARRERA,BUF_CARRERA);
                  END;
                  CLOSE(ARCH_CARRERA);
                  CLOSE(ARCH_AUX);
                  WRITELN;
                  WRITE('LA CARRERA HA SIDO ELIMINDADA');
                  READLN;
             END;

END;

PROCEDURE LISTAR_CARRERA;

BEGIN

     RESET(ARCH_CARRERA);
     WRITELN('NOMBRE                                            COD_DEPTO  COD');
     WRITELN('----------------------------------------------------------------');
     WHILE NOT EOF(ARCH_CARRERA) DO
     BEGIN
          READ(ARCH_CARRERA,CARRERA);
          IF VALIDAR_DEPTO(CARRERA.COD_DEPTO)>-1
          THEN BEGIN
                    WRITE(DERECHA(CARRERA.NOMBRE,50));
                    WRITE(DERECHA(' '+CARRERA.COD_DEPTO,11));
                    WRITELN(CARRERA.CODIGO);
               END;
     END;
     CLOSE(ARCH_CARRERA);

END;

PROCEDURE SUBMENU_CARRERAS;

BEGIN

     CLRSCR;
     TEXTCOLOR(11);
     WRITELN;
     WRITELN('SUBMENU CARRERAS');
     WRITELN;
     WRITELN('1.AGREGAR');
     WRITELN('2.MODIFICAR');
     WRITELN('3.CONSULTAR');
     WRITELN('4.ELIMINAR');
     WRITELN('5.LISTAR');
     WRITELN;
     WRITELN;
     WRITE('INGRESE SU OPCION: ');
     {$I-}
     READLN(OPC);
     {$I+}
     WRITELN;
     IF IORESULT <> 0
        THEN WRITE('ERROR, INGRESE UNA OPCION VALIDA')
             ELSE
                 CASE OPC OF
                 1 : AGREGAR_CARRERA;
                 2 : MODIFICAR_CARRERA;
                 3 : CONSULTAR_CARRERA;
                 4 : ELIMINAR_CARRERA;
                 5 : LISTAR_CARRERA;
                 END;
     READLN;

END;

PROCEDURE AGREGAR_DEPARTAMENTO;

VAR AUX:REG_DEPTO;
    SW:BYTE;

BEGIN

     RESET(ARCH_DEPTO);
     WRITE('NOMBRE DE DEPARTAMENTO: ');
     READLN(AUX.NOMBRE);
     SW:=0;
     WHILE NOT EOF(ARCH_DEPTO) DO
     BEGIN
          READ(ARCH_DEPTO,DEPTO);
          IF (DEPTO.NOMBRE)=(AUX.NOMBRE)
             THEN SW:=1;
     END;
     IF SW=1
        THEN WRITE('EL DEPARTAMENTO QUE INGRESO YA SE ENCUENTRA EN EL ARCHIVO')
        ELSE BEGIN
                  WRITE('INGRESE CODIGO DE DEPARTAMENTO: ');
                  READLN(AUX.CODIGO);
                  DEPTO:=AUX;
                  WRITE(ARCH_DEPTO,DEPTO);
                  CLOSE(ARCH_DEPTO);
             END;

END;

PROCEDURE MODIFICAR_DEPARTAMENTO;

VAR NAME:STRING[60];
    AUX:REG_DEPTO;
    POSICION,CONT:INTEGER;

BEGIN

     RESET(ARCH_DEPTO);
     WRITE('INGRESE NOMBRE DE DEPARTAMENTO A MODIFICAR: ');
     READLN(NAME);
     POSICION:=-1;
     CONT:=-1;
     WHILE NOT EOF(ARCH_DEPTO) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_DEPTO,DEPTO);
          IF DEPTO.NOMBRE=NAME
             THEN POSICION:=CONT;
     END;
     IF POSICION=-1
        THEN WRITE('EL DEPARTAMENTO INGRESADO NO SE ENCUENTRA EN EL ARCHIVO.')
        ELSE BEGIN
                  SEEK(ARCH_DEPTO,POSICION);
                  WRITE('INGRESE NUEVO NOMBRE DE DEPARTAMENTO: ');
                  READLN(AUX.NOMBRE);
                  WRITE('INGRESE NUEVO CODIGO DE DEPARTAMENTO: ');
                  READLN(AUX.CODIGO);
                  DEPTO:=AUX;
                  WRITE(ARCH_DEPTO,DEPTO);
                  CLOSE(ARCH_DEPTO);
             END;

END;

PROCEDURE CONSULTAR_DEPARTAMENTO;

VAR NAME:STRING[60];
    POSICION,CONT:INTEGER;

BEGIN

     RESET(ARCH_DEPTO);
     WRITE('INGRESE DEPARTAMENTO A CONSULTAR: ');
     READLN(NAME);
     POSICION:=(-1);
     CONT:=(-1);
     WHILE NOT EOF(ARCH_DEPTO) AND (POSICION=-1) DO
     BEGIN
          CONT:=CONT+1;
          READ(ARCH_DEPTO,DEPTO);
          IF (DEPTO.NOMBRE=NAME)
             THEN POSICION:=CONT;
     END;
     IF POSICION=(-1)
        THEN WRITE('EL DEPARTAMENTO INGRESADO NO SE ENCUENTRA EN EL ARCHIVO.')
        ELSE BEGIN
                  WRITELN('NOMBRE DEPARTAMENTO: ',DEPTO.NOMBRE);
                  WRITELN('CODIGO DE DEPARTAMENTO: ',DEPTO.CODIGO);
             END;
     CLOSE(ARCH_DEPTO);
     READLN;

END;

PROCEDURE ELIMINAR_DEPARTAMENTO;

VAR COD_DEPTO:STRING[5];
    POSICION,SW:BYTE;
    BUF_DEPTO:REG_DEPTO;
    ARCH_AUX:FILE OF REG_DEPTO;

BEGIN
     ASSIGN(ARCH_AUX,'AUXILIAR.DAT');
     RESET(ARCH_DEPTO);
     WRITE('INGRESE CODIGO DE DEPARTAMENTO A ELIMINAR: ');
     READLN(COD_DEPTO);
     POSICION:=0;
     SW:=0;
     WHILE NOT EOF(ARCH_DEPTO) DO
     BEGIN
          READ(ARCH_DEPTO,BUF_DEPTO);
          IF COD_DEPTO = BUF_DEPTO.CODIGO
             THEN BEGIN
                       POSICION:=FILEPOS(ARCH_DEPTO)-1;
                       SW:=1;
                  END;
     END;
     CLOSE(ARCH_DEPTO);
     WRITELN;
     IF SW=0
        THEN WRITE('EL DEPARTAMENTO NO EXISTE')
        ELSE BEGIN
                  RESET(ARCH_DEPTO);
                  REWRITE(ARCH_AUX);
                  WHILE NOT EOF(ARCH_DEPTO) DO
                  BEGIN
                       READ(ARCH_DEPTO,BUF_DEPTO);
                       IF COD_DEPTO<>BUF_DEPTO.CODIGO
                          THEN WRITE(ARCH_AUX,BUF_DEPTO);
                  END;
                  CLOSE(ARCH_DEPTO);
                  CLOSE(ARCH_AUX);
                  RESET(ARCH_AUX);
                  REWRITE(ARCH_DEPTO);
                  WHILE NOT EOF(ARCH_AUX) DO
                  BEGIN
                       READ(ARCH_AUX,BUF_DEPTO);
                       WRITE(ARCH_DEPTO,BUF_DEPTO);
                  END;
                  CLOSE(ARCH_DEPTO);
                  CLOSE(ARCH_AUX);
                  WRITELN;
                  WRITE('EL DEPARTAMENTO HA SIDO ELIMINDADO');
                  READLN;
             END;

END;

PROCEDURE LISTAR_DEPARTAMENTO;

BEGIN

     RESET(ARCH_DEPTO);
     WRITELN('NOMBRE DEPARTAMENTO                                          CODIGO');
     WRITELN('-------------------------------------------------------------------');
     WHILE NOT EOF(ARCH_DEPTO) DO
     BEGIN
          READ(ARCH_DEPTO,DEPTO);
          IF DEPTO.NOMBRE<>' '
          THEN BEGIN
                    WRITE(DERECHA(DEPTO.NOMBRE,63));
                    WRITELN(DEPTO.CODIGO);
               END;
     END;
     CLOSE(ARCH_DEPTO);

END;

PROCEDURE SUBMENU_DEPARTAMENTOS;

BEGIN

     CLRSCR;
     TEXTCOLOR(11);
     WRITELN;
     WRITELN('SUBMENU DEPARTAMENTOS');
     WRITELN;
     WRITELN('1.AGREGAR');
     WRITELN('2.MODIFICAR');
     WRITELN('3.CONSULTAR');
     WRITELN('4.ELIMINAR');
     WRITELN('5.LISTAR');
     WRITELN;
     WRITELN;
     WRITE('INGRESE SU OPCION: ');
     {$I-}
     READLN(OPC);
     {$I+}
     WRITELN;
     IF IORESULT <> 0
        THEN WRITE('ERROR, INGRESE UNA OPCION VALIDA')
             ELSE
                 CASE OPC OF
                 1 : AGREGAR_DEPARTAMENTO;
                 2 : MODIFICAR_DEPARTAMENTO;
                 3 : CONSULTAR_DEPARTAMENTO;
                 4 : ELIMINAR_DEPARTAMENTO;
                 5 : LISTAR_DEPARTAMENTO;
                 END;
     READLN;

END;

PROCEDURE LISTAR_ALUMNOS_X_CARRERA;

BEGIN

     RESET(ARCH_CARRERA);
     WRITELN('ALUMNO                                             CARRERA');
     WRITELN('--------------------------------------------------------------------');
     WHILE NOT EOF (ARCH_CARRERA) DO
     BEGIN
          READ(ARCH_CARRERA,CARRERA);
          RESET(ARCH_ALUMNO);
          WHILE NOT EOF (ARCH_ALUMNO) DO
          BEGIN
          READ(ARCH_ALUMNO,ALUMNO);
          IF (CARRERA.CODIGO=ALUMNO.COD_CARRERA) THEN
             BEGIN
                  WRITE(DERECHA(ALUMNO.NOMBRES+' '+ALUMNO.APE_MATERNO+' '+ALUMNO.APE_PATERNO,51));
                  WRITELN(CARRERA.NOMBRE);
             END;
          END;
          CLOSE(ARCH_ALUMNO);
     END;
     CLOSE(ARCH_CARRERA);

END;

PROCEDURE LISTAR_CARRERAS_X_DEPTO;

BEGIN

     RESET(ARCH_DEPTO);
     WRITELN('CARRERA               DEPARTAMENTO');
     WRITELN('---------------------------------------');
     WHILE NOT EOF (ARCH_DEPTO) DO
     BEGIN
          READ(ARCH_DEPTO,DEPTO);
          RESET(ARCH_CARRERA);
          WHILE NOT EOF (ARCH_CARRERA) DO
          BEGIN
          READ(ARCH_CARRERA,CARRERA);
          IF (CARRERA.COD_DEPTO=DEPTO.CODIGO) THEN
             BEGIN
                  WRITE(DERECHA(CARRERA.NOMBRE,22));
                  WRITELN(DEPTO.NOMBRE);
             END;
          END;
          CLOSE(ARCH_CARRERA);
     END;
     CLOSE(ARCH_DEPTO);

END;

PROCEDURE LISTAR_ALUMNOS_X_CIUDAD;

BEGIN

     RESET(ARCH_CIUDAD);
     WRITELN('CIUDAD     NOMBRE');
     WRITELN('--------------------------------------------------');
     WHILE NOT EOF (ARCH_CIUDAD) DO
     BEGIN
          READ(ARCH_CIUDAD,CIUDAD);
          RESET(ARCH_ALUMNO);
          WHILE NOT EOF (ARCH_ALUMNO) DO
          BEGIN
          READ(ARCH_ALUMNO,ALUMNO);
          IF (CIUDAD.CODIGO=ALUMNO.COD_CIUDAD) THEN
             BEGIN
                  WRITE(DERECHA(CIUDAD.NOMBRE,11));
                  WRITELN(ALUMNO.NOMBRES+' '+ALUMNO.APE_PATERNO+' '+ALUMNO.APE_MATERNO);
             END;
          END;
          CLOSE(ARCH_ALUMNO);
     END;
     CLOSE(ARCH_CIUDAD);

END;

PROCEDURE SUBMENU_LISTADOS;

VAR OPC_LIST:BYTE;

BEGIN

     CLRSCR;
     TEXTCOLOR(11);
     WRITELN;
     WRITELN('SUBMENU LISTADOS');
     WRITELN;
     WRITELN('1.ALUMNOS');
     WRITELN('2.CIUDADES');
     WRITELN('3.CARRERAS');
     WRITELN('4.DEPARTAMENTOS');
     WRITELN('5.ALUMNOS POR CARRERA');
     WRITELN('6.CARRERAS POR DEPARTAMENTO');
     WRITELN('7.ALUMNOS POR CIUDAD');
     WRITELN;
     WRITE('INGRESE SU OPCION: ');
     {$I-}
     READLN(OPC_LIST);
     {$I+}
     WRITELN;
     IF IORESULT <> 0
        THEN WRITE('ERROR, INGRESE UNA OPCION VALIDA')
             ELSE
                 CASE OPC_LIST OF
                 1 : LISTAR_ALUMNO;
                 2 : LISTAR_CIUDAD;
                 3 : LISTAR_CARRERA;
                 4 : LISTAR_DEPARTAMENTO;
                 5 : LISTAR_ALUMNOS_X_CARRERA;
                 6 : LISTAR_CARRERAS_X_DEPTO;
                 7 : LISTAR_ALUMNOS_X_CIUDAD;
                 END;
     READLN;

END;

BEGIN

     CLRSCR;
     ASSIGN(ARCH_ALUMNO,'ALUMNOS.DAT');             {//////////////////}
      {$I-}
     RESET(ARCH_ALUMNO);
      {$I+}
     IF IORESULT <> 0 THEN REWRITE(ARCH_ALUMNO);
     CLOSE(ARCH_ALUMNO);
     ASSIGN(ARCH_CARRERA,'CARRERAS.DAT');          {//////////////////}
      {$I-}
     RESET(ARCH_CARRERA);
      {$I+}
     IF IORESULT <> 0 THEN REWRITE(ARCH_CARRERA);
     CLOSE(ARCH_CARRERA);
     ASSIGN(ARCH_DEPTO,'DEPTO.DAT');               {//////////////////}
      {$I-}
     RESET(ARCH_DEPTO);
      {$I+}
     IF IORESULT <> 0 THEN REWRITE(ARCH_DEPTO);
     CLOSE(ARCH_DEPTO);
     ASSIGN(ARCH_CIUDAD,'CIUDAD.DAT');             {//////////////////}
      {$I-}
     RESET(ARCH_CIUDAD);
      {$I+}
     IF IORESULT <> 0 THEN REWRITE(ARCH_CIUDAD);
     CLOSE(ARCH_CIUDAD);
     OPC:=0;
     WHILE OPC<>6 DO
     BEGIN
          CLRSCR;
          TEXTCOLOR(2);
          WRITELN;
          WRITELN('MENU');
          WRITELN;
          WRITELN('1.ALUMNOS');
          WRITELN('2.CIUDADES');
          WRITELN('3.CARRERAS');
          WRITELN('4.DEPARTAMENTOS');
          WRITELN('5.LISTADOS');
          WRITELN('6.SALIR');
          WRITELN;
          WRITE('ESCRIBA SU OPCION: ');
          {$I-}
          READLN(OPC);
          {$I+}
          WRITELN;
          IF IORESULT <> 0
             THEN WRITE('ERROR, INGRESE UNA OPCION VALIDA')
             ELSE
                 CASE OPC OF
                 1 : SUBMENU_ALUMNOS;
                 2 : SUBMENU_CIUDAD;
                 3 : SUBMENU_CARRERAS;
                 4 : SUBMENU_DEPARTAMENTOS;
                 5 : SUBMENU_LISTADOS;
                 END;
     END;
     READLN;

END.



