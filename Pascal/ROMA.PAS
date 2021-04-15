PROGRAM ROMITA;
USES CRT;
TYPE TIPO_PUNTERO = ^TIPO_NODO;
     TIPO_NODO    = RECORD
                         PUEBLO    : STRING[30];
                         DISTANCIA : INTEGER;
                         SIGUIENTE : TIPO_PUNTERO;
                    END;
     TIPO_PUEBLOS = RECORD
                         CAMINO    : BYTE;
                         PUEBLO    : STRING[30];
                         DISTANCIA : INTEGER;
                    END;
     TIPO_ROMA    = ARRAY[1..5] OF TIPO_PUNTERO;

VAR  ARCHIVO : FILE OF TIPO_PUEBLOS;
     BUFFER  : TIPO_PUEBLOS;
     ROMA    : TIPO_ROMA;
     PUNT    : BYTE;
     PUNTERO : TIPO_PUNTERO;
     AUX     : TIPO_PUNTERO;
{-------------------------------------------------------------------------}
PROCEDURE MOSTRAR_LISTAS(VECTOR : TIPO_ROMA);
VAR PUNT    : BYTE;
    PUNTERO : TIPO_PUNTERO;
    MAYOR_KM: INTEGER;
    MAYOR_CM: BYTE;
    SUMA    : INTEGER;
BEGIN
    CLRSCR;
    MAYOR_KM := 0;
    FOR PUNT := 1 TO 5 DO
    BEGIN
        WRITELN('CAMINO ', PUNT,' ');
        PUNTERO := VECTOR[PUNT];
        SUMA    := 0;
        WHILE PUNTERO <> NIL DO
        BEGIN
            SUMA := SUMA + PUNTERO^.DISTANCIA;
            WRITE('(',PUNTERO^.DISTANCIA: 3,' ',PUNTERO^.PUEBLO: 8,')');
            PUNTERO := PUNTERO^.SIGUIENTE;
        END;
        IF SUMA > MAYOR_KM
           THEN BEGIN
                    MAYOR_KM := SUMA;
                    MAYOR_CM := PUNT;
                END;
        WRITELN;
    END;
    WRITELN('EL CAMINO MµS EXTENSO DESDE ROMA AL ÈLTIMO PUEBLO ES: ', MAYOR_CM);
    READLN;
END;
{-------------------------------------------------------------------------}
BEGIN
    CLRSCR;
    FOR PUNT := 1 TO 5 DO
        ROMA[PUNT] := NIL;

    ASSIGN(ARCHIVO, 'PUEBLOS.DAT');
    RESET(ARCHIVO);
    WHILE NOT EOF(ARCHIVO) DO
    BEGIN
        READ(ARCHIVO, BUFFER);
        NEW(PUNTERO);
        PUNTERO^.PUEBLO    := BUFFER.PUEBLO;
        PUNTERO^.DISTANCIA := BUFFER.DISTANCIA;
        PUNTERO^.SIGUIENTE := NIL;
        IF ROMA[BUFFER.CAMINO] = NIL
           THEN ROMA[BUFFER.CAMINO] := PUNTERO
           ELSE BEGIN
                    AUX := ROMA[BUFFER.CAMINO];
                    WHILE AUX^.SIGUIENTE <> NIL DO
                          AUX := AUX^.SIGUIENTE;
                    AUX^.SIGUIENTE := PUNTERO;
                END;
    END;
    CLOSE(ARCHIVO);
    MOSTRAR_LISTAS(ROMA);
END.