VERSION 5.00
Begin VB.Form frmNovoPrg 
   ClientHeight    =   8580
   ClientLeft      =   1125
   ClientTop       =   1860
   ClientWidth     =   16080
   ForeColor       =   &H80000008&
   KeyPreview      =   -1  'True
   LinkTopic       =   "NovoPrg"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   8580
   ScaleWidth      =   16080
   Begin IRRIG.GPainel Painel 
      Height          =   8550
      Index           =   0
      Left            =   15
      TabIndex        =   34
      TabStop         =   0   'False
      Top             =   15
      Width           =   16050
      _ExtentX        =   28284
      _ExtentY        =   15081
      BevelOuter      =   0
      Stretch         =   -1  'True
      Begin IRRIG.GBotao Botao 
         Height          =   480
         Index           =   14
         Left            =   14475
         TabIndex        =   33
         Top             =   75
         Width           =   1245
         _ExtentX        =   0
         _ExtentY        =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Imprimir"
         CaptionOffset   =   50
      End
      Begin IRRIG.GBotao Botao 
         Height          =   480
         Index           =   13
         Left            =   14475
         TabIndex        =   32
         TabStop         =   0   'False
         Top             =   75
         Width           =   1245
         _ExtentX        =   0
         _ExtentY        =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Imprimir"
         CaptionOffset   =   50
      End
      Begin IRRIG.GBotao Botao 
         Height          =   480
         Index           =   12
         Left            =   11520
         TabIndex        =   29
         TabStop         =   0   'False
         Top             =   75
         Width           =   1605
         _ExtentX        =   0
         _ExtentY        =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Gerar Pedido"
         CaptionOffset   =   50
      End
      Begin IRRIG.GBotao Botao 
         Height          =   480
         Index           =   11
         Left            =   13155
         TabIndex        =   27
         TabStop         =   0   'False
         Top             =   75
         Width           =   1245
         _ExtentX        =   0
         _ExtentY        =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Duplicar"
         CaptionOffset   =   50
      End
      Begin IRRIG.GCpMM mmCampo 
         Height          =   1650
         Index           =   0
         Left            =   120
         TabIndex        =   35
         TabStop         =   0   'False
         Top             =   675
         Width           =   1695
         _ExtentX        =   0
         _ExtentY        =   0
         Locked          =   -1  'True
         ScrollBars      =   0   'False
         Appearance      =   0
         BorderStyle     =   0
         BeginProperty CaptionFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.CommandButton bottxtCampo0 
         Height          =   270
         Index           =   1
         Left            =   6765
         Style           =   1  'Graphical
         TabIndex        =   38
         TabStop         =   0   'False
         Top             =   1650
         Width           =   255
      End
      Begin VB.CommandButton bottxtCampo0 
         Height          =   270
         Index           =   2
         Left            =   6510
         Style           =   1  'Graphical
         TabIndex        =   39
         TabStop         =   0   'False
         Top             =   1650
         Width           =   255
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   0
         Left            =   1950
         TabIndex        =   6
         Top             =   1650
         Width           =   4545
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   1
         Left            =   12195
         MaxLength       =   12
         TabIndex        =   9
         Top             =   1635
         Width           =   1155
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   2
         Left            =   13455
         MaxLength       =   10
         TabIndex        =   10
         Top             =   1635
         Width           =   735
      End
      Begin VB.CommandButton bottxtCampo3 
         Height          =   270
         Index           =   0
         Left            =   15420
         Style           =   1  'Graphical
         TabIndex        =   44
         TabStop         =   0   'False
         Top             =   1650
         Width           =   255
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   14250
         MaxLength       =   10
         TabIndex        =   11
         Top             =   1650
         Width           =   1155
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   4
         Left            =   1935
         MaxLength       =   60
         TabIndex        =   3
         Top             =   1095
         Width           =   5100
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   5
         Left            =   7095
         MaxLength       =   100
         TabIndex        =   8
         Top             =   1635
         Width           =   4980
      End
      Begin VB.CommandButton bottxtCampo6 
         Height          =   270
         Index           =   2
         Left            =   11805
         Style           =   1  'Graphical
         TabIndex        =   48
         TabStop         =   0   'False
         Top             =   1650
         Width           =   255
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   7110
         TabIndex        =   7
         Top             =   1650
         Width           =   4680
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   7
         Left            =   1935
         Locked          =   -1  'True
         MaxLength       =   254
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   2175
         Width           =   3360
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   8
         Left            =   1935
         MaxLength       =   40
         TabIndex        =   12
         Top             =   2175
         Width           =   3360
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   9
         Left            =   7095
         MaxLength       =   120
         TabIndex        =   15
         Top             =   2175
         Width           =   4980
      End
      Begin VB.CommandButton bottxtCampo10 
         Height          =   270
         Index           =   2
         Left            =   13080
         Style           =   1  'Graphical
         TabIndex        =   55
         TabStop         =   0   'False
         Top             =   2190
         Width           =   255
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   10
         Left            =   12210
         TabIndex        =   16
         Top             =   2190
         Width           =   855
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   11
         Left            =   5355
         MaxLength       =   14
         TabIndex        =   14
         Top             =   2175
         Width           =   1680
      End
      Begin IRRIG.GCpMM mmCampo 
         Height          =   5535
         Index           =   1
         Left            =   1935
         TabIndex        =   57
         TabStop         =   0   'False
         Top             =   2535
         Width           =   13740
         _ExtentX        =   0
         _ExtentY        =   0
         Locked          =   -1  'True
         ScrollBars      =   0   'False
         Appearance      =   0
         BeginProperty CaptionFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox txtCp 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Index           =   12
         Left            =   4680
         MaxLength       =   254
         MultiLine       =   -1  'True
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   15
         Width           =   915
      End
      Begin VB.CommandButton bottxtCampo13 
         Height          =   270
         Index           =   2
         Left            =   15405
         Style           =   1  'Graphical
         TabIndex        =   59
         TabStop         =   0   'False
         Top             =   2190
         Width           =   255
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   13470
         TabIndex        =   17
         Top             =   2190
         Width           =   1920
      End
      Begin IRRIG.GPainel Painel 
         Height          =   5550
         Index           =   1
         Left            =   135
         TabIndex        =   61
         TabStop         =   0   'False
         Top             =   2535
         Width           =   1650
         _ExtentX        =   2910
         _ExtentY        =   9790
         BevelOuter      =   1
         Stretch         =   -1  'True
         BackColor       =   12648384
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   10
            Left            =   75
            TabIndex        =   31
            TabStop         =   0   'False
            Top             =   4875
            Width           =   1500
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "M. Bocais"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   9
            Left            =   75
            TabIndex        =   30
            TabStop         =   0   'False
            Top             =   4395
            Width           =   1500
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "P. Executivo"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   8
            Left            =   75
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   555
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Salvar"
            CaptionAlign    =   4
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   7
            Left            =   75
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   3915
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Financeiro"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   6
            Left            =   75
            TabIndex        =   24
            TabStop         =   0   'False
            Top             =   3435
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Itens"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   5
            Left            =   75
            TabIndex        =   23
            TabStop         =   0   'False
            Top             =   2475
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Bombas"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   4
            Left            =   75
            TabIndex        =   22
            TabStop         =   0   'False
            Top             =   2955
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Calc. Cabos"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   3
            Left            =   75
            TabIndex        =   21
            TabStop         =   0   'False
            Top             =   1995
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "MCA/Adutoras"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   2
            Left            =   75
            TabIndex        =   20
            TabStop         =   0   'False
            Top             =   1515
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Área Irrigada"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   1
            Left            =   75
            TabIndex        =   19
            TabStop         =   0   'False
            Top             =   1035
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Lances"
            CaptionOffset   =   50
         End
         Begin IRRIG.GBotao Botao 
            Height          =   480
            Index           =   0
            Left            =   75
            TabIndex        =   18
            TabStop         =   0   'False
            Top             =   75
            Width           =   1515
            _ExtentX        =   0
            _ExtentY        =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   -1  'True
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Novo Projeto"
            CaptionOffset   =   50
         End
      End
      Begin VB.CheckBox ChkCp 
         Caption         =   "Venda Fechada"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   4035
         TabIndex        =   26
         TabStop         =   0   'False
         Top             =   495
         Width           =   2040
      End
      Begin VB.CommandButton bottxtCampo14 
         Height          =   345
         Index           =   1
         Left            =   11085
         Style           =   1  'Graphical
         TabIndex        =   63
         TabStop         =   0   'False
         Top             =   15
         Width           =   255
      End
      Begin VB.CommandButton bottxtCampo14 
         Height          =   345
         Index           =   2
         Left            =   10830
         Style           =   1  'Graphical
         TabIndex        =   64
         TabStop         =   0   'False
         Top             =   15
         Width           =   255
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   14.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   14
         Left            =   9720
         TabIndex        =   0
         Top             =   15
         Width           =   1095
      End
      Begin VB.CommandButton bottxtCampo15 
         Height          =   345
         Index           =   1
         Left            =   11085
         Style           =   1  'Graphical
         TabIndex        =   67
         TabStop         =   0   'False
         Top             =   390
         Width           =   255
      End
      Begin VB.CommandButton bottxtCampo15 
         Height          =   345
         Index           =   2
         Left            =   10830
         Style           =   1  'Graphical
         TabIndex        =   68
         TabStop         =   0   'False
         Top             =   390
         Width           =   255
      End
      Begin VB.TextBox txtCp 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   14.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   15
         Left            =   9720
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   390
         Width           =   1095
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   16
         Left            =   7095
         MaxLength       =   14
         TabIndex        =   4
         Top             =   1095
         Width           =   1740
      End
      Begin VB.TextBox txtCp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Index           =   17
         Left            =   8895
         MaxLength       =   14
         TabIndex        =   5
         Top             =   1095
         Width           =   1560
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Projeto de Irrigação - Nº"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   435
         Index           =   0
         Left            =   195
         TabIndex        =   36
         Top             =   0
         Width           =   4245
      End
      Begin VB.Line Linha 
         Index           =   0
         X1              =   255
         X2              =   9555
         Y1              =   405
         Y2              =   405
      End
      Begin VB.Label labFdo0 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Left            =   1935
         TabIndex        =   37
         Top             =   1635
         Width           =   5100
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Proposta"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   1
         Left            =   12210
         TabIndex        =   40
         Top             =   1395
         Width           =   825
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Opção"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   2
         Left            =   13455
         TabIndex        =   41
         Top             =   1335
         Width           =   615
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Dt. Proposta"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   3
         Left            =   14250
         TabIndex        =   42
         Top             =   1395
         Width           =   1110
      End
      Begin VB.Label labFdo3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Left            =   14235
         TabIndex        =   43
         Top             =   1635
         Width           =   1455
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Geral"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   4
         Left            =   1950
         TabIndex        =   45
         Top             =   1095
         Width           =   570
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Cliente Avulso"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   5
         Left            =   1935
         TabIndex        =   46
         Top             =   855
         Width           =   1485
      End
      Begin VB.Label labFdo6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Left            =   7095
         TabIndex        =   47
         Top             =   1635
         Width           =   4980
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Propriedade:"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   6
         Left            =   7095
         TabIndex        =   49
         Top             =   1395
         Width           =   1185
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "."
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   7
         Left            =   15900
         TabIndex        =   50
         Top             =   8400
         Width           =   45
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Municipio"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   8
         Left            =   1935
         TabIndex        =   51
         Top             =   1935
         Width           =   855
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Descrição do Equipamento"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   9
         Left            =   7095
         TabIndex        =   52
         Top             =   1935
         Width           =   2460
      End
      Begin VB.Label Label 
         Caption         =   "Tipo"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   10
         Left            =   12195
         TabIndex        =   53
         Top             =   1935
         Width           =   570
      End
      Begin VB.Label labFdo10 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Left            =   12195
         TabIndex        =   54
         Top             =   2175
         Width           =   1155
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Fone"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   11
         Left            =   5355
         TabIndex        =   56
         Top             =   1935
         Width           =   465
      End
      Begin VB.Label labFdo13 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Left            =   13455
         TabIndex        =   58
         Top             =   2175
         Width           =   2220
      End
      Begin VB.Label Label 
         Caption         =   "Vendedor"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   12
         Left            =   13455
         TabIndex        =   60
         Top             =   1935
         Width           =   1020
      End
      Begin VB.Label labFdo14 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   9705
         TabIndex        =   62
         Top             =   0
         Width           =   1650
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Consultar por Projeto"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   15.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   13
         Left            =   6615
         TabIndex        =   65
         Top             =   0
         Width           =   3045
      End
      Begin VB.Label labFdo15 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   9705
         TabIndex        =   66
         Top             =   375
         Width           =   1650
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Consultar por Pedido"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   15.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   14
         Left            =   6615
         TabIndex        =   69
         Top             =   375
         Width           =   3030
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "CPF"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   15
         Left            =   7095
         TabIndex        =   70
         Top             =   855
         Width           =   390
      End
      Begin VB.Label Label 
         AutoSize        =   -1  'True
         Caption         =   "Fone / Cel"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   16
         Left            =   8895
         TabIndex        =   71
         Top             =   855
         Width           =   915
      End
   End
   Begin VB.Timer timUnLoad 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   30
      Top             =   950
   End
End
Attribute VB_Name = "frmNovoPrg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'* Sistema...: SISTEMA IRRIGAÇÃO PENÁPOLIS
'* Empresa...: IRRIGAÇÃO PENÁPOLIS
'* Módulo....: NovoPrg
'* Função....: Projetos - Pivô (Novo)
'* CopyRight.: (C)2024 IRRIGAÇÃO PENÁPOLIS
'* Criação...: GAS-2007 - Gerador Automático de Sistemas
'* Data......: 16/08/2024 15:00:34
'* * * * * * *

Option Explicit
DefInt A-Z

Public vgSituacao As Integer                      'situação de edição que do módulo
Public vgCaracteristica As Integer                'caracteristica do módulo
Public vgTipo As Integer                          'tipo do módulo
Public vgPriVez As Integer                        'flag de carregamento do módulo
Public vgFormID As Long                           'identificador único para o módulo
Public vgIdentTab As String                       'nome da tabela principal do módulo
Public vgEmBrowse As Integer                      'flag se o módulo esta em grade
Public vgTemFiltro As Integer                     'flag se tem ou não filtro no módulo
Public vgFiltraSoUm As String                     'flag para filtrar só um registro
Public vgCancelou As Integer                      'flag cancela ou nao o processo do módulo
Public vgQueryAtual As String                     'expressão SQL definada para o módulo

Public vgFP As New frmPreview                     'formuário de preview do relatório
Public vgTooltips As New cTooltips                'classe de ajuda para os controes do módulo
Public vgFG As frmGauge                           'formulário do gauge
Public vgQReg As Long                             'quantidade de já feira para o gauge

Dim txtCampo(17) As New FormataCampos             'classe dos compos tipo texto do módulo
Dim chkCampo(0) As New FormataCampos              'classe dos compos tipo lógico do módulo
Dim vgPodeFazerUnLoad As Boolean                  'flag se o módulo pode ou nao ser removido da memória
Dim Sequencia_do_Geral As Long, Proposta As String, Opcao As String
Dim Data_da_Proposta As Variant, Cliente_Avulso As String, Propriedade_Avulsa As String
Dim Sequencia_da_Propriedade As Long, Municipio As String, Descricao_do_Equipamento As String
Dim Fixo_ou_Rebocavel As String, Fone_1 As String, Sequencia_do_Projeto As Double
Dim Sequencia_do_Vendedor As Long, Venda_Fechada As Boolean, Pesquisar As Double
Dim Orcamento As Double, CPF_Avulso As String, Fone_Avulso As String
Public txtSequencia_do_Geral As Object, txtProposta As Object, txtOpcao As Object
Public txtDta As Object, txtCliente_Avulso As Object, txtPropriedade_Avulsa As Object
Public txtProp As Object, lblAjuste As Object, txtMunicipio As Object
Public txtEquip As Object, txtTipo As Object, TxtFone_1 As Object
Public txtSequencia_do_Projeto As Object, txtSequencia_do_Vendedor As Object, btnNovo As Object
Public txtVendaFechada As Object, txtPesquisar As Object, txtOrcamento As Object
Public txtCPF_Avulso As Object, txtFone_Avulso As Object, Btnimprimir As Object

Dim MunAux As New GRecordSet, PropAux As New GRecordSet
Dim LanceAux As New GRecordSet, GeralAux As New GRecordSet
Public L1 As Integer

Private Sub TrocaGeral()
 txtProp.Text = ""
 txtProposta.Text = ""
 txtOpcao.Text = ""
 txtDta.Text = ""
 'TxtEquip.Text = ""
 txtCliente_Avulso.Enabled = True
End Sub


Private Function InfoMun(Oq As String) As Variant
   
   On Error Resume Next
   
   TbAuxiliar "Propriedades", "[Seqüência da Propriedade] = " & Sequencia_da_Propriedade, PropAux
   TbAuxiliar "Geral", "[Seqüência do Geral] = " & Sequencia_do_Geral, GeralAux
      
   If PropAux![Seqüência da Propriedade] = 0 Then
      TbAuxiliar "Municípios", "[Seqüência do Município] = " & GeralAux![Seqüência Do Município] & " AND [Seqüência do Município] > 0", MunAux
   Else
      TbAuxiliar "Municípios", "[Seqüência do Município] = " & PropAux![Seqüência Do Município] & " AND [Seqüência do Município] > 0", MunAux
   End If
   
   Select Case Oq
      Case "MUN"
      InfoMun = MunAux![Descrição] & " - " & MunAux!UF
   End Select

End Function


Private Sub CarregaFotos()
 
 If Vazio(Parametros![Diretorio das Fotos]) Then
    Exit Sub
 End If
  
 If EstaEmIDE Then Exit Sub
    
 If Existe(Parametros![Diretorio das Fotos] & Sequencia_do_Projeto & ".jpg") Then
    Set mmCampo(1).Picture = LoadPicture(Parametros![Diretorio das Fotos] & Sequencia_do_Projeto & ".jpg")
    mmCampo(1).ToolTipText = "Mapa da Propriedade"
 Else
    Set mmCampo(1).Picture = Nothing
 End If
    'MudaCorGrid
    'txtFormaPagto.ListFields = "Prazo"
End Sub

Private Sub Incluir()
 Dim Projeto As New GRecordSet
 Dim SeqOrc As Long
    
    If Sequencia_do_Projeto > 0 Then
       Alteracao
    End If
     
    Set Projeto = vgDb.OpenRecordSet("Projeto de Irrigação")
    
     If MsgBox("Deseja Incluir Um Novo Projeto?" & vbCrLf & " Usuario - " & vgPWUsuario, vbExclamation + vbYesNo, "Irrigação Penapolis") = vbNo Then
        txtSequencia_do_Projeto.SetFocus
        txtSequencia_do_Projeto.Enabled = True
     Exit Sub
     Else
     'novo
       txtVendaFechada.Value = 0
       txtPesquisar.Value = 0
       With Projeto
        .AddNew
         ![Data da Proposta] = Date
        .Update
         SeqOrc = Projeto![Sequencia do Projeto]
        .BookMark = .LastModified
         txtSequencia_do_Projeto.Value = SeqOrc
         txtSequencia_do_Vendedor.Enabled = True
         txtSequencia_do_Projeto.Enabled = False
         txtPesquisar.Enabled = False
         btnNovo.Enabled = False
         LimpaTela
         LiberaCampos
         Set mmCampo(1).Picture = Nothing
      End With
    End If
    Set Projeto = Nothing
End Sub

Private Sub BuscaProjeto()
 Dim Projeto As New GRecordSet
 
 If Pesquisar = 0 Then Exit Sub
 'If Pesquisar = 0 Then
 '   Set Projeto = VgDb.OpenRecordSet("SELECT * FROM [Projeto de Irrigação] WHERE [Sequencia do Projeto] > 0 And [Sequencia do Projeto] = " & Sequencia_do_Projeto)
 'Else
    Set Projeto = vgDb.OpenRecordSet("SELECT * FROM [Projeto de Irrigação] WHERE [Sequencia do Projeto] > 0 And [Sequencia do Projeto] = " & txtPesquisar.Text)
    txtSequencia_do_Projeto.Value = txtPesquisar.Text
 'End If
 
    If Not Projeto![Venda Fechada] Then
       LiberaCampos
    End If
   If Projeto.RecordCount = 0 Then
      MsgBox ("Projeto não Encontrado!")
      txtPesquisar.SetFocus
   Else
      txtCliente_Avulso.Value = Projeto![Cliente Avulso]
      txtSequencia_do_Geral.Value = Projeto![Sequencia Do Geral]
      txtPropriedade_Avulsa.Value = Projeto![Propriedade Avulsa]
      txtProposta.Value = Projeto!Proposta
      txtOpcao.Value = Projeto!Opção
      txtProp.Value = Projeto![Sequencia da Propriedade]
      txtDta.Value = Projeto![Data da Proposta]
      txtEquip.Value = Projeto![Descrição Do Equipamento]
      txtTipo.Value = Projeto![Fixo ou Rebocavel]
      txtSequencia_do_Vendedor.Value = Projeto![Sequencia Do Vendedor]
      txtMunicipio.Value = Projeto![Cidade Avulsa]
      TxtFone_1.Value = Projeto![Fone 1]
      txtSequencia_do_Projeto.Enabled = False
      txtVendaFechada.Value = Projeto![Venda Fechada]
      txtCPF_Avulso.Value = Projeto![CPF Avulso]
      txtFone_Avulso.Value = Projeto![cel avulso]
      'BloqueiaCampos
      'Sendk(13)
   End If
      CarregaFotos
      txtProposta.SetFocus
      Set Projeto = Nothing
      Exit Sub
End Sub


Private Sub AbreLances()
 Dim Tb As New GRecordSet
   
   On Error GoTo DeuErro
   
   Load frmcomequip
   frmcomequip.Show 'vbModal
   frmcomequip.SetFocus
   frmcomequip.txtSeq_Projeto.Value = frmNovoPrg.txtSequencia_do_Projeto.Value
   
   Set Tb = vgDb.OpenRecordSet("SELECT [Lance em Balanço], [Bomba Booster], Graus, [Extensão Ult Spray], [Alcance Spray Fim], [Saidas Acumuladas], [Modelo Pivo], [Fabricante Spray Final], [Sequencia do Bocal] From [Projeto de Irrigação] where [Sequencia do Projeto] = " & frmNovoPrg.txtSequencia_do_Projeto.Value)
   
   frmcomequip.txtModelo_Pivo.Value = Tb![Modelo Pivo]
   frmcomequip.txtLanceBalanco.Value = Tb![Lance em Balanço]
   frmcomequip.txtExtensao.Value = Tb![Extensão Ult Spray]
   frmcomequip.txtAlcance_Spray_Fim.Value = Tb![Alcance Spray Fim]
   frmcomequip.txtSaidasAcumuladas.Value = Tb![Saidas Acumuladas]
   frmcomequip.txtAspersor_Canhao.Enabled = True
   frmcomequip.txtFabricante.Value = Tb![Fabricante Spray Final]
   frmcomequip.txtAspersor_Canhao.Value = Tb![Sequencia do Bocal]
   frmcomequip.txtAspersor_Canhao.Enabled = False
   frmcomequip.chkBooster.Value = Tb![Bomba Booster]
   If Tb!Graus > 0 Then
      frmcomequip.txtGrausAux.Value = Tb!Graus
   Else
      frmcomequip.txtGrausAux.Value = 360
   End If
   If Tb.RecordCount > 0 Then
      If Tb![Sequencia do Bocal] > 0 Then
         frmcomequip.txtAspersor_Canhao.Enabled = True
         frmcomequip.txtAspersor_Canhao.SetFocus
         frmcomequip.txtAspersor_Canhao.Enabled = False
      End If
   End If
       
DeuErro:
   If Err <> 0 Then
      MsgBox Err.Description, vbCritical + vbOKOnly, vaTitulo
   End If

End Sub

Private Sub LiberaCampos()
 txtCliente_Avulso.Enabled = True
 txtSequencia_do_Geral.Enabled = True
 txtPropriedade_Avulsa.Enabled = True
 txtProposta.Enabled = True
 txtProp.Enabled = True
 txtDta.Enabled = True
 txtEquip.Enabled = True
 txtTipo.Enabled = True
 TxtFone_1.Enabled = True
 txtMunicipio.Enabled = True
 txtSequencia_do_Vendedor.Enabled = True
End Sub

Private Sub LimpaTela()
 txtCliente_Avulso.Text = ""
 txtSequencia_do_Geral.Text = ""
 txtPropriedade_Avulsa.Text = ""
 txtProp.Text = ""
 txtProposta.Text = ""
 txtOpcao.Text = ""
 txtDta.Text = ""
 txtEquip.Text = ""
 txtTipo.Text = ""
 TxtFone_1.Text = ""
 txtSequencia_do_Vendedor.Text = ""
 txtMunicipio.Text = ""
End Sub

Private Sub Consultar()
 Alteracao
 LimpaTela
 txtSequencia_do_Projeto.Enabled = True
 txtSequencia_do_Projeto.SetFocus
 txtSequencia_do_Projeto.Text = ""
 'BloqueiaCampos
 LiberaCampos
End Sub

Private Sub BloqueiaCampos()
 txtCliente_Avulso.Enabled = False
 txtSequencia_do_Geral.Enabled = False
 txtPropriedade_Avulsa.Enabled = False
 txtProposta.Enabled = False
 txtOpcao.Enabled = False
 txtProp.Enabled = False
 txtDta.Enabled = False
 txtEquip.Enabled = False
 txtTipo.Enabled = False
 TxtFone_1.Enabled = False
 txtMunicipio.Enabled = False
 txtSequencia_do_Vendedor.Enabled = False
End Sub

Private Sub LimpaGeral()
 txtSequencia_do_Geral.Text = ""
 txtProp.Text = ""
End Sub


Private Sub Alteracao()
 Dim Tb As New GRecordSet
 Dim Passou As Boolean

 Set Tb = vgDb.OpenRecordSet("SELECT * FROM [Projeto de Irrigação] Where [Sequencia do Projeto] = " & Sequencia_do_Projeto)
 
 If Sequencia_do_Geral = 0 Then
    If Vazio(Fone_Avulso) Then
       MsgBox ("Cliente Avulso" & vbCrLf & "Informar um nº de telefone"), vbExclamation: Exit Sub
    End If
    If Len(Fone_Avulso) < 13 Then
       MsgBox ("Telefone Inválido"), vbExclamation
    End If
 End If
 
 If Not Vazio(CPF_Avulso) Then
    Passou = (VDV2(CPF_Avulso))
    If Not Passou Then
       MsgBox ("CPF INVALIDO!!!")
       txtCPF_Avulso.Text = ""
       txtCPF_Avulso.SetFocus
       Exit Sub
    End If
 End If
 
 If Tb.RecordCount > 0 Then
   With Tb
    .Edit
      ![Sequencia Do Geral] = txtSequencia_do_Geral.Value
      ![Cliente Avulso] = txtCliente_Avulso.Value
      !Proposta = txtProposta.Value
      !Opção = txtOpcao.Value
      ![Data da Proposta] = txtDta.Value
      ![Sequencia da Propriedade] = txtProp.Value
      ![Descrição Do Equipamento] = txtEquip.Value
      ![Fixo ou Rebocavel] = txtTipo.Value
      ![Propriedade Avulsa] = txtPropriedade_Avulsa.Value
      ![Sequencia Do Vendedor] = txtSequencia_do_Vendedor.Value
      ![Cidade Avulsa] = txtMunicipio.Value
      ![Fone 1] = TxtFone_1.Value
      ![Venda Fechada] = Venda_Fechada
      ![CPF Avulso] = txtCPF_Avulso.Value
      ![cel avulso] = txtFone_Avulso.Value
    .Update
    .BookMark = .LastModified
    End With
 End If
End Sub


'Private Sub SuperInputBalanco()
' Dim Tb As New GRecordSet
 
 '  Set Tb = VgDb.OpenRecordSet("SELECT [Lance em Balanço], [Extensão Ult Spray], [Alcance Spray Fim], [Saidas Acumuladas], [Modelo Pivo], [Fabricante Spray Final], [Sequencia do Bocal] From [Projeto de Irrigação] where [Sequencia do Projeto] = " & frmNovoPrg.txtSequencia_do_Projeto.Value)
 
  ' Load frmBalanco
   'frmBalanco.Show 'vbModal
   'frmBalanco.txtSeq_Projeto.Value = frmNovoPrg.txtSequencia_do_Projeto.Value
   'frmBalanco.txtLanceBalanco.Text = Tb![Lance em Balanço]
   'frmBalanco.txtExtensao.Text = Tb![Extensão Ult Spray]
   'frmBalanco.txtAlcance_Spray_Fim.Text = Tb![Alcance Spray Fim]
   'frmBalanco.txtSaidasAcumuladas.Text = Tb![Saidas Acumuladas]
   'frmBalanco.txtModelo_Pivo.Text = Tb![Modelo Pivo]
   'frmBalanco.txtFabricante.Text = Tb![Fabricante Spray Final]
   'frmBalanco.txtAspersor_Canhao.Value = Tb![Sequencia Do Bocal]
   
   'If Tb.RecordCount > 0 Then
   '   If Tb![Sequencia Do Bocal] > 0 Then
   '      frmBalanco.txtAspersor_Canhao.SetFocus
   '   End If
   'End If
   
'End Sub


Private Function TemLance() As Boolean
 Dim Tb As New GRecordSet
 
 Set Tb = vgDb.OpenRecordSet("SELECT * From [Composição do Equipamento] Where [Sequencia do Projeto] = " & Sequencia_do_Projeto)
 
  If Tb.RecordCount > 0 Then
     TemLance = True
  Else
     TemLance = False
  End If
 
End Function

Private Sub AreaIrrigada()
 Dim Tb As New GRecordSet
 
   Load frmAreaIrri
   frmAreaIrri.Show 'vbModal
   frmAreaIrri.txtSeq_Projeto.Value = frmNovoPrg.txtSequencia_do_Projeto.Value
   
   Set Tb = vgDb.OpenRecordSet("SELECT [Tempo Max Opera], Graus, [Lamina Bruta], [N Posicoes], [Sequencia do Pneu] From [Projeto de Irrigação] where [Sequencia do Projeto] = " & frmNovoPrg.txtSequencia_do_Projeto.Value)
     If Tb!Graus = 0 Then
        frmAreaIrri.txtGraus.Value = 360
     Else
        frmAreaIrri.txtGraus.Value = Tb!Graus
     End If
        frmAreaIrri.txtLamina.Value = Tb![Lamina Bruta]
        frmAreaIrri.txtTempo_Max_Opera.Value = Tb![Tempo Max Opera]
     If Tb![N Posicoes] = 0 Then
        frmAreaIrri.txtN_Posicoes.Value = 1
     Else
        frmAreaIrri.txtN_Posicoes.Value = Tb![N Posicoes]
     End If
        frmAreaIrri.txtSequencia_do_Pneu.Value = Tb![Sequencia Do Pneu]
        frmAreaIrri.txtGraus.SetFocus
   
End Sub

Private Sub MCA()
 Dim Tb As New GRecordSet
 Dim Bocal As New GRecordSet
 Dim PressaoPadrao As Integer
  
   Load frmmca
   frmmca.Show 'vbModal
   frmmca.txtSeq_Projeto.Value = frmNovoPrg.txtSequencia_do_Projeto.Value
   
   PressaoPadrao = 15
   
   Set Tb = vgDb.OpenRecordSet("SELECT [Bomba Booster], [Modelo Trecho A], [Modelo Trecho B], [Modelo Trecho C], [Modelo Trecho D], [Com 1], [Com 2], [Com 3], [Com 4], [Sequencia do Bocal], [Modelo Pivo], [Pressao no Extremo], [Desnivel Ponto Alto], [Altura dos Aspersores], [Desnivel Moto Bomba], [Altura de succao], [Perda Mangueira], [Desnivel Ponto Baixo] From [Projeto de Irrigação] where [Sequencia do Projeto] = " & frmNovoPrg.txtSequencia_do_Projeto.Value)
   Set Bocal = vgDb.OpenRecordSet("SELECT MCA, [Sequencia do Bocal] FROM [Bocal Aspersor Nelson] where [Sequencia do Bocal] = " & Tb![Sequencia do Bocal])
   
     If Bocal.RecordCount > 0 Then
   
      If Bocal![Sequencia do Bocal] = 0 Then
         frmmca.txtPressao_no_Extremo.Value = PressaoPadrao
      End If
      If Bocal![Sequencia do Bocal] > 0 And Not Tb![Bomba Booster] Then
         frmmca.txtPressao_no_Extremo.Value = Bocal!MCA
      End If
      If Bocal![Sequencia do Bocal] > 0 And Tb![Bomba Booster] Then
         frmmca.txtPressao_no_Extremo.Value = PressaoPadrao
      End If
    
     Else
         frmmca.txtPressao_no_Extremo.Value = PressaoPadrao
     End If
     
      If Tb![Modelo Pivo] = "IP4000" Then
         frmmca.txtAltura_dos_Aspersores.Value = 4
      Else
         frmmca.txtAltura_dos_Aspersores.Value = 3
      End If
          
   frmmca.txtDesnivel_Ponto_Alto.Value = Tb![Desnivel Ponto Alto]
   frmmca.txtDesnivel_Moto_Bomba.Value = Tb![Desnivel Moto Bomba]
   frmmca.txtPerda_Mangueira.Value = Tb![Perda Mangueira]
   frmmca.txtAltura_de_succao.Value = Tb![Altura de succao]
   frmmca.txtDesnivel_Ponto_Baixo.Value = Tb![Desnivel Ponto Baixo]
   frmmca.txtCom_1.Value = Tb![Com 1]
   frmmca.txtCom_2.Value = Tb![Com 2]
   frmmca.txtCom_3.Value = Tb![Com 3]
   frmmca.txtCom_4.Value = Tb![Com 4]
   frmmca.txtModelo_Trecho_A.Value = Tb![Modelo Trecho A]
   frmmca.txtModelo_Trecho_B.Value = Tb![Modelo Trecho B]
   frmmca.txtModelo_Trecho_C.Value = Tb![Modelo Trecho C]
   frmmca.txtModelo_Trecho_D.Value = Tb![Modelo Trecho D]
   frmmca.txtDesnivel_Ponto_Alto.SetFocus
   
End Sub


Private Function PodeImprimir() As Boolean
 Dim Tb As New GRecordSet
 
 Set Tb = vgDb.OpenRecordSet("SELECT * FROM [Parcelas do Projeto] Where [Sequencia do Projeto] = " & txtSequencia_do_Projeto.Value)
  If Tb.RecordCount > 0 Then
     PodeImprimir = True
  Else
     PodeImprimir = False
  End If
End Function

Private Sub AbreCabos()
 Dim Tb As New GRecordSet
   
   On Error GoTo DeuErro
   
   Set Tb = vgDb.OpenRecordSet("SELECT [Sequencia do Autotrafo], [Codigo Do Conversor] From [Projeto de Irrigação] where [Sequencia do Projeto] = " & frmNovoPrg.txtSequencia_do_Projeto.Value)
   
   frmCalcCabo.Show
   frmCalcCabo.SetFocus
   frmCalcCabo.Seq_Projeto = Sequencia_do_Projeto
   frmCalcCabo.txtSequencia_do_Autotrafo.Value = Tb![Sequencia Do Autotrafo]
   frmCalcCabo.txtSequencia_do_Conversor.Value = Tb![Codigo Do Conversor]
 
DeuErro:
   If Err <> 0 Then
      MsgBox Err.Description, vbCritical + vbOKOnly, vaTitulo
   End If

End Sub


Private Sub PreValidaImpressao()
   Dim Tb As New GRecordSet, Itens As New GRecordSet
   Dim Vector() As String
   Dim i As Long, vaPrivez As Boolean, Campo As Variant, Mensagem As String
   
   On Error GoTo DeuErro
  
   If vgPWUsuario = "YGOR" Then
     Botao_Click (14)
      Exit Sub
   End If
  
   Set Itens = vgDb.OpenRecordSet("SELECT * FROM(" & _
                                  "SELECT PO.[Sequencia do Projeto], 'Pecas' Tipo, P.[Seqüência do Produto], P.Descrição, U.[Sigla da Unidade], PO.[Valor Unitário] " & _
                                  "FROM [Peças do Projeto] PO LEFT JOIN Produtos P ON PO.[Sequencia Do Produto] = P.[Seqüência Do Produto] " & _
                                  "LEFT JOIN Unidades U ON P.[Seqüência da Unidade] = U.[Seqüência da Unidade] " & _
                                  "UNION ALL " & _
                                  "SELECT CO.[Sequencia do Projeto], 'Conjuntos' Tipo, C.[Seqüência Do Conjunto], C.Descrição, U.[Sigla da Unidade], CO.[Valor Unitário] " & _
                                  "FROM [Conjuntos do Projeto] CO LEFT JOIN Conjuntos C ON CO.[Sequencia Do Conjunto] = C.[Seqüência Do Conjunto] " & _
                                  "LEFT JOIN Unidades U ON C.[Seqüência da Unidade] = U.[Seqüência da Unidade] " & _
                                  "LEFT JOIN [Projeto de Irrigação] O ON CO.[Sequencia do Projeto] = O.[Sequencia do Projeto] " & _
                                  ") A " & _
                                  "WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
                                                               
   If Itens.RecordCount = 0 Then
      Botao_Click (14)
      Exit Sub
   End If
   'Vamos Validar
   i = 0 'Tamanho do Vetor
   ReDim Preserve Vector(0) As String
 
   Do While Not Itens.EOF
      If Itens![Valor Unitário] = 0 Then i = i + 1: ReDim Preserve Vector(i): Vector(i - 1) = "ITEM: " & Itens![Seqüência do Produto] & " - " & Itens!Descrição
      Itens.MoveNext
   Loop
      
   If UBound(Vector) > 0 Then
      Mensagem = "Alguns Itens (sem Valor ou sem Receita):" & vbCrLf
      For Each Campo In Vector
         Mensagem = Mensagem & vbCrLf & Campo
      Next
      If Mensagem <> "" Then
         MsgBox Mensagem, vbCritical + vbOKOnly, vaTitulo
         Exit Sub
      End If
   End If
   
   Botao_Click (14)
    
DeuErro:
   If Err <> 0 Then
      MsgBox Err.Description, vbCritical + vbOKOnly, vaTitulo
   End If

End Sub

Private Sub AbreBombas()
 Dim Tb As New GRecordSet
 
   Load frmbombear
   frmbombear.Show 'vbModal
   frmbombear.txtSeq_Projeto.Value = frmNovoPrg.txtSequencia_do_Projeto.Value
   
   Set Tb = vgDb.OpenRecordSet("SELECT * From [Projeto de Irrigação] where [Sequencia do Projeto] = " & txtSequencia_do_Projeto.Value)
   frmbombear.txtQtde_Bomba_Simples.Value = Tb![Qtde Bomba Simples]
   frmbombear.txtQtde_Bomba_Paralela.Value = Tb![Qtde Bomba Paralela]
   frmbombear.txtMarca_Bomba_Simples.Value = Tb![Marca Bomba Simples]
   frmbombear.txtMarca_Bomba_Paralela.Value = Tb![Marca Bomba Paralela]
   frmbombear.txtModelo_Bomba_Simples.Value = Tb![Modelo Bomba Simples]
   frmbombear.txtModelo_Bomba_Paralela.Value = Tb![Modelo Bomba Paralela]
   frmbombear.txtTamanho_Bomba_Simples.Value = Tb![Tamanho Bomba Simples]
   frmbombear.txtTamanho_Bomba_Paralela.Value = Tb![Tamanho Bomba Paralela]
   frmbombear.txtN_Estagios_Simples.Value = Tb![N Estagios Simples]
   frmbombear.txtN_Estagios_Paralela.Value = Tb![N Estagios Paralela]
   frmbombear.txtDiametro_Bomba_Simples.Value = Tb![Diametro Bomba Simples]
   frmbombear.txtDiametro_Bomba_Paralela.Value = Tb![Diametro Bomba Paralela]
   frmbombear.txtRendimento_Bomba_Simples.Value = Tb![Rendimento Bomba Simples]
   frmbombear.txtRendimento_Bomba_Paralela.Value = Tb![Rendimento Bomba Paralela]
   frmbombear.txtRotacao_Bomba_Simples.Value = Tb![Rotação Bomba Simples]
   frmbombear.txtRotacao_Bomba_Paralela.Value = Tb![Rotação Bomba Paralela]
   frmbombear.txtPSerie.Value = Tb![Pressao Paralela]
   frmbombear.txtQtde_bomba_aux.Value = Tb![Qtde bomba aux]
   frmbombear.txtMarca_Bomba_Aux.Value = Tb![Marca Bomba Aux]
   frmbombear.txtModelo_Bomba_Aux.Value = Tb![Modelo Bomba Aux]
   frmbombear.txtTamanho_bomba_aux.Value = Tb![Tamanho bomba aux]
   frmbombear.txtN_estagio_bomba_aux.Value = Tb![N estagio bomba aux]
   frmbombear.txtDiam_bomba_aux.Value = Tb![Diam bomba aux]
   frmbombear.txtPressao_Bomba_Aux.Value = Tb![Pressao Bomba Aux]
   frmbombear.txtRendimento_Bomba_Aux.Value = Tb![Rendimento Bomba Aux]
   frmbombear.txtRotacao_Bomba_Aux.Value = Tb![Rotação Bomba Aux]
   frmbombear.txtVazao_Bomba_Aux.Value = Tb![Vazao Bomba Aux]
   frmbombear.txtCV_Aux.Value = Tb![CV Bomba Aux]
   '========Motor
   frmbombear.txtQtde_de_Motor.Value = Tb![Qtde de Motor]
   frmbombear.txtMarca_do_Motor.Value = Tb![Marca Do Motor]
   frmbombear.txtModelo_Motor.Value = Tb![Modelo Motor]
   frmbombear.txtNivel_de_Protecao.Value = Tb![Nivel de Proteção]
   frmbombear.txtPotencia_Nominal.Value = Tb![Potencia Nominal]
   frmbombear.txtNro_de_Fases.Value = Tb![Nro de Fases]
   frmbombear.txtVoltagem.Value = Tb!Voltagem
   
   frmbombear.txtvazao.SetFocus
   frmbombear.txtQtde_Bomba_Simples.SetFocus
   
   
   MostraFormulas
End Sub


Private Sub AbreProjeto()
   frmProjetos.Show
   frmProjetos.SetFocus
   frmProjetos.vgFiltroInicial = "[Sequencia do Projeto] = " & Sequencia_do_Projeto
   InicializaFiltro frmProjetos
  ' Unload Me
End Sub


Private Sub DuplicaProjeto()
   Dim OrcamentoOriginal As New GRecordSet, OConjuntosOriginal As New GRecordSet, OPecasOriginal As New GRecordSet, OParcelasOriginal As New GRecordSet
   Dim OrcamentoCopia As New GRecordSet, OConjuntosCopia As New GRecordSet, OPecasCopia As New GRecordSet, OParcelasCopia As New GRecordSet
   Dim Sequencia As Long, SeqItemConj As Integer
   Dim EquipOriginal As New GRecordSet, EquipCopia As New GRecordSet
   Dim VrLista As New GRecordSet, IdAux As Long
         
   On Error GoTo DeuErro
   
   If MsgBox("Tem Certeza que Deseja Duplicar esse Projeto?" & vbCrLf & "Esse Processo Pode ser demorado.", vbExclamation + vbYesNo, vaTitulo) = vbNo Then Exit Sub
  

   
   Screen.MousePointer = vbHourglass 'Ampulheta
   vgDb.BeginTrans
      
   Set OrcamentoOriginal = vgDb.OpenRecordSet("SELECT * FROM [Projeto de Irrigação] " & _
                                              "WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
   Set OrcamentoCopia = vgDb.OpenRecordSet("SELECT * FROM [Projeto de Irrigação]")
   '====================================================================================================
   Set OConjuntosOriginal = vgDb.OpenRecordSet("SELECT * FROM [Conjuntos do Projeto] " & _
                                               "WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
   Set OConjuntosCopia = vgDb.OpenRecordSet("SELECT * FROM [Conjuntos do Projeto]")
   '====================================================================================================
   Set OPecasOriginal = vgDb.OpenRecordSet("SELECT * FROM [Peças do Projeto] " & _
                                           "WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
   Set OPecasCopia = vgDb.OpenRecordSet("SELECT * FROM [Peças do Projeto]")
   '=====================================================================================================
   Set OParcelasOriginal = vgDb.OpenRecordSet("SELECT * FROM [Parcelas do Projeto] " & _
                                              "WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
   Set OParcelasCopia = vgDb.OpenRecordSet("SELECT * FROM [Parcelas do Projeto]")
   '=====================================================================================================
   Set EquipOriginal = vgDb.OpenRecordSet("SELECT * FROM [Composição do Equipamento] " & _
                                              "WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
   Set EquipCopia = vgDb.OpenRecordSet("SELECT * FROM [Composição do Equipamento]")
   
   With OrcamentoOriginal
      OrcamentoCopia.AddNew
      OrcamentoCopia![Data da Proposta] = Date
      OrcamentoCopia![Sequencia Do Geral] = ![Sequencia Do Geral]
      OrcamentoCopia!Opção = !Opção
      OrcamentoCopia!Proposta = !Proposta
      OrcamentoCopia![Sequencia da Propriedade] = ![Sequencia da Propriedade]
      OrcamentoCopia![Descrição Do Equipamento] = ![Descrição Do Equipamento]
      OrcamentoCopia![Lance em Balanço] = ![Lance em Balanço]
      OrcamentoCopia![Extensão Ult Spray] = ![Extensão Ult Spray]
      OrcamentoCopia![Alcance Spray Fim] = ![Alcance Spray Fim]
      OrcamentoCopia![N Posicoes] = ![N Posicoes]
      OrcamentoCopia![Graus] = ![Graus]
      OrcamentoCopia![Lamina Bruta] = ![Lamina Bruta]
      OrcamentoCopia![Tempo Max Opera] = ![Tempo Max Opera]
      OrcamentoCopia![Modelo Trecho A] = ![Modelo Trecho A]
      OrcamentoCopia![Modelo Trecho B] = ![Modelo Trecho B]
      OrcamentoCopia![Modelo Trecho C] = ![Modelo Trecho C]
      OrcamentoCopia![Modelo Trecho D] = ![Modelo Trecho D]
      OrcamentoCopia![Com 1] = ![Com 1]
      OrcamentoCopia![Com 2] = ![Com 2]
      OrcamentoCopia![Com 3] = ![Com 3]
      OrcamentoCopia![Com 4] = ![Com 4]
      OrcamentoCopia![Sequencia Do Autotrafo] = ![Sequencia Do Autotrafo]
      OrcamentoCopia![Saidas Acumuladas] = ![Saidas Acumuladas]
      OrcamentoCopia![Espaço medio Saidas] = ![Espaço medio Saidas]
      OrcamentoCopia![Pressao no Extremo] = ![Pressao no Extremo]
      OrcamentoCopia![Desnivel Ponto Alto] = ![Desnivel Ponto Alto]
      OrcamentoCopia![Altura dos Aspersores] = ![Altura dos Aspersores]
      OrcamentoCopia![Desnivel Moto Bomba] = ![Desnivel Moto Bomba]
      OrcamentoCopia![Altura de succao] = ![Altura de succao]
      OrcamentoCopia![Desnivel mais Baixo] = ![Desnivel mais Baixo]
      OrcamentoCopia![Perda Mangueira] = ![Perda Mangueira]
      OrcamentoCopia![Cliente Avulso] = ![Cliente Avulso]
      OrcamentoCopia![Propriedade Avulsa] = ![Propriedade Avulsa]
      OrcamentoCopia![Cidade Avulsa] = ![Cidade Avulsa]
      OrcamentoCopia![Desnivel Ponto Baixo] = ![Desnivel Ponto Baixo]
      OrcamentoCopia![Qtde Bomba Simples] = ![Qtde Bomba Simples]
      OrcamentoCopia![Qtde Bomba Paralela] = ![Qtde Bomba Paralela]
      OrcamentoCopia![Marca Bomba Simples] = ![Marca Bomba Simples]
      OrcamentoCopia![Marca Bomba Paralela] = ![Marca Bomba Paralela]
      OrcamentoCopia![Modelo Bomba Simples] = ![Modelo Bomba Simples]
      OrcamentoCopia![Modelo Bomba Paralela] = ![Modelo Bomba Paralela]
      OrcamentoCopia![Tamanho Bomba Simples] = ![Tamanho Bomba Simples]
      OrcamentoCopia![Tamanho Bomba Paralela] = ![Tamanho Bomba Paralela]
      OrcamentoCopia![N Estagios Simples] = ![N Estagios Simples]
      OrcamentoCopia![N Estagios Paralela] = ![N Estagios Paralela]
      OrcamentoCopia![Diametro Bomba Simples] = ![Diametro Bomba Simples]
      OrcamentoCopia![Diametro Bomba Paralela] = ![Diametro Bomba Paralela]
      OrcamentoCopia![Rendimento Bomba Simples] = ![Rendimento Bomba Simples]
      OrcamentoCopia![Rendimento Bomba Paralela] = ![Rendimento Bomba Paralela]
      OrcamentoCopia![Rotação Bomba Simples] = ![Rotação Bomba Simples]
      OrcamentoCopia![Rotação Bomba Paralela] = ![Rotação Bomba Paralela]
      OrcamentoCopia![Pressao Paralela] = ![Pressao Paralela]
      OrcamentoCopia![Marca Do Motor] = ![Marca Do Motor]
      OrcamentoCopia![Modelo Motor] = ![Modelo Motor]
      OrcamentoCopia![Nivel de Proteção] = ![Nivel de Proteção]
      OrcamentoCopia![Potencia Nominal] = ![Potencia Nominal]
      OrcamentoCopia![Nro de Fases] = ![Nro de Fases]
      OrcamentoCopia![Voltagem] = ![Voltagem]
      OrcamentoCopia![Qtde de Motor] = ![Qtde de Motor]
      OrcamentoCopia![Valor Total das Peças] = ![Valor Total das Peças]
      OrcamentoCopia![Valor Total dos Conjuntos] = ![Valor Total dos Conjuntos]
      OrcamentoCopia![Valor Total Do Projeto] = ![Valor Total Do Projeto]
      OrcamentoCopia![Forma de Pagamento] = ![Forma de Pagamento]
      OrcamentoCopia![Valor Do Frete] = ![Valor Do Frete]
      OrcamentoCopia![Valor Do Desconto] = ![Valor Do Desconto]
      OrcamentoCopia![Local de Entrega] = ![Local de Entrega]
      OrcamentoCopia![Prazo de Entrega Previsto] = ![Prazo de Entrega Previsto]
      OrcamentoCopia![Fone 1] = ![Fone 1]
      OrcamentoCopia![Sequencia Do Vendedor] = ![Sequencia Do Vendedor]
      OrcamentoCopia![Vendedor Intermediario] = ![Vendedor Intermediario]
      OrcamentoCopia![Percentual Do Vendedor] = ![Percentual Do Vendedor]
      OrcamentoCopia![Rebiut] = ![Rebiut]
      OrcamentoCopia![Percentual Rebiut] = ![Percentual Rebiut]
      OrcamentoCopia![Modelo Pivo] = ![Modelo Pivo]
      OrcamentoCopia![Fabricante Spray Final] = ![Fabricante Spray Final]
      OrcamentoCopia![Sequencia do Bocal] = ![Sequencia do Bocal]
      OrcamentoCopia![Sequencia Do Pneu] = ![Sequencia Do Pneu]
      OrcamentoCopia![Inicio Do Balanço] = ![Inicio Do Balanço]
      OrcamentoCopia.Update
      IdAux = OrcamentoCopia![Sequencia do Projeto]
      OrcamentoCopia.BookMark = OrcamentoCopia.LastModified
      '============================================================================
      'Conjuntos
      If OConjuntosOriginal.RecordCount > 0 Then
         SeqItemConj = 1
         Do While Not OConjuntosOriginal.EOF
            OConjuntosCopia.AddNew
            OConjuntosCopia![Sequencia do Projeto] = OrcamentoCopia![Sequencia do Projeto]
            OConjuntosCopia![Sequencia do Item] = OConjuntosOriginal![Sequencia do Item]
            OConjuntosCopia![Sequencia Do Conjunto] = OConjuntosOriginal![Sequencia Do Conjunto]
            OConjuntosCopia!Quantidade = OConjuntosOriginal!Quantidade
            OConjuntosCopia![Valor Unitário] = OConjuntosOriginal![Valor Unitário]
            OConjuntosCopia![Valor Total] = OConjuntosOriginal![Valor Total]
            OConjuntosCopia![Parte Do Pivo] = OConjuntosOriginal![Parte Do Pivo]
            OConjuntosCopia.Update
            OConjuntosCopia.BookMark = OConjuntosCopia.LastModified
            OConjuntosOriginal.MoveNext
         Loop
      End If
      'Peças
      If OPecasOriginal.RecordCount > 0 Then
         Do While Not OPecasOriginal.EOF
         Set VrLista = vgDb.OpenRecordSet("SELECT * From Produtos Where [Seqüência do Produto] = " & OPecasOriginal![Sequencia Do Produto])
            OPecasCopia.AddNew
            OPecasCopia![Sequencia do Projeto] = OrcamentoCopia![Sequencia do Projeto]
            OPecasCopia![Sequencia do Item] = OPecasOriginal![Sequencia do Item]
            OPecasCopia![Sequencia Do Produto] = OPecasOriginal![Sequencia Do Produto]
            OPecasCopia!Quantidade = OPecasOriginal!Quantidade
             If VrLista![Material Adquirido de Terceiro] Then
                OPecasCopia![Valor Unitário] = VrLista![Valor de Lista]
             Else
                OPecasCopia![Valor Unitário] = VrLista![Valor Total]
             End If
            OPecasCopia![Valor Total] = (OPecasCopia!Quantidade * OPecasCopia![Valor Unitário]) 'OPecasOriginal![Valor Total]
            OPecasCopia![Parte Do Pivo] = OPecasOriginal![Parte Do Pivo]
            OPecasCopia.Update
            OPecasCopia.BookMark = OPecasCopia.LastModified
            OPecasOriginal.MoveNext
         Loop
      End If
      'Parcelas
      If OParcelasOriginal.RecordCount > 0 Then
         Do While Not OParcelasOriginal.EOF
            OParcelasCopia.AddNew
            OParcelasCopia![Sequencia do Projeto] = OrcamentoCopia![Sequencia do Projeto]
            OParcelasCopia![Número da Parcela] = OParcelasOriginal![Número da Parcela]
            OParcelasCopia!Dias = OParcelasOriginal!Dias
            OParcelasCopia![Data de Vencimento] = OParcelasOriginal![Data de Vencimento]
            OParcelasCopia![Valor da Parcela] = OParcelasOriginal![Valor da Parcela]
            OParcelasCopia.Update
            OParcelasCopia.BookMark = OParcelasCopia.LastModified
            OParcelasOriginal.MoveNext
         Loop
      End If
      'Detalhes
      If EquipOriginal.RecordCount > 0 Then
         Do While Not EquipOriginal.EOF
            EquipCopia.AddNew
            EquipCopia![Sequencia do Projeto] = OrcamentoCopia![Sequencia do Projeto]
            EquipCopia![Sequencia do Item] = EquipOriginal![Sequencia do Item]
            EquipCopia![Modelo Do Lance] = EquipOriginal![Modelo Do Lance]
            EquipCopia![Tipo Do Lance] = EquipOriginal![Tipo Do Lance]
            EquipCopia![Quant de Lance] = EquipOriginal![Quant de Lance]
            EquipCopia.Update
            EquipCopia.BookMark = EquipCopia.LastModified
           EquipOriginal.MoveNext
         Loop
      End If
   End With
      
   vgDb.CommitTrans
   
   MsgBox "Projeto Duplicado com Sucesso!!!", vbInformation + vbOKOnly, vaTitulo
   
   txtPesquisar.Text = IdAux
   txtPesquisar.Text = IdAux
   
  ' txtSequencia_do_Projeto.Text = ""
   BuscaProjeto
          
   Screen.MousePointer = vbDefault 'Ampulheta
   
DeuErro:
   If Err Then
      MsgBox Err.Description, vbCritical + vbOKOnly, vaTitulo
      vgDb.RollBackTrans
   End If
   
End Sub


Private Function TemItens() As Boolean
 Dim Tb As New GRecordSet
 
 Set Tb = vgDb.OpenRecordSet("SELECT * FROM [Peças do Projeto] WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
  
  If Tb.RecordCount > 0 Then
     TemItens = True
  Else
     TemItens = False
  End If
  
End Function


Private Sub Financeiro(Seq As Long)
 Dim Tb As New GRecordSet
 
   Load frmFinanc
   frmFinanc.Show 'vbModal
   frmFinanc.txtSeq_Projeto.Value = Seq
   
   Set Tb = vgDb.OpenRecordSet("SELECT [Forma de Pagamento], Obs, [Valor do Frete], [Valor do Desconto], [Valor Total das Peças], [Valor Total dos Conjuntos], [Total dos Serviços], [Valor Total do Projeto], [Vendedor Intermediario], [Percentual do Vendedor], [Local de Entrega], Rebiut, [Percentual Rebiut], [Prazo de Entrega Previsto], [Entrega Tecnica] From [Projeto de Irrigação] where [Sequencia do Projeto] = " & Sequencia_do_Projeto)
     If Not Vazio(Tb![Forma de Pagamento]) Then
        frmFinanc.txtForma_de_Pagamento.Value = Tb![Forma de Pagamento]
     End If
     If Tb![Valor Do Frete] > 0 Then
        frmFinanc.txtValor_do_Frete.Value = Tb![Valor Do Frete]
     Else
        frmFinanc.txtValor_do_Frete.Value = 0
     End If
     If Tb![Valor Do Desconto] < 0 Then
        frmFinanc.txtValor_do_Desconto.Value = Tb![Valor Do Desconto]
     Else
        frmFinanc.txtValor_do_Desconto.Value = 0
     End If
     If Tb![Valor Total das Peças] Then
        frmFinanc.txtValor_Total_das_Pecas.Value = Tb![Valor Total das Peças]
     End If
     If Tb![Valor Total dos Conjuntos] > 0 Then
        frmFinanc.txtValor_Total_dos_Conjuntos.Value = Tb![Valor Total dos Conjuntos]
     End If
     If Tb![Total dos Serviços] > 0 Then
        frmFinanc.txtTotal_dos_Servicos.Value = Tb![Total dos Serviços]
     Else
        frmFinanc.txtTotal_dos_Servicos.Value = 0
     End If
     If Tb![Valor Total Do Projeto] > 0 Then
        frmFinanc.txtValor_Total_do_Projeto.Value = Tb![Valor Total Do Projeto]
     End If
     If Not Vazio(Tb![Vendedor Intermediario]) Then
        frmFinanc.txtVendedor_Intermediario.Value = Tb![Vendedor Intermediario]
     End If
     If Tb![Percentual Do Vendedor] > 0 Then
        frmFinanc.txtPercentual_do_Vendedor.Value = Tb![Percentual Do Vendedor]
     End If
     If Not Vazio(Tb!Rebiut) Then
        frmFinanc.txtRebiut.Value = Tb!Rebiut
     End If
     If Tb![Percentual Rebiut] > 0 Then
        frmFinanc.txtPercentual_Rebiut.Value = Tb![Percentual Rebiut]
     End If
     If Not Vazio(Tb![Local de Entrega]) Then
        frmFinanc.txtLocal_de_Entrega.Value = Tb![Local de Entrega]
     End If
     If Not Vazio(Tb![Prazo de Entrega Previsto]) Then
        frmFinanc.txtPrazo_de_Entrega_Previsto.Value = Tb![Prazo de Entrega Previsto]
     End If
     If Not Vazio(Tb![Entrega Tecnica]) Then
        frmFinanc.txtEntrega_Tecnica.Value = Tb![Entrega Tecnica]
     End If
     If Not Vazio(Tb!Obs) Then
        frmFinanc.txtObs.Value = Tb!Obs
     End If
     frmFinanc.gridParcelas.SetFocus
End Sub


Private Sub GerarOrcamento()
 Dim Produto As New GRecordSet, ProdutosOrc As New GRecordSet
 Dim Projeto As New GRecordSet, Orcamento As New GRecordSet
 Dim Conj As New GRecordSet, ConjOrc As New GRecordSet
 Dim Parcelas As New GRecordSet, ParcelasOrc As New GRecordSet
 Dim SeqOrc As Long, VrLista As New GRecordSet
 
  On Error GoTo DeuErro
   
  If MsgBox("Tem Certeza que Deseja Gerar o Pedido?" & vbCrLf & "Esse Processo Pode ser demorado.", vbExclamation + vbYesNo, vaTitulo) = vbNo Then Exit Sub
   
  vgDb.BeginTrans
 
  Set Projeto = vgDb.OpenRecordSet("SELECT * FROM [Projeto de Irrigação] WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto)
  Set Orcamento = vgDb.OpenRecordSet("Orçamento")
   
  Set Produto = vgDb.OpenRecordSet("SELECT * FROM [Peças do Projeto] Where [Sequencia do Projeto] = " & Sequencia_do_Projeto)
  Set ProdutosOrc = vgDb.OpenRecordSet("Peças do Orçamento")
  Set Conj = vgDb.OpenRecordSet("SELECT * FROM [Conjuntos do Projeto] Where [Sequencia do Projeto] = " & Sequencia_do_Projeto)
  Set ConjOrc = vgDb.OpenRecordSet("Conjuntos do Orçamento")
  Set Parcelas = vgDb.OpenRecordSet("SELECT * FROM [Parcelas do Projeto] Where [Sequencia do Projeto] = " & Sequencia_do_Projeto)
  Set ParcelasOrc = vgDb.OpenRecordSet("Parcelas Orçamento")
   
  'Processando...
   With Projeto
     Orcamento.AddNew
     Orcamento![Data de Emissão] = Date
     Orcamento![Seqüência Do Geral] = Projeto![Sequencia Do Geral]
     Orcamento![Sequencia do Projeto] = Sequencia_do_Projeto
     Orcamento![Seqüência da Propriedade] = Projeto![Sequencia da Propriedade]
     Orcamento![Seqüência Do Vendedor] = Projeto![Sequencia Do Vendedor]
     Orcamento![Seqüência da Transportadora] = 4129
     Orcamento![Seqüência da Classificação] = 10202
     Orcamento![Ocultar Valor Unitário] = 1
     Orcamento![Forma de Pagamento] = "Prazo"
     Orcamento![Vendedor Intermediario] = Projeto![Vendedor Intermediario]
     Orcamento![Percentual Do Vendedor] = Projeto![Percentual Do Vendedor]
     Orcamento!Rebiut = Projeto!Rebiut
     Orcamento![Percentual Rebiut] = Projeto![Percentual Rebiut]
     Orcamento![Entrega Tecnica] = Projeto![Entrega Tecnica]
     Orcamento.Update
      SeqOrc = Orcamento![Seqüência do Orçamento]
     Orcamento.BookMark = .LastModified
     Orcamento.MoveLast
   End With
   
   Do While Not Produto.EOF
      ProdutosOrc.AddNew
       ProdutosOrc![Seqüência do Orçamento] = SeqOrc
       ProdutosOrc![Seqüência do Produto] = Produto![Sequencia Do Produto]
       ProdutosOrc!Quantidade = Produto!Quantidade
        'Set VrLista = vgdb.OpenRecordSet("SELECT * From Produtos Where [Seqüência do Produto] = " & Produto![Sequencia Do Produto])
       ProdutosOrc![Valor Unitário] = Produto![Valor Unitário]
       ProdutosOrc![Valor Total] = (ProdutosOrc!Quantidade * ProdutosOrc![Valor Unitário])
      ProdutosOrc.Update
      ProdutosOrc.BookMark = ProdutosOrc.LastModified
      Produto.MoveNext
   Loop
  ' Produto.MoveFirst
   Do While Not Conj.EOF
      ConjOrc.AddNew
       ConjOrc![Seqüência do Orçamento] = SeqOrc
       ConjOrc![Seqüência do Conjunto] = Conj![Sequencia Do Conjunto]
       ConjOrc!Quantidade = Conj!Quantidade
        'Set VrLista = vgdb.OpenRecordSet("SELECT * From Produtos Where [Seqüência do Produto] = " & Produto![Sequencia Do Produto])
       ConjOrc![Valor Unitário] = Conj![Valor Unitário]
       ConjOrc![Valor Total] = (ConjOrc!Quantidade * ConjOrc![Valor Unitário])
      ConjOrc.Update
      ConjOrc.BookMark = ConjOrc.LastModified
      Conj.MoveNext
   Loop
   Do While Not Parcelas.EOF
      ParcelasOrc.AddNew
       ParcelasOrc![Seqüência do Orçamento] = SeqOrc
       ParcelasOrc![Número da Parcela] = Parcelas![Número da Parcela]
       ParcelasOrc!Dias = Parcelas!Dias
       ParcelasOrc![Data de Vencimento] = Parcelas![Data de Vencimento]
       ParcelasOrc![Valor da Parcela] = Parcelas![Valor da Parcela]
       ParcelasOrc![Descrição] = Parcelas![Descrição]
      ParcelasOrc.Update
      ParcelasOrc.BookMark = ParcelasOrc.LastModified
      Parcelas.MoveNext
   Loop
   'Conj.MoveFirst
   '== Fechando Projeto ==
   vgDb.Execute "Update [Projeto de Irrigação] Set [Sequencia do Orçamento] = " & SeqOrc & " WHERE [Sequencia do Projeto] = " & Sequencia_do_Projeto
   '======================='
   vgDb.CommitTrans
   Unload Me
   frmOrcament.Show
   frmOrcament.SetFocus
   frmOrcament.vgFiltroInicial = "[Seqüência Do Orçamento] = " & SeqOrc
   InicializaFiltro frmOrcament
   frmOrcament.RecalculaPecas
   frmOrcament.RecalculaConjuntos
   frmOrcament.RepositionOrcamento
   
       
DeuErro:
   If Err Then
      MsgBox Err.Description, vbCritical + vbOKOnly, vaTitulo
      vgDb.RollBackTrans
   End If
              
End Sub



Private Sub BuscaProjeto1()
 Dim Projeto As New GRecordSet
 
 If Orcamento = 0 Then Exit Sub
 
    Set Projeto = vgDb.OpenRecordSet("SELECT * FROM [Projeto de Irrigação] WHERE [Sequencia do Projeto] > 0 And [Sequencia do Projeto] = " & txtOrcamento.Text)
    txtSequencia_do_Projeto.Value = txtOrcamento.Text

 
    If Not Projeto![Venda Fechada] Then
       LiberaCampos
    End If
   If Projeto.RecordCount = 0 Then
      MsgBox ("Projeto não Encontrado!")
      txtPesquisar.SetFocus
   Else
      txtCliente_Avulso.Value = Projeto![Cliente Avulso]
      txtSequencia_do_Geral.Value = Projeto![Sequencia Do Geral]
      txtPropriedade_Avulsa.Value = Projeto![Propriedade Avulsa]
      txtProposta.Value = Projeto!Proposta
      txtOpcao.Value = Projeto!Opção
      txtProp.Value = Projeto![Sequencia da Propriedade]
      txtDta.Value = Projeto![Data da Proposta]
      txtEquip.Value = Projeto![Descrição Do Equipamento]
      txtTipo.Value = Projeto![Fixo ou Rebocavel]
      txtSequencia_do_Vendedor.Value = Projeto![Sequencia Do Vendedor]
      txtMunicipio.Value = Projeto![Cidade Avulsa]
      TxtFone_1.Value = Projeto![Fone 1]
      txtSequencia_do_Projeto.Enabled = False
      txtVendaFechada.Value = Projeto![Venda Fechada]
      txtCPF_Avulso.Value = Projeto![CPF Avulso]
      txtFone_Avulso.Value = Projeto![cel avulso]
      'BloqueiaCampos
      'Sendk(13)
   End If
      CarregaFotos
      txtProposta.SetFocus
      Set Projeto = Nothing
      Exit Sub
End Sub


Private Sub AbreExecutivo()
    Dim pdfFilePath As String

    pdfFilePath = "\\Srvdc\Public$\Projeto_Executivo\" & Sequencia_do_Projeto & ".pdf"
      If Existe(pdfFilePath) Then
         ShellExecute Me.hWnd, "open", pdfFilePath, vbNullString, vbNullString, 1
      Else
         MsgBox ("Não existe Projeto Executivo vinculado")
      End If
      
End Sub


Private Sub MapaBocal()
    Dim pdfFilePath As String

    pdfFilePath = "\\Srvdc\Public$\Mapeamento_Bocal\" & Sequencia_do_Projeto & ".pdf"
    
       If Existe(pdfFilePath) Then
          ShellExecute Me.hWnd, "open", pdfFilePath, vbNullString, vbNullString, 1
       Else
           MsgBox ("Não existe Mapeamento de Bocal vinculado")
       End If
    
End Sub

'Private Sub ImprimeItens()
' Dim Tb As New GRecordSet
 
' Set Tb = vgDb.OpenRecordSet("SELECT Obs From [Projeto de Irrigação] Where [Sequencia do Projeto] = " & Sequencia_do_Projeto)

 'frmRelImpIt.Show
 'frmRelImpIt.SetFocus
 'frmRelImpIt.txtPedido.Value = Sequencia_do_Projeto
 'frmRelImpIt.txtObs.Value = Tb!Obs
 
'End Sub

'inicializa variaveis (apelidos) coms os campos correspondentes
Private Sub InicializaApelidos(vgComOQue As Integer)
   On Error Resume Next                           'prepara para possíveis erros
   Sequencia_do_Geral = txtCampo(0).Value
   Proposta = txtCampo(1).Value
   Opcao = txtCampo(2).Value
   Data_da_Proposta = txtCampo(3).Value
   Cliente_Avulso = txtCampo(4).Value
   Propriedade_Avulsa = txtCampo(5).Value
   Sequencia_da_Propriedade = txtCampo(6).Value
   Municipio = txtCampo(8).Value
   Descricao_do_Equipamento = txtCampo(9).Value
   Fixo_ou_Rebocavel = txtCampo(10).Value
   Fone_1 = txtCampo(11).Value
   Sequencia_do_Projeto = txtCampo(12).Value
   Sequencia_do_Vendedor = txtCampo(13).Value
   Venda_Fechada = chkCampo(0).Value
   Pesquisar = txtCampo(14).Value
   Orcamento = txtCampo(15).Value
   CPF_Avulso = txtCampo(16).Value
   Fone_Avulso = txtCampo(17).Value
   If Err Then Err.Clear                          'se deu algum erro, vamos resetá-lo
End Sub

'poe relacionamento e filtro na lista externa (combobox)
Private Sub PoeRelEFiltroCbo(Index As Integer)
   On Error Resume Next
   Select Case Index
      Case 0
         txtCampo(0).Filter = "([Seqüência do Geral] > " & 0 & ") AND Cliente = " & 1 & ""
                           txtCampo(0).PesqSQLExpression = "SELECT Geral.[Seqüência do Geral], Geral.[Razão Social], Geral.[Nome Fantasia], Geral.Endereço, Geral.Bairro, " + _
                                                              "Municípios.Descrição, Municípios.UF, Municípios.CEP FROM Geral, Municípios WHERE (Geral.[Seqüência do Geral] > " + CStr(0) + ") AND " + _
                                                              "(Geral.Cliente = " + CStr(1) + ") AND (Geral.[Seqüência do Município] = Municípios.[Seqüência do Município])"
      Case 6
         txtCampo(6).Filter = "[Seqüência da Propriedade] IN (SELECT [Seqüência da Propriedade] FROM [Propriedades do Geral] WHERE [Seqüência do Geral] = " & Sequencia_do_Geral & " AND Inativo = " & 0 & ")"
      Case 13
         txtCampo(13).Filter = "(([Seqüência do Geral] > " & 0 & ") AND Vendedor = " & 1 & ") AND Inativo = " & 0 & ""
      Case 14
         txtCampo(14).Filter = "[Sequencia do Projeto] > " & 0 & ""
                           txtCampo(14).PesqSQLExpression = "SELECT [Projeto de Irrigação].[Sequencia do Projeto], [Projeto de Irrigação].[Cliente Avulso], Geral.[Razão Social], " + _
                                                               "[Projeto de Irrigação].[Data da Proposta], [Projeto de Irrigação].Proposta, [Projeto de Irrigação].Opção, " + _
                                                               "[Projeto de Irrigação].[Modelo Pivo], [Projeto de Irrigação].[Sequencia do Geral], [Projeto de Irrigação].[Sequencia do Orçamento] FROM [Projeto de Irrigação], " + _
                                                               "Geral WHERE ([Projeto de Irrigação].[Sequencia do Geral] = Geral.[Seqüência do Geral]) AND ([Projeto de Irrigação].[Sequencia do Projeto] > " + CStr(0) + ")"
      Case 15
         txtCampo(15).Filter = "[Sequencia do Orçamento] > " & 0 & ""
                           txtCampo(15).PesqSQLExpression = "SELECT [Projeto de Irrigação].[Sequencia do Projeto], [Projeto de Irrigação].[Data da Proposta], [Projeto de Irrigação].[Descrição do Equipamento], " + _
                                                               "[Projeto de Irrigação].[Sequencia do Orçamento] FROM [Projeto de Irrigação] WHERE ([Projeto de Irrigação].[Sequencia do Orçamento] > " + CStr(0) + ")"
   End Select
End Sub

'executa processos/validacoes nos campos do formuário
Public Function Executar(vgOq As String) As String
   Dim vgMsg As String, vgOk As Integer, vgNVez As Integer
   On Error GoTo DeuErro                          'fica na espera de um erro...
   vgMsg$ = ""                                    'retorna uma msg dizendo o motivo
   vgOk = True                                    'se a validação esta OK
   vgNVez = 0                                     'porque não fez o processo/validacoes
   If vgOq = VALIDACOES Then
      InicializaApelidos COM_TEXTBOX
      If Not Venda_Fechada Then
         vgOk = ((VDV2(CPF_Avulso)))
         vgMsg$ = "Informe o CPF"
         If Not vgOk Then txtCampo(16).SetFocus
      End If
      If vgOk Then
         If Vazio(Cliente_Avulso) And Not Venda_Fechada Then
            vgOk = (Sequencia_do_Geral > 0)
            vgMsg$ = "Sequencia do Geral inválido!"
            If Not vgOk Then txtCampo(0).SetFocus
         End If
      End If
      If vgOk Then
         If Not Venda_Fechada Then
            vgOk = (Not Vazio(Proposta))
            vgMsg$ = "Proposta não pode ser vazio!"
            If Not vgOk Then txtCampo(1).SetFocus
         End If
      End If
      If vgOk Then
         If Not Venda_Fechada Then
            vgOk = (Not Vazio(Opcao))
            vgMsg$ = "Opção não pode ser vazio!"
            If Not vgOk Then txtCampo(2).SetFocus
         End If
      End If
      If vgOk Then
         If Not Venda_Fechada Then
            vgOk = (Data_da_Proposta = Date)
            vgMsg$ = "Data da Proposta tem que ser a data Atual!"
            If Not vgOk Then txtCampo(3).SetFocus
         End If
      End If
      If vgOk Then
         If Not Venda_Fechada Then
            vgOk = (Not Vazio(Descricao_do_Equipamento))
            vgMsg$ = "Descrição do Equipamento não pode ser vazio!"
            If Not vgOk Then txtCampo(9).SetFocus
         End If
      End If
      If vgOk Then
         If Not Venda_Fechada Then
            vgOk = (Not Vazio(Fixo_ou_Rebocavel) And Sequencia_do_Projeto > 0)
            vgMsg$ = "Fixo ou Rebocavel não pode ser vazio!"
            If Not vgOk Then txtCampo(10).SetFocus
         End If
      End If
      If vgOk Then
         If Not Venda_Fechada Then
            vgOk = (Sequencia_do_Vendedor > 0)
            vgMsg$ = "Sequencia do Vendedor inválido!"
            If Not vgOk Then txtCampo(13).SetFocus
         End If
      End If
      If vgOk Then vgMsg$ = ""
      DoEvents
   ElseIf vgOq = INICIALIZACOES Then
      InicializaApelidos COM_TEXTBOX
      On Error Resume Next
            txtCampo(10).Value = "Fixo"
            chkCampo(0).Value = False
   ElseIf vgOq = INI_APELIDOS Then
      InicializaApelidos COM_REGISTRO
      ExecutaVisivel
      ExecutaPreValidacao
   End If
   Executar = vgMsg$                              'prepara saida da função
   Exit Function                                  'e cai fora...

DeuErro:
   Select Case Err                                'vamos verificar se deu algum erro
      Case 3197                                   'registro acabou de ser alterado por outro usuário
         Resume
      Case 3046, 3158, 3186, 3187, 3188, 3189, 3218, 3260
         vgNVez = vgNVez + 1                      'outro usuário acessando
         If vgNVez <= 10 Then                     'vamos tentar 10 vezes
            Delay 0.5                             'mais antes espera 1/2 segundo
            Resume                                'antes de tentar
         End If
   End Select
   Executar = Err.Source + "|" + Trim$(Str$(Err)) + "|" + Error$ 'não teve jeito o erro não pode ser evitado...
End Function

'mostra fórmulas no formulário
Private Sub MostraFormulas()
   On Error Resume Next                           'previne erros...
   txtCampo(7).Value = InfoMun("MUN")
   If Err Then Err = 0: txtCampo(7).Text = ""
   If Err Then Err.Clear                          'se houve erro, limpa...
End Sub

'executa a pré-validação dos campos
Private Sub ExecutaPreValidacao()
   Dim Ok As Boolean
   On Error Resume Next                           'prepara para possiveis erros
   Ok = (Vazio(Cliente_Avulso) And Not Venda_Fechada)
   txtCampo(0).Enabled = (Ok And txtCampo(0).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(1).Enabled = (Ok And txtCampo(1).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(2).Enabled = (Ok And txtCampo(2).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(3).Enabled = (Ok And txtCampo(3).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(4).Enabled = (Ok And txtCampo(4).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(5).Enabled = (Ok And txtCampo(5).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(6).Enabled = (Ok And txtCampo(6).Editable)
   Ok = (Sequencia_do_Geral = 0 And Not Vazio(Cliente_Avulso))
   txtCampo(8).Enabled = (Ok And txtCampo(8).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(9).Enabled = (Ok And txtCampo(9).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(10).Enabled = (Ok And txtCampo(10).Editable)
   Ok = (Sequencia_do_Geral = 0)
   Label(11).Enabled = Ok
   Ok = (Sequencia_do_Geral = 0 And Not Vazio(Cliente_Avulso) And Not Venda_Fechada)
   txtCampo(11).Enabled = (Ok And txtCampo(11).Editable)
   Ok = (False)
   txtCampo(12).Enabled = (Ok And txtCampo(12).Editable)
   Ok = (Not Venda_Fechada)
   txtCampo(13).Enabled = (Ok And txtCampo(13).Editable)
   Ok = (Sequencia_do_Projeto > 0 And Not Venda_Fechada And Data_da_Proposta = Date)
   Botao(1).Enabled = Ok
   Ok = (Sequencia_do_Projeto > 0 And TemLance And Not Venda_Fechada And Data_da_Proposta = Date)
   Botao(2).Enabled = Ok
   Ok = (Sequencia_do_Projeto > 0 And Not Venda_Fechada And Data_da_Proposta = Date)
   Botao(3).Enabled = Ok
   Ok = (Not Venda_Fechada And Data_da_Proposta = Date)
   Botao(4).Enabled = Ok
   Ok = (Not Venda_Fechada And Data_da_Proposta = Date)
   Botao(5).Enabled = Ok
   Ok = (Not Venda_Fechada And Data_da_Proposta = Date)
   Botao(6).Enabled = Ok
   Ok = (TemItens() And Not Venda_Fechada And Data_da_Proposta = Date)
   Botao(7).Enabled = Ok
   Ok = (Not Venda_Fechada Or vgPWUsuario = "YGOR")
   chkCampo(0).Enabled = (Ok And chkCampo(0).Editable)
   Ok = (Sequencia_do_Projeto > 0)
   Botao(11).Enabled = Ok
   Ok = (Sequencia_do_Projeto > 0)
   Botao(12).Enabled = Ok
   Ok = (Not Venda_Fechada)
   txtCampo(16).Enabled = (Ok And txtCampo(16).Editable)
   Ok = (PodeImprimir)
   Botao(14).Enabled = Ok
   If Err Then Err.Clear                          'se houve erro, limpa...
End Sub

'coloca os campos visíveis segundo a condição
Private Sub ExecutaVisivel()
   On Error Resume Next                           'prepara para possiveis erros
   txtCampo(4).Visible = (Sequencia_do_Geral = 0 Or Vazio(Cliente_Avulso))
   Label(4).Visible = (Sequencia_do_Geral > 0)
   Label(5).Visible = (Sequencia_do_Geral = 0 Or txtSequencia_do_Geral = "")
   txtCampo(5).Visible = (Sequencia_do_Geral = 0 Or txtSequencia_do_Geral.Text = "")
   txtCampo(6).Visible = (Sequencia_do_Geral > 0 And Vazio(Cliente_Avulso))
   txtCampo(7).Visible = (Sequencia_do_Geral > 0 And Vazio(Cliente_Avulso))
   txtCampo(8).Visible = (Sequencia_do_Geral = 0)
   Label(15).Visible = (Sequencia_do_Geral = 0 Or Vazio(Cliente_Avulso))
   txtCampo(16).Visible = (Sequencia_do_Geral = 0 Or Vazio(Cliente_Avulso))
   txtCampo(17).Visible = (Sequencia_do_Geral = 0 Or Vazio(Cliente_Avulso))
   Label(16).Visible = (Sequencia_do_Geral = 0 Or Vazio(Cliente_Avulso))
   Botao(14).Visible = (False)
   If Err Then Err.Clear                          'se houve erro, limpa...
End Sub

'evento - quando o botão for pressionado o Botão do PopupMenu
Public Sub AcaoPopUp0(Index As Integer)
   Select Case Index
      Case 1
         mdiIRRIG.MRelProje
         AtivaForm Me
      Case 2
         mdiIRRIG.MRelImpIt
         AtivaForm Me
      Case 3
         mdiIRRIG.MTbAgua
         AtivaForm Me
      Case 4
         mdiIRRIG.MRelPrgRe
         AtivaForm Me
      Case 5
         mdiIRRIG.MRelDetSe
         AtivaForm Me
      Case 6
         mdiIRRIG.MRelmpfaz
         AtivaForm Me
   End Select
End Sub

'evento - quando o conteúdo do campo for alterado
Private Sub txtCp_Change(Index As Integer)
   If vgPriVez Or txtCampo(Index).PriVez Then Exit Sub
   InicializaApelidos COM_TEXTBOX                         'inicializa apelidos com o que esta sendo digitado
   txtCampo(Index).Change
   If Index = 0 Or Index = 6 Or Index = 10 Or Index = 13 Or Index = 14 Or Index = 15 Then
      ExecutaVisivel
      ExecutaPreValidacao
      MostraFormulas
   End If
   Select Case Index
      Case 0
         TrocaGeral
      Case 4
         LimpaGeral
      Case 15
         BuscaProjeto1
   End Select
End Sub

'evento - quando o campo receber o foco
Private Sub txtCp_GotFocus(Index As Integer)
         On Error Resume Next
         Select Case Index
         Case 0
            PoeRelEFiltroCbo 0
         Case 3
            If Len(txtCp(3).Text) = 0 Then
               txtCampo(3).Value = Date
               txtCp_Change Index
               InicializaApelidos COM_TEXTBOX
               ExecutaVisivel
               ExecutaPreValidacao
               MostraFormulas
            End If
         Case 6
            PoeRelEFiltroCbo 6
         Case 10
            If Len(txtCp(10).Text) = 0 Then
               txtCampo(10).Value = "Fixo"
               txtCp_Change Index
               InicializaApelidos COM_TEXTBOX
               ExecutaVisivel
               ExecutaPreValidacao
               MostraFormulas
            End If
         Case 13
            PoeRelEFiltroCbo 13
         Case 14
            PoeRelEFiltroCbo 14
         Case 15
            PoeRelEFiltroCbo 15
      End Select
   Select Case Index
      Case 14
         txtOrcamento.Text = ""
      Case 15
         txtPesquisar.Text = ""
   End Select
   txtCampo(Index).GotFocus
End Sub

'evento - quando o campo tiver validação imediata
Private Sub txtCp_Validate(Index As Integer, Cancel As Boolean)
   Dim vgMsg As String, vgOk As Integer
   vgOk = True
         On Error Resume Next
         Select Case Index
         Case 3
            If vgOk Then
               If Not Venda_Fechada Then
                  vgOk = (Data_da_Proposta = Date)
                  vgMsg$ = "Data da Proposta tem que ser a data Atual!"
                  If Not vgOk Then txtCampo(3).SetFocus
               End If
            End If
   End Select
   If vgOk = 0 Then                               'EPA!... tem campo errado
      If Err <> 0 Then
         CErr.NumErro = Err.Number
         CErr.Show
      Else
         Beep                                     'manda aviso sonoro
         Cancel = (MsgBox(vgMsg$ + vbCrLf + vbCrLf + LoadGasString(82), vbCritical + vbYesNo + vbDefaultButton2, vgAtencao$) = vbNo) 'mostra mensagem do erro
      End If
   End If
End Sub


'evento - quando qq tecla for digitada no campo
Private Sub txtCp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
   txtCampo(Index).KeyDown KeyCode, Shift
End Sub

'evento - quando qq tecla for digitada no campo
Private Sub txtCp_KeyPress(Index As Integer, KeyAscii As Integer)
   txtCampo(Index).KeyPress KeyAscii
End Sub

'evento - quando o campo perder o foco
Private Sub txtCp_LostFocus(Index As Integer)
   txtCampo(Index).LostFocus                      'executa LostFocus na classe
   InicializaApelidos COM_TEXTBOX                 'inicializa apelidos dos campos
   MostraFormulas                                 'mostra formulas na janela
   ExecutaVisivel                                 'torna camos visiveis
   ExecutaPreValidacao                            'habilita/desabilita campos
   Select Case Index
      Case 14
         BuscaProjeto
   End Select
End Sub


'evento - quando o check for marcado/desmarcado
Private Sub chkCp_Click(Index As Integer)
   If vgPriVez Then Exit Sub
   InicializaApelidos COM_TEXTBOX
   MostraFormulas                                 'mostra formulas na janela
   ExecutaVisivel                                 'torna camos visiveis
   ExecutaPreValidacao                            'habilita/desabilita campos
   chkCampo(Index).Change
End Sub

'evento - quando o check receber o foco
Private Sub chkCp_GotFocus(Index As Integer)
   chkCampo(Index).GotFocus
End Sub

'evento - quando qq tecla for digitada no check
Private Sub chkCp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
   chkCampo(Index).KeyDown KeyCode, Shift
End Sub

'evento - quando qq tecla for digitada no check
Private Sub chkCp_KeyPress(Index As Integer, KeyAscii As Integer)
   chkCampo(Index).KeyPress KeyAscii
End Sub

'evento - quando o check perder o foco
Private Sub chkCp_LostFocus(Index As Integer)
   chkCampo(Index).LostFocus
End Sub

'evento - inicialização do formulário
Private Sub Form_Load()
   On Error GoTo DeuErro
   Screen.MousePointer = vbHourglass
   Caption = LoadGasString(52730)
   vgFormID = 1383
   vgIdentTab = ""
   vgPriVez = True
   vgPodeFazerUnLoad = False
   vgTipo = TP_COMUM
   vgCaracteristica = F_COMUM
   vgTemFiltro = False
   vgSituacao = ACAO_NAVEGANDO
   Set mmCampo(0).Picture = LoadPicture(LoadGasPicture(44235))
   Set Botao(8).Picture = LoadPicture(LoadGasPicture(44236))
   Set txtSequencia_do_Geral = txtCampo(0)
   Set txtProposta = txtCampo(1)
   Set txtOpcao = txtCampo(2)
   Set txtDta = txtCampo(3)
   Set txtCliente_Avulso = txtCampo(4)
   Set txtPropriedade_Avulsa = txtCampo(5)
   Set txtProp = txtCampo(6)
   Set lblAjuste = Label(7)
   Set txtMunicipio = txtCampo(8)
   Set txtEquip = txtCampo(9)
   Set txtTipo = txtCampo(10)
   Set TxtFone_1 = txtCampo(11)
   Set txtSequencia_do_Projeto = txtCampo(12)
   Set txtSequencia_do_Vendedor = txtCampo(13)
   Set btnNovo = Botao(0)
   Set txtVendaFechada = chkCampo(0)
   Set txtPesquisar = txtCampo(14)
   Set txtOrcamento = txtCampo(15)
   Set txtCPF_Avulso = txtCampo(16)
   Set txtFone_Avulso = txtCampo(17)
   Set Btnimprimir = Botao(14)
   DefineControles
   vgTooltips.Create
   Label(0).Caption = LoadGasString(52735)
   vgTooltips.AddTool txtCampo(0).CtPri, 0, LoadGasString(52736)
   Label(1).Caption = LoadGasString(52737)
   vgTooltips.AddTool txtCampo(1).CtPri, 0, LoadGasString(52738)
   Label(2).Caption = LoadGasString(52739)
   Label(3).Caption = LoadGasString(52740)
   vgTooltips.AddTool txtCampo(2).CtPri, 0, LoadGasString(52741)
   vgTooltips.AddTool txtCampo(3).CtPri, 0, LoadGasString(52742)
   vgTooltips.AddTool txtCampo(4).CtPri, 0, LoadGasString(52743)
   Label(4).Caption = LoadGasString(52744)
   Label(5).Caption = LoadGasString(52745)
   vgTooltips.AddTool txtCampo(5).CtPri, 0, LoadGasString(52746)
   vgTooltips.AddTool txtCampo(6).CtPri, 0, LoadGasString(52747)
   Label(6).Caption = LoadGasString(52748)
   Label(7).Caption = LoadGasString(52749)
   vgTooltips.AddTool txtCampo(8).CtPri, 0, LoadGasString(52750)
   Label(8).Caption = LoadGasString(52751)
   vgTooltips.AddTool txtCampo(9).CtPri, 0, LoadGasString(52752)
   Label(9).Caption = LoadGasString(52753)
   Label(10).Caption = LoadGasString(52754)
   vgTooltips.AddTool txtCampo(10).CtPri, 0, LoadGasString(52755)
   Label(11).Caption = LoadGasString(52756)
   vgTooltips.AddTool txtCampo(11).CtPri, 0, LoadGasString(52757)
   vgTooltips.AddTool txtCampo(13).CtPri, 0, LoadGasString(52758)
   Label(12).Caption = LoadGasString(52759)
   Botao(0).Caption = LoadGasString(52760)
   Botao(1).Caption = LoadGasString(52761)
   Botao(2).Caption = LoadGasString(52762)
   Botao(3).Caption = LoadGasString(52763)
   Botao(4).Caption = LoadGasString(52764)
   Botao(5).Caption = LoadGasString(52765)
   Botao(6).Caption = LoadGasString(52766)
   Botao(7).Caption = LoadGasString(52767)
   Botao(8).Caption = LoadGasString(52768)
   Botao(9).Caption = LoadGasString(52769)
   Botao(10).Caption = LoadGasString(52770)
   vgTooltips.AddTool chkCampo(0).CtPri, 0, LoadGasString(52771)
   chkCampo(0).Caption = LoadGasString(52772)
   Label(13).Caption = LoadGasString(52773)
   Botao(11).Caption = LoadGasString(52774)
   Botao(12).Caption = LoadGasString(52775)
   Label(14).Caption = LoadGasString(52776)
   Label(15).Caption = LoadGasString(52777)
   vgTooltips.AddTool txtCampo(16).CtPri, 0, LoadGasString(52778)
   Label(16).Caption = LoadGasString(52779)
   Botao(13).Caption = LoadGasString(52780)
   Botao(14).Caption = LoadGasString(52781)
   AjustaTamanho Me
   Executar INICIALIZACOES
   InicializaApelidos COM_TEXTBOX
   ExecutaVisivel
   ExecutaPreValidacao
   MostraFormulas
   Screen.MousePointer = vbDefault
   vgPriVez = False
   Exit Sub

DeuErro:
   CErr.NumErro = Err
   CErr.FunctionName = "Form_Load"
   CErr.Origem = CStr(vgFormID) + " - " + Me.Caption
   CErr.Show
End Sub


'evento - quando o formulário receber o foco
Private Sub Form_Activate()
   Dim i As Integer
   AtivaForm Me
End Sub

'evento - redefinido o tamanho do formulário
Private Sub Form_Resize()
   AjustaPanFundo Me
End Sub

'define as propriedades das classe dos campos do formuário
Public Sub DefineControles()
 On Error GoTo DeuErro

   Set txtCampo(14).CtPri = txtCp(14)
   Set txtCampo(14).CtFdo = labFdo14
   Set txtCampo(14).CtBot(BOT_LISTA) = bottxtCampo14(BOT_LISTA)
   Set txtCampo(14).CtBot(BOT_COMBO) = bottxtCampo14(BOT_COMBO)
   bottxtCampo14(BOT_LISTA).Caption = "P"
   Set bottxtCampo14(BOT_COMBO).Picture = LoadPicture(LoadGasPicture(3))
   txtCampo(14).DataType = 1
   txtCampo(14).Mask = "999999"
   txtCampo(14).PesqModoAbertura = 2
   txtCampo(14).PesqFieldCapture = "[Projeto de Irrigação].[Sequencia do Projeto]"
   txtCampo(14).BoundColumn = "Sequencia do Projeto"
   txtCampo(14).ListFields = "Sequencia do Projeto"
   txtCampo(14).OrderFields = "Sequencia do Projeto-"
   txtCampo(14).Relation = ""
   txtCampo(14).Source = "Projeto de Irrigação"
   txtCampo(14).vgfrmGMCale.grdListaG.AutoRebind = True

   Set txtCampo(15).CtPri = txtCp(15)
   Set txtCampo(15).CtFdo = labFdo15
   Set txtCampo(15).CtBot(BOT_LISTA) = bottxtCampo15(BOT_LISTA)
   Set txtCampo(15).CtBot(BOT_COMBO) = bottxtCampo15(BOT_COMBO)
   bottxtCampo15(BOT_LISTA).Caption = "P"
   Set bottxtCampo15(BOT_COMBO).Picture = LoadPicture(LoadGasPicture(3))
   txtCampo(15).DataType = 1
   txtCampo(15).Mask = "999999"
   txtCampo(15).PesqModoAbertura = 2
   txtCampo(15).PesqFieldCapture = "[Projeto de Irrigação].[Sequencia do Projeto]"
   txtCampo(15).BoundColumn = "Sequencia do Projeto"
   txtCampo(15).ListFields = "Sequencia do Projeto"
   txtCampo(15).OrderFields = "Sequencia do Projeto-"
   txtCampo(15).Relation = ""
   txtCampo(15).Source = "Projeto de Irrigação"
   txtCampo(15).vgfrmGMCale.grdListaG.AutoRebind = True

   Set txtCampo(12).CtPri = txtCp(12)
   txtCampo(12).DataType = 1
   txtCampo(12).Mask = "999999"
   txtCampo(12).BoundColumn = ""
   txtCampo(12).ListFields = ""
   txtCampo(12).OrderFields = ""
   txtCampo(12).Relation = ""
   txtCampo(12).Source = ""

   Set txtCampo(4).CtPri = txtCp(4)
   txtCampo(4).DataType = 0
   txtCampo(4).Mask = "@x"
   txtCampo(4).BoundColumn = ""
   txtCampo(4).ListFields = ""
   txtCampo(4).OrderFields = ""
   txtCampo(4).Relation = ""
   txtCampo(4).Source = ""

   Set txtCampo(16).CtPri = txtCp(16)
   txtCampo(16).DataType = 0
   txtCampo(16).Mask = "999.999.999-99"
   txtCampo(16).BoundColumn = ""
   txtCampo(16).ListFields = ""
   txtCampo(16).OrderFields = ""
   txtCampo(16).Relation = ""
   txtCampo(16).Source = ""

   Set txtCampo(17).CtPri = txtCp(17)
   txtCampo(17).DataType = 0
   txtCampo(17).Mask = "(99)##999-9999"
   txtCampo(17).BoundColumn = ""
   txtCampo(17).ListFields = ""
   txtCampo(17).OrderFields = ""
   txtCampo(17).Relation = ""
   txtCampo(17).Source = ""

   Set txtCampo(0).CtPri = txtCp(0)
   Set txtCampo(0).CtFdo = labFdo0
   Set txtCampo(0).CtBot(BOT_LISTA) = bottxtCampo0(BOT_LISTA)
   Set txtCampo(0).CtBot(BOT_COMBO) = bottxtCampo0(BOT_COMBO)
   bottxtCampo0(BOT_LISTA).Caption = "P"
   Set bottxtCampo0(BOT_COMBO).Picture = LoadPicture(LoadGasPicture(3))
   txtCampo(0).DataType = 1
   txtCampo(0).Mask = "999999"
   txtCampo(0).PesqModoAbertura = 2
   txtCampo(0).PesqFieldCapture = "Geral.[Seqüência do Geral]"
   txtCampo(0).BoundColumn = "Seqüência do Geral"
   txtCampo(0).ListFields = "Razão Social; Seqüência do Geral"
   txtCampo(0).OrderFields = "Razão Social; Seqüência do Geral"
   txtCampo(0).Relation = ""
   txtCampo(0).Source = "Geral"
   txtCampo(0).vgfrmGMCale.grdListaG.AutoRebind = True

   Set txtCampo(6).CtPri = txtCp(6)
   Set txtCampo(6).CtFdo = labFdo6
   Set txtCampo(6).CtBot(BOT_COMBO) = bottxtCampo6(BOT_COMBO)
   Set bottxtCampo6(BOT_COMBO).Picture = LoadPicture(LoadGasPicture(3))
   txtCampo(6).DataType = 1
   txtCampo(6).Mask = "999999"
   txtCampo(6).BoundColumn = "Seqüência da Propriedade"
   txtCampo(6).ListFields = "Nome da Propriedade; Endereço; Complemento; Bairro"
   txtCampo(6).OrderFields = "Nome da Propriedade; Seqüência da Propriedade"
   txtCampo(6).Relation = ""
   txtCampo(6).Source = "Propriedades"
   txtCampo(6).vgfrmGMCale.grdListaG.AutoRebind = True

   Set txtCampo(5).CtPri = txtCp(5)
   txtCampo(5).DataType = 0
   txtCampo(5).Mask = "@x"
   txtCampo(5).BoundColumn = ""
   txtCampo(5).ListFields = ""
   txtCampo(5).OrderFields = ""
   txtCampo(5).Relation = ""
   txtCampo(5).Source = ""

   Set txtCampo(1).CtPri = txtCp(1)
   txtCampo(1).DataType = 0
   txtCampo(1).Mask = "@x"
   txtCampo(1).BoundColumn = ""
   txtCampo(1).ListFields = ""
   txtCampo(1).OrderFields = ""
   txtCampo(1).Relation = ""
   txtCampo(1).Source = ""

   Set txtCampo(2).CtPri = txtCp(2)
   txtCampo(2).DataType = 0
   txtCampo(2).Mask = "@x"
   txtCampo(2).BoundColumn = ""
   txtCampo(2).ListFields = ""
   txtCampo(2).OrderFields = ""
   txtCampo(2).Relation = ""
   txtCampo(2).Source = ""

   Set txtCampo(3).CtPri = txtCp(3)
   Set txtCampo(3).CtFdo = labFdo3
   Set txtCampo(3).CtBot(BOT_ACAO) = bottxtCampo3(BOT_ACAO)
   Set bottxtCampo3(BOT_ACAO).Picture = LoadPicture(LoadGasPicture(4))
   txtCampo(3).DataType = 2
   txtCampo(3).Mask = "99/99/9999"
   txtCampo(3).BoundColumn = ""
   txtCampo(3).ListFields = ""
   txtCampo(3).OrderFields = ""
   txtCampo(3).Relation = ""
   txtCampo(3).Source = ""

   Set txtCampo(8).CtPri = txtCp(8)
   txtCampo(8).DataType = 0
   txtCampo(8).Mask = ""
   txtCampo(8).BoundColumn = ""
   txtCampo(8).ListFields = ""
   txtCampo(8).OrderFields = ""
   txtCampo(8).Relation = ""
   txtCampo(8).Source = ""

   Set txtCampo(7).CtPri = txtCp(7)
   txtCampo(7).DataType = 0
   txtCampo(7).Mask = ""
   txtCampo(7).Editable = False
   txtCampo(7).BoundColumn = ""
   txtCampo(7).ListFields = ""
   txtCampo(7).OrderFields = ""
   txtCampo(7).Relation = ""
   txtCampo(7).Source = ""

   Set txtCampo(11).CtPri = txtCp(11)
   txtCampo(11).DataType = 0
   txtCampo(11).Mask = "(99)##999-9999"
   txtCampo(11).BoundColumn = ""
   txtCampo(11).ListFields = ""
   txtCampo(11).OrderFields = ""
   txtCampo(11).Relation = ""
   txtCampo(11).Source = ""

   Set txtCampo(9).CtPri = txtCp(9)
   txtCampo(9).DataType = 0
   txtCampo(9).Mask = "@x"
   txtCampo(9).BoundColumn = ""
   txtCampo(9).ListFields = ""
   txtCampo(9).OrderFields = ""
   txtCampo(9).Relation = ""
   txtCampo(9).Source = ""

   Set txtCampo(10).CtPri = txtCp(10)
   Set txtCampo(10).CtFdo = labFdo10
   Set txtCampo(10).CtBot(BOT_COMBO) = bottxtCampo10(BOT_COMBO)
   Set bottxtCampo10(BOT_COMBO).Picture = LoadPicture(LoadGasPicture(3))
   txtCampo(10).DataType = 0
   txtCampo(10).ListFields = "Fixo|Rebocável"

   Set txtCampo(13).CtPri = txtCp(13)
   Set txtCampo(13).CtFdo = labFdo13
   Set txtCampo(13).CtBot(BOT_COMBO) = bottxtCampo13(BOT_COMBO)
   Set bottxtCampo13(BOT_COMBO).Picture = LoadPicture(LoadGasPicture(3))
   txtCampo(13).DataType = 1
   txtCampo(13).Mask = "999999"
   txtCampo(13).BoundColumn = "Seqüência do Geral"
   txtCampo(13).ListFields = "Razão Social"
   txtCampo(13).OrderFields = "Razão Social"
   txtCampo(13).Relation = ""
   txtCampo(13).Source = "Geral"
   txtCampo(13).vgfrmGMCale.grdListaG.AutoRebind = True

   Set chkCampo(0).CtPri = ChkCp(0)
   chkCampo(0).DataType = 5

 Exit Sub

DeuErro:
  CErr.NumErro = Err
  CErr.FunctionName = "DefineControles0"
  CErr.Origem = CStr(vgFormID) + " - " + Me.Caption
 CErr.Show
End Sub

'evento - antes de descarregar o formulário
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   If vgPodeFazerUnLoad = False Then
      timUnLoad.Enabled = True
      Cancel = True
   End If
   Cancel = Cancel Or (Not vgFG Is Nothing)
End Sub

'evento - descarregando o formulário da memória
Private Sub Form_Unload(Cancel As Integer)
   Dim i As Integer
   On Error Resume Next
   Alteracao
   FinalizaForm Me
   Set txtSequencia_do_Geral = Nothing
   Set txtProposta = Nothing
   Set txtOpcao = Nothing
   Set txtDta = Nothing
   Set txtCliente_Avulso = Nothing
   Set txtPropriedade_Avulsa = Nothing
   Set txtProp = Nothing
   Set lblAjuste = Nothing
   Set txtMunicipio = Nothing
   Set txtEquip = Nothing
   Set txtTipo = Nothing
   Set TxtFone_1 = Nothing
   Set txtSequencia_do_Projeto = Nothing
   Set txtSequencia_do_Vendedor = Nothing
   Set btnNovo = Nothing
   Set txtVendaFechada = Nothing
   Set txtPesquisar = Nothing
   Set txtOrcamento = Nothing
   Set txtCPF_Avulso = Nothing
   Set txtFone_Avulso = Nothing
   Set Btnimprimir = Nothing
   For i = 0 To UBound(txtCampo)
      txtCampo(i).Finalize
      Set txtCampo(i) = Nothing
   Next
   Set chkCampo(0) = Nothing
   Set vgFG = Nothing
   Set vgTooltips = Nothing
   Set frmNovoPrg = Nothing                       'libera o segmento de código do form
End Sub

'evento - quando qq tecla for digitada no formulário
Private Sub Form_KeyPress(KeyAscii As Integer)
   If KeyAscii = vbKeyEscape Then                 'se teclou ESC
      Unload Me                                   'tira este form da memória
   End If
End Sub

'evento - quando o tempo esgotar
Private Sub timUnLoad_Timer()
   timUnLoad.Enabled = False
   vgPodeFazerUnLoad = True
   Unload Me
End Sub

'evento - quando o botão for pressionado
Private Sub Botao_Click(Index As Integer)
   Dim Cancel As Boolean, hMenu As Long, pt As POINTAPI
   If vgPriVez Then Exit Sub
   Select Case Index
      Case 0
         Incluir
      Case 1
         AbreLances
      Case 2
         AreaIrrigada
      Case 3
         MCA
      Case 4
         AbreCabos
      Case 5
         AbreBombas
      Case 6
         AbreProjeto
      Case 7
         Financeiro ((Sequencia_do_Projeto))
      Case 8
         Alteracao
      Case 9
         AbreExecutivo
      Case 10
         MapaBocal
      Case 11
         DuplicaProjeto
      Case 12
         GerarOrcamento
      Case 13
         PreValidaImpressao
      Case 14
         hMenu = CreatePopupMenu()
         AppendMenu hMenu, MF_STRING, 1, "Ficha Tecnica"
         AppendMenu hMenu, MF_STRING, 2, "Itens"
         AppendMenu hMenu, MF_STRING, 3, "Aplicação de Agua"
         AppendMenu hMenu, MF_STRING, 4, "Resumo"
         AppendMenu hMenu, MF_STRING, 5, "Serviços"
         AppendMenu hMenu, MF_STRING, 6, "Mapa da Propriedade"
         GetCursorPos pt
         AcaoPopUp0 TrackPopupMenuEx(hMenu, TPM_LEFTALIGN Or TPM_RETURNCMD Or TPM_RIGHTBUTTON, pt.x, pt.y, Me.hWnd, ByVal 0&)
         DestroyMenu hMenu
   End Select
End Sub


'evento - quando o botão for apertado
Private Sub bottxtCampo14_Click(Index As Integer)
   txtCampo(14).SetFocus
   DoEvents
   txtCampo(14).BotClick Index
End Sub

'evento - quando o botão for apertado
Private Sub bottxtCampo15_Click(Index As Integer)
   txtCampo(15).SetFocus
   DoEvents
   txtCampo(15).BotClick Index
End Sub

'evento - quando o botão for apertado
Private Sub bottxtCampo0_Click(Index As Integer)
   txtCampo(0).SetFocus
   DoEvents
   txtCampo(0).BotClick Index
End Sub

'evento - quando o botão for apertado
Private Sub bottxtCampo6_Click(Index As Integer)
   txtCampo(6).SetFocus
   DoEvents
   txtCampo(6).BotClick Index
End Sub

'evento - quando o botão for apertado
Private Sub bottxtCampo3_Click(Index As Integer)
   txtCampo(3).SetFocus
   DoEvents
   txtCampo(3).BotClick Index
End Sub

'evento - quando o botão for apertado
Private Sub bottxtCampo10_Click(Index As Integer)
   txtCampo(10).SetFocus
   DoEvents
   txtCampo(10).BotClick Index
End Sub

'evento - quando o botão for apertado
Private Sub bottxtCampo13_Click(Index As Integer)
   txtCampo(13).SetFocus
   DoEvents
   txtCampo(13).BotClick Index
End Sub

'evento - quando o mouse for pressionado sobre o campo
Private Sub txtCp_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
   txtCampo(Index).MouseDown
End Sub



