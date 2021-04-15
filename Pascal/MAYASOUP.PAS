
PROGRAM SOUP;
USES CRT;
VAR          MATRIZ : ARRAY[1..15,1..20] OF CHAR;
            MATRIZ2 : ARRAY[1..15,1..20] OF CHAR;
               SOPA : TEXT;
             BUFFER : STRING;
FILA,COLUMNA,PAISES : BYTE;
            FIL,COL : BYTE;
               PAIS : STRING;
    JUGADAS,PUNTERO : BYTE;
                  I : INTEGER;

PROCEDURE SEGUNDALETRA;
VAR SUBPAIS,SIGUIENTE,CANTIDAD,SGTE: BYTE;

BEGIN
        {HACIA LA DERECHA}
        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA,COLUMNA+SIGUIENTE]) AND (SUBPAIS <= LENGTH(PAIS)) AND (COLUMNA + SIGUIENTE <= 20) DO
           BEGIN
              GOTOXY(COLUMNA + SIGUIENTE,FILA) ;
              FIL:= FILA;
              COL:= COLUMNA + SIGUIENTE;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA + SIGUIENTE,FILA) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;

           END;


        SUBPAIS:= SUBPAIS -1 ;
        SIGUIENTE:= SIGUIENTE -1 ;
        CANTIDAD:= 1 ;

        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA;
                                              COL:= COLUMNA + SIGUIENTE;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA + SIGUIENTE,FILA);
                                              GOTOXY(COL,FIL);
                                              MATRIZ2[FIL,COL]:= '+';
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SIGUIENTE:= SIGUIENTE -1;
                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;

        {HACIA ARRIBA}
        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA - SIGUIENTE,COLUMNA]) AND (SUBPAIS <= LENGTH(PAIS)) AND (FILA - SIGUIENTE >= 1) DO
           BEGIN
              GOTOXY(COLUMNA,FILA - SIGUIENTE) ;
              FIL:= FILA - SIGUIENTE;
              COL:= COLUMNA;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA,FILA - SIGUIENTE) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;

           END;

        SUBPAIS:= SUBPAIS - 1 ;
        SIGUIENTE:= SIGUIENTE - 1 ;
        CANTIDAD:= 1 ;


        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA - SIGUIENTE;
                                              COL:= COLUMNA;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA,FILA - SIGUIENTE);
                                              MATRIZ2[FIL,COL]:= '+';
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SIGUIENTE:= SIGUIENTE - 1;
                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;
        {HACIA ABAJO}
        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA + SIGUIENTE,COLUMNA]) AND (SUBPAIS <= LENGTH(PAIS)) AND (FILA + SIGUIENTE <= 15) DO
           BEGIN
              GOTOXY(COLUMNA,FILA + SIGUIENTE) ;
              FIL:= FILA + SIGUIENTE;
              COL:= COLUMNA;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA,FILA + SIGUIENTE) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;

           END;

        SUBPAIS:= SUBPAIS -1 ;
        SIGUIENTE:= SIGUIENTE -1 ;
        CANTIDAD:= 1 ;


        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA + SIGUIENTE;
                                              COL:= COLUMNA;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA,FILA + SIGUIENTE);
                                              MATRIZ2[FIL,COL]:='+';
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SIGUIENTE:= SIGUIENTE -1;
                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;
        {HACIA IZQUIERDA}
        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA,COLUMNA - SIGUIENTE]) AND (SUBPAIS <= LENGTH(PAIS)) AND (COLUMNA-SIGUIENTE >= 1) DO
           BEGIN
              GOTOXY(COLUMNA - SIGUIENTE,FILA) ;
              FIL:= FILA;
              COL:= COLUMNA - SIGUIENTE;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA - SIGUIENTE,FILA) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;

           END;

        SUBPAIS:= SUBPAIS -1 ;
        SIGUIENTE:= SIGUIENTE -1 ;
        CANTIDAD:= 1 ;


        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA;
                                              COL:= COLUMNA - SIGUIENTE;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA - SIGUIENTE,FILA);
                                              MATRIZ2[FIL,COL]:= '+' ;
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SIGUIENTE:= SIGUIENTE - 1;
                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;
        {DIAGONAL DERECHA ARRIBA}

        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        SGTE:=1;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA - SIGUIENTE,COLUMNA + SGTE]) AND
              (SUBPAIS<= LENGTH(PAIS)) AND
              (FILA-SIGUIENTE>= 1) AND
              (COLUMNA + SGTE <= 20) DO
           BEGIN
              GOTOXY(COLUMNA + SGTE,FILA - SIGUIENTE) ;
              FIL:= FILA - SIGUIENTE;
              COL:= COLUMNA + SGTE;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA + SGTE,FILA - SIGUIENTE) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;
              SGTE:= SGTE + 1;

           END;

        SUBPAIS:= SUBPAIS -1 ;
        SIGUIENTE:= SIGUIENTE -1 ;
        SGTE := SGTE -1 ;
        CANTIDAD:= 1 ;


        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA - SIGUIENTE;
                                              COL:= COLUMNA + SGTE;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA+SGTE,FILA-SIGUIENTE);
                                              MATRIZ2[FIL,COL]:= '+';
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SIGUIENTE:= SIGUIENTE - 1;
                                              SGTE:= SGTE - 1;
                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;


        {DIAGONAL IZQUIERDA ARRIBA}
        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        SGTE:=1;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA - SIGUIENTE,COLUMNA - SGTE]) AND
              (SUBPAIS<= LENGTH(PAIS)) AND
              (FILA-SIGUIENTE>= 1) AND
              (COLUMNA - SGTE >= 1) DO
           BEGIN
              GOTOXY(COLUMNA - SGTE,FILA - SIGUIENTE) ;
              FIL:= FILA - SIGUIENTE;
              COL:= COLUMNA - SGTE;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA - SGTE,FILA - SIGUIENTE) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;
              SGTE:= SGTE + 1;
           END;

        SUBPAIS:= SUBPAIS -1 ;
        SIGUIENTE:= SIGUIENTE -1 ;
        SGTE := SGTE -1 ;
        CANTIDAD:= 1 ;


        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA - SIGUIENTE;
                                              COL:= COLUMNA - SGTE;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA-SGTE,FILA-SIGUIENTE);
                                              MATRIZ2[FIL,COL]:= '+';
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SIGUIENTE:= SIGUIENTE - 1;
                                              SGTE:= SGTE - 1;
                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;

        {DIAGONAL DERECHA ABAJO}
        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        SGTE:=1;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA + SIGUIENTE,COLUMNA + SGTE]) AND
              (SUBPAIS<= LENGTH(PAIS)) AND
              (FILA + SIGUIENTE <= 15) AND
              (COLUMNA + SGTE <= 20) DO
           BEGIN
              GOTOXY(COLUMNA + SGTE,FILA + SIGUIENTE) ;
              FIL:= FILA + SIGUIENTE;
              COL:= COLUMNA + SGTE;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA + SGTE,FILA + SIGUIENTE) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;
              SGTE:= SGTE + 1;
           END;

        SUBPAIS:= SUBPAIS -1 ;
        SIGUIENTE:= SIGUIENTE -1 ;
        SGTE := SGTE -1 ;
        CANTIDAD:= 1 ;


        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA + SIGUIENTE;
                                              COL:= COLUMNA + SGTE;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA+SGTE,FILA+SIGUIENTE);
                                              MATRIZ2[FIL,COL]:= '+';
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SIGUIENTE:= SIGUIENTE - 1;
                                              SGTE:= SGTE - 1;
                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;

        {DIAGONAL IZQUIERDA ABAJO}
        SUBPAIS:=2 ;
        SIGUIENTE:=1 ;
        SGTE:=1;
        WHILE (PAIS[SUBPAIS] = MATRIZ[FILA + SIGUIENTE,COLUMNA - SGTE]) AND
              (SUBPAIS<= LENGTH(PAIS)) AND
              (FILA + SIGUIENTE <= 15) AND
              (COLUMNA - SGTE >= 1) DO
           BEGIN
              GOTOXY(COLUMNA - SGTE,FILA + SIGUIENTE) ;
              FIL:= COLUMNA - SGTE;
              COL:= FILA + SIGUIENTE;
              IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                TEXTCOLOR(YELLOW);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                GOTOXY(COLUMNA - SGTE,FILA + SIGUIENTE) ;
                                                TEXTCOLOR(WHITE);
                                                WRITE(PAIS[SUBPAIS]);
                                                DELAY(200);
                                                END;
              SUBPAIS:= SUBPAIS + 1;
              SIGUIENTE:= SIGUIENTE + 1;
              SGTE:= SGTE + 1;
           END;

        SUBPAIS:= SUBPAIS -1 ;
        SIGUIENTE:= SIGUIENTE -1 ;
        SGTE := SGTE -1 ;
        CANTIDAD:= 1 ;

        IF SUBPAIS = LENGTH(PAIS) THEN
           WHILE CANTIDAD<= LENGTH(PAIS) DO BEGIN
                                              FIL:= FILA + SIGUIENTE;
                                              COL:= COLUMNA - SGTE;
                                              CANTIDAD:= CANTIDAD + 1 ;
                                              GOTOXY(COLUMNA - SGTE, FILA + SIGUIENTE) ;
                                              MATRIZ2[FIL,COL]:= '+';
                                              TEXTCOLOR(RED);
                                              WRITE(PAIS[SUBPAIS]);
                                              SUBPAIS:= SUBPAIS - 1;
                                              SGTE:= SGTE - 1;
                                              SIGUIENTE:= SIGUIENTE - 1;

                                              TEXTCOLOR(WHITE);
                                              DELAY(250);
                                            END;
END;

PROCEDURE BUSCAR;
   BEGIN
        FOR FILA:=1 TO 15 DO
            BEGIN
                 FOR COLUMNA:=1 TO 20 DO

                     IF (PAIS[1] = MATRIZ[FILA,COLUMNA]) THEN
                        BEGIN
                          GOTOXY(COLUMNA,FILA) ;
                          FIL := FILA;
                          COL := COLUMNA;
                          IF (MATRIZ2[FIL,COL] <> '+') THEN BEGIN
                                                            TEXTCOLOR(YELLOW);
                                                            WRITE(PAIS[1]);
                                                            DELAY(100);
                                                            GOTOXY(COLUMNA,FILA) ;
                                                            TEXTCOLOR(WHITE);
                                                            WRITE(PAIS[1]);
                                                            DELAY(100);
                                                            END;
                          SEGUNDALETRA;
                        END;
            END;
   END;



BEGIN
     CLRSCR;
     ASSIGN(SOPA,'SOPA.TXT');
     RESET(SOPA);
     FILA:= 1;

     WHILE NOT EOF(SOPA) DO BEGIN
                              READLN(SOPA,BUFFER);
                              FOR COLUMNA:= 1 TO 20 DO MATRIZ[FILA,COLUMNA] :=BUFFER[COLUMNA];
                              FILA:= FILA + 1;
                            END;
     FOR FILA:=1 TO 15 DO
       BEGIN
         FOR COLUMNA:=1 TO 20 DO BEGIN
                                   TEXTCOLOR(WHITE);
                                   WRITE(MATRIZ[FILA,COLUMNA]);
                                 END;
         WRITELN;
       END;
       WRITELN;

     {MATRIZ EXTERNA PARA RESGUARDAR LOS PAISES YA ENCONTRADOS}

     FOR FIL:=1 TO 15 DO
       BEGIN
         FOR COL:=1 TO 20 DO MATRIZ2[FIL,COL]:= '*' ;
       END;


     JUGADAS:= 0;

     PUNTERO:= 7;
     GOTOXY(35,3); WRITE('¨CUANTAS PALABRAS DESEA BUSCAR ? = ');
     GOTOXY(35,4); TEXTCOLOR(YELLOW); WRITE('Se sugiere buscar paises de Sudamerica');
     GOTOXY(70,3); TEXTCOLOR(WHITE);  READLN(PAISES);
     REPEAT
       GOTOXY(35,PUNTERO);
       WRITE('INGRESE PALABRA : ');
       READLN(PAIS);
       FOR I := 1 TO LENGTH(PAIS) DO PAIS[I] := UPCASE(PAIS[I]) ;
       JUGADAS:= JUGADAS + 1;
       BUSCAR;

       PUNTERO:=PUNTERO +1;


     UNTIL JUGADAS = PAISES ;
     GOTOXY(35,PUNTERO);

     READLN;
     CLOSE(SOPA);

END.
