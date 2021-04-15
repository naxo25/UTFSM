VERSION 5.00
Begin VB.Form Estado_seleccionado 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   5700
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7095
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5700
   ScaleWidth      =   7095
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton salir 
      Caption         =   "Salir"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4560
      TabIndex        =   6
      Top             =   3960
      Width           =   1575
   End
   Begin VB.TextBox ss 
      Height          =   495
      Left            =   240
      TabIndex        =   5
      Top             =   3840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label Label 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   855
      Left            =   120
      TabIndex        =   12
      Top             =   4680
      Width           =   6855
   End
   Begin VB.Label hpmax 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   6480
      TabIndex        =   11
      Top             =   1080
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "Ataque"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   3720
      TabIndex        =   10
      Top             =   2520
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Sp"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   3720
      TabIndex        =   9
      Top             =   1800
      Width           =   1335
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Hp"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   3720
      TabIndex        =   8
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label Label4 
      Caption         =   "Defensa"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   3720
      TabIndex        =   7
      Top             =   3240
      Width           =   1335
   End
   Begin VB.Label hp 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   5280
      TabIndex        =   4
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label inteligencia 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   5280
      TabIndex        =   3
      Top             =   1800
      Width           =   1695
   End
   Begin VB.Label daño 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   5280
      TabIndex        =   2
      Top             =   2520
      Width           =   1695
   End
   Begin VB.Label defensa 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   5280
      TabIndex        =   1
      Top             =   3240
      Width           =   1695
   End
   Begin VB.Label nombre 
      Alignment       =   2  'Center
      Caption         =   "Nombre"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   3720
      TabIndex        =   0
      Top             =   360
      Width           =   3255
   End
   Begin VB.Image P1 
      Height          =   4095
      Left            =   240
      Top             =   240
      Width           =   3375
   End
End
Attribute VB_Name = "Estado_seleccionado"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ss_change()
    
    If ss = 0 Then
        zero = App.Path + "\Imagenes\16.jpg"
        Item = atributos.lista.List(0)
        nombre.ForeColor = RGB(255, 0, 0)
    End If
    If ss = 1 Then
        zero = App.Path + "\Imagenes\143.jpg"
        Item = atributos.lista.List(1)
        nombre.ForeColor = RGB(0, 0, 255)
    End If
    P1.Stretch = True
    P1 = LoadPicture(zero)
    nombre = Left(Item, InStr(Item, ";") - 1)
    Item = Mid(Item, InStr(Item, ";") + 1)
    hp = Left(Item, InStr(Item, ";") - 1)
    Item = Mid(Item, InStr(Item, ";") + 1)
    hpmax = Left(Item, InStr(Item, ";") - 1)
    color_hp
    hpmax = "/" + Left(Item, InStr(Item, ";") - 1)
    Item = Mid(Item, InStr(Item, ";") + 1)
    inteligencia = Left(Item, InStr(Item, ";") - 1)
    Item = Mid(Item, InStr(Item, ";") + 1)
    daño = Left(Item, InStr(Item, ";") - 1)
    Item = Mid(Item, InStr(Item, ";") + 1)
    defensa = Item
    
End Sub
Private Sub color_hp()

  If hp < hpmax / 3 Then
      hp.ForeColor = RGB(255, 0, 0) 'rojo
      hpmax.ForeColor = RGB(255, 0, 0)
  Else
    If hp < hpmax / 2 Then
      hp.ForeColor = RGB(255, 210, 0) 'amarillo
      hpmax.ForeColor = RGB(255, 210, 0)
  Else
      hp.ForeColor = RGB(0, 0, 0) 'black
      hpmax.ForeColor = RGB(0, 0, 0)
  End If
  End If
  
  Dim vh As String
  vh = (hpmax / 3) * 2
  
  If nombre = "Zero" Then
    Label = "Skills: Zero entra en estado Berserk al perder 2/3 (" + vh + ") de vida, aumenta su daño y sufre daño"
  Else
    Label = "Skills: Megaman usa power up al perder 2/3 de hp (" + vh + ") de vida, aumenta su defensa, ataque y vida"
  End If
  
End Sub

Private Sub salir_Click()
    Unload Me
    Tablero.Seleccion.Visible = False
    Tablero.Text1.SetFocus
End Sub
