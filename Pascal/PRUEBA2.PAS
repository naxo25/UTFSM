PROGRAM PRUEBA;
USES CRT;

TYPE  TIPO_T_PRODUCTOS = RECORD
                             ID_TIPO_PRODUCTO : STRING[7];
                             NOMBRE           : STRING[20];
                             ACTIVO           : STRING[2];
                       END;

      TIPO_MARCAS = RECORD
                          ID_MARCA : BYTE;
                          NOMBRE   : STRING[20];
                          ACTIVO   : STRING[2];
                    END;

      TIPO_PRODUCTOS = RECORD
                             ID_PRODUCTO      : STRING[7];
                             NOMBRE           : STRING[50];
                             ID_MARCA         : BYTE;
                             ID_TIPO_PRODUCTO : STRING[7];
                             STOCK_REAL       : INTEGER;
                             STOCK_CRITICO    : INTEGER;
                             ACTIVO           : STRING[2];
                       END;

VAR T_PRODUCTOS     : FILE OF TIPO_T_PRODUCTOS;
    MARCAS          : FILE OF TIPO_MARCAS;
    PRODUCTOS       : FILE OF TIPO_PRODUCTOS;
    ID_PRODUCTO     : STRING[7];
    OP              : BYTE;
    VALOR_BUSCADO   : STRING[7];
    TIPO_PRODUCTO   : STRING[7];
    CANTIDAD        : INTEGER;
    CODIGO_PRODUCTO : STRING[7];

PROCEDURE ORDENAR_PRODUCTOS(ID_PRODUCTO : STRING);
VAR I,J : BYTE;
    BUF,BUF2 : TIPO_PRODUCTOS;
    VALOR : STRING;
    BUF_NUMERO,BUF2_NUMERO,ERROR : INTEGER;
BEGIN
     RESET(PRODUCTOS);
     FOR I:=1 TO FILESIZE(PRODUCTOS)-1 DO
         FOR J:=0 TO FILESIZE(PRODUCTOS)-2 DO
         BEGIN
              SEEK(PRODUCTOS,J);
              READ(PRODUCTOS,BUF);
              VALOR:=COPY(BUF.ID_PRODUCTO,6,2);
              VAL(VALOR,BUF_NUMERO,ERROR);
              SEEK(PRODUCTOS,J+1);
              READ(PRODUCTOS,BUF2);
              VALOR:=COPY(BUF2.ID_PRODUCTO,6,2);
              VAL(VALOR,BUF2_NUMERO,ERROR);
              IF BUF_NUMERO>BUF2_NUMERO THEN
              BEGIN
                   SEEK(PRODUCTOS,J+1);
                   WRITE(PRODUCTOS,BUF);
                   SEEK(PRODUCTOS,J);
                   WRITE(PRODUCTOS,BUF2);
              END;
         END;
END;

FUNCTION BUSCAR_PRODUCTO(VALOR_BUSCADO : STRING):INTEGER;
VAR VALOR ,VALOR_BUF           : STRING;
    NUMERO,ERROR,NUMERO_BUF    : INTEGER;
    MITAD,MAX,MIN,MEDIO,EXISTE :  INTEGER;
    BUF                        :  TIPO_PRODUCTOS;
BEGIN
     RESET(PRODUCTOS);
     VALOR:=COPY(VALOR_BUSCADO,6,2);
     VAL(VALOR,NUMERO,ERROR);
     MAX    :=  FILESIZE(PRODUCTOS)-1;
     MITAD  :=  MAX DIV 2;
     MEDIO  :=  MITAD;
     MIN    :=  0;
     EXISTE :=  0;
     SEEK   (PRODUCTOS,MAX);
     READ   (PRODUCTOS,BUF);
     VALOR_BUF:=COPY(BUF.ID_PRODUCTO,6,2);
     VAL(VALOR_BUF,NUMERO_BUF,ERROR);
     IF NUMERO_BUF = NUMERO THEN
     BEGIN
          MITAD  := MAX;
          EXISTE := 1;
     END;
     IF NUMERO > NUMERO_BUF THEN
        EXISTE := 1;
     IF EXISTE = 0 THEN
     BEGIN
          SEEK(PRODUCTOS,0);
          READ(PRODUCTOS,BUF);
          VALOR_BUF:=COPY(BUF.ID_PRODUCTO,6,2);
          VAL(VALOR_BUF,NUMERO_BUF,ERROR);
          IF NUMERO_BUF = NUMERO THEN
          BEGIN
               MITAD  := MIN;
               EXISTE := 1;
          END;
          IF NUMERO < NUMERO_BUF THEN
             EXISTE := 1;
     END;
     WHILE EXISTE <> 1 DO
     BEGIN
          SEEK(PRODUCTOS,MITAD);
          READ(PRODUCTOS,BUF);
          VALOR_BUF:=COPY(BUF.ID_PRODUCTO,6,2);
          VAL(VALOR_BUF,NUMERO_BUF,ERROR);
          IF (NUMERO > NUMERO_BUF) THEN
          BEGIN
               MIN   :=  MITAD;
               MEDIO :=  MEDIO DIV 2;
               IF MEDIO = 0 THEN
                  MEDIO:= 1;
{ESTO ES PARA TERMINAR DE BUSCAR SI FALTO UN REGISTRO ENTRE MITAD Y EL MAX O MIN}
               MITAD := MITAD+MEDIO;
          END;
          IF (NUMERO < NUMERO_BUF) THEN
          BEGIN
               MAX:=MITAD;
               MEDIO:=MEDIO DIV 2;
               IF MEDIO = 0 THEN
                  MEDIO:= 1;
               MITAD:=MITAD-MEDIO;
          END;
          IF (MITAD = MIN) OR (MITAD = MAX) OR (NUMERO=NUMERO_BUF) THEN
              EXISTE := 1;
     END;
     IF (NUMERO <> NUMERO_BUF) THEN
         BUSCAR_PRODUCTO:=-1;
     IF NUMERO = NUMERO_BUF THEN
        BUSCAR_PRODUCTO:=MITAD;
END;

FUNCTION UBICAR_TIPO_PRODUCTO(TIPO_PRODUCTO : STRING): INTEGER;
VAR VALOR, BUF_VALOR  : STRING;
    NUMERO,BUF_NUMERO : INTEGER;
    ERROR             : INTEGER;
    BUF               : TIPO_T_PRODUCTOS;
BEGIN
     RESET(T_PRODUCTOS);
     VALOR:=COPY(TIPO_PRODUCTO,6,2);
     VAL(VALOR,NUMERO,ERROR);
     IF (NUMERO>9) OR (NUMERO<1) THEN
     BEGIN
          UBICAR_TIPO_PRODUCTO:=-1;
     END
          ELSE IF (NUMERO<10) AND (NUMERO>=1) THEN
              BEGIN
                   SEEK(T_PRODUCTOS,NUMERO-1);
                   READ(T_PRODUCTOS,BUF);
                   BUF_VALOR:=COPY(BUF.ID_TIPO_PRODUCTO,6,2);
                   VAL(BUF_VALOR,BUF_NUMERO,ERROR);
                   IF BUF_NUMERO = NUMERO THEN
                      UBICAR_TIPO_PRODUCTO:=NUMERO-1;
                   IF BUF_NUMERO <> NUMERO THEN
                      UBICAR_TIPO_PRODUCTO:=-1;
              END;
END;

PROCEDURE ACTUALIZAR_STOCK(CODIGO_PRODUCTO:STRING; CANTIDAD:INTEGER);
VAR VALOR:STRING;
    NUMERO,ERROR:INTEGER;
    BUF:TIPO_PRODUCTOS;
    RESP:CHAR;
BEGIN
     RESET(PRODUCTOS);
     NUMERO:=BUSCAR_PRODUCTO(CODIGO_PRODUCTO);
     IF NUMERO = -1 THEN
        WRITELN('PRODUCTO INGRESADO NO EXISTE')
        ELSE
            BEGIN
                 WRITELN('¨DESEA RESTAR O AGREGAR? (A/R)');
                 WRITE('RESPUESTA: ');
                 READLN(RESP);
                 IF RESP='A' THEN
                    CANTIDAD:=CANTIDAD*-1;
                 SEEK(PRODUCTOS,NUMERO);
                 READ(PRODUCTOS,BUF);
                 IF BUF.ACTIVO='NO' THEN
                    WRITELN('PRODUCTO ACABADO');
                 IF BUF.ACTIVO='SI' THEN
                 BEGIN
                    BUF.STOCK_REAL:=BUF.STOCK_REAL-CANTIDAD;
                    SEEK(PRODUCTOS,NUMERO);
                    WRITE(PRODUCTOS,BUF);
                    WRITELN('NOMBRE: ',BUF.ID_PRODUCTO,' CANTIDAD DISPONIBLE: ',BUF.STOCK_REAL);
                 END;
            END;
END;

PROCEDURE MOSTRAR_PRODUCTOS;
VAR BUF : TIPO_PRODUCTOS;
BEGIN
     RESET(PRODUCTOS);
     WHILE NOT EOF (PRODUCTOS) DO
     BEGIN
          READ(PRODUCTOS,BUF);
          WRITELN(BUF.STOCK_REAL:2,' ',BUF.ID_PRODUCTO,' ',BUF.NOMBRE);
     END;
     READLN;
END;

BEGIN
     CLRSCR;
     ASSIGN(PRODUCTOS,'PRODUCTO.DAT');
     ASSIGN(T_PRODUCTOS,'TP.DAT');
     ASSIGN(MARCAS,'MARCAS.DAT');
     ORDENAR_PRODUCTOS(ID_PRODUCTO);
     OP:=1;
           WHILE OP <> 0 DO
           BEGIN
                CLRSCR;
                WRITELN('1- MOSTRAR ARCHIVO PRODUCTOS ORDENADO');
                WRITELN('2- REALIZAR FUNCION BUSCAR PRODUCTO');
                WRITELN('3- REALIZAR FUNCION UBICAR TIPO PRODUCTO');
                WRITELN('4- ACTUALIZAR STOCK');
                WRITE('OPCION: ');
                READLN(OP);
                CASE OP OF
                1: MOSTRAR_PRODUCTOS;
                2: BEGIN
                   WRITE('INGRESE ID DEL PRODUCTO (EJ PROD-7): ');
                   READLN(VALOR_BUSCADO);
                   IF BUSCAR_PRODUCTO(VALOR_BUSCADO)=-1 THEN
                      WRITELN('PRODUCTO NO EXISTE EN ARCHIVO PRODUCTOS')
                      ELSE
                      BEGIN
                        WRITE('LA POSICION EN EL ARCHIVO PRODUCTOS SEGUN LA ');
                        WRITELN('FUNCION ES ',BUSCAR_PRODUCTO(VALOR_BUSCADO));
                      END;
                      READLN;
                   END;
                3: BEGIN
                   WRITE('INGRESE ID DEL TIPO PRODUCTO (EJ TIPO-2): ');
                   READLN(TIPO_PRODUCTO);
                   IF UBICAR_TIPO_PRODUCTO(TIPO_PRODUCTO)=-1 THEN
                      WRITELN('TIPO DE PRODUCTO NO EXISTE EN EL ARCHIVO TIPO PRODUCTOS')
                      ELSE
                      BEGIN
                        WRITE('LA POSICION EN EL ARCHIVO TIPO PRODUCTOS SEGUN LA ');
                        WRITELN('FUNCION ES ',UBICAR_TIPO_PRODUCTO(TIPO_PRODUCTO));
                      END;
                      READLN;
                   END;
                4: BEGIN
                        WRITE('INGRESE CANTIDAD DE PRODUCTOS: ');
                        READLN(CANTIDAD);
                        WRITE('INGRESE CODIGO DEL PRODUCTO (EJ PROD-4) : ');
                        READLN(CODIGO_PRODUCTO);
                        ACTUALIZAR_STOCK(CODIGO_PRODUCTO,CANTIDAD);
                        READLN;
                   END;
                END;
           END;
     READLN;
END.