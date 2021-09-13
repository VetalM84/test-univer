object Form2: TForm2
  Left = 225
  Top = 188
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 209
  ClientWidth = 197
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 10
    Width = 155
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1087#1072#1087#1082#1077' '#1089' '#1092#1072#1081#1083#1072#1084#1080' '#1090#1077#1089#1090#1072
  end
  object Label2: TLabel
    Left = 15
    Top = 65
    Width = 166
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1086#1082#1085#1072' '#1085#1072#1089#1090#1088#1086#1077#1082
  end
  object Bevel2: TBevel
    Left = 5
    Top = 60
    Width = 186
    Height = 106
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 5
    Top = 5
    Width = 186
    Height = 50
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 45
    Top = 115
    Width = 95
    Height = 13
    Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1087#1072#1088#1086#1083#1103
  end
  object Edit1: TEdit
    Left = 15
    Top = 25
    Width = 141
    Height = 21
    TabOrder = 0
  end
  object Button2: TButton
    Left = 35
    Top = 175
    Width = 126
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    Default = True
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 15
    Top = 135
    Width = 166
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 15
    Top = 85
    Width = 166
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 160
    Top = 25
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Folder: TpsvBrowseFolderDialog
    Left = 20
    Top = 115
  end
end
