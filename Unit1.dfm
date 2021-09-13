object Form1: TForm1
  Left = 203
  Top = 168
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1077#1089#1090' '
  ClientHeight = 317
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 10
    Top = 30
    Width = 46
    Height = 19
    Caption = #1058#1077#1084#1072': '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 5
    Width = 85
    Height = 19
    Caption = #1042#1072#1088#1080#1072#1085#1090' '#8470' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 5
    Top = 255
    Width = 526
    Height = 6
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 10
    Top = 55
    Width = 64
    Height = 19
    Caption = #1054#1094#1077#1085#1082#1072': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 365
    Top = 10
    Width = 35
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object Label5: TLabel
    Left = 529
    Top = 0
    Width = 10
    Height = 11
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -5
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 0
    Width = 3
    Height = 3
    Flat = True
    OnMouseMove = SpeedButton1MouseMove
  end
  object Radio2: TRadioGroup
    Left = 5
    Top = 165
    Width = 526
    Height = 81
    Caption = ' '#1054#1090#1074#1077#1090' '
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 298
    Width = 536
    Height = 19
    Panels = <
      item
        Text = #1042#1089#1077#1075#1086' '#1074#1086#1087#1088#1086#1089#1086#1074': '
        Width = 115
      end
      item
        Text = #1058#1077#1082#1091#1097#1080#1081' '#1074#1086#1087#1088#1086#1089' '#8470' '
        Width = 130
      end
      item
        Text = #1054#1089#1090#1072#1083#1086#1089#1100' '#1086#1090#1074#1077#1090#1080#1090#1100' '#1085#1072' '
        Width = 140
      end>
  end
  object Button2: TButton
    Left = 405
    Top = 265
    Width = 126
    Height = 26
    Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1074#1086#1087#1088#1086#1089
    Default = True
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 5
    Top = 265
    Width = 91
    Height = 26
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
    TabOrder = 3
    OnClick = Button4Click
  end
  object Memo1: TRichEdit
    Left = 5
    Top = 90
    Width = 526
    Height = 71
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 175
    Top = 5
    Width = 151
    Height = 21
    TabOrder = 5
    Text = #1060'.'#1048'.'#1054'.'
  end
  object MaskEdit1: TMaskEdit
    Left = 405
    Top = 5
    Width = 31
    Height = 21
    CharCase = ecUpperCase
    EditMask = '99-L;1;_'
    MaxLength = 4
    TabOrder = 6
    Text = '  - '
  end
  object Button1: TButton
    Left = 115
    Top = 265
    Width = 126
    Height = 25
    Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
    TabOrder = 7
    OnClick = Button1Click
  end
  object Openf: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' '#1090#1077#1089#1090#1072'|*.tes|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 480
    Top = 110
  end
  object Calc: TsCalculator
    BeepOnError = False
    Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
    Left = 440
    Top = 110
  end
end
