{No es la gran cosa de juego pero tal vez te pueda servir para acreditar una
materia, si te interesan mas codigos comunicate conmigo a:
jorgeponceturrubiates@hotmail.com o xjapt@yahoo.com.mx}
program juego;
uses dos,crt;
type
    coordenadas=record {Es el registro de misiles}
                      x  :byte;
                      y  :byte;
                      edo:boolean;
                end;
    {Es el array de los misiles}
    misiles    =array [25..54] of coordenadas;
var
   s            :string;
   EXISTE_MOUSE	:boolean;
   R		:registers;
   a,b,c,vel,t,w:word;
   arreglo,barra:misiles;
{Borra el cursor de la  pantalla}
procedure tocursor;
begin
     asm
        mov ah,01h
        mov cx,1400h
        int 10h
     end;
end;
{Inicia el raton si es que esta cargado el controlador}
function Inicializar_mouse : boolean;
begin
	R.ax := $00;
	intr($33,R);
	if  (integer(R.ax)=-1) then Inicializar_mouse := true
			        else Inicializar_mouse := false;
end; { fin inicializar_mouse }
{Muestra el mouse, flecha en modo grafico y barra en modo texto}
procedure Mostrar_mouse;
begin
	R.ax := $01;
	intr($33,R);
end; { fin mostrar cursor del mouse}
{Lee posicion del muose y boton b donde hizo click}
procedure Lee_posi_mouse(Var x, y, b: Word);
begin
	R.ax := $03;
	intr($33,R);
        b := R.bx;
	x := R.cx;
	y := R.dx;
end; { fin Lee posicion del mouse y estado de los botones }
{Fija la posicion inicial del mouse x y y}
procedure Fijar_posi_mouse(x, y : Word);
begin
	R.ax := $04;
	R.cx := x;
	R.dx := y;
	intr($33,R);
end; { fin fijar posicion nueva posicion del cursor del mouse }
{lp limpiar pantalla}
procedure lp (n:byte);
begin
     textbackground (n);
     clrscr;
end;
{Dibuja una ventana en modo texto de doble linea}
procedure ventana (x1,y1,x2,y2,color,relleno:byte);
var
   i,j:byte;
begin
     if (x1<x2) and (y1<y2) then
     begin
          textbackground (relleno);
          for i:=x1 to x2 do
          begin
               for j:=y1 to y2 do
               begin
                    gotoxy (i,j);
                    write (' ');
               end;
          end;
          textcolor (color);
          for i:=x1 to x2 do
          begin
               gotoxy (i,y1); write ('Э');
               gotoxy (i,y2); write ('Э');
          end;
          for i:=y1 to y2 do
          begin
               gotoxy (x1,i); write ('К');
               gotoxy (x2,i); write ('К');
          end;
          gotoxy (x1,y1); write ('Щ');
          gotoxy (x1,y2); write ('Ш');
          gotoxy (x2,y1); write ('Л');
          gotoxy (x2,y2); write ('М');
     end;
end;
{Inicia los misiles la posicion inicial por default 3 para y y 25 para x}
procedure iniciar (var n:misiles);
var
   i:word;
begin
     for i:=25 to 54 do
     begin
          n[i].x:=i;
          n[i].y:=3;
          n[i].edo:=true;
     end;
end;
{Hace mover los misiles uno a la vez al azar, hasta llegar a y=23
vel es la velocidad de avance que se puede modificar en con clicks}
function avanzar (var n,b:misiles):word;
var
   i:byte;
begin
     randomize;
     i:=random (30)+25;
     if n[i].edo=true then
     begin
          gotoxy (n[i].x,n[i].y); write (' ');
          textcolor (2);
          n[i].y:=n[i].y+1;
          gotoxy (n[i].x,n[i].y); write ('');
          gotoxy (80,25);
          delay (vel);
     end
     else
     begin
          n[i].edo:=true;
          n[i].y:=3;
     end;
     avanzar:=1;
     if n[i].y=23 then
     begin
          if b[i].edo=true then
          begin
               gotoxy (n[i].x,n[i].y); write (' ');
               n[i].y:=3;
               b[i].edo:=false;
          end
          else avanzar:=0;
     end;
end;
{Borra los misiles derribados e inicializa el arreglo para que se vuelva a
cargar el misil en la otra vuelta (campo edo)}
procedure eliminar (x,y:word; var c:word; var n:misiles);
var
   i:word;
begin
     for i:=25 to 55 do
     begin
          if ((n[i].x=x) and (n[i].y=y)) and (n[i].edo) then
          begin
               n[i].edo:=false;
               gotoxy (x,y); write (' ');
               sound (440);
               delay (10);
               nosound;
               c:=c+1;
          end;
     end;
end;
{P R O G R A M A    P R I N C I P A L
El juego termina cuando derribas 150 misiles}
begin
     tocursor;
     s:=' FreeWare';
     vel:=100; {Velocidad por default}
     w:=0;
     lp(2); {Pone color azul}
     EXISTE_MOUSE:=inicializar_mouse;
     if not EXISTE_MOUSE then
     begin
          writeln ('Mouse no activado');
          halt;
     end;
     iniciar (arreglo);
     ventana (3,5,21,20,0,7);
     ventana (58,5,79,20,0,7);
     textcolor (4);
     for t:=1 to 10 do
     begin
          gotoxy (13,6+t); write (s[t]);
     end;
     textcolor (1);
     gotoxy (4,18); write ('И Copyright MMIII');
     gotoxy (64,7); write ('VELOCIDAD');
     gotoxy (64,8); write (' ллллл ');
     textcolor (8);
     gotoxy (64,8); write ('');
     gotoxy (72,8); write ('');
     textcolor (8);
     gotoxy (64,10); write (' ');
     textcolor (1);
     write ('SALIR');
     gotoxy (60,13); write ('Misiles Derribados');
     ventana (24,2,55,24,7,0);
     for a:=25 to 54 do
     begin
          gotoxy (a,23); write ('Б');
          barra[a].edo:=true;
     end;
     fijar_posi_mouse (300,50);
     repeat
           mostrar_mouse;
           lee_posi_mouse (a,b,c);
           textbackground (7);
           textcolor (4);
           gotoxy (70,14); write (w);
           textbackground (0);
           if c=1 then
           begin
                {Este calculo es muy importante ya que cuando se trabaja en
                modo texto, las coordenadas se obtienen en mickeys y esta se
                tiene que dividir entre 8 y sumar uno para obtener las
                coordenadas exactas}
                eliminar ((a div 8)+1, (b div 8)+1,w,arreglo);
                if (((a div 8)+1)=64) and (((b div 8)+1)=8) then vel:=vel+10;
                if (((a div 8)+1)=72) and (((b div 8)+1)=8) then vel:=vel-10;
                if vel<30 then vel:=30;
                if vel>250 then vel:=250;
           end;
           t:=avanzar (arreglo,barra);
           gotoxy (80,25);
     until ((c=1) and (((a div 8)+1)=64) and (((b div 8)+1)=10)) or (t=0) or (w=150);
     ventana (30,12,50,16,7,0);
     if t=0 then
     begin
          textcolor (yellow+blink);
          gotoxy (35,14); write ('TU PIERDES');
          delay (1000);
     end;
     if w=150 then
     begin
          textcolor (yellow+blink);
          gotoxy (35,14); write ('TU GANASTE');
          delay (1000);
     end;
end.
