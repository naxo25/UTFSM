PROGRAM PRUEBA;
USES CRT;

TYPE PROGRAMACION = RECORD
                    FECHA      : BYTE;
                    COD_LOCAL  : STRING[2];
                    GOL_LOCAL  : BYTE;
                    COD_VISITA : STRING[2];
                    GOL_VISITA : BYTE;
                    ESTADO     : CHAR;
                    END;

TYPE EQUIPOS = RECORD
               COD_EQUIPO         : STRING[2];
               NOM_EQUIPO         : STRING[40];
               PARTIDOS_JUGADOS   : BYTE;
               PARTIDOS_GANADOS   : BYTE;
               PARTIDOS_EMPATADOS : BYTE;
               PARTIDOS_PERDIDOS  : BYTE;
               GOLES_A_FAVOR      : BYTE;
               GOLES_EN_CONTRA    : BYTE;
               END;

VAR EVENTOS : FILE OF PROGRAMACION;
    BUFFER : PROGRAMACION;
    DATOS : FILE OF EQUIPOS;
    MATRIZ : ARRAY [1..6] OF BYTE;
    auxdatos : file of equipos;
    bfdatos : equipos;

VAR
    RESUL : TEXT;
    ESTADO, RESULT : CHAR;
    BUF,COD_LOCAL,COD_VISITA,FECHA,GOL_LOCAL,GOL_VISITA: STRING;
    FECHITA,GOLCITOLOCAL,GOLCITOVISITA: BYTE;
    X,Y : BYTE;
{------------------------------------------------------------------}

PROCEDURE LOCAL;
VAR POS, I: INTEGER;
    BUF: EQUIPOS;

BEGIN
     I:= -1;
     POS:= -1;
     RESET(DATOS);
       WHILE (NOT EOF(DATOS)) AND (POS = -1) DO BEGIN
                                                  I:= I + 1 ;
                                                  READ(DATOS,BUF);
                                                  IF BUF.COD_EQUIPO = COD_LOCAL THEN POS := I;
                                                END;
       IF POS >- 1 THEN BEGIN
                              SEEK(DATOS,POS);
                              BUF.PARTIDOS_JUGADOS := BUF.PARTIDOS_JUGADOS + 1;
                              BUF.COD_EQUIPO := COD_LOCAL;
                              IF BUF.COD_EQUIPO = COD_LOCAL
                                 THEN BEGIN
                                        BUF.GOLES_A_FAVOR := BUF.GOLES_A_FAVOR + GOLCITOLOCAL;
                                        BUF.GOLES_EN_CONTRA := BUF.GOLES_EN_CONTRA + GOLCITOVISITA;
                                        IF RESULT = 'L'
                                           THEN BUF.PARTIDOS_GANADOS := BUF.PARTIDOS_GANADOS + 1;
                                        IF RESULT = 'V'
                                           THEN BUF.PARTIDOS_PERDIDOS := BUF.PARTIDOS_PERDIDOS + 1;
                                        IF RESULT = 'E'
                                           THEN BUF.PARTIDOS_EMPATADOS := BUF.PARTIDOS_EMPATADOS + 1;
                                      END;

                              IF BUF.COD_EQUIPO = COD_VISITA
                                 THEN BEGIN
                                        BUF.GOLES_A_FAVOR := BUF.GOLES_A_FAVOR + GOLCITOVISITA;
                                        BUF.GOLES_EN_CONTRA := BUF.GOLES_EN_CONTRA + GOLCITOLOCAL;
                                        IF RESULT = 'V'
                                           THEN BUF.PARTIDOS_GANADOS := BUF.PARTIDOS_GANADOS + 1;
                                        IF RESULT = 'L'
                                           THEN BUF.PARTIDOS_PERDIDOS := BUF.PARTIDOS_PERDIDOS + 1;
                                        IF RESULT = 'E'
                                           THEN BUF.PARTIDOS_EMPATADOS := BUF.PARTIDOS_EMPATADOS + 1;
                                      END;
                              WRITE(DATOS,BUF);
                        END;
     CLOSE(DATOS);
END;

{*******************************************************************}

PROCEDURE VISITA;
VAR POS, I: INTEGER;
    BUF: EQUIPOS;

BEGIN
     POS:=-1;
     I:=-1;
     RESET(DATOS);
     WHILE (NOT EOF(DATOS)) AND (POS = -1) DO BEGIN
                                                I := I + 1;
                                                READ(DATOS,BUF);
                                                IF BUF.COD_EQUIPO = COD_VISITA THEN POS := I;
                                              END;
     IF POS > -1 THEN BEGIN
                        SEEK(DATOS,POS);
                        BUF.PARTIDOS_JUGADOS := BUF.PARTIDOS_JUGADOS+1;
                        BUF.COD_EQUIPO := COD_VISITA;
                        IF BUF.COD_EQUIPO = COD_LOCAL
                           THEN BEGIN
                                  BUF.GOLES_A_FAVOR := BUF.GOLES_A_FAVOR + GOLCITOLOCAL;
                                  BUF.GOLES_EN_CONTRA := BUF.GOLES_EN_CONTRA + GOLCITOVISITA;
                                  IF RESULT = 'L'
                                     THEN BUF.PARTIDOS_GANADOS := BUF.PARTIDOS_GANADOS + 1;
                                  IF RESULT = 'V'
                                     THEN BUF.PARTIDOS_PERDIDOS := BUF.PARTIDOS_PERDIDOS + 1;
                                  IF RESULT = 'E'
                                     THEN BUF.PARTIDOS_EMPATADOS := BUF.PARTIDOS_EMPATADOS + 1;
                                END;
                        IF BUF.COD_EQUIPO = COD_VISITA
                           THEN BEGIN
                                  BUF.GOLES_A_FAVOR := BUF.GOLES_A_FAVOR + GOLCITOVISITA;
                                  BUF.GOLES_EN_CONTRA := BUF.GOLES_EN_CONTRA + GOLCITOLOCAL;
                                  IF RESULT = 'V'
                                     THEN BUF.PARTIDOS_GANADOS := BUF.PARTIDOS_GANADOS + 1;
                                  IF RESULT = 'L'
                                     THEN BUF.PARTIDOS_PERDIDOS := BUF.PARTIDOS_PERDIDOS + 1;
                                  IF RESULT = 'E'
                                     THEN BUF.PARTIDOS_EMPATADOS := BUF.PARTIDOS_EMPATADOS + 1;
                                END;
                        WRITE(DATOS,BUF);
                      END;
     CLOSE(DATOS);
END;
{*******************************************************************}
PROCEDURE MODIFICAR_GOLES;
VAR POS, I:INTEGER;
    BUF : PROGRAMACION;

BEGIN
     POS:= -1;
     I:= -1;
     RESET(EVENTOS);
     WHILE (NOT EOF(EVENTOS)) AND (POS = -1) DO
                                             BEGIN
                                             I := I + 1;
                                             READ(EVENTOS,BUF);
                                             IF BUF.COD_LOCAL = COD_LOCAL THEN POS := I;
                                             END;
     CLOSE(EVENTOS);
     RESET(EVENTOS);
     IF POS >- 1 THEN
     BEGIN
          SEEK(EVENTOS,POS);
          BUF.FECHA := FECHITA;
          BUF.COD_LOCAL := COD_LOCAL;
          BUF.GOL_LOCAL := GOLCITOLOCAL;
          BUF.COD_VISITA := COD_VISITA;
          BUF.GOL_VISITA := GOLCITOVISITA;
          IF GOL_LOCAL > GOL_VISITA THEN RESULT:='L'
             ELSE IF GOL_LOCAL < GOL_VISITA THEN RESULT:= 'V'
                                            ELSE RESULT:='E';
          WRITE(EVENTOS,BUF);
     END;
     CLOSE(EVENTOS);
END;
{*******************************************************************}
PROCEDURE DESPLEGAR_DATOS;
VAR BUF : EQUIPOS;
    CONT : BYTE;

BEGIN
     CONT := CONT + 1;
     RESET(DATOS);
     WRITELN(' EQUIPO   NOMBRE DEL EQUIPO   PARTIDOS JUGADOS   GOLES A FAVOR   GOLES EN CONTRA ');
     WHILE NOT EOF(DATOS) DO
           BEGIN
                TEXTCOLOR(RED);
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(9,X);
                                   WRITE('|');
                                  END;
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(29,X);
                                   WRITE('|');
                                  END;
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(48,X);
                                   WRITE('|');
                                  END;
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(64,X);
                                   WRITE('|');
                                  END;
                FOR X:=2 TO 80 DO BEGIN
                                   GOTOXY(X,2);
                                   WRITE('-');
                                  END;
                FOR X:=2 TO 80 DO BEGIN
                                   GOTOXY(X,21);
                                   WRITE('-');
                                  END;
                TEXTCOLOR(WHITE);
                READ(DATOS,BUF);
                GOTOXY(4,2 + CONT);
                WRITE(BUF.COD_EQUIPO);

                   IF BUF.COD_EQUIPO = 'HU' THEN BUF.NOM_EQUIPO:= 'HUACHIPATO';
                   IF BUF.COD_EQUIPO = 'UN' THEN BUF.NOM_EQUIPO:= 'NUBLENSE';
                   IF BUF.COD_EQUIPO = 'CH' THEN BUF.NOM_EQUIPO:= 'U. DE CHILE';
                   IF BUF.COD_EQUIPO = 'CS' THEN BUF.NOM_EQUIPO:= 'COBRESAL';
                   IF BUF.COD_EQUIPO = 'CO' THEN BUF.NOM_EQUIPO:= 'U. DE CONCE';
                   IF BUF.COD_EQUIPO = 'SM' THEN BUF.NOM_EQUIPO:= 'SAN MARCOS';
                   IF BUF.COD_EQUIPO = 'UC' THEN BUF.NOM_EQUIPO:= 'U. CATOLICA';
                   IF BUF.COD_EQUIPO = 'CB' THEN BUF.NOM_EQUIPO:= 'COBRELOA';
                   IF BUF.COD_EQUIPO = 'CC' THEN BUF.NOM_EQUIPO:= 'COLO-COLO';
                   IF BUF.COD_EQUIPO = 'AI' THEN BUF.NOM_EQUIPO:= 'AUDAX ITALIANO';
                   IF BUF.COD_EQUIPO = 'BA' THEN BUF.NOM_EQUIPO:= 'BARNECHEA' ;
                   IF BUF.COD_EQUIPO = 'LC' THEN BUF.NOM_EQUIPO:= 'UN. LA CALERA' ;
                   IF BUF.COD_EQUIPO = 'UE' THEN BUF.NOM_EQUIPO:= 'UNION ESPA¥OLA' ;
                   IF BUF.COD_EQUIPO = 'SW' THEN BUF.NOM_EQUIPO:= 'STGO WANDERERS' ;
                   IF BUF.COD_EQUIPO = 'AN' THEN BUF.NOM_EQUIPO:= 'ANTOFAGASTA' ;
                   IF BUF.COD_EQUIPO = 'DI' THEN BUF.NOM_EQUIPO:= 'DEP. IQUIQUE' ;
                   IF BUF.COD_EQUIPO = 'OH' THEN BUF.NOM_EQUIPO:= 'OHIGGINS' ;
                   IF BUF.COD_EQUIPO = 'PA' THEN BUF.NOM_EQUIPO:= 'PALESTINO' ;
                GOTOXY(13,2 + CONT);
                WRITE(BUF.NOM_EQUIPO);

                GOTOXY(39,2 + CONT);
                WRITE(BUF.PARTIDOS_JUGADOS);
                GOTOXY(55,2 + CONT);
                WRITE(BUF.GOLES_A_FAVOR);
                GOTOXY(72,2 + CONT);
                WRITE(BUF.GOLES_EN_CONTRA);
                CONT := CONT + 1;
           END;
           READLN;
           READLN;
           DELAY(250);
END;
{*******************************************************************}
PROCEDURE DESPLEGAR_EVENTOS;
VAR BUFF : PROGRAMACION;
    I,J     : INTEGER;
BEGIN
     I := 1;
     J := 1;
     RESET(EVENTOS);

     WRITELN('  FECHA   EQ. LOCAL   GOLES LOCAL   EQ. VISITA   GOLES VISITA   PARTIDO JUGADO ');
     WHILE NOT EOF(EVENTOS) DO
           BEGIN
           TEXTCOLOR(RED);
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(9,X);
                                   WRITE('|');
                                  END;
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(21,X);
                                   WRITE('|');
                                  END;
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(35,X);
                                   WRITE('|');
                                  END;
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(48,X);
                                   WRITE('|');
                                  END;
                FOR X:=1 TO 20 DO BEGIN
                                   GOTOXY(63,X);
                                   WRITE('|');
                                  END;
                FOR X:=2 TO 79 DO BEGIN
                                   GOTOXY(X,2);
                                   WRITE('-');
                                  END;
                FOR X:=2 TO 79 DO BEGIN
                                   GOTOXY(X,20);
                                   WRITE('-');
                                  END;
                TEXTCOLOR(WHITE);
                READ(EVENTOS,BUFF);
                          GOTOXY(5,1 + I);WRITELN(BUFF.FECHA);
                          GOTOXY(15,1 + I);WRITELN(BUFF.COD_LOCAL);
                          GOTOXY(28,1 + I);WRITELN(BUFF.GOL_LOCAL);
                          GOTOXY(41,1 + I);WRITELN(BUFF.COD_VISITA);
                          GOTOXY(56,1 + I);WRITELN(BUFF.GOL_VISITA);
                          GOTOXY(72,1 + I);WRITELN(BUFF.ESTADO);
                          I := I + 1;
                          IF I = 19
                             THEN BEGIN
                                       I:= 1;
                                       WRITELN;
                                       IF J <= 2
                                               THEN BEGIN
                                                         GOTOXY(1,23);WRITELN('                                          ');
                                                         GOTOXY(1,23);WRITELN('PRESIONE UNA TECLA PARA VER MAS RESULTADOS');
                                                         J:= J + 1;
                                                    END
                                               ELSE BEGIN
                                                    GOTOXY(1,23);
                                                    WRITELN('NO HAY MAS RESULTADOS, PRESIONE UNA TECLA PARA SALIR');
                                                    END;
                                               READLN;
                                  END;

                          DELAY(250);
           END;
END;
{*******************************************************************}
PROCEDURE BUSCAR_EQUIPO;
VAR ERROR: INTEGER;
BEGIN
     RESET(EVENTOS);
     READ(EVENTOS,BUFFER);

     ESTADO:= 'S';
     FECHA := COPY(BUF,1,1);
     COD_LOCAL:= COPY(BUF,3,2);
     GOL_LOCAL := COPY(BUF,6,1);
     COD_VISITA:= COPY(BUF,8,2);
     GOL_VISITA:= COPY(BUF,11,1);

     VAL(FECHA,FECHITA,ERROR);
     VAL(GOL_LOCAL,GOLCITOLOCAL,ERROR);
     VAL(GOL_VISITA,GOLCITOVISITA,ERROR);

     BUFFER.ESTADO:= ESTADO;
     BUFFER.FECHA:= FECHITA;
     BUFFER.COD_LOCAL:= COD_LOCAL;
     BUFFER.GOL_LOCAL:= GOLCITOLOCAL;
     BUFFER.COD_VISITA:= COD_VISITA;
     BUFFER.GOL_VISITA:= GOLCITOVISITA;

     SEEK(EVENTOS, FILEPOS(EVENTOS) - 1);
     WRITE(EVENTOS,BUFFER);
     CLOSE(EVENTOS);
END;
{*******************************************************************}
PROCEDURE COMPROBAR_DATOS;
BEGIN
     RESET(EVENTOS);
     READ(EVENTOS,BUFFER);
     TEXTCOLOR(RED);

     WRITELN('fecha :',FECHA);
     WRITELN('codigo local:',COD_LOCAL);
     WRITELN('gol local:',GOL_LOCAL);
     WRITELN('codigo visita:',COD_VISITA);
     WRITELN('gol visita:',GOL_VISITA);
     WRITELN('estado:',ESTADO);

     TEXTCOLOR(WHITE);
     CLOSE(EVENTOS);

END;
{--------------------------------------------------------------------------}

PROCEDURE LISTAR_TRES;
VAR I:BYTE;
    BUFFER:EQUIPOS;
BEGIN
     WRITELN('NOMBRE    PARTIDOS GANADOS');
     WRITELN('--------------------------');
     WRITELN;
     WRITELN('PRIMEROS LUGARES');
     WRITELN('----------------');
     WRITELN;
     FOR I:=1 TO 3 DO
     BEGIN
          RESET(DATOS);
          SEEK(DATOS,MATRIZ[I]);
          READ(DATOS,BUFFER);
          WRITELN(BUFFER.COD_EQUIPO,'        ',BUFFER.PARTIDOS_GANADOS);
     END;
     WRITELN;
     WRITELN('ULTIMOS LUGARES');
     WRITELN('---------------');
     WRITELN;
     FOR I:=6 DOWNTO 4 DO
     BEGIN
          RESET(DATOS);
          SEEK(DATOS,MATRIZ[I]);
          READ(DATOS,BUFFER);
          WRITELN(BUFFER.COD_EQUIPO,'        ',BUFFER.PARTIDOS_GANADOS);
     END;
     CLOSE(DATOS);
END;

PROCEDURE CREAR_TRES_MEJORES_Y_PEORES;

VAR CONT,I:INTEGER;
    PUNTOS:BYTE;
    BUFFER:EQUIPOS;

BEGIN
     {ESTA PARTE ES PARA LOS GANADORES}
     PUNTOS:=0;
     FOR I:=1 TO 3 DO
     BEGIN
          RESET(DATOS);
          CONT:=-1;
          PUNTOS:=0;
          WHILE NOT EOF (DATOS) DO
          BEGIN
               CONT:=CONT+1;
               READ(DATOS,BUFFER);
               IF (BUFFER.PARTIDOS_GANADOS>PUNTOS) AND
               (MATRIZ[I-1]<>CONT) AND (MATRIZ[I-2]<>CONT) THEN
               BEGIN
                  MATRIZ[I]:=CONT;
                  PUNTOS:=BUFFER.PARTIDOS_GANADOS;
               END;
          END;
          CLOSE(DATOS);
     END;

     {ESTA PARTE ES PARA LOS ULTIMOS LUGARES}
     PUNTOS:=0;
     FOR I:=4 TO 6 DO
     BEGIN
          RESET(DATOS);
          CONT:=-1;
          PUNTOS:=6;
          WHILE NOT EOF (DATOS) DO
          BEGIN
               CONT:=CONT+1;
               READ(DATOS,BUFFER);
               IF (BUFFER.PARTIDOS_GANADOS<PUNTOS) AND
               (MATRIZ[I-1]<>CONT) AND (MATRIZ[I-2]<>CONT) THEN
               BEGIN
                  MATRIZ[I]:=CONT;
                  PUNTOS:=BUFFER.PARTIDOS_GANADOS;
               END;
          END;
          CLOSE(DATOS);
     END;

END;

BEGIN
     CLRSCR;
     ASSIGN(RESUL,'RESUL.TXT');
     RESET(RESUL);
     ASSIGN(EVENTOS,'PROGRAMA.DAT');
     RESET(EVENTOS);
     ASSIGN(DATOS,'EQUIPOS.DAT');
     assign(auxdatos,'auxdatos.dat');

     RESET(datos);
     REWRITE(AUXdatos);
     WHILE NOT EOF (datos) DO
     BEGIN
          READ(datos,bfdatos);
          WRITE(AUXdatos,bfdatos);
     END;
     CLOSE(datos);
     CLOSE(AUXdatos);

     WHILE NOT EOF(RESUL) DO BEGIN
                             READLN(RESUL,BUF);
                             BUSCAR_EQUIPO;
                             MODIFICAR_GOLES;
                             LOCAL;
                             VISITA;
                             END;
     DESPLEGAR_DATOS;
     CLRSCR;
     DESPLEGAR_EVENTOS;
     READLN;
     CREAR_TRES_MEJORES_Y_PEORES;
     CLRSCR;
     LISTAR_TRES;
     READLN;
     reset(eventos);
     RESET(auxdatos);
     REWRITE(datos);
     WHILE NOT EOF (auxdatos) DO
     BEGIN
          READ(auxdatos,bfdatos);
          WRITE(datos,bfdatos);
     END;
     CLOSE(datos);
     CLOSE(AUXdatos);
END.