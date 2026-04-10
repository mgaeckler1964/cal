object MainForm: TMainForm
  Left = 594
  Top = 199
  Width = 626
  Height = 389
  ActiveControl = StatusLine
  Caption = 'C.A.L.'
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDefault
  WindowState = wsMaximized
  WindowMenu = Window1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 317
    Width = 618
    Height = 26
    Align = alBottom
    BorderWidth = 1
    TabOrder = 0
    object StatusLine: TPanel
      Left = 2
      Top = 2
      Width = 553
      Height = 22
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      BorderWidth = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 555
      Top = 2
      Width = 61
      Height = 22
      Align = alRight
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 1
    end
  end
  object SpeedPanel: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 30
    Align = alTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object ExitBtn: TSpeedButton
      Left = 0
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Beendet das Lernprogramm'
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00377777777777
        777777773FFFFFFFFFFFF333333F888888888888F7F7F7888888888888883333
        33888888888888877F7F788888888888888F333FF88844444400888FFF444444
        88888888888333888883333334D5007FFF433333333338F888F3338F33333333
        345D50FFFF4333333333388788F3338F3333333334D5D0FFFF433333333338F8
        78F3338F33333333345D50FEFE4333333333388788F3338F3333333334D5D0FF
        FF433333333338F878F3338F33333333345D50FEFE4333333333388788F3338F
        3333333334D5D0FFFF433333333338F878F3338F33333333345D50FEFE433333
        3333388788F3338F3333333334D5D0EFEF433333333338F878F3338F33333333
        345D50FEFE4333333333388788F3338F3333333334D5D0EFEF433333333338F8
        F8FFFF8F33333333344444444443333333333888888888833333333333333333
        3333333333333333FFFFFF333333333333300000033333333333333888888F33
        333333333330AAAA0333333333333338FFFF8F33333333333330000003333333
        33333338888883333333}
      NumGlyphs = 2
      OnClick = FileExitItemClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 4
    Top = 36
    object File1: TMenuItem
      Caption = '&Datei'
      Hint = 'Info und Ende'
      object HelpAboutItem: TMenuItem
        Caption = '&Über C.A.L. ...'
        Hint = 'Informationen'
        OnClick = HelpAboutItemClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FileExitItem: TMenuItem
        Caption = '&Ende'
        Hint = 'Beendet das Lernprogramm'
        OnClick = FileExitItemClick
      end
    end
    object Lektionen1: TMenuItem
      Caption = '&Lektionen'
      Hint = 'Lernkommandos'
      object Sprachen1: TMenuItem
        Caption = '&Sprachen'
        Hint = 'Legt die möglichen Sprachen fest'
        OnClick = Sprachen1Click
      end
      object Wrterbearbeiten1: TMenuItem
        Caption = '&Wörter bearbeiten'
        Hint = 'Bearbeitet die Wörterbücher'
        OnClick = Wrterbearbeiten1Click
      end
      object Lektionenbearbeiten1: TMenuItem
        Caption = '&Lektionen bearbeiten'
        Hint = 'Erzeugt und bearbeitet Lektionen'
        OnClick = Lektionenbearbeiten1Click
      end
      object Lernen1: TMenuItem
        Caption = 'Le&rnen'
        Hint = 'Übt eine Lektion'
        OnClick = Lernen1Click
      end
    end
    object Window1: TMenuItem
      Caption = '&Fenster'
      Hint = 'Fensterkommandos'
      object WindowCascadeItem: TMenuItem
        Caption = 'Ü&bereinander'
        Hint = 'Legt Fenster übereinander'
        OnClick = WindowCascadeItemClick
      end
      object WindowTileItem: TMenuItem
        Caption = '&Nebeneinander'
        Hint = 'Legt Fenster nebeneinnader an'
        OnClick = WindowTileItemClick
      end
      object WindowArrangeItem: TMenuItem
        Caption = '&Symbole anordnen'
        Hint = 'Ordnet die Symbole am unteren Ende an'
        OnClick = WindowArrangeItemClick
      end
      object WindowMinimizeItem: TMenuItem
        Caption = '&Alle Fenster als Symbol'
        Hint = 'Stellt alle Fenster als Symbole dar'
        OnClick = WindowMinimizeItemClick
      end
    end
  end
end
