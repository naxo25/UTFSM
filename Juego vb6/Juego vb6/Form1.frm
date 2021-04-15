VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form Tablero 
   BackColor       =   &H8000000E&
   Caption         =   "Form1"
   ClientHeight    =   7815
   ClientLeft      =   225
   ClientTop       =   555
   ClientWidth     =   12375
   LinkTopic       =   "Form1"
   ScaleHeight     =   7815
   ScaleWidth      =   12375
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Opciones 
      Caption         =   "Opciones"
      Height          =   3255
      Left            =   6840
      TabIndex        =   16
      Top             =   4680
      Visible         =   0   'False
      Width           =   2295
   End
   Begin VB.Frame Seleccion 
      BackColor       =   &H0000FF00&
      Caption         =   "Selección"
      Height          =   1215
      Left            =   7680
      TabIndex        =   13
      Top             =   480
      Width           =   1935
      Begin VB.CommandButton z 
         BackColor       =   &H80000010&
         Caption         =   "Zero"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   0
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   15
         Top             =   720
         Width           =   1815
      End
      Begin VB.CommandButton x 
         BackColor       =   &H80000010&
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   0
         TabIndex        =   14
         Top             =   240
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H80000007&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   7815
      Left            =   9000
      TabIndex        =   17
      Top             =   0
      Width           =   135
   End
   Begin VB.Frame Status 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Status"
      Height          =   3255
      Left            =   9120
      TabIndex        =   6
      Top             =   4560
      Width           =   3255
      Begin VB.Label exp 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C0C0&
         Height          =   495
         Left            =   360
         TabIndex        =   12
         Top             =   1920
         Width           =   2655
      End
      Begin VB.Label Inteligencia 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   495
         Left            =   360
         TabIndex        =   11
         Top             =   1440
         Width           =   2655
      End
      Begin VB.Label hpmax 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1800
         TabIndex        =   10
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "/"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1680
         TabIndex        =   9
         Top             =   960
         Width           =   135
      End
      Begin VB.Label hp 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   8
         Top             =   960
         Width           =   1335
      End
      Begin VB.Label nombre 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   7
         Top             =   360
         Width           =   2775
      End
   End
   Begin VB.CommandButton estado 
      Caption         =   "Estado"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   9480
      TabIndex        =   4
      Top             =   480
      Width           =   2655
   End
   Begin VB.CommandButton salir 
      Caption         =   "Salir"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   9480
      TabIndex        =   3
      Top             =   1440
      Width           =   2655
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   12480
      TabIndex        =   2
      Top             =   4080
      Width           =   495
   End
   Begin VB.Frame frameind 
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Caption         =   "Frame2"
      Height          =   1215
      Left            =   0
      TabIndex        =   19
      Top             =   600
      Width           =   9135
      Begin VB.Image i15 
         Height          =   615
         Left            =   0
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i23 
         Height          =   615
         Left            =   4800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i44 
         Height          =   615
         Left            =   8400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i43 
         Height          =   615
         Left            =   7800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i42 
         Height          =   615
         Left            =   7200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i41 
         Height          =   615
         Left            =   6600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i40 
         Height          =   615
         Left            =   6000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i39 
         Height          =   615
         Left            =   5400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i38 
         Height          =   615
         Left            =   4800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i37 
         Height          =   615
         Left            =   4200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i36 
         Height          =   615
         Left            =   3600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i35 
         Height          =   615
         Left            =   3000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i34 
         Height          =   615
         Left            =   2400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i33 
         Height          =   615
         Left            =   1800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i32 
         Height          =   615
         Left            =   1200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i31 
         Height          =   615
         Left            =   600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i30 
         Height          =   615
         Left            =   0
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i25 
         Height          =   615
         Left            =   6000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i26 
         Height          =   615
         Left            =   6600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i27 
         Height          =   615
         Left            =   7200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i28 
         Height          =   615
         Left            =   7800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i29 
         Height          =   615
         Left            =   8400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i17 
         Height          =   615
         Left            =   1200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i18 
         Height          =   615
         Left            =   1800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i19 
         Height          =   615
         Left            =   2400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i20 
         Height          =   615
         Left            =   3000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i21 
         Height          =   615
         Left            =   3600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i22 
         Height          =   615
         Left            =   4200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i24 
         Height          =   615
         Left            =   5400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i16 
         Height          =   615
         Left            =   600
         Top             =   0
         Width           =   615
      End
   End
   Begin VB.Frame frame40 
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Caption         =   "Frame2"
      Height          =   2415
      Left            =   0
      TabIndex        =   20
      Top             =   1800
      Width           =   9135
      Begin VB.Frame frameenotro 
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         Caption         =   "Frame2"
         Height          =   1215
         Left            =   0
         TabIndex        =   21
         Top             =   1200
         Width           =   9135
         Begin VB.Image i83 
            Height          =   615
            Left            =   4800
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i75 
            Height          =   615
            Left            =   0
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i76 
            Height          =   615
            Left            =   600
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i84 
            Height          =   615
            Left            =   5400
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i82 
            Height          =   615
            Left            =   4200
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i81 
            Height          =   615
            Left            =   3600
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i80 
            Height          =   615
            Left            =   3000
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i79 
            Height          =   615
            Left            =   2400
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i78 
            Height          =   615
            Left            =   1800
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i77 
            Height          =   615
            Left            =   1200
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i89 
            Height          =   615
            Left            =   8400
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i88 
            Height          =   615
            Left            =   7800
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i87 
            Height          =   615
            Left            =   7200
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i86 
            Height          =   615
            Left            =   6600
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i85 
            Height          =   615
            Left            =   6000
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i90 
            Height          =   615
            Left            =   0
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i91 
            Height          =   615
            Left            =   600
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i92 
            Height          =   615
            Left            =   1200
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i93 
            Height          =   615
            Left            =   1800
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i94 
            Height          =   615
            Left            =   2400
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i95 
            Height          =   615
            Left            =   3000
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i96 
            Height          =   615
            Left            =   3600
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i97 
            Height          =   615
            Left            =   4200
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i98 
            Height          =   615
            Left            =   4800
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i99 
            Height          =   615
            Left            =   5400
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i100 
            Height          =   615
            Left            =   6000
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i101 
            Height          =   615
            Left            =   6600
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i102 
            Height          =   615
            Left            =   7200
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i103 
            Height          =   615
            Left            =   7800
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i104 
            Height          =   615
            Left            =   8400
            Top             =   600
            Width           =   615
         End
      End
      Begin VB.Image i53 
         Height          =   615
         Left            =   4800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i45 
         Height          =   615
         Left            =   0
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i46 
         Height          =   615
         Left            =   600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i54 
         Height          =   615
         Left            =   5400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i52 
         Height          =   615
         Left            =   4200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i51 
         Height          =   615
         Left            =   3600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i50 
         Height          =   615
         Left            =   3000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i49 
         Height          =   615
         Left            =   2400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i48 
         Height          =   615
         Left            =   1800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i47 
         Height          =   615
         Left            =   1200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i59 
         Height          =   615
         Left            =   8400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i58 
         Height          =   615
         Left            =   7800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i57 
         Height          =   615
         Left            =   7200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i56 
         Height          =   615
         Left            =   6600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i55 
         Height          =   615
         Left            =   6000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i60 
         Height          =   615
         Left            =   0
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i61 
         Height          =   615
         Left            =   600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i62 
         Height          =   615
         Left            =   1200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i63 
         Height          =   615
         Left            =   1800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i64 
         Height          =   615
         Left            =   2400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i65 
         Height          =   615
         Left            =   3000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i66 
         Height          =   615
         Left            =   3600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i67 
         Height          =   615
         Left            =   4200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i68 
         Height          =   615
         Left            =   4800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i69 
         Height          =   615
         Left            =   5400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i70 
         Height          =   615
         Left            =   6000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i71 
         Height          =   615
         Left            =   6600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i72 
         Height          =   615
         Left            =   7200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i73 
         Height          =   615
         Left            =   7800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i74 
         Height          =   615
         Left            =   8400
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.Frame framee40 
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Caption         =   "Frame2"
      Height          =   2295
      Left            =   0
      TabIndex        =   22
      Top             =   4200
      Width           =   9135
      Begin VB.Frame framenotro 
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         Caption         =   "Frame2"
         Height          =   1215
         Left            =   0
         TabIndex        =   23
         Top             =   1200
         Width           =   9135
         Begin VB.Image Image22 
            Height          =   615
            Left            =   4800
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image146 
            Height          =   615
            Left            =   8400
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image145 
            Height          =   615
            Left            =   7800
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image144 
            Height          =   615
            Left            =   7200
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image143 
            Height          =   615
            Left            =   6600
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image142 
            Height          =   615
            Left            =   6000
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image141 
            Height          =   615
            Left            =   5400
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image140 
            Height          =   615
            Left            =   4800
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image139 
            Height          =   615
            Left            =   4200
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image138 
            Height          =   615
            Left            =   3600
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image137 
            Height          =   615
            Left            =   3000
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image136 
            Height          =   615
            Left            =   2400
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image135 
            Height          =   615
            Left            =   1800
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image134 
            Height          =   615
            Left            =   1200
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image133 
            Height          =   615
            Left            =   600
            Top             =   600
            Width           =   615
         End
         Begin VB.Image i160 
            Height          =   615
            Left            =   0
            Top             =   600
            Width           =   615
         End
         Begin VB.Image Image131 
            Height          =   615
            Left            =   6000
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image130 
            Height          =   615
            Left            =   6600
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image129 
            Height          =   615
            Left            =   7200
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image128 
            Height          =   615
            Left            =   7800
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image127 
            Height          =   615
            Left            =   8400
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image126 
            Height          =   615
            Left            =   1200
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image125 
            Height          =   615
            Left            =   1800
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image124 
            Height          =   615
            Left            =   2400
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image123 
            Height          =   615
            Left            =   3000
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image122 
            Height          =   615
            Left            =   3600
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image121 
            Height          =   615
            Index           =   0
            Left            =   4200
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image120 
            Height          =   615
            Left            =   5400
            Top             =   0
            Width           =   615
         End
         Begin VB.Image Image119 
            Height          =   615
            Left            =   600
            Top             =   0
            Width           =   615
         End
         Begin VB.Image i145 
            Height          =   615
            Left            =   0
            Top             =   0
            Width           =   615
         End
      End
      Begin VB.Image Image206 
         Height          =   615
         Left            =   4800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image175 
         Height          =   615
         Left            =   8400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image174 
         Height          =   615
         Left            =   7800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image173 
         Height          =   615
         Left            =   7200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image172 
         Height          =   615
         Left            =   6600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image171 
         Height          =   615
         Left            =   6000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image170 
         Height          =   615
         Left            =   5400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image169 
         Height          =   615
         Left            =   4800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image168 
         Height          =   615
         Left            =   4200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image167 
         Height          =   615
         Left            =   3600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image166 
         Height          =   615
         Left            =   3000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image165 
         Height          =   615
         Left            =   2400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image164 
         Height          =   615
         Left            =   1800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image163 
         Height          =   615
         Left            =   1200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image162 
         Height          =   615
         Left            =   600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image i130 
         Height          =   615
         Left            =   0
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image160 
         Height          =   615
         Left            =   6000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image159 
         Height          =   615
         Left            =   6600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image158 
         Height          =   615
         Left            =   7200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image157 
         Height          =   615
         Left            =   7800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image156 
         Height          =   615
         Left            =   8400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image155 
         Height          =   615
         Left            =   1200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image154 
         Height          =   615
         Left            =   1800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image153 
         Height          =   615
         Left            =   2400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image152 
         Height          =   615
         Left            =   3000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image151 
         Height          =   615
         Left            =   3600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image150 
         Height          =   615
         Left            =   4200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image149 
         Height          =   615
         Left            =   5400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image148 
         Height          =   615
         Left            =   600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i105 
         Height          =   615
         Left            =   0
         Top             =   0
         Width           =   615
      End
   End
   Begin VB.Frame frameinde 
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Caption         =   "Frame2"
      Height          =   1215
      Left            =   0
      TabIndex        =   24
      Top             =   6600
      Width           =   9135
      Begin VB.Image Image47 
         Height          =   615
         Left            =   4800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image46 
         Height          =   615
         Left            =   3600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i175 
         Height          =   615
         Left            =   0
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image203 
         Height          =   615
         Left            =   600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image202 
         Height          =   615
         Left            =   5400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image201 
         Height          =   615
         Left            =   4200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image199 
         Height          =   615
         Left            =   3000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image198 
         Height          =   615
         Left            =   2400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image197 
         Height          =   615
         Left            =   1800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image196 
         Height          =   615
         Left            =   1200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image195 
         Height          =   615
         Left            =   8400
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image194 
         Height          =   615
         Left            =   7800
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image193 
         Height          =   615
         Left            =   7200
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image192 
         Height          =   615
         Left            =   6600
         Top             =   0
         Width           =   615
      End
      Begin VB.Image Image191 
         Height          =   615
         Left            =   6000
         Top             =   0
         Width           =   615
      End
      Begin VB.Image i190 
         Height          =   615
         Left            =   0
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image189 
         Height          =   615
         Left            =   600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image188 
         Height          =   615
         Left            =   1200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image187 
         Height          =   615
         Left            =   1800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image186 
         Height          =   615
         Left            =   2400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image185 
         Height          =   615
         Left            =   3000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image184 
         Height          =   615
         Left            =   3600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image183 
         Height          =   615
         Left            =   4200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image182 
         Height          =   615
         Left            =   4800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image181 
         Height          =   615
         Left            =   5400
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image180 
         Height          =   615
         Left            =   6000
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image179 
         Height          =   615
         Left            =   6600
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image178 
         Height          =   615
         Left            =   7200
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image177 
         Height          =   615
         Left            =   7800
         Top             =   600
         Width           =   615
      End
      Begin VB.Image Image176 
         Height          =   615
         Left            =   8400
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.Image i0 
      Height          =   615
      Left            =   0
      Top             =   0
      Width           =   615
   End
   Begin VB.Label muestra 
      Height          =   375
      Left            =   11760
      TabIndex        =   18
      Top             =   3960
      Width           =   495
   End
   Begin VB.Image i14 
      Height          =   615
      Left            =   8400
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i13 
      Height          =   615
      Left            =   7800
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i1 
      Height          =   615
      Left            =   600
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i2 
      Height          =   615
      Left            =   1200
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i3 
      Height          =   615
      Left            =   1800
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i4 
      Height          =   615
      Left            =   2400
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i5 
      Height          =   615
      Left            =   3000
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i6 
      Height          =   615
      Left            =   3600
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i7 
      Height          =   615
      Left            =   4200
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i8 
      Height          =   615
      Left            =   4800
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i9 
      Height          =   615
      Left            =   5400
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i10 
      Height          =   615
      Left            =   6000
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i11 
      Height          =   615
      Left            =   6600
      Top             =   0
      Width           =   615
   End
   Begin VB.Image i12 
      Height          =   615
      Left            =   7200
      Top             =   0
      Width           =   615
   End
   Begin VB.Label turno 
      Height          =   495
      Left            =   12480
      TabIndex        =   5
      Top             =   1440
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Line Line1 
      BorderColor     =   &H0000FF00&
      X1              =   9240
      X2              =   12480
      Y1              =   4560
      Y2              =   4560
   End
   Begin WMPLibCtl.WindowsMediaPlayer Sonido 
      Height          =   615
      Left            =   12480
      TabIndex        =   1
      Top             =   3360
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
      _cy             =   1085
   End
   Begin VB.Label posicion 
      Height          =   495
      Left            =   12480
      TabIndex        =   0
      Top             =   2160
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FFFFFF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      Height          =   7815
      Left            =   9120
      Top             =   0
      Width           =   3255
   End
   Begin VB.Image Fondo 
      Height          =   7815
      Left            =   0
      Top             =   0
      Width           =   9255
   End
End
Attribute VB_Name = "Tablero"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim pos, posant, jefemusic, vida As Integer
Dim pj, nada As String
Dim batle As Byte

Private Sub estado_Click()
    Seleccion.Visible = True
End Sub

Private Sub Form_Load()

    batle = 0
    vida = 1
    jefemusic = 1
    Seleccion.Visible = False

    Fondo.Stretch = True
    i0.Stretch = True
    i1.Stretch = True
    i2.Stretch = True
    i3.Stretch = True
    i4.Stretch = True
    i5.Stretch = True
    i6.Stretch = True
    i7.Stretch = True
    i8.Stretch = True
    i9.Stretch = True
    i10.Stretch = True
    i11.Stretch = True
    i12.Stretch = True
    i13.Stretch = True
    i14.Stretch = True
    i15.Stretch = True
    i16.Stretch = True
    i17.Stretch = True
    i18.Stretch = True
    i19.Stretch = True
    i20.Stretch = True
    i21.Stretch = True
    i22.Stretch = True
    i23.Stretch = True
    i24.Stretch = True
    i25.Stretch = True
    i26.Stretch = True
    i27.Stretch = True
    i28.Stretch = True
    i29.Stretch = True
    i30.Stretch = True
    i31.Stretch = True
    i32.Stretch = True
    i33.Stretch = True
    i34.Stretch = True
    i35.Stretch = True
    i36.Stretch = True
    i37.Stretch = True
    i38.Stretch = True
    i39.Stretch = True
    i40.Stretch = True
    i41.Stretch = True
    i42.Stretch = True
    i43.Stretch = True
    i44.Stretch = True
    i45.Stretch = True
    i46.Stretch = True
    i47.Stretch = True
    i48.Stretch = True
    i49.Stretch = True
    i50.Stretch = True
    i51.Stretch = True
    i52.Stretch = True
    i53.Stretch = True
    i54.Stretch = True
    i55.Stretch = True
    i56.Stretch = True
    i57.Stretch = True
    i58.Stretch = True
    i59.Stretch = True
    i60.Stretch = True
    i61.Stretch = True
    i62.Stretch = True
    i63.Stretch = True
    i64.Stretch = True
    i65.Stretch = True
    i66.Stretch = True
    i67.Stretch = True
    i68.Stretch = True
    i69.Stretch = True
    i70.Stretch = True
    i71.Stretch = True
    i72.Stretch = True
    i73.Stretch = True
    i74.Stretch = True
    i75.Stretch = True
    i76.Stretch = True
    i77.Stretch = True
    i78.Stretch = True
    i79.Stretch = True
    i80.Stretch = True
    i81.Stretch = True
    i82.Stretch = True
    i83.Stretch = True
    i84.Stretch = True
    i85.Stretch = True
    i86.Stretch = True
    i87.Stretch = True
    i88.Stretch = True
    i89.Stretch = True
    i90.Stretch = True
    i91.Stretch = True
    i92.Stretch = True
    i93.Stretch = True
    i94.Stretch = True
    i95.Stretch = True
    i96.Stretch = True
    i97.Stretch = True
    i98.Stretch = True
    i99.Stretch = True
    i100.Stretch = True
    
    turno = 0
    pos = 20
    atributos.pos1 = 20
    atributos.pos2 = 31
    atributos.pos1ant = 20
    atributos.pos2ant = 31
    pj = App.Path + "\Imagenes\16.jpg"
    i20.Picture = LoadPicture(pj)
    nada = App.Path + "\Imagenes\blanco.jpg"
    pj = App.Path + "\Imagenes\142.jpg"
    i31.Picture = LoadPicture(pj)
    'Fondo = LoadPicture(App.Path + "\Fondos\.jpg")
    i0 = LoadPicture(App.Path + "\Imagenes\misakamikoto.jpg")
    i2 = LoadPicture(App.Path + "\Imagenes\susano.jpg")
    i5 = LoadPicture(App.Path + "\Imagenes\jorgito.jpg")
    i22 = LoadPicture(App.Path + "\Imagenes\la wea vieja.jpg")
    
    Open App.Path + "\Stats\Original.txt" For Input As #1
        While Not EOF(1)
            Line Input #1, bufer
            atributos.lista.AddItem bufer
        Wend
    Close #1
    cargar_estado
    exp = 0
    
End Sub

Private Sub Image92_Click()

End Sub

Private Sub salir_Click()
    Unload Me
    Inicio.Show
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)

    determinar_turno
    posant = pos
    If Chr(KeyAscii) = "a" Then
        pos = pos - 1
    Else
    If Chr(KeyAscii) = "s" Then
        pos = pos + 15
    Else
    If Chr(KeyAscii) = "d" Then
        pos = pos + 1
    Else
    If Chr(KeyAscii) = "w" Then
        pos = pos - 15
    End If
    End If
    End If
    End If
    movimientos
    keyascci = 0

End Sub

Private Sub determinar_turno()

    If turno = 0 Then
        pos = atributos.pos1
    Else
    If turno = 1 Then
        pos = atributos.pos2
    End If
    End If

End Sub


Private Sub movimientos()

If ((pos <> atributos.pos1) And (pos <> atributos.pos2)) Then
    tt = 0
    cargar_estado 'del pj en turno
    evento
    coordenadas
    atributos.pos = pos 'cuando termino el turno cambio la posicion e invoco atributos.pos.change
    switch_turno
    color_hp
    batle = 0
End If

End Sub

Private Sub cargar_estado()

    If turno = 0 Then
        Item = atributos.lista.List(0)
        atributos.pos1 = pos
        atributos.pos1ant = posant
        pj = App.Path + "\Imagenes\16.jpg"
        Batalla.nombre1.ForeColor = RGB(255, 0, 0)
        nombre.ForeColor = RGB(255, 0, 0)
    Else
    If turno = 1 Then
        Item = atributos.lista.List(1)
        atributos.pos2 = pos
        atributos.pos2ant = posant
        pj = App.Path + "\Imagenes\142.jpg"
        Batalla.nombre1.ForeColor = RGB(0, 0, 255)
        nombre.ForeColor = RGB(0, 0, 255)
    End If
    End If
    Batalla.nombre1 = (Left(Item, InStr(Item, ";") - 1))
    nombre = Batalla.nombre1
    Item = Mid(Item, InStr(Item, ";") + 1)
    hp = Left(Item, InStr(Item, ";") - 1)
    Item = Mid(Item, InStr(Item, ";") + 1)
    hpmax = Left(Item, InStr(Item, ";") - 1)
    Item = Mid(Item, InStr(Item, ";") + 1)
    Inteligencia = Left(Item, InStr(Item, ";") - 1)
    nombre = Batalla.nombre1
    
End Sub

Private Sub evento()

Select Case pos
    Case 0
        Batalla.enemigo = 0
        Batalla.Show
    Case 2
        Batalla.enemigo = 1
        Batalla.Show
    Case 5
        Batalla.enemigo = -1
        Batalla.Show
    Case 22
        Batalla.enemigo = 5
        Batalla.Show
            If jefemusic = 1 Then
                Sonido.URL = App.Path + "\Sound\jetstream.mp3"
                jefemusic = 0
            End If
End Select
    
    If (turno = 0) And (Batalla.enemigo <> -5) Then
        atributos.pos1 = posant
        batle = 1
    Else
    If (turno = 1) And (Batalla.enemigo <> -5) Then
        atributos.pos2 = posant
        batle = 1
    End If
    End If
    
End Sub

Private Sub coordenadas()

If batle = 0 Then

Select Case pos
    
    Case 0
            i0 = LoadPicture(pj)
            Select Case posant
            Case 15
                i15 = LoadPicture(nada)
            Case 1
                i1 = LoadPicture(nada)
            End Select
    Case 1
            i1 = LoadPicture(pj)
            Select Case posant
            Case 0
                i0 = LoadPicture(nada)
            Case 2
                i2 = LoadPicture(nada)
            Case 16
                i16 = LoadPicture(nada)
            End Select
    Case 2
            i2 = LoadPicture(pj)
            Select Case posant
            Case 1
                i1 = LoadPicture(nada)
            Case 3
                i3 = LoadPicture(nada)
            Case 17
                i17 = LoadPicture(nada)
            End Select
    Case 3
            i3 = LoadPicture(pj)
            Select Case posant
            Case 2
                i2 = LoadPicture(nada)
            Case 4
                i4 = LoadPicture(nada)
            Case 18
                i18 = LoadPicture(nada)
            End Select
    Case 4
            i4 = LoadPicture(pj)
            Select Case posant
            Case 3
                i3 = LoadPicture(nada)
            Case 5
                i5 = LoadPicture(nada)
            Case 19
                i19 = LoadPicture(nada)
            End Select
    Case 5
            i5 = LoadPicture(pj)
            Select Case posant
            Case 4
                i4 = LoadPicture(nada)
            Case 6
                i6 = LoadPicture(nada)
            Case 20
                i20 = LoadPicture(nada)
            End Select
    Case 6
            i6 = LoadPicture(pj)
            Select Case posant
            Case 5
                i5 = LoadPicture(nada)
            Case 7
                i7 = LoadPicture(nada)
            Case 21
                i21 = LoadPicture(nada)
            End Select
    Case 14
            i14 = LoadPicture(pj)
            Select Case posant
            Case 13
                i13 = LoadPicture(nada)
            Case 29
                i29 = LoadPicture(nada)
            End Select
    Case 15
            i15 = LoadPicture(pj)
            Select Case posant
            Case 0
                i0 = LoadPicture(nada)
            Case 16
                i16 = LoadPicture(nada)
            Case 30
                i30 = LoadPicture(nada)
            End Select
    Case 16
            i16 = LoadPicture(pj)
            Select Case posant
            Case 1
                i1 = LoadPicture(nada)
            Case 31
                i31 = LoadPicture(nada)
            Case 15
                i15 = LoadPicture(nada)
            Case 17
                i17 = LoadPicture(nada)
            End Select
    Case 17
            i17 = LoadPicture(pj)
            Select Case posant
            Case 2
                i2 = LoadPicture(nada)
            Case 32
                i32 = LoadPicture(nada)
            Case 16
                i16 = LoadPicture(nada)
            Case 18
                i18 = LoadPicture(nada)
            End Select
    Case 18
            i18 = LoadPicture(pj)
            Select Case posant
            Case 3
                i3 = LoadPicture(nada)
            Case 33
                i33 = LoadPicture(nada)
            Case 17
                i17 = LoadPicture(nada)
            Case 19
                i19 = LoadPicture(nada)
            End Select
    Case 19
            i19 = LoadPicture(pj)
            Select Case posant
            Case 4
                i4 = LoadPicture(nada)
            Case 34
                i34 = LoadPicture(nada)
            Case 18
                i18 = LoadPicture(nada)
            Case 20
                i20 = LoadPicture(nada)
            End Select
    Case 20
            i20 = LoadPicture(pj)
            Select Case posant
            Case 19
                i19 = LoadPicture(nada)
            Case 35
                i35 = LoadPicture(nada)
            Case 21
                i21 = LoadPicture(nada)
            Case 5
                i5 = LoadPicture(nada)
            End Select
    Case 21
            i21 = LoadPicture(pj)
            Select Case posant
            Case 20
                i20 = LoadPicture(nada)
            Case 22
                i22 = LoadPicture(nada)
            Case 36
                i36 = LoadPicture(nada)
            Case 6
                i6 = LoadPicture(nada)
            End Select
    Case 22
            i22 = LoadPicture(pj)
            Select Case posant
            Case 7
                i7 = LoadPicture(nada)
            Case 37
                i37 = LoadPicture(nada)
            Case 21
                i21 = LoadPicture(nada)
            Case 23
                i23 = LoadPicture(nada)
            End Select
    Case 29
            i29 = LoadPicture(pj)
            Select Case posant
            Case 14
                i14 = LoadPicture(nada)
            Case 44
                i44 = LoadPicture(nada)
            Case 28
                i28 = LoadPicture(nada)
            End Select
    Case 30
            i30 = LoadPicture(pj)
            Select Case posant
            Case 15
                i15 = LoadPicture(nada)
            Case 45
                i45 = LoadPicture(nada)
            Case 31
                i31 = LoadPicture(nada)
            End Select
    Case 31
            i31 = LoadPicture(pj)
            Select Case posant
            Case 16
                i16 = LoadPicture(nada)
            Case 46
                i46 = LoadPicture(nada)
            Case 32
                i32 = LoadPicture(nada)
            Case 30
                i30 = LoadPicture(nada)
            End Select
    Case 32
            i32 = LoadPicture(pj)
            Select Case posant
            Case 17
                i17 = LoadPicture(nada)
            Case 47
                i47 = LoadPicture(nada)
            Case 31
                i31 = LoadPicture(nada)
            Case 33
                i33 = LoadPicture(nada)
            End Select
    Case 33
            i33 = LoadPicture(pj)
            Select Case posant
            Case 18
                i18 = LoadPicture(nada)
            Case 48
                i48 = LoadPicture(nada)
            Case 32
                i32 = LoadPicture(nada)
            Case 34
                i34 = LoadPicture(nada)
            End Select
    Case 34
            i34 = LoadPicture(pj)
            Select Case posant
            Case 19
                i19 = LoadPicture(nada)
            Case 49
                i49 = LoadPicture(nada)
            Case 33
                i33 = LoadPicture(nada)
            Case 35
                i35 = LoadPicture(nada)
            End Select
    Case 35
            i35 = LoadPicture(pj)
            Select Case posant
            Case 20
                i20 = LoadPicture(nada)
            Case 50
                i50 = LoadPicture(nada)
            Case 34
                i34 = LoadPicture(nada)
            Case 36
                i36 = LoadPicture(nada)
            End Select
    Case 36
            i36 = LoadPicture(pj)
            Select Case posant
            Case 21
                i21 = LoadPicture(nada)
            Case 51
                i51 = LoadPicture(nada)
            Case 35
                i35 = LoadPicture(nada)
            Case 37
                i37 = LoadPicture(nada)
            End Select
    Case 37
            i37 = LoadPicture(pj)
            Select Case posant
            Case 22
                i22 = LoadPicture(nada)
            Case 52
                i52 = LoadPicture(nada)
            Case 36
                i36 = LoadPicture(nada)
            Case 38
                i38 = LoadPicture(nada)
            End Select
    Case 44
            i44 = LoadPicture(pj)
            Select Case posant
            Case 29
                i29 = LoadPicture(nada)
            Case 59
                i59 = LoadPicture(nada)
            Case 43
                i43 = LoadPicture(nada)
            End Select
    Case 45
            i45 = LoadPicture(pj)
            Select Case posant
            Case 30
                i30 = LoadPicture(nada)
            Case 15
                i15 = LoadPicture(nada)
            Case 44
                i44 = LoadPicture(nada)
            End Select
    Case 46
            i46 = LoadPicture(pj)
            Select Case posant
            Case 45
                i45 = LoadPicture(nada)
            Case 61
                i61 = LoadPicture(nada)
            Case 31
                i31 = LoadPicture(nada)
            Case 47
                i47 = LoadPicture(nada)
            End Select
    Case 47
            i47 = LoadPicture(pj)
            Select Case posant
            Case 46
                i46 = LoadPicture(nada)
            Case 48
                i48 = LoadPicture(nada)
            Case 32
                i32 = LoadPicture(nada)
            Case 62
                i62 = LoadPicture(nada)
            End Select
    Case 48
            i48 = LoadPicture(pj)
            Select Case posant
            Case 47
                i47 = LoadPicture(nada)
            Case 49
                i49 = LoadPicture(nada)
            Case 33
                i33 = LoadPicture(nada)
            Case 63
                i63 = LoadPicture(nada)
            End Select
    Case 49
            i49 = LoadPicture(pj)
            Select Case posant
            Case 34
                i34 = LoadPicture(nada)
            Case 64
                i64 = LoadPicture(nada)
            Case 48
                i48 = LoadPicture(nada)
            Case 50
                i50 = LoadPicture(nada)
            End Select
    Case 50
            i50 = LoadPicture(pj)
            Select Case posant
            Case 49
                i49 = LoadPicture(nada)
            Case 35
                i35 = LoadPicture(nada)
            Case 51
                i51 = LoadPicture(nada)
            Case 65
                i65 = LoadPicture(nada)
            End Select
    Case 51
            i51 = LoadPicture(pj)
            Select Case posant
            Case 66
                i66 = LoadPicture(nada)
            Case 52
                i52 = LoadPicture(nada)
            Case 36
                i36 = LoadPicture(nada)
            Case 50
                i50 = LoadPicture(nada)
            End Select
    Case 52
            i52 = LoadPicture(pj)
            Select Case posant
            Case 67
                i67 = LoadPicture(nada)
            Case 53
                i53 = LoadPicture(nada)
            Case 51
                i51 = LoadPicture(nada)
            Case 37
                i37 = LoadPicture(nada)
            End Select
    Case 59
            i59 = LoadPicture(pj)
            Select Case posant
            Case 44
                i44 = LoadPicture(nada)
            Case 74
                i74 = LoadPicture(nada)
            Case 58
                i58 = LoadPicture(nada)
            Case 60
                i60 = LoadPicture(nada)
            End Select
    Case 60
            i60 = LoadPicture(pj)
            Select Case posant
            Case 45
                i45 = LoadPicture(nada)
            Case 75
                i75 = LoadPicture(nada)
            Case 61
                i61 = LoadPicture(nada)
            End Select
            
End Select
    
End If

End Sub

Private Sub switch_turno()

    If turno = 0 Then
        turno = 1
    Else
        If turno = 1 Then
            turno = 0
        End If
    End If
    
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

End Sub

Private Sub x_Click()
    Estado_seleccionado.ss = 1
    Estado_seleccionado.Show
End Sub

Private Sub Z_Click()
    Estado_seleccionado.ss = 0
    Estado_seleccionado.Show
End Sub
