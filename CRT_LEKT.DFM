object CreateLektionDlg: TCreateLektionDlg
  Left = 122
  Top = 597
  BorderStyle = bsDialog
  Caption = 'Neue Lektion'
  ClientHeight = 143
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 47
    Height = 13
    Caption = 'Lektion:'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 52
    Height = 13
    Caption = 'Sprache:'
  end
  object OkButton: TBitBtn
    Left = 126
    Top = 83
    Width = 77
    Height = 27
    Enabled = False
    TabOrder = 2
    OnClick = OkButtonClick
    Kind = bkOK
  end
  object BitBtnCancel: TBitBtn
    Left = 208
    Top = 83
    Width = 77
    Height = 27
    Caption = 'Abbruch'
    TabOrder = 3
    Kind = bkCancel
  end
  object lektionName: TEdit
    Left = 72
    Top = 16
    Width = 209
    Height = 21
    TabOrder = 0
    OnChange = lektionNameChange
  end
  object SprachCombo: TComboBox
    Left = 72
    Top = 48
    Width = 217
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnChange = SprachComboChange
  end
  object SprachTabelle: TTable
    DatabaseName = 'CAL'
    TableName = 'SPRACHE.DB'
    Left = 16
    Top = 88
    object SprachTabelleId: TIntegerField
      FieldName = 'Id'
    end
    object SprachTabelleSprache: TStringField
      FieldName = 'Sprache'
      Size = 32
    end
  end
  object insertLektSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      
        'insert into lektion ( lektion, sprache ) values (:lektion,:sprac' +
        'he)')
    Left = 48
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'lektion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sprache'
        ParamType = ptUnknown
      end>
  end
end
