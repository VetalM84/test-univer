object Form1: TForm1
  Left = 200
  Top = 106
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1092#1072#1081#1083#1086#1074' '#1090#1077#1089#1090#1072
  ClientHeight = 299
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 476
    Height = 301
    ActivePage = TabSheet1
    HotTrack = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1058#1077#1084#1072', '#1074#1072#1088#1080#1072#1085#1090', '#1090#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1086#1074
      object Label1: TLabel
        Left = 194
        Top = 60
        Width = 75
        Height = 13
        Caption = #1058#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
      end
      object Edit1: TLabeledEdit
        Left = 10
        Top = 20
        Width = 161
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = #1058#1077#1084#1072
        TabOrder = 0
      end
      object Edit3: TLabeledEdit
        Left = 255
        Top = 20
        Width = 86
        Height = 21
        EditLabel.Width = 85
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1087#1088#1086#1089#1086#1074
        TabOrder = 2
        OnKeyPress = Edit3KeyPress
      end
      object Edit2: TLabeledEdit
        Left = 190
        Top = 20
        Width = 46
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090
        TabOrder = 1
        OnKeyPress = Edit2KeyPress
      end
      object Button1: TButton
        Left = 357
        Top = 20
        Width = 101
        Height = 21
        Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1092#1072#1081#1083
        TabOrder = 3
        OnClick = Button1Click
      end
      object ListView1: TListView
        Left = 10
        Top = 59
        Width = 161
        Height = 201
        Columns = <
          item
            Caption = #1042#1086#1087#1088#1086#1089' '#8470' '
            Width = 140
          end>
        ColumnClick = False
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
        OnClick = ListView1Click
      end
      object RichEdit1: TRichEdit
        Left = 192
        Top = 75
        Width = 266
        Height = 76
        ScrollBars = ssBoth
        TabOrder = 5
      end
      object Button2: TButton
        Left = 308
        Top = 159
        Width = 150
        Height = 21
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1089#1090' '#1074#1086#1087#1088#1086#1089#1072
        TabOrder = 6
        OnClick = Button2Click
      end
      object Button5: TButton
        Left = 308
        Top = 240
        Width = 150
        Height = 21
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' '#1090#1077#1089#1090#1072
        TabOrder = 7
        OnClick = Button5Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1086#1090#1074#1077#1090', '#1074#1072#1088#1080#1072#1085#1090#1099' '#1086#1090#1074#1077#1090#1072
      ImageIndex = 1
      object Label2: TLabel
        Left = 130
        Top = 7
        Width = 233
        Height = 16
        Caption = #1058#1077#1082#1091#1097#1080#1081' '#1074#1086#1087#1088#1086#1089' '#8470' '#1085#1077#1080#1079#1074#1077#1089#1090#1077#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ListView2: TListView
        Left = 10
        Top = 89
        Width = 446
        Height = 81
        Hint = 
          #1044#1083#1103' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1074#1093#1086#1076#1072' '#1074' '#1088#1077#1078#1080#1084' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1090#1077#1082#1089#1090#1072' '#1074#1099#1076#1077#1083#1080#1090#1077' '#1089#1090#1088#1086#1082#1091 +
          ' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter'
        Columns = <
          item
            Caption = #1058#1077#1082#1089#1090' '#1074#1072#1088#1080#1072#1085#1090#1086#1074' '#1086#1090#1074#1077#1090#1072
            Width = 425
          end>
        ColumnClick = False
        GridLines = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnKeyPress = ListView2KeyPress
      end
      object Edit4: TLabeledEdit
        Left = 30
        Top = 54
        Width = 91
        Height = 21
        EditLabel.Width = 91
        EditLabel.Height = 13
        EditLabel.Caption = #1042#1072#1088#1080#1072#1085#1090#1086#1074' '#1086#1090#1074#1077#1090#1072
        TabOrder = 1
        OnChange = Edit4Change
        OnKeyPress = Edit4KeyPress
      end
      object Button3: TButton
        Left = 265
        Top = 54
        Width = 176
        Height = 21
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1088#1080#1072#1085#1090#1086#1074' '#1086#1090#1074#1077#1090#1072
        TabOrder = 2
        OnClick = Button3Click
      end
      object Edit5: TLabeledEdit
        Left = 140
        Top = 54
        Width = 111
        Height = 21
        EditLabel.Width = 109
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1086#1090#1074#1077#1090' '#8470
        TabOrder = 3
        OnKeyPress = Edit5KeyPress
      end
      object Button4: TButton
        Left = 245
        Top = 180
        Width = 195
        Height = 21
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1089#1090' '#1074#1072#1088#1080#1072#1085#1090#1086#1074' '#1086#1090#1074#1077#1090#1072
        TabOrder = 4
        OnClick = Button4Click
      end
    end
  end
  object Save: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1090#1077#1089#1090#1072' (*.tes)|*.tes|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1090#1077#1089#1090#1072
    Left = 170
    Top = 200
  end
  object Open: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' '#1090#1077#1089#1090#1072' (*.tes)|*.tes|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Title = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' '#1090#1077#1089#1090#1072
    Left = 130
    Top = 200
  end
end
