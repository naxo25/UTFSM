PROGRAM CERT2009;
USES CRT;

TYPE ST15 = STRING[15];
PERSONA = RECORD
        ROL      : INTEGER;
        APELLIDO : ST15;
        EDAD     : BYTE;
END;

VAR ARCH:FILE OF PERSONA; ORDROL,ORDAPELL,AUXBUF:FILE OF INTEGER;
    i : byte;

PROCEDURE AGREGAR;
VAR ROLSITO, EX,CONT,POSROL,BUFAUX,POSROLSITO,POS : INTEGER; BUF:PERSONA;
BEGIN
     WRITE('ROL : ');
     READLN(ROLSITO);
     EX := 0;
     reset(arch);
     WHILE NOT EOF (ARCH) DO
     BEGIN
          READ(ARCH,BUF);
          IF ROLSITO = BUF.ROL THEN
             EX := 1;
     END;
     IF EX = 1 THEN
        WRITELN('MALO')
        ELSE
        BEGIN
             WRITE('APELLIDO : ');
             READLN(BUF.APELLIDO);
             WRITE('EDAD : ');
             READ(BUF.EDAD);
             BUF.ROL := ROLSITO;
              WRITE(ARCH,BUF);
             POSROL:=0;
             CONT:= 0;

             RESET(ORDROL);
             writeln('poos', pos);
             readln;
             WHILE NOT EOF (ORDROL) DO
             BEGIN
                  READ(ORDROL,POS);
                  SEEK(ARCH,POS);
                  READ(ARCH,BUF);
                  CONT:=CONT+1;
                  IF (ROLSITO < BUF.ROL) and (POSROL = 0) THEN
                     POSROL := CONT;
             END;

             POSROLSITO := FILESIZE(ARCH)-1;
             IF (ROLSITO > BUF.ROL) AND (POSROL = 0) THEN
             BEGIN
                  WRITE(ORDROL,POSROLSITO)
             END
             ELSE
             BEGIN
                  RESET(ORDROL);
                  REWRITE(AUXBUF);
                  WHILE NOT EOF (ORDROL) DO
                  BEGIN
                       READ(ORDROL,BUFAUX);
                       WRITE(AUXBUF,BUFAUX)
                  END;

                  RESET(AUXBUF);
                  REWRITE(ORDROL);
                  CONT := 0;
                  WHILE NOT EOF(AUXBUF) DO
                  BEGIN
                       READ(AUXBUF,BUFAUX);
                       CONT := CONT + 1;
                       IF CONT = POSROL THEN
                          WRITE(ORDROL,POSROLSITO);
                       WRITE(ORDROL,BUFAUX)
                  END;
             END;
        END;
END;

PROCEDURE MOSTRAR;
VAR BUF:INTEGER;
BEGIN
     RESET(ORDROL);
     WHILE NOT EOF(ORDROL) DO
     BEGIN
          READ(ORDROL,BUF);
          WRITELN(BUF)
     END;
END;

PROCEDURE MOSTRAR2;
VAR BUF:PERSONA;
BEGIN
     RESET(ARCH);
     WHILE NOT EOF(ARCH) DO
     BEGIN
          READ(ARCH,BUF);
          WRITELN(BUF.ROL,' ',BUF.APELLIDO)
     END;
END;

PROCEDURE MOSTRARPORROL;
var pos : integer; buf:persona; cont:byte;
BEGIN
     RESET(ORDROL); RESET(ARCH);
     cont := 0;
     WHILE NOT EOF (ORDROL) DO
     BEGIN
          READ(ORDROL,POS);
          SEEK(ARCH,POS);
          READ(ARCH,BUF);
          WRITELN(cont:4,pos:4,BUF.ROL:6,'  ',BUF.APELLIDO);
          cont := cont + 1;
     END;
END;

BEGIN
CLRSCR;
       ASSIGN(ARCH,'ARCHDATO.dat');
       ASSIGN(ORDROL,'ORDROL.DAT');
       ASSIGN(AUXBUF,'AUXDATO.DAT');
       mostrarporrol;
	READLN;
       clrscr;
       for i := 1 to 2 do
       begin
       AGREGAR;
       READLN;
       MOSTRARPORROL;
       READLN;
       end;
       CLOSE(ARCH);
       CLOSE(ORDROL);
END.