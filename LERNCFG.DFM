object LernConfigDlg: TLernConfigDlg
  Left = 982
  Top = 131
  HorzScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Lernen'
  ClientHeight = 225
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 115
    Width = 47
    Height = 13
    Caption = '&Lektion:'
  end
  object Label2: TLabel
    Left = 8
    Top = 147
    Width = 102
    Height = 13
    Caption = '&Bedenkzeit (Sek):'
  end
  object Label3: TLabel
    Left = 8
    Top = 83
    Width = 52
    Height = 13
    Caption = '&Sprache:'
  end
  object GroupBoxLanguage: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 57
    Caption = 'Sprache'
    TabOrder = 0
  end
  object okButton: TBitBtn
    Left = 142
    Top = 187
    Width = 77
    Height = 27
    Enabled = False
    TabOrder = 7
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 187
    Width = 77
    Height = 27
    Caption = '&Abbruch'
    TabOrder = 8
    Kind = bkCancel
  end
  object deutschRadio: TRadioButton
    Left = 16
    Top = 32
    Width = 73
    Height = 17
    Caption = '&Deutsch'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object mixedRadio: TRadioButton
    Left = 88
    Top = 32
    Width = 81
    Height = 17
    Caption = '&Gemischt'
    TabOrder = 2
  end
  object fremdRadio: TRadioButton
    Left = 168
    Top = 32
    Width = 97
    Height = 17
    Caption = '&Fremdsprache'
    TabOrder = 3
  end
  object LektionCombo: TComboBox
    Left = 112
    Top = 112
    Width = 185
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    Sorted = True
    TabOrder = 5
    OnChange = LektionComboChange
  end
  object timeoutEdit: TEdit
    Left = 112
    Top = 144
    Width = 185
    Height = 21
    TabOrder = 6
    OnChange = timeoutEditChange
  end
  object SprachCombo: TComboBox
    Left = 112
    Top = 80
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    OnChange = SprachComboChange
  end
  object lektionSql: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'select lektion, id '
      'from lektion '
      'where sprache = :theLangId '
      'order by lektion')
    Left = 80
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'theLangId'
        ParamType = ptUnknown
      end>
  end
  object sprachSQL: TQuery
    DatabaseName = 'CAL'
    SQL.Strings = (
      'select id, sprache from sprache order by sprache')
    Left = 80
    Top = 80
  end
end
