VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form Inicio 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Form1"
   ClientHeight    =   9030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   14040
   DrawStyle       =   1  'Dash
   FillColor       =   &H0000C0C0&
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   9030
   ScaleWidth      =   14040
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox op 
      Height          =   495
      Left            =   14040
      TabIndex        =   5
      Top             =   4440
      Width           =   495
   End
   Begin VB.Label l2 
      Alignment       =   2  'Center
      BackColor       =   &H0000C000&
      BackStyle       =   0  'Transparent
      Caption         =   "Continuar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   5160
      TabIndex        =   2
      Top             =   6240
      Width           =   3855
   End
   Begin VB.Label l1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Nueva Partida"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   5280
      TabIndex        =   0
      Top             =   5520
      Width           =   3855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "TT  Game"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   48.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1455
      Left            =   3720
      TabIndex        =   6
      Top             =   2040
      Width           =   6735
   End
   Begin WMPLibCtl.WindowsMediaPlayer sonido 
      Height          =   495
      Left            =   960
      TabIndex        =   4
      Top             =   5880
      Visible         =   0   'False
      Width           =   615
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
      _cx             =   1085
      _cy             =   873
   End
   Begin VB.Label l4 
      Alignment       =   2  'Center
      BackColor       =   &H0000C000&
      BackStyle       =   0  'Transparent
      Caption         =   "Salir"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   5160
      TabIndex        =   3
      Top             =   7680
      Width           =   3855
   End
   Begin VB.Label l3 
      Alignment       =   2  'Center
      BackColor       =   &H0000C000&
      BackStyle       =   0  'Transparent
      Caption         =   "Musica"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   5160
      TabIndex        =   1
      Top             =   6960
      Width           =   3855
   End
   Begin VB.Image Z 
      Height          =   4695
      Left            =   0
      Top             =   0
      Width           =   6975
   End
   Begin VB.Image X 
      Height          =   4695
      Left            =   6960
      Top             =   0
      Width           =   7095
   End
   Begin VB.Image zelot 
      Height          =   4455
      Left            =   6960
      Top             =   4680
      Width           =   7095
   End
   Begin VB.Image Annie 
      Height          =   4335
      Left            =   0
      Top             =   4680
      Width           =   6975
   End
End
Attribute VB_Name = "Inicio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim s As Byte
Private Sub Form_Load()
    'sonido.URL = App.Path + "/Videos/Zero_s_Defining_Story.mp4"
    'sonido.URL = App.Path + "/Sound/vvvsong1.mp3"
    Tablero.sonido.URL = App.Path + "/Sound/castle2_track.mp3"
    X.Stretch = True
    Z.Stretch = True
    Annie.Stretch = True
    zelot.Stretch = True
    X.Picture = LoadPicture(App.Path + "\Imagenes\143.jpg")
    Z.Picture = LoadPicture(App.Path + "\Imagenes\16.jpg")
    Annie.Picture = LoadPicture(App.Path + "\Imagenes\annie.jpg")
    zelot.Picture = LoadPicture(App.Path + "\Imagenes\zealot.jpg")
    s = 1
    color
End Sub

Private Sub op_Change()

  If op = "w" Then
     s = s - 1
  End If
  If op = "s" Then
     s = s + 1
  End If
  If s = 0 Then
     s = 1
  Else
  If s = 5 Then
     s = 4
  End If
  End If
  sonido.URL = App.Path + "/Sound/toque.mp3"
  op = ""
  color
  
End Sub

Private Sub color()

  If s = 1 Then
     l1.ForeColor = RGB(255, 255, 0)
     l2.ForeColor = RGB(255, 0, 0)
  End If
  If s = 2 Then
     l1.ForeColor = RGB(255, 0, 0)
     l2.ForeColor = RGB(255, 255, 0)
     l3.ForeColor = RGB(255, 0, 0)
  End If
  If s = 3 Then
     l4.ForeColor = RGB(255, 0, 0)
     l3.ForeColor = RGB(255, 255, 0)
     l2.ForeColor = RGB(255, 0, 0)
  End If
  If s = 4 Then
     l4.ForeColor = RGB(255, 255, 0)
     l3.ForeColor = RGB(255, 0, 0)
  End If
  
End Sub

Private Sub op_KeyPress(KeyAscii As Integer)

  If KeyAscii = 13 Then
    If s = 1 Then
        Unload Me
        Tablero.Show
        Tablero.sonido.URL = App.Path + "\Sound\Or4nges - Crow Machine.mp3"
    End If
    If s = 2 Then
    End If
    If s = 3 Then
    End If
    If s = 4 Then
        End
    End If
  End If

End Sub
