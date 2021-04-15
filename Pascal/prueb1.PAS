PROGRAM XPERTO;
USES CRT;
TYPE PROGRAMACION = RECORD
                          FECHA      : BYTE;
                          COD_LOCAL  : STRING[2];
                          GOL_LOCAL  : BYTE;
                          COD_VISITA :STRING[2];
                          GOL_VISITA : BYTE;
                          ESTADO     : CHAR
                       END;

     EQUIPOS      = RECORD
                          COD_EQUIPO : STRING[2];
                          NOM_EQUIPO : STRING[40];
                          PARTIDOS_JUGADOS   : BYTE;
                          PARTIDOS_GANADOS   : BYTE;
                          PARTIDOS_EMPATADOS : BYTE;
                          PARTIDOS_PERDIDOS  : BYTE;
                          GOLES_A_FAVOR      : BYTE;
                          GOLES_EN_CONTRA    : BYTE;
                       END;

VAR RESULTADOS, FECHA, COD_LOCAL, GOL_LOCAL, COD_VISITA, GOL_VISITA : STRING;
    FECHA2, GOLLOCAL2, GOLVISITA2 : BYTE;
    RESULTADO         : CHAR;
    GUARDAR           : ARRAY [1..6] OF BYTE;
    ARCH_PROGRAMACION : FILE OF PROGRAMACION;
    ARCH_EQUIPOS      : FILE OF EQUIPOS;
    EQUIPOS_AUX       : FILE OF EQUIPOS;
    BUFFER            : EQUIPOS;

PROCEDURE GUARDAR_EQUIPOS;
VAR CONT, I :INTEGER;
    PUNTOS  : BYTE;

BEGIN
     FOR I := 1 TO 3 DO
     BEGIN
          RESET(ARCH_EQUIPOS);
          CONT := -1;
          PUNTOS := 0;
          WHILE NOT EOF (ARCH_EQUIPOS) DO
          BEGIN
               CONT := CONT + 1;
               READ(ARCH_EQUIPOS, BUFFER);
               IF (BUFFER.PARTIDOS_GANADOS > PUNTOS) AND
                  (GUARDAR[I-1] <> CONT) AND (GUARDAR[I-2] <> CONT)
                  THEN BEGIN
                            GUARDAR[I] := CONT;
                            PUNTOS := BUFFER.PARTIDOS_GANADOS;
                       END;
          END;
          WRITELN(BUFFER.PARTIDOS_GANADOS);
          READLN;
          CLOSE(ARCH_EQUIPOS);
     END;
     PUNTOS := 0;
     FOR I := 4 TO 6 DO
     BEGIN
          RESET(ARCH_EQUIPOS);
          CONT := -1;
          PUNTOS := 6;
          WHILE NOT EOF(ARCH_EQUIPOS) DO
                BEGIN
                     CONT := CONT+1;
                     READ(ARCH_EQUIPOS,BUFFER);
                     IF (BUFFER.PARTIDOS_GANADOS < PUNTOS) AND
                        (GUARDAR[I-1] <> CONT) AND (GUARDAR[I-2] <> CONT)
                                   THEN BEGIN
                                             GUARDAR[I] := CONT;
                                             PUNTOS := BUFFER.PARTIDOS_GANADOS;
                                        END;
                END;
                CLOSE(ARCH_EQUIPOS);
     END;

END;

PROCEDURE LISTA_FINAL;
VAR BUFFER : EQUIPOS;
    I      : BYTE;
BEGIN
     READLN;
     {-------------------------------------------------------------}

     WRITELN('PRIMEROS LUGARES');
     WRITELN('-------- -------');
     WRITELN;
     FOR I := 1 TO 3 DO
     BEGIN
          RESET(ARCH_EQUIPOS);
          SEEK(ARCH_EQUIPOS, GUARDAR[I]);
          READ(ARCH_EQUIPOS, BUFFER);
          WRITELN(BUFFER.COD_EQUIPO,'  ',BUFFER.PARTIDOS_GANADOS);
     END;
     WRITELN;
     WRITELN('ULTIMOS LUGARES');
     WRITELN('------- -------');
     WRITELN;
     FOR I:=4 TO 6 DO
     BEGIN
          RESET(ARCH_EQUIPOS);
          SEEK(ARCH_EQUIPOS, GUARDAR[I]);
          READ(ARCH_EQUIPOS,BUFFER);
          WRITELN(BUFFER.COD_EQUIPO,'  ',BUFFER.PARTIDOS_GANADOS);
     END;
     CLOSE(ARCH_EQUIPOS);
     READLN;
END;

PROCEDURE EQUIPO1;
VAR POSICION, CONT : INTEGER;
    BUFFER : EQUIPOS;
BEGIN
     POSICION := -1;
     CONT := -1;
     RESET(ARCH_EQUIPOS);
     WHILE (NOT EOF(ARCH_EQUIPOS)) AND (POSICION = -1) DO
     BEGIN
          CONT := CONT + 1;
          READ(ARCH_EQUIPOS, BUFFER);
          IF BUFFER.COD_EQUIPO = COD_LOCAL
             THEN POSICION := CONT;
     END;
     IF POSICION >- 1
        THEN BEGIN
               SEEK(ARCH_EQUIPOS,POSICION);
               BUFFER.PARTIDOS_JUGADOS := BUFFER.PARTIDOS_JUGADOS + 1;
               BUFFER.COD_EQUIPO := COD_LOCAL;
               IF BUFFER.COD_EQUIPO = COD_LOCAL
                  THEN BEGIN
                            BUFFER.GOLES_A_FAVOR := BUFFER.GOLES_A_FAVOR + GOLLOCAL2;
                            BUFFER.GOLES_EN_CONTRA := BUFFER.GOLES_EN_CONTRA + GOLVISITA2;
                            IF RESULTADO = 'L'
                               THEN BUFFER.PARTIDOS_GANADOS := BUFFER.PARTIDOS_GANADOS + 1;
                            IF RESULTADO = 'V'
                               THEN BUFFER.PARTIDOS_PERDIDOS := BUFFER.PARTIDOS_PERDIDOS + 1;
                            IF RESULTADO = 'E'
                               THEN BUFFER.PARTIDOS_EMPATADOS := BUFFER.PARTIDOS_EMPATADOS + 1;
                       END;
               IF BUFFER.COD_EQUIPO = COD_VISITA
                  THEN BEGIN
                            BUFFER.GOLES_A_FAVOR := BUFFER.GOLES_A_FAVOR + GOLVISITA2;
                            BUFFER.GOLES_EN_CONTRA := BUFFER.GOLES_EN_CONTRA + GOLLOCAL2;
                            IF RESULTADO = 'V'
                               THEN BUFFER.PARTIDOS_GANADOS := BUFFER.PARTIDOS_GANADOS + 1;
                            IF RESULTADO = 'L'
                               THEN BUFFER.PARTIDOS_PERDIDOS := BUFFER.PARTIDOS_PERDIDOS + 1;
                            IF RESULTADO = 'E'
                               THEN BUFFER.PARTIDOS_EMPATADOS := BUFFER.PARTIDOS_EMPATADOS + 1;
                       END;
               WRITE(ARCH_EQUIPOS,BUFFER);
        END;
        CLOSE(ARCH_EQUIPOS);
END;

PROCEDURE EQUIPO2;
VAR POSICION, CONT : INTEGER;
    BUFFER : EQUIPOS;
BEGIN
     POSICION := -1;
     CONT := -1;
     RESET(ARCH_EQUIPOS);
     WHILE (NOT EOF(ARCH_EQUIPOS)) AND (POSICION = -1) DO
     BEGIN
          CONT := CONT + 1;
          READ(ARCH_EQUIPOS,BUFFER);
          IF BUFFER.COD_EQUIPO = COD_VISITA
             THEN POSICION := CONT;
     END;
     IF POSICION > -1
        THEN BEGIN
                  SEEK(ARCH_EQUIPOS,POSICION);
                  BUFFER.PARTIDOS_JUGADOS := BUFFER.PARTIDOS_JUGADOS + 1;
                  BUFFER.COD_EQUIPO := COD_VISITA;
                  IF BUFFER.COD_EQUIPO = COD_LOCAL
                     THEN BEGIN
                               BUFFER.GOLES_A_FAVOR := BUFFER.GOLES_A_FAVOR + GOLLOCAL2;
                               BUFFER.GOLES_EN_CONTRA := BUFFER.GOLES_EN_CONTRA + GOLVISITA2;
                               IF RESULTADO = 'L'
                                  THEN BUFFER.PARTIDOS_GANADOS := BUFFER.PARTIDOS_GANADOS + 1;
                               IF RESULTADO = 'V'
                                  THEN BUFFER.PARTIDOS_PERDIDOS := BUFFER.PARTIDOS_PERDIDOS + 1;
                               IF RESULTADO = 'E'
                                  THEN BUFFER.PARTIDOS_EMPATADOS := BUFFER.PARTIDOS_EMPATADOS + 1;
                          END;
                  IF BUFFER.COD_EQUIPO = COD_VISITA
                     THEN BEGIN
                               BUFFER.GOLES_A_FAVOR := BUFFER.GOLES_A_FAVOR + GOLVISITA2;
                               BUFFER.GOLES_EN_CONTRA := BUFFER.GOLES_EN_CONTRA + GOLLOCAL2;
                               IF RESULTADO = 'V'
                                  THEN BUFFER.PARTIDOS_GANADOS := BUFFER.PARTIDOS_GANADOS + 1;
                               IF RESULTADO = 'L'
                                  THEN BUFFER.PARTIDOS_PERDIDOS := BUFFER.PARTIDOS_PERDIDOS + 1;
                               IF RESULTADO = 'E'
                                  THEN BUFFER.PARTIDOS_EMPATADOS := BUFFER.PARTIDOS_EMPATADOS + 1;
                          END;
                          WRITE(ARCH_EQUIPOS,BUFFER);
             END;
             CLOSE(ARCH_EQUIPOS);
END;

PROCEDURE LEER_ARCHIVO;
VAR BUFFER  : STRING;
    ARCH_RESUL : TEXT;
    BUFFER2 : PROGRAMACION;
    ERROR : INTEGER;
    ESTADO: CHAR;
    BUFFER3: EQUIPOS;
BEGIN
    CLRSCR;
    ASSIGN(ARCH_RESUL,'RESUL.TXT');
    RESET(ARCH_RESUL);
    ASSIGN(ARCH_PROGRAMACION,'PROGRAMA.DAT');
    RESET(ARCH_PROGRAMACION);
    ASSIGN(ARCH_EQUIPOS,'EQUIPOS.DAT');
    ASSIGN(EQUIPOS_AUX,'EQUIPOAUXILIAR.DAT');
    RESET(ARCH_EQUIPOS);
    REWRITE(EQUIPOS_AUX);
    WHILE NOT EOF (ARCH_EQUIPOS) DO
          BEGIN
               READ(ARCH_EQUIPOS,BUFFER3);
               WRITE(EQUIPOS_AUX,BUFFER3);
          END;
    CLOSE(ARCH_EQUIPOS);
    CLOSE(EQUIPOS_AUX);
    WHILE NOT EOF(ARCH_RESUL) DO
          BEGIN
               READLN(ARCH_RESUL,BUFFER);
               FECHA      := COPY(BUFFER,1,1);
               COD_LOCAL  := COPY(BUFFER,3,2);
               GOL_LOCAL  := COPY(BUFFER,6,1);
               COD_VISITA := COPY(BUFFER,8,2);
               GOL_VISITA := COPY(BUFFER,11,1);
               VAL(FECHA, FECHA2, ERROR);
               VAL(GOL_LOCAL, GOLLOCAL2, ERROR);
               VAL(GOL_VISITA, GOLVISITA2, ERROR);
               ESTADO := 'S';
               READ(ARCH_PROGRAMACION,BUFFER2);
               BUFFER2.FECHA := FECHA2;
               BUFFER2.COD_LOCAL := COD_LOCAL;
               BUFFER2.GOL_LOCAL := GOLLOCAL2;
               BUFFER2.COD_VISITA := COD_VISITA;
               BUFFER2.GOL_VISITA := GOLVISITA2;
               BUFFER2.ESTADO := ESTADO;
               SEEK(ARCH_PROGRAMACION, FILEPOS(ARCH_PROGRAMACION) - 1);
               WRITE(ARCH_PROGRAMACION,BUFFER2);
               EQUIPO1;
               EQUIPO2;
          END;
          CLOSE(ARCH_PROGRAMACION);
END;

PROCEDURE LISTAR_FECHAS;
VAR BUFFER2 : PROGRAMACION;
    N,P     : INTEGER;
BEGIN
     N := 1;
     P := 1;
     RESET(ARCH_PROGRAMACION);
     WRITELN('                                 RESULTADOS                                    ');
     WRITELN('-------------------------------------------------------------------------------');
     WRITELN('-FECHA--EQUIPO LOCAL--GOLES LOCAL--EQUIPO VISITA--GOLES VISITA--PARTIDO JUGADO-');
     WHILE NOT EOF(ARCH_PROGRAMACION) DO
           BEGIN
                READ(ARCH_PROGRAMACION,BUFFER2);
                          GOTOXY(4,3 + N);WRITELN(BUFFER2.FECHA);
                          GOTOXY(14,3 + N);WRITELN(BUFFER2.COD_LOCAL);
                          GOTOXY(28,3 + N);WRITELN(BUFFER2.GOL_LOCAL);
                          GOTOXY(41,3 + N);WRITELN(BUFFER2.COD_VISITA);
                          GOTOXY(56,3 + N);WRITELN(BUFFER2.GOL_VISITA);
                          GOTOXY(71,3 + N);WRITELN(BUFFER2.ESTADO);
                          N := N + 1;
                          IF N = 19
                             THEN BEGIN
                                       N:= 1;
                                       WRITELN;
                                       IF P <= 2
                                               THEN BEGIN
                                                         GOTOXY(1,23);WRITELN('                                          ');
                                                         GOTOXY(1,23);WRITELN('PRESIONE UNA TECLA PARA VER MAS RESULTADOS');
                                                         P:= P + 1;
                                                    END
                                               ELSE WRITELN('NO HAY MAS RESULTADOS, PRESIONE UNA TECLA PARA SALIR');
                                               READLN;
                                  END;
                          DELAY(300);
           END;
END;

PROCEDURE LISTAR_EQUIPOS;
VAR BUFFER : EQUIPOS;
    N      : BYTE;
BEGIN
     N := N + 1;
     RESET(ARCH_EQUIPOS);
     WRITELN('                                 RESULTADOS                                    ');
     WRITELN('-------------------------------------------------------------------------------');
     WRITELN('------EQUIPO------PARTIDOS JUGADOS-----GOLES A FAVOR-----GOLES EN CONTRA-------');
     WHILE NOT EOF(ARCH_EQUIPOS) DO
           BEGIN
                READ(ARCH_EQUIPOS,BUFFER);
                GOTOXY(9,-1 + N);WRITE(BUFFER.COD_EQUIPO);
                GOTOXY(26,-1 + N);WRITE(BUFFER.PARTIDOS_JUGADOS);
                GOTOXY(46,-1 + N);WRITE(BUFFER.GOLES_A_FAVOR);
                GOTOXY(64,-1 + N);WRITE(BUFFER.GOLES_EN_CONTRA);
                N := N + 1;
           END;
     CLOSE(ARCH_EQUIPOS);
     READLN;
END;

BEGIN
LEER_ARCHIVO;
LISTAR_FECHAS;
CLRSCR;
LISTAR_EQUIPOS;
CLRSCR;
GUARDAR_EQUIPOS;
readln;
LISTA_FINAL;
READLN;
END.