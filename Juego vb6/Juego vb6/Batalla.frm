VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Object = "{62EC3EC3-A75A-11D1-AB74-004F4C006808}#1.0#0"; "MARCHOSO.OCX"
Begin VB.Form Batalla 
   Caption         =   "Form2"
   ClientHeight    =   7620
   ClientLeft      =   225
   ClientTop       =   555
   ClientWidth     =   11445
   LinkTopic       =   "Form2"
   ScaleHeight     =   7620
   ScaleWidth      =   11445
   StartUpPosition =   3  'Windows Default
   Begin MARCHOSOLib.Marchoso gif 
      Height          =   2895
      Left            =   1560
      TabIndex        =   9
      Top             =   720
      Width           =   3135
      _Version        =   131072
      _ExtentX        =   5530
      _ExtentY        =   5106
      _StockProps     =   1
      FileName        =   ""
   End
   Begin VB.CommandButton salir 
      Caption         =   "Salir"
      Height          =   495
      Left            =   1080
      TabIndex        =   6
      Top             =   6600
      Width           =   3975
   End
   Begin VB.CommandButton Defender 
      Caption         =   "Defender"
      Height          =   495
      Left            =   1080
      TabIndex        =   4
      Top             =   5880
      Width           =   3975
   End
   Begin VB.CommandButton atacar 
      Caption         =   "Atacar"
      Height          =   495
      Left            =   1080
      TabIndex        =   3
      Top             =   5160
      Width           =   3975
   End
   Begin WMPLibCtl.WindowsMediaPlayer sonido 
      Height          =   375
      Left            =   9240
      TabIndex        =   15
      Top             =   1080
      Visible         =   0   'False
      Width           =   375
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   661
      _cy             =   661
   End
   Begin VB.Label enemigo 
      Height          =   375
      Left            =   4560
      TabIndex        =   14
      Top             =   480
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label nombre1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   7080
      TabIndex        =   13
      Top             =   6600
      Width           =   1455
   End
   Begin VB.Label nombre2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1080
      TabIndex        =   12
      Top             =   3960
      Width           =   1455
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   375
      Left            =   8880
      TabIndex        =   11
      Top             =   7080
      Width           =   375
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   375
      Left            =   2880
      TabIndex        =   10
      Top             =   4440
      Width           =   375
   End
   Begin WMPLibCtl.WindowsMediaPlayer golpe 
      Height          =   255
      Left            =   11520
      TabIndex        =   8
      Top             =   1680
      Visible         =   0   'False
      Width           =   495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   873
      _cy             =   450
   End
   Begin VB.Label hp1max 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   9240
      TabIndex        =   7
      Top             =   7080
      Width           =   1815
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00FF0000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Opciones"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000080FF&
      Height          =   2415
      Left            =   960
      TabIndex        =   5
      Top             =   4920
      Width           =   4215
   End
   Begin VB.Label Hp2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   1080
      TabIndex        =   2
      Top             =   4440
      Width           =   1935
   End
   Begin VB.Label Hp2max 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   3120
      TabIndex        =   1
      Top             =   4440
      Width           =   1935
   End
   Begin VB.Label Hp1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   7080
      TabIndex        =   0
      Top             =   7080
      Width           =   1935
   End
   Begin VB.Image P1 
      Height          =   3975
      Left            =   7080
      Top             =   2880
      Width           =   3975
   End
   Begin VB.Image P2 
      Height          =   3735
      Left            =   1080
      Top             =   480
      Width           =   3975
   End
   Begin VB.Image fondo 
      Height          =   7695
      Left            =   0
      Top             =   0
      Width           =   11415
   End
End
Attribute VB_Name = "Batalla"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim daño2, defensa1, defensa2, int1, int2, pos1, pos2 As Integer
Dim daño1 As String
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Dim tt, Timepoison As Byte

Private Sub Form_Load()

    P1.Stretch = True
    P2.Stretch = True
    Fondo.Stretch = True
    enemigo = -5
    'fondo = LoadPicture(App.Path + "\Fondos\aguila de fuego.jpg")
    
End Sub

Private Sub cargar_efecto(pj, zz)

If pj = 1 Then
    If zz = 1 Then
        golpe.URL = App.Path + "/Sound/zeroatack.mp3"
    End If
    If zz = 2 Then
        golpe.URL = App.Path + "/sound/zerodaño.mp3"
    End If
    If zz = 3 Then
        golpe.URL = App.Path + "/sound/muerte.mp3"
    End If
End If
If pj = 2 Then
    If zz = 3 Then
        golpe.URL = App.Path + "/sound/grito.mp3"
    End If
End If

End Sub

Function daño(pj) As String

If pj = 1 Then
    skill (1)
    Hp2 = Hp2 - (daño1 - defensa2)
    daño = (daño1 - defensa2)
    color (2)
    Call cargar_imagen(2, 2)
    
Else

If pj = 2 Then
If Hp2 > 0 Then
    If skill(2) = 1 Then
        daño = daño_magico
        sp2 = "0"
    Else
    If skill(3) = 1 Then
        Hp1 = Hp1 - (daño2 - defensa1)
        daño = daño2 - defensa
    Else
        Hp1 = Hp1 - (daño2 - defensa1)
        daño = daño2 - defensa1
    End If
    End If
End If
color (1)
Call cargar_imagen(2, 1)
Call cargar_imagen(1, 2)
End If
End If

End Function

Function daño_magico() As String

    daño_magico = (int2 - (int1 / 10))
    If daño_magico > 0 Then
        Hp1 = Hp1 - daño_magico
        Else: daño_magico = 0
    End If
    
End Function

Function skill(zz) As Byte
    
If zz = 1 Then  'Para skill player 1 autoactivables de caracter fisico
    If (nombre1 = "Zero" And Hp1 < hp1max / 3) And (atributos.Zero_bersek = 1) Then
        cal = (daño1 - defensa2) * 2.3
        daño1 = cal
        defensa1 = "-3"
        skill = 1
        atributos.Zero_bersek = 0
    Else
    If (nombre1 = "Zero" And Hp1 > hp1max / 3) And (atributos.Zero_bersek = 0) Then
        atributos.Zero_bersek = 1
    Else
    If (nombre1 = "Megaman" And Hp1 < hp1max / 3 And atributos.Power_up = 1) Then
        Hp1 = Hp1 + 70
        daño1 = "33"
        defensa1 = "25"
        atributos.Power_up = 0
        skill = 1
    Else
        zz = 0
    End If
    End If
    End If
Else

If zz = 2 Then  'Para skill enemigos controlados por pc autoactivables de daño magico
    If (Hp2 < Hp2max / 3) And (int2 = 73) And (nombre2 = "Saske") Then
        gif = App.Path + "\Imagenes\sharingan.gif"
        MsgBox "Sasuke usa amateratsu"
        gif = App.Path + "\Imagenes\sasuke.gif"
        skill = 1
    Else
    If (int2 > 0) And (Hp2 < Hp2max / 3) And (nombre2 = "Misaka") Then
        Call cargar_imagen(2, 3)
        MsgBox "Misaka usa rayo"
        skill = 1
    Else
    If nombre2 = "Annie" And Hp2 < Hp2max / 4 Then
        MsgBox "Annie usa lluevia de fuego"
        int2 = "100"
        skill = 1
    Else
        zz = 0
    End If
    End If
    End If
Else

If zz = 3 Then  'Para skill de daño fisico con efectos
    If nombre2 = "jorgito" Then
        MsgBox nombre1 + " esta envenenado"
        tt = Tablero.turno 'guarda el turno del loco envenenado
        Timepoison = 4
        skill = 1
    End If
End If
End If
End If

    
End Function

Private Sub alteraciones()
    
    If nombre1 = "Zero" And atributos.Zero_bersek = 0 Then
        Hp1 = Hp1 - 6
        MsgBox "Zero esta sufriendo daño continuo"
    End If
    
    If tt = Tablero.turno And Timepoison > 0 Then
        Hp1 = Hp1 - 11
        MsgBox "Daño por veneno"
        Timepoison = Timepoison - 1
    End If
    If nombre2 = "Annie" And Hp2 > Hp2max / 4 Then
        MsgBox "Annie quema " + daño_magico + " de hp a sus enemigos"
    End If
    
End Sub

Private Sub atacar_click()

    Call cargar_efecto(1, 1)
    MsgBox nombre1 + " ha hecho " + daño(1) + " de daño"
    Defender_Click
    
End Sub

Private Sub Defender_Click()
    
    alteraciones
    If Hp2 > 0 Then
        Call cargar_efecto(1, 2)
        MsgBox nombre1 + " ha sufrido " + daño(2) + " de daño"
    End If
    salir_Click
    
End Sub

Private Sub enemigo_change()

If enemigo <> -5 Then
        
       Call cargar_imagen(1, 1)
       Call cargar_imagen(2, 1)

       For i = 0 To atributos.lista.ListCount - 1
        Item = atributos.lista.List(i)
        nombre = (Left(Item, InStr(Item, ";") - 1))
        Item = Mid(Item, InStr(Item, ";") + 1)
            If nombre1 = nombre Then
                Hp1 = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                hp1max = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                int1 = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                daño1 = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                defensa1 = Item
                pos1 = i 'pos actual del pj1 en la lista
            Else
            If nombre2 = nombre Then
                Hp2 = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                Hp2max = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                int2 = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                daño2 = Left(Item, InStr(Item, ";") - 1)
                Item = Mid(Item, InStr(Item, ";") + 1)
                defensa2 = Item
                pos2 = i 'pos actual del pj1 en la lista
            End If
            End If
       Next
       
       color (1)
       color (2)
    
End If

End Sub

Private Sub cargar_imagen(pj As Integer, zz As Integer)

If pj = 2 Then
If zz = 1 Then
    If enemigo = 0 Then
        nombre2 = "Misaka"
        io = App.Path + "\Imagenes\Misaka.mikoto.jpg"
    Else
    If enemigo = 1 Then
        nombre2 = "Saske"
        gif = App.Path + "\Imagenes\sasuke.gif"
    Else
    If enemigo = -1 Then
        nombre2 = "jorgito"
        io = App.Path + "\Imagenes\jorgito.jpg"
    Else
    If enemigo = 5 Then
        nombre2 = "Annie"
        io = App.Path + "\Imagenes\annie.jpg"
        nombre2.ForeColor = RGB(255, 0, 0) 'rojo
    End If
    End If
    End If
    End If
End If
If zz = 2 Then
    If enemigo = 0 Then
        io = App.Path + "\Imagenes\Misaka.mikotob.jpg"
    End If
    If enemigo = -1 Then
        io = App.Path + "\Imagenes\jorgitob.jpg"
    End If
    If enemigo = 5 Then
        io = App.Path + "\Imagenes\annieb.jpg"
    End If
End If
If zz = 3 Then
    If enemigo = 0 Then
        io = App.Path + "\Imagenes\Misaka.jpg"
    End If
End If
P2 = LoadPicture(io)
End If

If pj = 1 Then
If (zz = 1) Then
    If nombre1 = "Zero" And atributos.Zero_bersek = 0 Then
        zero = App.Path + "\Imagenes\17.jpg"
    Else
    If nombre1 = "Zero" Then
        zero = App.Path + "\Imagenes\16.jpg"
    End If
    End If
    If nombre1 = "Megaman" Then
        zero = App.Path + "\Imagenes\143.jpg"
    End If
End If
If zz = 2 Then
    If nombre1 = "Zero" Then
        zero = App.Path + "\Imagenes\16b.jpg"
    Else
    If nombre1 = "Megaman" Then
        zero = App.Path + "\Imagenes\143b.jpg"
    End If
    End If
End If
P1 = LoadPicture(zero)
End If

End Sub

Private Sub color(zz)

If zz = 2 Then
    If Hp2 < (Hp2max / 3) Then
        Hp2.ForeColor = RGB(255, 0, 0) 'rojo
    Else
    If Hp2 < (Hp2max / 2) Then
        Hp2.ForeColor = RGB(255, 210, 0) 'amarillo
    Else
        Hp2.ForeColor = RGB(0, 0, 0) 'negro
    End If
    End If
Else

If zz = 1 Then
    If Hp1 < (hp1max / 3) Then
        Hp1.ForeColor = RGB(255, 0, 0) 'rojo
        Tablero.hp.ForeColor = RGB(255, 0, 0)
        Tablero.hpmax.ForeColor = RGB(255, 0, 0)
    Else
    If Hp1 < (hp1max / 2) Then
        Hp1.ForeColor = RGB(255, 210, 0) 'amarillo
        Tablero.hp.ForeColor = RGB(255, 210, 0)
        Tablero.hpmax.ForeColor = RGB(255, 210, 0)
    Else
        Hp1.ForeColor = RGB(0, 0, 0) 'negro
        Tablero.hp.ForeColor = RGB(0, 0, 0)
        Tablero.hpmax.ForeColor = RGB(0, 0, 0)
    End If
    End If
End If
End If

End Sub

Private Sub guardar_estado()
'Variables se guardan como strings
atributos.lista.List(pos1) = nombre1 + ";" + Hp1 + ";" + hp1max + ";" + int1 + ";" + daño1 + ";" + defensa1
atributos.lista.List(pos2) = nombre2 + ";" + Hp2 + ";" + Hp2max + ";" + int2 + ";" + daño2 + ";" + defensa2
End Sub

Private Sub Hp1_Change()

    If Hp1 < 0 Then
        Hp1 = 0
        Call cargar_efecto(1, 3)
        If nombre1 = "Zero" And atributos.save = 2 Then
            Unload Me
        End If
        If nombre1 = "Megaman" And atributos.save = 1 Then
            Unload Me
        End If
        If nombre1 = "Zero" Then
            atributos.save = 1
        Else
            atributos.save = 2
        End If
    End If
    
End Sub

Private Sub Hp2_Change()

    If Hp2 < 0 Then
        Hp2 = 0
        Call cargar_efecto(2, 3)
        If nombre2 = "Annie" Then
            Tablero.Sonido.URL = App.Path + "\Sound\Or4nges - Crow Machine.mp3"
        End If
        Tablero.exp = Tablero.exp + 15
    End If
    
End Sub

Private Sub salir_Click()
    guardar_estado
    Tablero.hp = Hp1
    Tablero.hpmax = hp1max
    Unload Me
    enemigo = -5
End Sub

