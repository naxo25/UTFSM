VERSION 5.00
Begin VB.Form atributos 
   Caption         =   "Form1"
   ClientHeight    =   6705
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9975
   LinkTopic       =   "Form1"
   ScaleHeight     =   6705
   ScaleWidth      =   9975
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lista 
      Height          =   2205
      Left            =   360
      TabIndex        =   2
      Top             =   1560
      Width           =   8655
   End
   Begin VB.Label salir 
      Height          =   255
      Left            =   8160
      TabIndex        =   10
      Top             =   360
      Width           =   495
   End
   Begin VB.Label Zero_bersek 
      Height          =   495
      Left            =   5040
      TabIndex        =   9
      Top             =   240
      Width           =   615
   End
   Begin VB.Label Valores 
      Caption         =   "Nombre/Hp/HpMax/Int/Sp/SpMax/Ataque/Defensa"
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   1320
      Width           =   9135
   End
   Begin VB.Label Power_up 
      Height          =   495
      Left            =   4080
      TabIndex        =   7
      Top             =   240
      Width           =   615
   End
   Begin VB.Label pos2ant 
      Height          =   375
      Left            =   2400
      TabIndex        =   6
      Top             =   5400
      Width           =   1335
   End
   Begin VB.Label pos2 
      Height          =   375
      Left            =   2280
      TabIndex        =   5
      Top             =   4080
      Width           =   1335
   End
   Begin VB.Label pos1ant 
      Height          =   375
      Left            =   480
      TabIndex        =   4
      Top             =   5400
      Width           =   1335
   End
   Begin VB.Label save 
      Height          =   495
      Left            =   2040
      TabIndex        =   3
      Top             =   240
      Width           =   1575
   End
   Begin VB.Label pos 
      Height          =   375
      Left            =   1320
      TabIndex        =   1
      Top             =   4800
      Width           =   1335
   End
   Begin VB.Label pos1 
      Height          =   375
      Left            =   480
      TabIndex        =   0
      Top             =   4080
      Width           =   1335
   End
End
Attribute VB_Name = "atributos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    atributos.salir = 0 '?
    save = 0 'save guarda quien esta vivo en la seccion temporal
    Power_up = 1
    Zero_bersek = 1
End Sub

Private Sub exit_change()
    If salir = 1 Then
        Unload Me
    End If
End Sub
