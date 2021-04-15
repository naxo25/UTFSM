PROGRAM ALGO;
USES CRT;

TYPE  TIPO_ARBOL = ^ARBOL;
      ARBOL      = RECORD
                   NUMERO  : INTEGER;
                   IZQ,DER : TIPO_ARBOL;
      END;

VAR  RAIZ:TIPO_ARBOL;

PROCEDURE CREAR(VAR RAIZ:TIPO_ARBOL);
VAR P,ANT,Q:TIPO_ARBOL;
    NUMERO:INTEGER;
    SEGUIR:CHAR;
BEGIN
     WHILE SEGUIR <> 'N' DO
     BEGIN
          WRITE('NUMERO : ');
          READLN(NUMERO);
          NEW(Q);
          Q^.NUMERO:=NUMERO;
          Q^.DER:=NIL; Q^.IZQ:=NIL;
          IF RAIZ = NIL THEN
             RAIZ := Q
             ELSE
                 BEGIN
                 P:=RAIZ;
                 WHILE P <> NIL DO
                 BEGIN
                      ANT:=P;
                      IF NUMERO < P^.NUMERO THEN
                         P:=P^.IZQ
                         ELSE P:=P^.DER;
                 END;
                 IF NUMERO < ANT^.NUMERO THEN
                      ANT^.IZQ:=Q
                      ELSE ANT^.DER:=Q;
                 END;
          WRITE('DESEA SEGUIR : ');
          READLN(SEGUIR);
     END;
END;

PROCEDURE MOSTRAR_PRE(RAIZ:TIPO_ARBOL);
BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          WRITE(RAIZ^.NUMERO,'  ');
          MOSTRAR_PRE(RAIZ^.IZQ);
          MOSTRAR_PRE(RAIZ^.DER);
     END;
END;

PROCEDURE MOSTRAR_IN(RAIZ:TIPO_ARBOL);
BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          MOSTRAR_IN(RAIZ^.IZQ);
          WRITE(RAIZ^.NUMERO,'  ');
          MOSTRAR_IN(RAIZ^.DER);
     END;
END;

PROCEDURE MOSTRAR_POST(RAIZ:TIPO_ARBOL);
BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          MOSTRAR_POST(RAIZ^.IZQ);
          MOSTRAR_POST(RAIZ^.DER);
          WRITE(RAIZ^.NUMERO,'  ');
     END;
END;

PROCEDURE MOSTRAR_INVERTIDO(RAIZ:TIPO_ARBOL);
{NO ENTRA PERO PARA QUE LO VEAN}
BEGIN
     IF RAIZ <> NIL THEN
     BEGIN
          MOSTRAR_POST(RAIZ^.DER);
          WRITE(RAIZ^.NUMERO,'  ');
          MOSTRAR_POST(RAIZ^.IZQ);
     END;
END;

BEGIN
     CLRSCR;
     RAIZ:=NIL;
     CREAR(RAIZ);
     CLRSCR;
     WRITELN('ORDEN PRE ORDEN');
     MOSTRAR_PRE(RAIZ);
     READLN;
     WRITELN('ORDEN IN ORDEN');
     MOSTRAR_IN(RAIZ);
     READLN;
     WRITELN('ORDEN POST ORDEN');
     MOSTRAR_POST(RAIZ);
     READLN;
     WRITELN('ORDEN ORDEN INVERTIDO por la derecha');
     MOSTRAR_INVERTIDO(RAIZ);
     READLN;
END.