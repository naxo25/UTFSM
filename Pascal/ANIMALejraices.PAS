PROGRAM ANIMALITO;
USES CRT;

TYPE
     PuntFicha=^Ficha;
     Ficha=RECORD
                     Sexo: CHAR;
                     Raza: STRING;
                     Color: STRING;
                     AnoNac: INTEGER;
               END;
     PuntAnimal=^ANIMAL;
     Animal=RECORD
                  Nombre,Especie: STRING;
                  Fichita: PuntFicha;
                  Siguiente: PuntAnimal;
            END;


VAR BaseAnimal: PuntAnimal;
    BaseFicha : PuntFicha;
    i         : byte;

{SI A BASE ANIMAL NO LE PONEMOS VAR ANTES NO SE MODIFICARA, SOLO SE PASARAN DATOS
ASI QUE HAY Q DARLE VAR PARA ASI PASE DATOS QUE SE PUEDAN MODIFICAR DENTRO DE EL
PROCEDURE, SIEMPRE PARA MODIFICAR SE DEBEN PASAR PARAMETROS COMO VARIABLES, SINO
EN ESTE CASO EL PROCEDURE NO LE DARA Q A LA BASE SI NO EXISTE}

PROCEDURE InsertarAnimal (var BaseAnimal: PuntAnimal);
VAR p,q,pant: PuntAnimal; f: PuntFicha; nom: STRING;
BEGIN
     p:=BASEANIMAL;
     WRITE('Nombre Animal: '); READLN(nom);
     WHILE (p<>NIL) AND (p^.Nombre<>nom) DO
           BEGIN
                pant:=p;
                p:=p^.Siguiente;
           END;
     IF p<>NIL
        THEN WRITE('Ya existe')
        ELSE BEGIN
                  NEW(q); q^.Nombre:=nom;
                  WRITE('Especie: '); READLN(q^.Especie);
                  NEW(f);
                  WRITELN('Ingrese sexo: '); READLN(f^.Sexo);
                  WRITELN('Ingrese raza: '); READLN(f^.Raza);
                  WRITELN('Ingrese color: '); READLN(f^.Color);
                  WRITELN('Ingrese a¤o nacimiento: '); READLN(f^.AnoNac);
                  q^.fichita:=f;
                  IF baseANIMAL=NIL
                     THEN begin
                          baseANIMAL:=q;
                          end
                     ELSE BEGIN
                               pant^.Siguiente:=q;
                               q^.Siguiente:=p;
                          END;
            END;
END;

PROCEDURE CONSULTARANIMAL(BASEANIMAL:PUNTANIMAL);
VAR P:PUNTANIMAL; F:PUNTFICHA; NOMBRE:STRING;
BEGIN
     P:=BASEANIMAL;
     WRITE('INGRESE NOMBRE DE ANIMAL: ');
     READLN(NOMBRE);
     WHILE (P<>NIL) AND (NOMBRE<>P^.NOMBRE) DO
          P:=P^.SIGUIENTE;
     IF P=NIL THEN
        WRITE('EL ANIMAL NO EXISTE')
        ELSE
            BEGIN
                 WRITELN(P^.NOMBRE);
                 WRITELN(P^.ESPECIE);
                 F:=P^.FICHITA;
                 WRITELN(F^.SEXO);
                 WRITELN(F^.RAZA);
                 WRITELN(F^.COLOR);
                 WRITELN(F^.ANONAC);
            END;
     READLN;
END;

BEGIN
baseanimal:=nil; i:=1;
while i<>0 do
begin
CLRSCR;
     writeln('opcion(1=agregar, 2=consultar, 0=salir)');
     readln(i);
     case i of
          1:InsertarAnimal(BaseAnimal);
          2:CONSULTARANIMAL(BASEANIMAL);
       end;
     readln;
end;
END.
