object AboutDlg: TAboutDlg
  Left = 906
  Top = 335
  ActiveControl = OKButton
  BorderStyle = bsDialog
  Caption = 'C.A.L.'
  ClientHeight = 175
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 281
    Height = 121
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 24
      Top = 24
      Width = 33
      Height = 33
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9FFFFFFFFFFFFFFFCCCCCFFFFFFFFFFF9FFFFFFFFFFFFFCCFF
        FFFCCFFFFFFFFF9FFFFFFFFFFFFCFFFFFFFFFCFFFFFFFF9FFFFFFFFFFFCFFFFF
        FFFFFFCFFFFFFF9FFFFFFFFFFFCFFFFFFFFFFFCFFFFFFF9FFFFFFFFFFCFFFFFF
        FFFFFFFCFFFFFF9FFFFFFFFFFCFFFFFFFFFFFFFCFFFFFF9FFFFFFFFFFCFFFFFF
        FFFFFFFC9FFFFF9FFFFF9FFFFCFFFFFFFFFFFFFCF9FFFF9FFFF9FFFFFCFFFFFF
        FFFFFFFCFF9FFF9FFF9FFFFFFFCFFFFFFFFFFFCFFFF9FF9FF9FFFFFFFFCFFFFF
        FFFFFFCFFFFF9F9F9FFFFFFFFFFCFFFFFFFFFCFFFFFFF999FFFFFFFFFFFFCCFF
        FFFCCFFFFFFFFF9FFFFFFFFFFFFFFFCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFCFFFFFFFFFFFFFFF9FFFFFFFFFFFFFFFCFFFFFFFFFFFFFF9
        99FFFFFFFFFFFFFFCFFFFFFFFFFFFF9F9F9FFFFFFFFFFFFFCFFFFFFFFFFFF9FF
        9FF9FFFFFFFFFFFFCFFFFFFFFFFF9FFF9FFF9FFFFFFFFFFFCFFFFFFFFFF9FFFF
        9FFFF9FFFCFFFFFFCFFFFFFFFF9FFFFF9FFFFF9FFFCFFFFFCFFFFFFFF9FFFFFF
        9FFFFFF9FFFCFFFFCFFFFFFFFFFFFFFF9FFFFFFFFFFFCFFFCFFFFFFFFFFFFFFF
        9FFFFFFFFFFFFCFFCFFFFFFFFFFFFFFF9FFFFFFFFFFFFFCFCFFFFFFFFFFFFFFF
        9FFFFFFFFFFFFFFCCFFFFFFFFFFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000}
      Stretch = True
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 16
      Width = 163
      Height = 13
      Caption = 'C omputer  A ided  L earning'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 40
      Width = 65
      Height = 13
      Caption = 'Version 1.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 80
      Width = 190
      Height = 13
      Caption = 'Copyright 1995 by Martin Gäckler'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
  end
  object OKButton: TBitBtn
    Left = 103
    Top = 138
    Width = 77
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Kind = bkOK
    Margin = 2
    Spacing = -1
    IsControl = True
  end
end
