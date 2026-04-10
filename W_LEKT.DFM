object WortListForm: TWortListForm
  Left = 900
  Top = 297
  Width = 650
  Height = 722
  Caption = 'Lektionen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object woertBuchGrid: TDBGrid
    Left = 0
    Top = 73
    Width = 224
    Height = 622
    Align = alLeft
    DataSource = WortSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'System'
    TitleFont.Style = []
  end
  object WortListGrid: TDBGrid
    Left = 409
    Top = 73
    Width = 224
    Height = 622
    Align = alLeft
    DataSource = WortListSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'System'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 408
      Top = 8
      Width = 47
      Height = 16
      Caption = 'Lektion'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 75
      Height = 16
      Caption = 'Wörterbuch'
    end
    object LektionCombo: TComboBox
      Left = 408
      Top = 24
      Width = 169
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 3
      OnChange = LektionComboChange
    end
    object ButtonNewLesson: TButton
      Left = 240
      Top = 8
      Width = 129
      Height = 25
      Caption = '&Neue Lektion'
      TabOrder = 1
      OnClick = ButtonNewLessonClick
    end
    object deleteLektion: TButton
      Left = 240
      Top = 40
      Width = 129
      Height = 25
      Caption = '&Lektion löschen'
      Enabled = False
      TabOrder = 2
      OnClick = deleteLektionClick
    end
    object SprachCombo: TComboBox
      Left = 8
      Top = 24
      Width = 169
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
      OnChange = SprachComboChange
    end
  end
  object TPanel
    Left = 224
    Top = 73
    Width = 185
    Height = 622
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Label3: TLabel
      Left = 12
      Top = 192
      Width = 85
      Height = 16
      Caption = 'Neuer Name:'
    end
    object addButton: TButton
      Left = 8
      Top = 88
      Width = 169
      Height = 25
      Caption = '&Hinzufügen>>'
      Enabled = False
      TabOrder = 2
      OnClick = addButtonClick
    end
    object deleteButton: TButton
      Left = 8
      Top = 152
      Width = 169
      Height = 25
      Caption = '<<&Entfernen'
      Enabled = False
      TabOrder = 4
      OnClick = deleteButtonClick
    end
    object insertAllButton: TButton
      Left = 8
      Top = 120
      Width = 169
      Height = 25
      Caption = 'Neue &Worte>>'
      Enabled = False
      TabOrder = 3
      OnClick = addNewButtonClick
    end
    object SortDeutsch: TRadioButton
      Left = 8
      Top = 16
      Width = 73
      Height = 17
      Caption = '&Deutsch'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = SortDeutschClick
    end
    object SortForeign: TRadioButton
      Left = 8
      Top = 40
      Width = 113
      Height = 17
      Caption = '&Fremdsprache'
      TabOrder = 1
      OnClick = SortForeignClick
    end
    object renameButton: TButton
      Left = 8
      Top = 248
      Width = 169
      Height = 25
      Caption = '&Umbenennen'
      Enabled = False
      TabOrder = 6
      OnClick = renameButtonClick
    end
    object newLektName: TEdit
      Left = 8
      Top = 216
      Width = 169
      Height = 24
      TabOrder = 5
      OnChange = newLektNameChange
    end
  end
  object WortSource: TDataSource
    DataSet = WortTabelle
    Left = 8
    Top = 144
  end
  object WortTabelle: TTable
    DatabaseName = 'CAL'
    IndexName = 'deutschIdx'
    ReadOnly = True
    TableName = 'WORTE.DB'
    Left = 40
    Top = 144
    object WortTabelleDeutsch: TStringField
      DisplayWidth = 10
      FieldName = 'Deutsch'
      Size = 255
    end
    object WortTabelleFremdsprache: TStringField
      DisplayWidth = 13
      FieldName = 'Fremdsprache'
      Size = 255
    end
    object WortTabelleId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object WortTabelleSprache: TIntegerField
      FieldName = 'Sprache'
      Visible = False
    end
  end
  object WortListSource: TDataSource
    DataSet = wortListSql
    Left = 416
    Top = 128
  end
  object wortListSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'select worte.deutsch, worte.fremdsprache, worte.id'
      'from worte, w_list'
      'where w_list.wort = worte.id and w_list.lektion = :lektionId'
      'order by worte.deutsch')
    Left = 464
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'lektionId'
        ParamType = ptUnknown
      end>
    object wortListSqlDeutsch: TStringField
      DisplayWidth = 10
      FieldName = 'Deutsch'
      Size = 255
    end
    object wortListSqlFremdsprache: TStringField
      DisplayWidth = 10
      FieldName = 'Fremdsprache'
      Size = 255
    end
    object wortListSqlId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
  end
  object lektionSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'select id, lektion'
      'from lektion '
      'where sprache = :theLangId'
      'order by lektion'
      '')
    Left = 576
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'theLangId'
        ParamType = ptUnknown
      end>
  end
  object deleteAllSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'delete from w_list where lektion = :lektionId;')
    Left = 288
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'lektionId'
        ParamType = ptUnknown
      end>
  end
  object deleteLektSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'delete from lektion where id = :lektionId')
    Left = 264
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'lektionId'
        ParamType = ptUnknown
      end>
  end
  object insertSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'insert into w_list ( lektion, wort ) values (:lekId, :wortId )')
    Left = 304
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'lekId'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'wortId'
        ParamType = ptUnknown
      end>
  end
  object deleteSQL: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'delete from w_list '
      'where lektion = :lekId and wort = :wortId')
    Left = 304
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'lekId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wortId'
        ParamType = ptUnknown
      end>
  end
  object insertAllSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'select Id '
      'from worte '
      'where frageDatum is null and '
      '   sprache = :sprache')
    Left = 304
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sprache'
        ParamType = ptUnknown
      end>
  end
  object updateNewSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'update worte'
      'set FrageDatum = :newDate'
      'where FrageDatum is null')
    Left = 344
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'newDate'
        ParamType = ptUnknown
      end>
  end
  object renameLektSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'update lektion'
      'set lektion = :newName'
      'where Id = :lektionId')
    Left = 312
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'newName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'lektionId'
        ParamType = ptUnknown
      end>
  end
  object sprachSQL: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'select id, sprache from sprache order by sprache')
    Left = 176
    Top = 24
  end
end
