PROGRAM XPERTO_PRUEBA1;
USES CRT;

TYPE TIPO_PROGRAMACION = RECORD
                               FECHA                 : BYTE;
                               COD_LOCAL             : STRING[2];
                               GOL_LOCAL             : BYTE;
                               COD_VISITA            : STRING[2];
                               GOL_VISITA            : BYTE;
                               ESTADO                : CHAR;
                         END;

TYPE TIPO_EQUIPOS      = RECORD
                               COD_EQUIPO            : STRING[2];
                               NOM_EQUIPO            : STRING[40];
                               PARTIDOS_JUGADOS      : BYTE;
                               PARTIDOS_GANADOS      : BYTE;
                               PARTIDOS_EMPATADOS    : BYTE;
                               PARTIDOS_PERDIDOS     : BYTE;
                               GOLES_A_FAVOR         : BYTE;
                               GOLES_EN_CONTRA       : BYTE;
                         END;

TYPE TIPO_RESUL        = RECORD
                               FECHA                 : BYTE;
                               COD_LOCAL             : STRING[2];
                               GOL_LOCAL             : BYTE;
                               COD_VISITA            : STRING[2];
                               GOL_VISITA            : BYTE;
                         END;


VAR
        ARCH_PROGRAMACION           : FILE OF TIPO_PROGRAMACION;
        ARCH_EQUIPOS                : FILE OF TIPO_EQUIPOS;
        ARCH_RESUL                  : FILE OF TIPO_RESUL;
        CODIGO1, CODIGO2            : STRING[2];
        GOL1, GOL2, FECH            : BYTE;
        X1, X2                      : INTEGER;
{------------------------PROCEDIMIENTOS---------------------------}

                        {VALIDAR_ARCHIVOS}
PROCEDURE VALIDAR_ARCHIVOS;
BEGIN
     {$I-}
     RESET(ARCH_PROGRAMACION);
     RESET(ARCH_PROGRAMACION);
     RESET(ARCH_RESUL);
     IF IORESULT <> 0 THEN
        REWRITE(ARCH_PROGRAMACION);
        CLOSE(ARCH_PROGRAMACION);
     IF IORESULT <> 0 THEN
        REWRITE(ARCH_EQUIPOS);
        CLOSE(ARCH_EQUIPOS);
     IF IORESULT <> 0 THEN
        REWRITE(ARCH_RESUL);
        CLOSE(ARCH_RESUL);
     {$I+}
END;

                          {LECTURA_RESULT}
PROCEDURE LECTURA_RESUL;
VAR
        FECHA                           : BYTE;
        BUFFER_RESUL                    : TIPO_RESUL;

BEGIN
     RESET(ARCH_RESUL);
     WHILE NOT EOF(ARCH_RESUL) DO
           BEGIN
                READ(ARCH_RESUL,BUFFER_RESUL);
               { FECHA           := COPY(BUFFER_RESUL,1,1);  VAL
                CODIGO1         := COPY(BUFFER_RESUL,3,2);
                GOL_LOCAl       := COPY(BUFFER_RESUL,6,1);  VAL
                CODIGO2         := COPY(BUFFER_RESUL,8,2);
                GOL_VISITA      := COPY(BUFFER_RESUL,11,1); VAL
                ACTUALIZAR_PROGRAMACION;
                ACTUALIZAR_EQUIPOS;}
           END;
     READLN;
     CLOSE(ARCH_RESUL);
END;

                          {ACTUALIZAR_PROGRAMACION}
PROCEDURE ACTUALIZAR_PROGRAMACION{(CODIGO1,CODIGO2: STRING[2];GOL1, GOL2, FECH: BYTE)};
VAR
        BUFFER_PROGRAMACION : TIPO_PROGRAMACION;

BEGIN
     RESET(ARCH_PROGRAMACION);
     WHILE NOT EOF(ARCH_PROGRAMACION) DO
           READ(ARCH_PROGRAMACION,BUFFER_PROGRAMACION);
           IF (CODIGO1 = BUFFER_PROGRAMACION.COD_LOCAL) AND (CODIGO2 = BUFFER_PROGRAMACION.COD_VISITA) THEN
              BEGIN
                   BUFFER_PROGRAMACION.FECHA                := FECH;
                   READLN(BUFFER_PROGRAMACION.FECHA);
                   BUFFER_PROGRAMACION.COD_LOCAL            := CODIGO1;
                   READLN(BUFFER_PROGRAMACION.COD_LOCAL);
                   BUFFER_PROGRAMACION.GOL_LOCAL            := GOL1;
                   READLN(BUFFER_PROGRAMACION.GOL_LOCAL);
                   BUFFER_PROGRAMACION.COD_VISITA           := CODIGO2;
                   READLN(BUFFER_PROGRAMACION.COD_VISITA);
                   BUFFER_PROGRAMACION.GOL_VISITA           := GOL2;
                   READLN(BUFFER_PROGRAMACION.GOL_VISITA);
                   SEEK(ARCH_PROGRAMACION,FILEPOS(ARCH_PROGRAMACION)-1);
                   WRITE(ARCH_PROGRAMACION,BUFFER_PROGRAMACION);
              END
           ELSE
     READLN;
END;

                        {ACTUALIZAR_EQUIPOS}
PROCEDURE ACTUALIZAR_EQUIPOS{(CODIGO1,CODIGO2: STRING[2];GOL1, GOL2, FECH: BYTE)};
VAR
        BUFFER_EQUIPOS : TIPO_EQUIPOS;

BEGIN
     RESET(ARCH_EQUIPOS);
     RESET(ARCH_PROGRAMACION);
     WHILE NOT EOF(ARCH_EQUIPOS) DO
           READ(ARCH_EQUIPOS,BUFFER_EQUIPOS);
           IF (CODIGO1 = BUFFER_EQUIPOS.COD_EQUIPO) THEN
              BEGIN
                   BUFFER_EQUIPOS.PARTIDOS_JUGADOS      := BUFFER_EQUIPOS.PARTIDOS_JUGADOS + 1;
                   READLN(BUFFER_EQUIPOS.PARTIDOS_JUGADOS);
                   IF GOL1 > GOL2 THEN
                      BEGIN BUFFER_EQUIPOS.PARTIDOS_GANADOS     := BUFFER_EQUIPOS.PARTIDOS_GANADOS + 1;
                            READLN(BUFFER_EQUIPOS.PARTIDOS_JUGADOS);
                            BUFFER_EQUIPOS.GOLES_A_FAVOR        := BUFFER_EQUIPOS.GOLES_A_FAVOR + 1;
                            READLN(BUFFER_EQUIPOS.GOLES_A_FAVOR);
                      END;
                   IF GOL1 < GOL2 THEN
                      BEGIN BUFFER_EQUIPOS.PARTIDOS_PERDIDOS     := BUFFER_EQUIPOS.PARTIDOS_PERDIDOS + 1;
                            READLN(BUFFER_EQUIPOS.PARTIDOS_PERDIDOS);
                            BUFFER_EQUIPOS.GOLES_EN_CONTRA      := BUFFER_EQUIPOS.GOLES_EN_CONTRA + 1;
                            READLN(BUFFER_EQUIPOS.GOLES_EN_CONTRA);
                      END;
                   IF GOL1 = GOL2 THEN
                      BEGIN BUFFER_EQUIPOS.PARTIDOS_EMPATADOS     := BUFFER_EQUIPOS.PARTIDOS_EMPATADOS + 1;
                            READLN(BUFFER_EQUIPOS.PARTIDOS_EMPATADOS);
                      END;
                   SEEK(ARCH_EQUIPOS,FILEPOS(ARCH_EQUIPOS)-1);
                   WRITE(ARCH_EQUIPOS,BUFFER_EQUIPOS);
              END;
     READLN;
END;

                           {MOSTRAR_EQUIPOS}
PROCEDURE MOSTRAR_EQUIPOS;
VAR
   BUFFER_EQUIPOS       : TIPO_EQUIPOS;

BEGIN
     RESET(ARCH_EQUIPOS);
     WHILE NOT EOF(ARCH_EQUIPOS) DO
           BEGIN
                READ(ARCH_EQUIPOS,BUFFER_EQUIPOS);
                WRITE(BUFFER_EQUIPOS.NOM_EQUIPO);
                WRITE(BUFFER_EQUIPOS.PARTIDOS_JUGADOS);
                WRITE(BUFFER_EQUIPOS.PARTIDOS_GANADOS);
                WRITE(BUFFER_EQUIPOS.PARTIDOS_EMPATADOS);
                WRITE(BUFFER_EQUIPOS.PARTIDOS_PERDIDOS);
                WRITE(BUFFER_EQUIPOS.GOLES_A_FAVOR);
                WRITE(BUFFER_EQUIPOS.GOLES_EN_CONTRA);
           END;
END;
{--------------------------MAIN-----------------------------------}
BEGIN
     ASSIGN(ARCH_RESUL,'RESUL.TXT');
     ASSIGN(ARCH_PROGRAMACION,'PROGRAMACION.DAT');
     ASSIGN(ARCH_EQUIPOS,'EQUIPOS.DAT');
     RESET(ARCH_RESUL);
     WHILE NOT EOF(ARCH_RESUL) DO
           BEGIN
                READLN(ARCH_RESUL,BUFFER_RESUL);
                VAL
     VALIDAR_ARCHIVOS;
     CLRSCR;
     LECTURA_RESUL;
     MOSTRAR_EQUIPOS;
     READLN;
END.