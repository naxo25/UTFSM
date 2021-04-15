PROGRAM AJEDREZ;
USES CRT;
TYPE TIPO_TABLERO    = ARRAY[1..8,1..8] OF STRING[2];
     TIPO_PIEZA      = RECORD
                          CODIGO : STRING[2];
                          NOMBRE : STRING[20];
                       END;
     TIPO_ARR_PIEZAS = ARRAY[1..6] OF TIPO_PIEZA;
     ST2             = STRING[2];
VAR  TABLERO         : TIPO_TABLERO;
     PIEZAS          : TIPO_ARR_PIEZAS;

PROCEDURE LLENAR_ARREGLO_PIEZAS(VAR VECTOR: TIPO_ARR_PIEZAS);
BEGIN
   VECTOR[1].CODIGO := 'PN'; VECTOR[1].NOMBRE := 'PEON NEGRO';
   VECTOR[2].CODIGO := 'AN'; VECTOR[2].NOMBRE := 'ALFIL NEGRO';
   VECTOR[3].CODIGO := 'TN'; VECTOR[3].NOMBRE := 'TORRE NEGRA';
   VECTOR[4].CODIGO := 'CN'; VECTOR[4].NOMBRE := 'CABALLO NEGRO';
   VECTOR[5].CODIGO := 'RN'; VECTOR[5].NOMBRE := 'REINA NEGRA';
   VECTOR[6].CODIGO := 'XN'; VECTOR[6].NOMBRE := 'REY NEGRO';
END;

FUNCTION VALOR_PIEZA(CODIGO: ST2; PIEZAS: TIPO_ARR_PIEZAS): BYTE;
VAR POSICION, PUNT : BYTE;
BEGIN
   POSICION := 0;
   FOR PUNT := 1 TO 6 DO
      IF PIEZAS[PUNT].CODIGO = CODIGO
         THEN POSICION := PUNT;
   VALOR_PIEZA := POSICION;
END;

PROCEDURE LIMPIAR_TABLERO(VAR TAB : TIPO_TABLERO);
VAR FIL, COL: BYTE;
BEGIN
   FOR FIL := 1 TO 8 DO
       FOR COL := 1 TO 8 DO
             TAB[FIL,COL] := '';
END;

PROCEDURE UBICAR_PIEZAS_NEGRAS(VAR TAB : TIPO_TABLERO);
VAR CONT : BYTE;
BEGIN
   RANDOMIZE;
   FOR CONT := 1 TO 4 DO
   BEGIN
        TAB[RANDOM(8) + 1,RANDOM(8) + 1] := 'PN';
        TAB[RANDOM(8) + 1,RANDOM(8) + 1] := 'AN';
        TAB[RANDOM(8) + 1,RANDOM(8) + 1] := 'TN';
        TAB[RANDOM(8) + 1,RANDOM(8) + 1] := 'CN';
   END;
   TAB[RANDOM(8) + 1,RANDOM(8) + 1] := 'RN';
   TAB[RANDOM(8) + 1,RANDOM(8) + 1] := 'XN';
END;

PROCEDURE MOSTRAR_TABLERO(MAT : TIPO_TABLERO);
VAR FIL, COL: BYTE;
BEGIN
    CLRSCR;
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');
    writeln('°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ°°°°ÛÛÛÛ');

    FOR FIL := 1 TO 8 DO
        FOR COL := 1 TO 8 DO
        BEGIN
           IF MAT[FIL,COL] = 'CB'
              THEN TEXTCOLOR(YELLOW+BLINK)

              ELSE TEXTCOLOR(WHITE);
           GOTOXY(COL * 4 - 2, FIL * 3 - 1);
           WRITE(MAT[FIL,COL]);
        END;
        READLN;
END;

PROCEDURE UBICAR_CABALLO_BLANCO(VAR TAB : TIPO_TABLERO);
BEGIN
   TAB[RANDOM(8) + 1, RANDOM(8) + 1] := 'CB';
END;

PROCEDURE MOSTRAR_RESULTADO(MAT : TIPO_TABLERO);
VAR FIL, COL, VALOR, MAYOR : BYTE;
BEGIN
   MAYOR := 0;
   FOR FIL := 1 TO 8 DO
       FOR COL := 1 TO 8 DO
           IF MAT[FIL,COL] = 'CB'
              THEN BEGIN
                      IF (FIL - 2 >= 1) AND (COL + 1 <= 8)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL - 2,COL + 1], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      IF (FIL - 1 >= 1) AND (COL + 2 <= 8)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL - 1,COL + 2], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      IF (FIL + 1 <= 8) AND (COL + 2 <= 8)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL + 1,COL + 2], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      IF (FIL + 2 <= 8) AND (COL + 1 <= 8)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL + 2,COL + 1], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      IF (FIL + 2 <= 8) AND (COL - 1 >= 1)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL + 2,COL - 1], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      IF (FIL - 2 >= 1) AND (COL + 1 <= 8)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL - 2,COL + 1], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      IF (FIL - 1 >= 1) AND (COL - 2 >= 1)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL - 1,COL - 2], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      IF (FIL - 1 >= 1) AND (COL - 2 >= 1)
                         THEN BEGIN
                                  VALOR := VALOR_PIEZA(MAT[FIL + 2,COL - 1], PIEZAS);
                                  IF VALOR > MAYOR THEN MAYOR := VALOR;
                              END;
                      GOTOXY(40,5);
                      IF MAYOR = 0
                         THEN WRITE('NO HAY PIEZA PARA COMER')
                         ELSE WRITE('LA MEJOR PIEZA ES ', PIEZAS[MAYOR].NOMBRE);
                      READLN;
                   END
END;

BEGIN
    LLENAR_ARREGLO_PIEZAS(PIEZAS);
    LIMPIAR_TABLERO(TABLERO);
    UBICAR_PIEZAS_NEGRAS(TABLERO);
    UBICAR_CABALLO_BLANCO(TABLERO);
    MOSTRAR_TABLERO(TABLERO);
    MOSTRAR_RESULTADO(TABLERO);
END.







