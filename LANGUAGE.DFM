object LangForm: TLangForm
  Left = 22
  Top = 631
  Width = 499
  Height = 231
  ActiveControl = Panel1
  Caption = 'Sprachen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNavigator: TDBNavigator
      Left = 8
      Top = 8
      Width = 240
      Height = 25
      DataSource = DataSourceSprache
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 491
    Height = 163
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 479
      Height = 151
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSourceSprache
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object DataSourceSprache: TDataSource
    DataSet = TableSprache
    Left = 303
    Top = 53
  end
  object TableSprache: TTable
    DatabaseName = 'CAL'
    TableName = 'sprache.db'
    Left = 180
    Top = 61
    object TableSpracheSprache: TStringField
      FieldName = 'Sprache'
      Size = 32
    end
  end
end
