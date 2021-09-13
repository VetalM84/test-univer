object Form2: TForm2
  Left = 285
  Top = 194
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
  ClientHeight = 253
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 5
    Top = 5
    Width = 226
    Height = 206
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 135
    Top = 220
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 25
    Top = 220
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Save: TSaveDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1095#1077#1090
    Left = 125
    Top = 75
  end
end
