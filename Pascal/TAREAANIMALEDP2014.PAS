PROGRAM ANIMAL;
USES CRT;

TYPE PUNTERO   = ^TIPO_NODO;
     TIPO_NODO = RECORD
                       DATO   : STRING[40];
                       SI, NO : PUNTERO;
                 END;

     REGISTRO  = RECORD
                       DATO   : STRING[40];
                       SI, NO : INTEGER;
                 END;

VAR RAIZ                 :  PUNTERO;
    ARCHIVO              :  FILE OF REGISTRO;
    POS,OP               :  INTEGER;
    BUFFER               :  REGISTRO;

PROCEDURE CREAR_ARBOL(VAR RAIZ:PUNTERO);
VAR PUNT : PUNTERO;
BEGIN
     NEW(RAIZ);
     RAIZ^.DATO := 'VIVE EN EL AGUA';
     NEW(PUNT);
     PUNT^.DATO := 'RANA'; PUNT^.SI := NIL; PUNT^.NO := NIL; RAIZ^.SI := PUNT;
     NEW(PUNT);
     PUNT^.DATO := 'RATON'; PUNT^.SI := NIL; PUNT^.NO := NIL; RAIZ^.NO := PUNT;
END;

PROCEDURE CREAR_ARCHIVOS;
BEGIN
     ASSIGN(ARCHIVO,'ANIMAL.DAT');
     {$I-}
     RESET(ARCHIVO);
     {$I+}
     IF IORESULT <> 0 THEN REWRITE(ARCHIVO);
END;

PROCEDURE RESPALDAR1(RAIZ : PUNTERO; VAR POS : INTEGER);

PROCEDURE GUARDAR_SI;
VAR BUFFER : REGISTRO;
BEGIN
     SEEK(ARCHIVO,POS);
     BUFFER.DATO:=RAIZ^.DATO;
     IF RAIZ^.SI <> NIL THEN
        BUFFER.SI:=POS+1
        ELSE BUFFER.SI:=-1;
     BUFFER.NO:=-1;
     WRITE(ARCHIVO,BUFFER);
END;

BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          GUARDAR_SI;
          POS:=POS+1;
          RESPALDAR1(RAIZ^.SI,POS);
          RESPALDAR1(RAIZ^.NO,POS);
     END;
END;


PROCEDURE RESPALDAR2(RAIZ : PUNTERO; VAR POS : INTEGER);

FUNCTION BUSCAR(DATO : STRING):INTEGER;
VAR BUFFER : REGISTRO;
BEGIN
     RESET(ARCHIVO);
     WHILE NOT EOF (ARCHIVO) DO
     BEGIN
          READ(ARCHIVO,BUFFER);
          IF DATO = BUFFER.DATO THEN
             BUSCAR:=FILEPOS(ARCHIVO)-1;
     END;
END;

PROCEDURE GUARDAR_NO;
VAR BUFFER : REGISTRO;
BEGIN
     IF RAIZ^.NO <> NIL THEN
     BEGIN
        SEEK(ARCHIVO,POS);
        READ(ARCHIVO,BUFFER);
        BUFFER.NO:=BUSCAR(RAIZ^.NO^.DATO);
        SEEK(ARCHIVO,POS);
        WRITE(ARCHIVO,BUFFER);
     END;
END;

BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          GUARDAR_NO;
          POS:=POS+1;
          RESPALDAR2(RAIZ^.SI,POS);
          RESPALDAR2(RAIZ^.NO,POS);
     END;
END;

PROCEDURE RESPALDAR(RAIZ : PUNTERO);
VAR POS    : INTEGER;
    BUFFER : REGISTRO;
BEGIN
     REWRITE(ARCHIVO);
     POS:=0;
     RESPALDAR1(RAIZ,POS);
     POS:=0;
     RESPALDAR2(RAIZ,POS);
     RESET(ARCHIVO);
END;

PROCEDURE RESTAURAR(VAR RAIZ : PUNTERO);

PROCEDURE RECREAR_RAIZ(RAIZ : PUNTERO; VAR J : INTEGER);
VAR BUFFERSI,BUFFERNO : REGISTRO;
    P,Z               : PUNTERO;
BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          SEEK(ARCHIVO,J);
          READ(ARCHIVO,BUFFER);
          RAIZ^.SI:=NIL;
          RAIZ^.NO:=NIL;
          IF (BUFFER.SI <> -1) THEN
          BEGIN
               NEW(P);
               SEEK(ARCHIVO,BUFFER.SI);
               READ(ARCHIVO,BUFFERSI);
               P^.DATO := BUFFERSI.DATO;
               P^.SI := NIL; P^.NO := NIL;
               RAIZ^.SI:=P;
          END;
          IF (BUFFER.NO <> -1) THEN
          BEGIN
               NEW(Z);
               SEEK(ARCHIVO,BUFFER.NO);
               READ(ARCHIVO,BUFFERNO);
               Z^.DATO := BUFFERNO.DATO;
               Z^.SI := NIL; Z^.NO := NIL;
               RAIZ^.NO:=Z;
          END;
          J:=J+1;
     RECREAR_RAIZ(RAIZ^.SI,J);
     RECREAR_RAIZ(RAIZ^.NO,J);
     END;
END;

VAR BUFFER : REGISTRO;
    J      : INTEGER;
BEGIN
     NEW(RAIZ);
     RESET(ARCHIVO);
     READ(ARCHIVO,BUFFER);
     RAIZ^.DATO := BUFFER.DATO;
     RAIZ^.SI := NIL;
     RAIZ^.NO := NIL;
     J:=0;
     RECREAR_RAIZ(RAIZ,J);
END;

PROCEDURE JUGAR(VAR RAIZ :PUNTERO);
 VAR PUNT      : PUNTERO;
     RESPUESTA : CHAR;
     ANIMAL    : STRING[40];
     ANTERIOR  : PUNTERO;
     PREGUNTA  : STRING[40];
     PUNT_SI   : PUNTERO;
     PUNT_NO   : PUNTERO;
     CONTINUAR : CHAR;
     OP        : CHAR;
 BEGIN
     WRITE('¨SE DESEA RECUPERAR EL JUEGO (S/N)?:  ');
     READLN(OP);
     IF OP = 'N' THEN
        CREAR_ARBOL(RAIZ)
        ELSE IF OP = 'S' THEN RESTAURAR(RAIZ);
     CONTINUAR := 'S';
     WHILE CONTINUAR = 'S' DO
     BEGIN
        CLRSCR;
        WRITELN('PC DICE: PIENSE EN UN ANIMAL.');
        PUNT := RAIZ;
        WHILE PUNT <> NIL DO
        BEGIN
             WRITELN('PC PREGUNTA     : ¨', PUNT^.DATO, '?: ');
             WRITE  ('USUARIO RESPONDE: ');
             READLN(RESPUESTA);
             ANTERIOR := PUNT;
             IF RESPUESTA = 'S'
                THEN PUNT := PUNT^.SI;
             IF RESPUESTA = 'N'
                THEN PUNT := PUNT^.NO;
        END;
        IF RESPUESTA = 'S'
           THEN BEGIN
                   WRITELN('PC DICE: ­HE GANADO!');
                   READLN;
                END;
        IF RESPUESTA = 'N'
           THEN BEGIN
                   WRITELN('PC DICE: ­HE PERDIDO!');
                   WRITELN('PC DICE: ¨CUAL ERA EL ANIMAL?');
                   WRITE('USUARIO RESPONDE: ');
                   READLN(ANIMAL);
                   WRITELN('PC DICE: INGRESE UNA PREGUNTA QUE DIFERENCIA A ',
                            ANIMAL, ' DE ', ANTERIOR^.DATO);
                   WRITE('USUARIO RESPONDE: ');
                   READLN(PREGUNTA);
                   WRITELN('PC DICE: ¨CUAL SERIA LA RESPUESTA A LA PREGUNTA ',
                            PREGUNTA, ' PARA ', ANIMAL, '?');
                   WRITE('USUARIO RESPONDE: ');
                   READLN(RESPUESTA);
                   WRITELN('PC DICE: GRACIAS, AHORA CONOZCO A OTRO ANIMAL.');
                   NEW(PUNT_SI);
                   NEW(PUNT_NO);
                   PUNT_SI^.SI  := NIL;
                   PUNT_SI^.NO  := NIL;
                   PUNT_NO^.SI  := NIL;
                   PUNT_NO^.NO  := NIL;
                   ANTERIOR^.SI := PUNT_SI;
                   ANTERIOR^.NO := PUNT_NO;
                   IF RESPUESTA = 'S'
                      THEN BEGIN
                              PUNT_NO^.DATO := ANTERIOR^.DATO;
                              PUNT_SI^.DATO := ANIMAL
                           END
                      ELSE BEGIN
                              PUNT_SI^.DATO := ANTERIOR^.DATO;
                              PUNT_NO^.DATO := ANIMAL;
                           END;
                   ANTERIOR^.DATO := PREGUNTA;
                END;
                WRITELN('PC PREGUNTA: ¨DESEA CONTINUAR?');
                WRITE('USUARIO RESPONDE: ');
                READLN(CONTINUAR);
     END;
 END;

PROCEDURE LISTAR(RAIZ : PUNTERO);
BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          IF (RAIZ^.SI = NIL) AND (RAIZ^.NO = NIL) THEN
              WRITELN('ANIMAL    ',RAIZ^.DATO)
              ELSE WRITELN('PREGUNTA  ',RAIZ^.DATO);
          LISTAR(RAIZ^.SI);
          LISTAR(RAIZ^.NO)
     END;
END;

PROCEDURE MOSTRAR;
VAR BUFFER : REGISTRO;
BEGIN
     RESET(ARCHIVO);
     WHILE NOT EOF (ARCHIVO) DO
     BEGIN
          READ(ARCHIVO,BUFFER);
          WRITELN(BUFFER.DATO:15,BUFFER.SI:3,BUFFER.NO:3);
     END;
END;

BEGIN
     CLRSCR;
     CREAR_ARCHIVOS;
     OP:=1;
     WHILE OP<>0 DO
     BEGIN
     CLRSCR;
          WRITELN('1- JUGAR');
          WRITELN('2- RESPALDAR EL JUEGO ACTUAL');
          WRITELN('3- RECUPERAR ');
          WRITELN('4- LISTAR');
          WRITELN('0- SALIR');
          WRITE('INGRESE OPCION : ');
          READLN(OP);
          CASE OP OF
               1 : JUGAR(RAIZ);
               2 : RESPALDAR(RAIZ);
               3 : RESTAURAR(RAIZ);
               4 : LISTAR(RAIZ);
          END;
          READLN;
          MOSTRAR;
          READLN;
     END;
     READLN;
END.