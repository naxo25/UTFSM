UNIT BIBLIO;

INTERFACE
 USES CRT;
 VAR MESES:ARRAY[1..12] OF INTEGER;

 FUNCTION MAYUSCULAS(TEXTO:STRING):STRING;
 FUNCTION MINUSCULAS(TEXTO:STRING):STRING;
 FUNCTION SIN_ESPACIOS(TEXTO:STRING):STRING;
 FUNCTION IZQUIERDA(TEXTO:STRING;NUM:BYTE):STRING;
 FUNCTION DERECHA(TEXTO:STRING;I:BYTE):STRING;
 FUNCTION REEMPLAZAR(TEXTO,CHR2:STRING;CHR:CHAR):STRING;
 FUNCTION MEDIO(TEXTO:STRING;M,N:BYTE):STRING;
 FUNCTION POSICION(TEXTO:STRING;CHR:CHAR;OCURRENCIA:BYTE):BYTE;
 FUNCTION CENTRAR(TEXTO:STRING;TOTAL:BYTE):STRING;
 FUNCTION ELEVADO(BASE:INTEGER; EXP:SHORTINT):REAL;
 PROCEDURE LLENAR_PANTALLA(CHR:CHAR;COL1:BYTE;COL2:BYTE);
 Function  SetBackColor(Color: Byte):Byte;
 Function  SetForeColor(Color: Byte):Byte;
 Procedure SaveScreen(Var Puntero: Pointer);
 Procedure RestoreScreen(Var Puntero: Pointer);
 Procedure Mensaje(Texto: String);
 FUNCTION VALIDAR_ROL_USM(ROL_USM:STRING):CHAR;
 PROCEDURE CREAR_MESES;
 FUNCTION VAL_FECHA(FECHA:STRING):INTEGER;

IMPLEMENTATION

 FUNCTION MAYUSCULAS(TEXTO : STRING):STRING;
 VAR RESULTADO:STRING; I:BYTE;
 BEGIN
 RESULTADO:='';
    FOR I := 1 TO LENGTH(TEXTO) DO
    BEGIN
    IF (TEXTO[I]= '¤') THEN
       RESULTADO := RESULTADO + '¥'
       ELSE IF (TEXTO[I]= ' ') THEN
            RESULTADO := RESULTADO + 'µ'
            ELSE IF (TEXTO[I]= '‚') THEN
                 RESULTADO := RESULTADO + ''
                 ELSE IF (TEXTO[I]= '¡') THEN
                      RESULTADO := RESULTADO + 'Ö'
                      ELSE IF (TEXTO[I]= '¢') THEN
                           RESULTADO := RESULTADO + 'à'
                           ELSE IF (TEXTO[I]= '£') THEN
                                RESULTADO := RESULTADO + 'é'
                                ELSE RESULTADO := RESULTADO + UPCASE(TEXTO[I]) ;
    END;
    MAYUSCULAS := RESULTADO;
 END;

 FUNCTION MINUSCULAS(TEXTO:STRING):STRING;
 VAR C:CHAR; I:BYTE; RESULTADO:STRING;
 BEGIN
 RESULTADO:='';
      FOR I:=1 TO LENGTH(TEXTO) DO
      BEGIN
      IF (TEXTO[I] >= 'A') AND (TEXTO[I] <= 'Z') THEN
          RESULTADO:=RESULTADO+CHR(ORD(TEXTO[I])+32)
          ELSE IF (TEXTO[I]= '¥') THEN
               RESULTADO := RESULTADO + '¤'
               ELSE IF (TEXTO[I]= 'µ') THEN
                    RESULTADO := RESULTADO +' '
                    ELSE IF (TEXTO[I]= '') THEN
                         RESULTADO := RESULTADO + '‚'
                         ELSE IF (TEXTO[I]= 'Ö') THEN
                              RESULTADO := RESULTADO + '¡'
                              ELSE IF (TEXTO[I]= 'à') THEN
                                   RESULTADO := RESULTADO + '¢'
                                   ELSE IF (TEXTO[I]= 'é') THEN
                                        RESULTADO := RESULTADO + '£'
                                        ELSE RESULTADO:=RESULTADO+TEXTO[I]
      END;
      MINUSCULAS:=RESULTADO;
 END;

 FUNCTION SIN_ESPACIOS(TEXTO:STRING):STRING;
 VAR A,B,SW,I:BYTE;
 BEGIN
 SW:=0; A:=1;
      FOR I:=1 TO LENGTH(TEXTO) DO
      BEGIN
           IF (TEXTO[I] = ' ') AND (SW<>1) THEN
              A:=A+1
              ELSE SW:=1;
           IF (TEXTO[I]<>' ') THEN
              B:=I;
      END;
      SIN_ESPACIOS:=COPY(TEXTO,A,B);
 END;

 FUNCTION  IZQUIERDA(TEXTO:STRING;NUM:BYTE):STRING;
 VAR CONT,LARGO: BYTE;FINAL: STRING;
 BEGIN
     LARGO:=LENGTH(TEXTO);
     CONT:=1;
     FINAL:='';
     IF NUM>LARGO
        THEN WRITE('ERROR, EL NUMERO INGRESADO ES MAYOR AL NUMERO DE LETRAS.')
        ELSE
        BEGIN WHILE CONT<=NUM DO
              BEGIN
                  FINAL:=FINAL+TEXTO[CONT];
                  CONT:=CONT+1;
              END;
        END;
     IZQUIERDA:=FINAL;
 END;

 FUNCTION DERECHA(TEXTO:STRING;I:BYTE):STRING;
 VAR CONT,LARGO: BYTE;FINAL: STRING;
 BEGIN
 LARGO:=LENGTH(TEXTO);
 I:=I-LARGO;
 CONT:=1;
 FINAL:='';
 WHILE CONT<=I DO
 BEGIN
 	FINAL:=FINAL+' ';
 	CONT:=CONT+1;
 END;
 DERECHA:=TEXTO+FINAL;
 END;

 FUNCTION MEDIO(TEXTO:STRING;M,N:BYTE):STRING;
 BEGIN
      MEDIO:=COPY(TEXTO,M,N);
 END;

 FUNCTION REEMPLAZAR(TEXTO,CHR2:STRING;CHR:CHAR):STRING;
 VAR I:BYTE; RESULTADO:STRING;
 BEGIN
 RESULTADO:='';
      FOR I:=1 TO LENGTH(TEXTO) DO
          IF TEXTO[I]=CHR THEN
             RESULTADO:=RESULTADO+CHR2
             ELSE RESULTADO:=RESULTADO+TEXTO[I];
      REEMPLAZAR:=RESULTADO;
 END;

 FUNCTION POSICION(TEXTO:STRING;CHR:CHAR;OCURRENCIA:BYTE):BYTE;
 VAR I,RESULTADO:BYTE;
 BEGIN
      RESULTADO:=0;
      FOR I:=1 TO LENGTH(TEXTO) DO
      BEGIN
          IF TEXTO[I]=CHR THEN
             OCURRENCIA:=OCURRENCIA-1;
          IF OCURRENCIA=0 THEN
          BEGIN
             RESULTADO:=I;
             OCURRENCIA:=OCURRENCIA-1;
          END;
      END;
      POSICION:=RESULTADO;
 END;

 FUNCTION CENTRAR(TEXTO: STRING; TOTAL : BYTE) : STRING;
 VAR  RESULTADO        : STRING;
      MITAD_TEXTO      : BYTE;
      MITAD_TOTAL      : BYTE;
      CONT             : BYTE;
 BEGIN
 IF LENGTH(TEXTO) <= TOTAL
    THEN BEGIN
         MITAD_TEXTO := TRUNC(LENGTH(TEXTO) / 2);
         MITAD_TOTAL := TRUNC(TOTAL / 2);
         RESULTADO   := '';
         FOR CONT := 1 TO MITAD_TOTAL - MITAD_TEXTO DO
                  RESULTADO := RESULTADO + ' ';
             RESULTADO := RESULTADO + TEXTO;
             FOR CONT := LENGTH(RESULTADO) TO TOTAL - 1 DO
                  RESULTADO := RESULTADO + ' ';
             CENTRAR := RESULTADO
         END
    ELSE CENTRAR := TEXTO;
 END;

 FUNCTION ELEVADO(BASE:INTEGER;EXP:SHORTINT):REAL;
 VAR SW,I:BYTE; RESULT:LONGINT;
 BEGIN
      RESULT:=BASE; I:=2; SW:=0;
      IF EXP<0 THEN
      BEGIN
         EXP:=EXP*-1;
         SW:=1;
      END;
      WHILE I<=EXP DO
      BEGIN
            RESULT:=RESULT*BASE;
            I:=I+1;
      END;
      IF SW=0 THEN
         ELEVADO:=RESULT
         ELSE ELEVADO:=1/RESULT;
 END;

 PROCEDURE LLENAR_PANTALLA(CHR:CHAR;COL1:BYTE;COL2:BYTE);
 VAR I:BYTE;TEXTO:STRING;
 BEGIN
     CLRSCR;
     I:=1;TEXTO:='';

     WHILE I<80 DO
     BEGIN
          TEXTO:=TEXTO+CHR;
          I:=I+1
     END;
     I:=1;
     WHILE I<26 DO
     BEGIN
          TEXTBACKGROUND(COL1);
          TEXTCOLOR(COL2);
          WRITELN(TEXTO);
          I:=I+1
     END;
     TEXTBACKGROUND(0);
     TEXTCOLOR(7);
     READLN;
 END;

 Procedure Mensaje(Texto:String);
 Var Puntero: Pointer;
     Ant_Fondo, Ant_Letra: Byte;
 Begin
     SaveScreen(Puntero);
     Ant_Fondo := SetBackColor(Red);
     Ant_Letra := SetForeColor(Yellow);
     Gotoxy(20,10); Write('+---------------------------------------------+');
     Gotoxy(20,11); Write('|                                             |');
     Gotoxy(20,12); Write('|                                             |');
     Gotoxy(20,13); Write('|                                             |');
     Gotoxy(20,14); Write('|          Presione Enter para Continuar      |');
     Gotoxy(20,15); Write('+---------------------------------------------+');
     TextColor(White + Blink);
     Gotoxy(21,11); Write(Texto);
     Readln;
     TextBackGround(Ant_Fondo);
     TextColor(Ant_Letra);
     RestoreScreen(Puntero);
 End;

  Function SetBackColor(Color: Byte):Byte;
  Begin
      SetBackColor := TextAttr DIV 16;
      TextBackGround(Color);
  End;

  Function SetForeColor(Color: Byte):Byte;
  Begin
      SetForeColor := TextAttr MOD 16;
      TextColor(Color);
  End;

  Procedure SaveScreen(Var Puntero: Pointer);
  Begin
      GetMem(Puntero,4000);
      Move(Mem[$B800:0],Puntero^,4000);
  End;

  Procedure RestoreScreen(Var Puntero: Pointer);
  Begin
      Move(Puntero^,Mem[$B800:0],4000);
      FreeMem(Puntero,4000);
      Puntero := Nil;
  End;

FUNCTION VALIDAR_ROL_USM(ROL_USM:STRING):CHAR;

VAR RESULTADO,X:INTEGER;
    DIGITO,ROL:LONGINT;
    C:BYTE;
    NUMSTRING:CHAR;

BEGIN
     RESULTADO:=0; C:=2;
     VAL(ROL_USM,ROL,X);
     WHILE ROL<>0 DO
     BEGIN
          DIGITO:=ROL-(TRUNC(ROL/10)*10);
          ROL:=TRUNC(ROL/10);
          RESULTADO:=RESULTADO+(DIGITO*C);
          C:=C+1;
          IF C=8 THEN
             C:=2;
     END;
     RESULTADO:=(RESULTADO MOD 11);
     RESULTADO:=11-RESULTADO;
     IF RESULTADO=10 THEN
        VALIDAR_ROL_USM:='K'
        ELSE
        IF RESULTADO=9 THEN
              VALIDAR_ROL_USM:='9'
              ELSE IF RESULTADO=8 THEN
                   VALIDAR_ROL_USM:='8'
                   ELSE IF RESULTADO=7 THEN
                        VALIDAR_ROL_USM:='7'
                        ELSE IF RESULTADO=6 THEN
                             VALIDAR_ROL_USM:='6'
                             ELSE IF RESULTADO=5 THEN
                                  VALIDAR_ROL_USM:='5'
                                  ELSE IF RESULTADO=4 THEN
                                       VALIDAR_ROL_USM:='4'
                                       ELSE IF RESULTADO=3 THEN
                                            VALIDAR_ROL_USM:='3'
                                            ELSE IF RESULTADO=2 THEN
                                                 VALIDAR_ROL_USM:='2'
                                                 ELSE IF RESULTADO=1 THEN
                                                      VALIDAR_ROL_USM:='1'
 END;

PROCEDURE CREAR_MESES;

BEGIN

       MESES[1]:=31;
       MESES[2]:=28;
       MESES[3]:=31;
       MESES[4]:=30;
       MESES[5]:=31;
       MESES[6]:=30;
       MESES[7]:=31;
       MESES[8]:=31;
       MESES[9]:=30;
       MESES[10]:=31;
       MESES[11]:=30;
       MESES[12]:=31;

END;

FUNCTION VAL_FECHA(FECHA:STRING):INTEGER;

VAR X,MES,RES:INTEGER; DIAS,BISIESTO:BYTE; ANO,NUMERO:LONGINT;

BEGIN

 CREAR_MESES;
 RES:=0;
 BISIESTO:=0;
 {$I-}
 VAL(FECHA,NUMERO,X);
 {$I+}
 IF IORESULT<>0 THEN
    RES:=4
    ELSE
    BEGIN
      ANO:=TRUNC(NUMERO/10000);
      IF TRUNC(ANO/4)=ANO/4 THEN
         BISIESTO:=1;
      ANO:=2014-ANO;
      MES:=(TRUNC(NUMERO/100))-((TRUNC(NUMERO/10000))*100);
      DIAS:=NUMERO - (TRUNC(NUMERO/100)*100);
      IF (ANO>15) AND (ANO<65) THEN
         RES:=0
         ELSE
             RES:=3;
      IF ((MES<1) OR (MES>12)) AND (RES=0) THEN
         RES:=2
         ELSE IF ((MES<1) OR (MES>12)) AND (RES<>0) THEN
                  RES:=4;
      IF BISIESTO = 1 THEN
         MESES[2]:=MESES[2]+1;
      IF ((DIAS<1) OR (DIAS>MESES[MES])) AND (RES=0) THEN
         RES:=1
         ELSE IF ((DIAS<1) OR (DIAS>MESES[MES])) AND (RES<>0) THEN
              RES:=4;
    END;
    VAL_FECHA:=RES;

END;

END.
