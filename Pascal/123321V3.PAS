PROGRAM EJRECUR;
USES CRT;

VAR NUMERO : BYTE;

PROCEDURE ALGO3(NUMERO:BYTE);
BEGIN
     IF NUMERO<8 THEN
     BEGIN
          WRITELN('ANTES 3 : ',NUMERO);
          ALGO3(NUMERO+1);
          WRITE('DESPUES 3 : ',NUMERO);
          READLN;
     END;
END;

PROCEDURE ALGO2(NUMERO:BYTE);
BEGIN
     IF NUMERO<6 THEN
     BEGIN
          WRITELN('ANTES 2 : ',NUMERO);
          ALGO2(NUMERO+1);
          ALGO3(NUMERO+1);
          WRITE('DESPUES 2 : ',NUMERO);
          READLN;
     END;
END;

PROCEDURE ALGO(NUMERO:BYTE);
BEGIN
     IF NUMERO<4 THEN
     BEGIN
          WRITELN('ANTES : ',NUMERO);
          ALGO(NUMERO+1);
          ALGO2(NUMERO+1);
          WRITELN('DESPUES : ',NUMERO);
     END;
END;

BEGIN
CLRSCR;
       NUMERO:=0;
       ALGO(NUMERO);
       READLN;
END.