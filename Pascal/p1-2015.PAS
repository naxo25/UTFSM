PROGRAM PRUEBA1;
USES CRT;

TYPE ST20 = STRING[20];

     PUNTPERSONA = ^PERSONA;
     PERSONA = RECORD
             ROL : INTEGER;
             NOMBRE : ST20;
             EDAD : BYTE;
             SEXO : CHAR;
             IGUALPAIS : PUNTPERSONA;
             IZQ,DER : PUNTPERSONA;
     END;

     PUNTPAIS = ^PAIS;
     PAIS = RECORD
          NOMBREPAIS : ST20;
          PRIPERSONA : PUNTPERSONA;
          NEXT : PUNTPAIS;
     END;

VAR RAIZ : PUNTPERSONA; BASE : PUNTPAIS;

PROCEDURE VALIDAR_SEXO( VAR CARACTER : CHAR );
BEGIN

     READLN(CARACTER);
     WHILE (CARACTER <> 'M') AND (CARACTER <> 'F') DO
     BEGIN
          WRITE('REINGRESE SEXO, SOLO "M" O "F" : ');
          READLN(CARACTER)
     END;

END;

PROCEDURE CREAR_RAIZ( VAR RAIZ,Q,PANT : PUNTPERSONA );
BEGIN
     IF RAIZ = NIL THEN
        RAIZ := Q
        ELSE
            IF Q^.ROL < PANT^.ROL THEN
               PANT^.IZQ := Q
               ELSE PANT^.DER := Q;
END;

PROCEDURE AGREGAR ( VAR RAIZ : PUNTPERSONA; VAR BASE : PUNTPAIS );
VAR Q,P,PANT,X,XANT : PUNTPERSONA; PAIS : ST20;
    Z,ZANT,C : PUNTPAIS; CARACTER : CHAR;
BEGIN

     NEW(Q);
     Q^.IGUALPAIS := NIL; Q^.IZQ := NIL; Q^.DER := NIL;
     WRITE('Rol : '); READLN(Q^.ROL);
     P := RAIZ;
     WHILE (P <> NIL) AND (P^.ROL <> Q^.ROL) DO
     BEGIN
           PANT := P;
           IF Q^.ROL < P^.ROL THEN
              P := P^.IZQ
              ELSE P := P^.DER;
     END;

     IF P <> NIL THEN
        WRITELN('Rol ya existente')
        ELSE
          BEGIN
            WRITE('Nombre : '); READLN(Q^.NOMBRE);
            WRITE('Edad : '); READLN(Q^.EDAD);
            WRITE('Sexo : '); VALIDAR_SEXO(CARACTER); Q^.SEXO := CARACTER;
            WRITE('Nacionalidad : '); READLN(PAIS);
            Z := BASE;
            WHILE (Z <> NIL) AND (PAIS <> Z^.NOMBREPAIS) DO
            BEGIN
                  ZANT := Z;
                  Z := Z^.NEXT;
            END;
            {PAIS EXISTENTE}
            IF Z <> NIL THEN
            BEGIN
                 X := Z^.PRIPERSONA;
                 WHILE X <> NIL DO
                 BEGIN
                      XANT := X;
                      X := X^.IGUALPAIS;
                 END;
                 IF Z^.PRIPERSONA = NIL THEN
                    Z^.PRIPERSONA := Q
                    ELSE XANT^.IGUALPAIS := Q;
                 CREAR_RAIZ(RAIZ,Q,PANT)
            END
              ELSE {PAIS NO EXISTE}
                BEGIN
                     NEW(C);
                     C^.NOMBREPAIS := PAIS;
                     C^.PRIPERSONA := Q;
                     C^.NEXT := NIL;
                     IF BASE = NIL THEN
                        BASE := C
                        ELSE ZANT^.NEXT := C;
                     CREAR_RAIZ(RAIZ,Q,PANT);
                END;
     END;
END;

PROCEDURE CONSULTAR ( RAIZ : PUNTPERSONA; BASE : PUNTPAIS );
VAR P,X : PUNTPERSONA; Z : PUNTPAIS; ROLSITO : INTEGER;
BEGIN

     IF RAIZ = NIL THEN
        WRITELN('NO HAY GENTE');
     IF RAIZ <> NIL THEN
     BEGIN
          WRITE('Rol : '); READLN(ROLSITO);
          P := RAIZ;
          WHILE (P <> NIL) AND (P^.ROL <> ROLSITO) DO
          BEGIN
               IF ROLSITO < P^.ROL THEN
                  P := P^.IZQ
                  ELSE P := P^.DER;
          END;
          IF P = NIL THEN
             WRITELN('ROL INEXISTENTE')
             ELSE
                 Z := BASE;
                 WHILE (Z <> NIL) DO
                 BEGIN
                      X := Z^.PRIPERSONA;
                      WHILE X <> NIL DO
                      BEGIN
                           IF X^.ROL = ROLSITO THEN
                           BEGIN
                                WRITELN(X^.ROL,' ',X^.NOMBRE,' ',X^.SEXO,' ',Z^.NOMBREPAIS);
                           END;
                           X := X^.IGUALPAIS;
                      END;
                      Z := Z^.NEXT;
                 END;
     END;

END;

PROCEDURE LISTAR ( BASE : PUNTPAIS );
VAR CARACTER : CHAR; X:PUNTPAIS; Z : PUNTPERSONA;
BEGIN

     WRITE('Por cual genero desea listar : ');
     VALIDAR_SEXO(CARACTER);
     X := BASE;
     WHILE X <> NIL DO
     BEGIN
          Z := X^.PRIPERSONA;
          WHILE Z <> NIL DO
          BEGIN
               IF Z^.SEXO = CARACTER THEN
                  WRITELN(Z^.NOMBRE,' ',Z^.EDAD,' ',X^.NOMBREPAIS);
               Z := Z^.IGUALPAIS;
          END;
     X := X^.NEXT;
     END;

END;

PROCEDURE MENU;
VAR OP : BYTE;
BEGIN

     REPEAT
           WRITELN('0 SALIR');
           WRITELN('1 AGREGAR');
           WRITELN('2 CONSULTAR POR ROL');
           WRITELN('3 LISTAR POR SEXO');
           WRITELN;
           WRITE('OPCION : '); READLN(OP);
           CASE OP OF
                1 : AGREGAR(RAIZ,BASE);
                2 : CONSULTAR(RAIZ,BASE);
                3 : LISTAR(BASE);
           END;
      READLN;
      CLRSCR;
     UNTIL OP = 0;

END;

PROCEDURE CREAR_BASES ( VAR BASE : PUNTPAIS; VAR RAIZ : PUNTPERSONA );
BEGIN

END;

BEGIN
     CLRSCR;
     NEW(RAIZ); NEW(BASE);
     RAIZ := NIL; BASE := NIL;
     MENU;
END.