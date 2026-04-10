object WortForm: TWortForm
  Left = 250
  Top = 552
  Width = 737
  Height = 448
  ActiveControl = Panel1
  Caption = 'Wörterbuch'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Sprache:'
    end
    object DBNavigator: TDBNavigator
      Left = 8
      Top = 48
      Width = 230
      Height = 25
      DataSource = WortSource
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object RadioButtonDeutsch: TRadioButton
      Left = 256
      Top = 56
      Width = 65
      Height = 17
      Caption = 'Deutsch'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = RadioButtonDeutschClick
    end
    object RadioButtonFremdsprache: TRadioButton
      Left = 320
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Fremdsprache'
      TabOrder = 3
      OnClick = RadioButtonFremdspracheClick
    end
    object SprachCombo: TComboBox
      Left = 56
      Top = 8
      Width = 217
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      OnChange = SprachComboChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 729
    Height = 340
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 6
      Top = 6
      Width = 717
      Height = 328
      Align = alClient
      BorderStyle = bsNone
      DataSource = WortSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object WortSource: TDataSource
    DataSet = WortTabelle
    Left = 239
    Top = 133
  end
  object WortTabelle: TTable
    DatabaseName = 'CAL'
    IndexName = 'deutschIdx'
    MasterFields = 'Id'
    MasterSource = _SprachSource
    TableName = 'worte.db'
    Left = 172
    Top = 133
    object WortTabelleDeutsch: TStringField
      DisplayWidth = 40
      FieldName = 'Deutsch'
      Size = 255
    end
    object WortTabelleFremdsprache: TStringField
      DisplayWidth = 40
      FieldName = 'Fremdsprache'
      Size = 255
    end
    object WortTabelleFehler: TSmallintField
      DisplayWidth = 3
      FieldName = 'Fehler'
      ReadOnly = True
      Required = True
    end
    object WortTabelleFrageDatum: TDateField
      FieldName = 'FrageDatum'
      ReadOnly = True
    end
    object WortTabelleSprache: TIntegerField
      FieldName = 'Sprache'
      Visible = False
    end
  end
  object SprachTabelle: TTable
    DatabaseName = 'CAL'
    TableName = 'SPRACHE.DB'
    Left = 328
    Top = 8
    object SprachTabelleId: TIntegerField
      FieldName = 'Id'
    end
    object SprachTabelleSprache: TStringField
      FieldName = 'Sprache'
      Size = 32
    end
  end
  object _SprachSource: TDataSource
    DataSet = SprachTabelle
    Left = 384
    Top = 8
  end
end
