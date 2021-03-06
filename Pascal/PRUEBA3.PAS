PROGRAM PRUEBA;
USES CRT;

TYPE  TIPO_ARBOL = ^RAIZ_ARBOL;
      RAIZ_ARBOL =  RECORD
                          DATO     : STRING[30];
                          IZQ, DER : TIPO_ARBOL;
                          VALOR    : INTEGER;
                    END;

VAR   RAIZ : TIPO_ARBOL;
      OP   : BYTE;

PROCEDURE CREAR_ARBOL(VAR RAIZ : TIPO_ARBOL);
VAR P,Q,Z,F,ANT:TIPO_ARBOL;
BEGIN
     NEW(RAIZ);
     RAIZ^.DATO := 'REINO ANIMAL'; RAIZ^.IZQ := NIL; RAIZ^.DER := NIL;
     RAIZ^.VALOR:=0;
     NEW(P);
     P^.DATO := 'VERTEBRADOS'; P^.IZQ:= NIL; P^.DER := NIL;
     P^.VALOR:=-20;
     NEW(Q);
     Q^.DATO := 'INVERTEBRADOS'; Q^.IZQ:= NIL; Q^.DER := NIL;
     Q^.VALOR:=30;
     RAIZ^.IZQ:=P; RAIZ^.DER:=Q;
     Z:=RAIZ;
     Z:=Z^.IZQ;
     {AVES}
     NEW(P);
     P^.DATO := 'AVES'; P^.IZQ:= NIL; P^.DER := NIL; P^.VALOR:=-40;
     NEW(Q);
     Q^.DATO := 'MAMIFEROS'; Q^.IZQ:= NIL; Q^.DER := NIL; Q^.VALOR:=-10;
     Z^.IZQ:=P; Z^.DER:=Q;
     ANT:=Z^.DER;
     Z:=Z^.IZQ;
     NEW(P);
     P^.DATO := 'VUELAN'; P^.IZQ:= NIL; P^.DER := NIL; P^.VALOR:=-50;
     NEW(Q);
     Q^.DATO:='HALCON'; Q^.IZQ:=NIL; Q^.DER:=NIL; Q^.VALOR:=-60;
     NEW(F);
     F^.DATO:='CONDOR'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=-45;
     P^.IZQ:=Q; P^.DER:=F;
     Z^.IZQ:=P;
     NEW(Q);
     Q^.DATO := 'NO VUELAN'; Q^.IZQ:= NIL; Q^.DER := NIL; Q^.VALOR:=-35;
     NEW(P);
     P^.DATO:='PINGUINO'; P^.IZQ:=NIL; P^.DER:=NIL; P^.VALOR:=-38;
     NEW(F);
     F^.DATO:='�ANDU'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=-32;
     Q^.IZQ:=P; Q^.DER:=F;
     Z^.DER:=Q;
     {MAMIFEROS}
     NEW(P);
     P^.DATO := 'TERRESTRES'; P^.IZQ:= NIL; P^.DER := NIL; P^.VALOR:=-12;
     NEW(Q);
     Q^.DATO:='LEON'; Q^.IZQ:=NIL; Q^.DER:=NIL; Q^.VALOR:=-14;
     NEW(F);
     F^.DATO:='CABALLO'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=-11;
     P^.IZQ:=Q; P^.DER:=F;
     ANT^.IZQ:=P;
     NEW(Q);
     Q^.DATO := 'ACUATICOS'; Q^.IZQ:= NIL; Q^.DER := NIL; Q^.VALOR:=-6;
     NEW(P);
     P^.DATO:='BALLENA'; P^.IZQ:=NIL; P^.DER:=NIL; P^.VALOR:=-8;
     NEW(F);
     F^.DATO:='DELFIN'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=-4;
     Q^.IZQ:=P; Q^.DER:=F;
     ANT^.DER:=Q;
     {INVERTEBRADOS}
     Z:=RAIZ;
     Z:=Z^.DER;
     NEW(P);
     P^.DATO := 'ARTROPODOS'; P^.IZQ:= NIL; P^.DER := NIL; P^.VALOR:=20;
     NEW(Q);
     Q^.DATO := 'MOLUSCOS'; Q^.IZQ:= NIL; Q^.DER := NIL; Q^.VALOR:=40;
     Z^.IZQ:=P; Z^.DER:=Q;
     ANT:=Z^.DER;
     Z:=Z^.IZQ;
     NEW(P);
     P^.DATO := 'INSECTOS'; P^.IZQ:= NIL; P^.DER := NIL; P^.VALOR:=15;
     NEW(Q);
     Q^.DATO:='MOSCA'; Q^.IZQ:=NIL; Q^.DER:=NIL; Q^.VALOR:=14;
     NEW(F);
     F^.DATO:='HORMIGA'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=16;
     P^.IZQ:=Q; P^.DER:=F;
     Z^.IZQ:=P;
     NEW(Q);
     Q^.DATO := 'ARACNIDOS'; Q^.IZQ:= NIL; Q^.DER := NIL; Q^.VALOR:=25;
     NEW(P);
     P^.DATO:='ARA�A'; P^.IZQ:=NIL; P^.DER:=NIL; P^.VALOR:=24;
     NEW(F);
     F^.DATO:='ESCORPION'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=26;
     Q^.IZQ:=P; Q^.DER:=F;
     Z^.DER:=Q;
     NEW(P);
     P^.DATO := 'CEFALOPODOS'; P^.IZQ:= NIL; P^.DER := NIL; P^.VALOR:=38;
     NEW(Q);
     Q^.DATO:='PULPO'; Q^.IZQ:=NIL; Q^.DER:=NIL; Q^.VALOR:=37;
     NEW(F);
     F^.DATO:='CALAMAR'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=39;
     P^.IZQ:=Q; P^.DER:=F;
     ANT^.IZQ:=P;
     NEW(Q);
     Q^.DATO := 'BIVALVOS'; Q^.IZQ:= NIL; Q^.DER := NIL; Q^.VALOR:=45;
     NEW(P);
     P^.DATO:='OSTRA'; P^.IZQ:=NIL; P^.DER:=NIL; P^.VALOR:=44;
     NEW(F);
     F^.DATO:='ALMEJA'; F^.IZQ:=NIL; F^.DER:=NIL; F^.VALOR:=46;
     Q^.IZQ:=P; Q^.DER:=F;
     ANT^.DER:=Q;
END;

PROCEDURE BUSCAR_ANIMAL_IZQ(RAIZ:TIPO_ARBOL; VAR COMPARAR:INTEGER; ANIMAL:STRING;VAR EXISTE:INTEGER);
VAR P:TIPO_ARBOL;
BEGIN
     IF (RAIZ <> NIL) AND (EXISTE<>1) THEN
     BEGIN
          IF (ANIMAL = RAIZ^.DATO) AND (RAIZ^.IZQ = NIL) THEN
          BEGIN
             EXISTE := 1;
             COMPARAR:=RAIZ^.VALOR;
          END;
          BUSCAR_ANIMAL_IZQ(RAIZ^.IZQ,COMPARAR,ANIMAL,EXISTE);
          BUSCAR_ANIMAL_IZQ(RAIZ^.DER,COMPARAR,ANIMAL,EXISTE);
     END;
END;

PROCEDURE BUSCAR_ANIMAL_DER(RAIZ:TIPO_ARBOL; VAR COMPARAR:INTEGER; ANIMAL:STRING; VAR EXISTE:INTEGER);
VAR P:TIPO_ARBOL;
BEGIN
     IF (RAIZ <> NIL) THEN
     BEGIN
          IF (ANIMAL = RAIZ^.DATO) AND (RAIZ^.DER = NIL) THEN
          BEGIN
             EXISTE := 1;
             COMPARAR:=RAIZ^.VALOR;
          END;
          BUSCAR_ANIMAL_DER(RAIZ^.IZQ,COMPARAR,ANIMAL,EXISTE);
          BUSCAR_ANIMAL_DER(RAIZ^.DER,COMPARAR,ANIMAL,EXISTE);
     END;
END;

PROCEDURE RECORRER(RAIZ:TIPO_ARBOL; COMPARAR:INTEGER);
VAR P:TIPO_ARBOL;
BEGIN
     P:=RAIZ;
     WHILE (P <> NIL) DO
     BEGIN
          WRITELN(P^.DATO);
          IF COMPARAR < P^.VALOR THEN
             P:=P^.IZQ
             ELSE P:=P^.DER;
     END;
END;

PROCEDURE CONOCER_CLASIFICACION(RAIZ:TIPO_ARBOL);
VAR ANIMAL:STRING[30]; EXISTE,COMPARAR:INTEGER;
BEGIN
     EXISTE := 0;
     WRITE('INGRESE UN ANIMAL: ');
     READLN(ANIMAL);
     BUSCAR_ANIMAL_IZQ(RAIZ^.IZQ,COMPARAR,ANIMAL,EXISTE);
     IF EXISTE = 0 THEN
        BUSCAR_ANIMAL_DER(RAIZ^.DER,COMPARAR,ANIMAL,EXISTE);
     IF EXISTE = 0 THEN
        WRITELN('ERROR, NO EXISTE EL ANIMAL BUSCADO O NO INGRESO UN ANIMAL');
     IF EXISTE <> 0 THEN
        RECORRER(RAIZ,COMPARAR);
     READLN;
END;

PROCEDURE ENCONTRAR_NOMBRE(RAIZ:TIPO_ARBOL; NOMBRE:STRING; VAR ENCONTRADO:TIPO_ARBOL);
BEGIN
     IF (RAIZ<>NIL) THEN
     BEGIN
          IF RAIZ^.DATO = NOMBRE THEN
             ENCONTRADO:=RAIZ;
          IF ENCONTRADO^.DER = NIL THEN
             ENCONTRADO:=NIL;
          ENCONTRAR_NOMBRE(RAIZ^.IZQ,NOMBRE,ENCONTRADO);
          ENCONTRAR_NOMBRE(RAIZ^.DER,NOMBRE,ENCONTRADO);
     END;
END;

PROCEDURE LISTAR_ANIMALES(ENCONTRADO:TIPO_ARBOL);
BEGIN
     IF ENCONTRADO <> NIL THEN
     BEGIN
          IF ENCONTRADO^.DER = NIL THEN
             WRITELN(ENCONTRADO^.DATO);
          LISTAR_ANIMALES(ENCONTRADO^.IZQ);
          LISTAR_ANIMALES(ENCONTRADO^.DER);
     END;
END;

PROCEDURE CONOCER_ANIMALES_DE_UNA_CLASE(RAIZ:TIPO_ARBOL);
VAR NOMBRE:STRING[30];
    ENCONTRADO:TIPO_ARBOL;
BEGIN
     ENCONTRADO:=NIL;
     WRITELN('INGRESAR NOMBRE DE CLASE, SUB-CLASE O TIPO: ');
     READLN(NOMBRE);
     ENCONTRAR_NOMBRE(RAIZ,NOMBRE,ENCONTRADO);
     LISTAR_ANIMALES(ENCONTRADO);
     IF (ENCONTRADO = NIL) THEN
        WRITELN('ERROR, NO EXISTE LA CLASE, SUB-CLASE O TIPO BUSCADO');
     READLN;
END;

BEGIN
     CLRSCR;
     CREAR_ARBOL(RAIZ);
     OP := 0;
     WHILE OP <> 3 DO
     BEGIN
     CLRSCR;
          WRITELN('1- CONOCER CLASIFICACION');
          WRITELN('2- CONOCER ANIMALES');
          WRITELN('3- SALIR');
          WRITELN;
          WRITE('INGRESE OPCION : ');
          READLN(OP);
          CASE OP OF
               1 : CONOCER_CLASIFICACION(RAIZ);
               2 : CONOCER_ANIMALES_DE_UNA_CLASE(RAIZ);
          END;
     END;
     READLN;
END.