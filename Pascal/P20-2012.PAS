Program prueba22;
uses crt;

type st30 = string[30]; st10 = string[10];
     puntalum = ^alumno; puntasig = ^asignatura; puntnota = ^nota;
     asignatura = record
            CodAsig    :  st10;
            NombreAsig :  st30;
            SigAsig    :  puntasig;
     end;
     nota = record
          NotaFinal     :  byte;
          CualAsig      :  puntasig;
          Semestre,anno :  integer;
          SigNota       :  puntnota;
     end;
     alumno = record
            RolUsm     :  longint;
            NombreAlum :  st30;
            Sexo       :  char;
            SigAlumno  :  PuntAlum;
            PriNota    :  PuntNota;
            Izq,Der    :  PuntAlum;
     end;

var raiz     :  puntalum;
    baseasig :  puntasig;
    op       :  byte;

Procedure agregar(var raiz:puntalum);
var p,q,pant,r,rant : puntalum; rol:longint; sw:byte;
begin
     write('ingrese rol: '); readln(rol);
     p := raiz; sw:=0;
     while (p <> nil) and (p^.rolusm <> rol) do
     begin
          pant := p;
          if rol < p^.rolusm then
             p := p^.izq
             else p := p^.der;
     end;
     if p <> nil then
        writeln('Alumno ya existe')
        else
            begin
                 new(q);
                 q^.rolusm := rol;
                 write('nombre: '); readln(q^.nombrealum);
                 write('sexo: '); readln(q^.sexo);
                 q^.sigalumno := nil; q^.prinota:= nil; q^.izq := nil; q^.der:= nil;
                 if raiz = nil then
                 begin
                    raiz := q;
                    sw := 1;
                 end
                    else
                        begin
                             if rol < pant^.rolusm then
                                pant^.izq := q
                                else pant^.der := q;
                        end;
                        r := raiz;
                        while r <> nil do
                        begin
                             rant := r;
                             r := r^.sigalumno;
                        end;
                        if sw = 0 then rant^.sigalumno:=q;
            end;
end;

procedure buscar_asig(var sw:byte; asig:st30; var a:puntasig; baseasig:puntasig);
begin
     a := baseasig;
     while (a <> nil) and (a^.nombreasig <> asig) do
           a := a^.sigasig;
     if a <> nil then
        sw := 1;
end;

Procedure agregar_nota(var raiz:puntalum);
var p      : puntalum;
    a      : puntasig;
zant,q,z,x : puntnota;
    rol    : longint;
    asig   : st30;
    sw     : byte;
begin
     write('Rol: '); readln(rol);
     p := raiz;
     while (p <> nil) and (p^.rolusm <> rol) do
     begin
          if rol < p^.rolusm then
             p := p^.izq
             else p := p^.der;
     end;
     if p = nil then
        writeln('Alumno no existe')
        else
            begin
                 new(q);
                 write('asignatura: '); readln(asig);
                 sw := 0;
                 buscar_asig(sw,asig,a,baseasig);
                 if sw = 1 then
                 begin
                    q^.cualasig := a;
                    write('nota: '); readln(q^.notafinal);
                    write('a¤o: '); readln(q^.anno);
                    write('semestre: '); readln(q^.semestre);
                    q^.signota := nil;
                    if p^.prinota = nil then
                       p^.prinota := q
                       else
                           begin
                           z := p^.prinota;
                           while z <> nil do
                           begin zant:= z;
                                 z := z^.signota;
                           end;
                               zant^.signota := q;
                           end;
                 end
                 else writeln('No existe la asignatura')
            end;
end;

procedure crearbase(var baseasig:puntasig);
var p:puntasig;
begin
       new(baseasig);
       baseasig^.nombreasig := 'mat';
       baseasig^.codasig := '10';
       baseasig^.sigasig := nil;
       new(p);
       p^.nombreasig := 'his';
       p^.codasig := '20';
       p^.sigasig:= nil;
       baseasig^.sigasig:=p;
       new(p);
       p^.nombreasig := 'alg';
       p^.codasig := '30';
       p^.sigasig:= nil;
       baseasig^.sigasig^.sigasig:=p;
end;

procedure mostrar_notas(raiz:puntalum;baseasig:puntasig);
var p:puntalum; rol:longint; q,aux:puntnota; a:puntasig; b:puntasig; sw:byte;
begin
     write('rol: '); readln(rol);
     p:=raiz;
     while (p <> nil) and (rol <> p^.rolusm) do
     begin
          if rol < p^.rolusm then
             p := p^.izq
             else p := p^.der;
     end;
     if p = nil then
        writeln('No existe rol')
        else
            begin
                 b := baseasig;
                 while b <> nil do
                 begin
                      sw := 0;
                      q := p^.prinota;
                      while q <> nil do
                      begin
                           a := q^.cualasig;
                           if a^.nombreasig = b^.nombreasig then
                           begin
                              aux := q;
                              sw := 1
                           end;
                           q := q^.signota
                      end;
                           if sw = 1 then
                              writeln(aux^.notafinal,' ',aux^.cualasig^.nombreasig,' ',aux^.anno,' ',aux^.semestre);
                      b := b^.sigasig;
                 end;
            end;
end;

Procedure eliminar(var baseasig:puntasig; raiz:puntalum);
var z,zant : puntasig; x : puntalum; sw:byte; v : puntnota;
begin
     z := baseasig;
     while (z <> nil) do
     begin
          zant := z;
          x := raiz; sw := 0;
          while (x <> nil) do
          begin
               v := x^.prinota;
               while v <> nil do
               begin
                    if v^.cualasig^.nombreasig = z^.nombreasig then
                       sw:=1;
                    v := v^.signota;
               end;
               x := x^.sigalumno;
          end;
          if sw = 0 then
          begin
               writeln(z^.nombreasig,' ha sido eliminada');
               z^.nombreasig := '';
          end;
          z := z^.sigasig;
     end;
end;

BEGIN
clrscr;
       new(raiz);
       raiz:=nil;
       crearbase(baseasig);
       repeat
       clrscr;
             writeln('1 Agregar Alumno');
             writeln('2 Agregar Nota');
             writeln('3 Mostrar Concentracion de Notas');
             writeln('4 Eliminar Asignaturas');
             writeln('0 Salir');
             write('opcion: '); readln(op);
             case op of
                1: agregar(raiz);
                2: agregar_nota(raiz);
                3: mostrar_notas(raiz,baseasig);
                4: eliminar(baseasig,raiz);
             end;
       readln;
       until op = 0;
END.