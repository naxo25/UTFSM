Unit MiBiblio;

Interface
  Uses Crt;		               {Es necesario puesto que se hace uso de sus herramientas}
  Function  SetBackColor(Color: Byte):Byte;
  Function  SetForeColor(Color: Byte):Byte;
  Procedure SaveScreen(Var Puntero: Pointer);
  Procedure RestoreScreen(Var Puntero: Pointer);
  Procedure Mensaje(Texto: String);

Implementation
{--------------------------------------------------------------------------}
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
{--------------------------------------------------------------------------}
  Function SetBackColor(Color: Byte):Byte;
  Begin
      SetBackColor := TextAttr DIV 16;  {Obtiene el valor del color actualmente configurado}
      TextBackGround(Color);	        {Cambia el color}
  End;
{--------------------------------------------------------------------------}
  Function SetForeColor(Color: Byte):Byte;
  Begin
      SetForeColor := TextAttr MOD 16;  {Obtiene el valor del color actualmente configurado}
      TextColor(Color);	               {Cambia el color}
  End;
{--------------------------------------------------------------------------}
  Procedure SaveScreen(Var Puntero: Pointer);
  Begin
      GetMem(Puntero,4000);	      {Reserva espacio de memoria (auxiliar)}
      Move(Mem[$B800:0],Puntero^,4000); {Copia bits desde la memoria de video a la auxiliar}
  End;
{--------------------------------------------------------------------------}
  Procedure RestoreScreen(Var Puntero: Pointer);
  Begin
      Move(Puntero^,Mem[$B800:0],4000); {Copia bits desde la memoria auxiliar a la de video}
      FreeMem(Puntero,4000);	      {Libera el espacio reservado en SaveScreen}
      Puntero := Nil;		      {Ahora, puntero apunta a una dirección “Nula”}
  End;
{--------------------------------------------------------------------------}
End.
