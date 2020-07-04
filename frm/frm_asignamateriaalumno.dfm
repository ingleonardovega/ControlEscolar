object asignamateriaalumno: Tasignamateriaalumno
  Left = 0
  Top = 0
  Caption = 'Asigna Materia Alumnos'
  ClientHeight = 542
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label29: TLabel
      Left = 26
      Top = 16
      Width = 60
      Height = 16
      Caption = 'Semestre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 47
      Top = 43
      Width = 39
      Height = 16
      Caption = 'Grupo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 212
      Top = 16
      Width = 57
      Height = 16
      Caption = 'Matricula:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 275
      Top = 16
      Width = 105
      Height = 16
      Caption = '---------------------'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 408
      Top = 18
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label5: TLabel
      Left = 421
      Top = 45
      Width = 11
      Height = 13
      Alignment = taRightJustify
      Caption = 'ca'
    end
    object ComboBox4: TComboBox
      Left = 92
      Top = 15
      Width = 61
      Height = 21
      TabOrder = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6')
    end
    object ComboBox5: TComboBox
      Left = 92
      Top = 42
      Width = 61
      Height = 21
      TabOrder = 1
      OnSelect = ComboBox5Select
      Items.Strings = (
        'A'
        'B')
    end
    object BitBtn1: TBitBtn
      Left = 816
      Top = 13
      Width = 75
      Height = 46
      Caption = 'Agregar'
      Kind = bkRetry
      NumGlyphs = 2
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object ComboBox3: TComboBox
      Left = 438
      Top = 15
      Width = 115
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      TextHint = 'Tipo'
      OnSelect = ComboBox3Select
      Items.Strings = (
        'AREA'
        'CAPACITACION'
        'PARAESCOLAR')
    end
    object ComboBox1: TComboBox
      Left = 438
      Top = 42
      Width = 211
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      TextHint = 'Area'
      OnDropDown = ComboBox1DropDown
      Items.Strings = (
        'TRONCO COMUN'
        'AREA'
        'CAPACITACION'
        'PARAESCOLAR')
    end
  end
  object gridAlumno: TStringGrid
    Left = 0
    Top = 73
    Width = 912
    Height = 469
    Align = alClient
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnDblClick = gridAlumnoDblClick
    OnSelectCell = gridAlumnoSelectCell
    ColWidths = (
      107
      265
      82
      154
      140
      138)
    RowHeights = (
      24
      24)
  end
  object PopupMenu1: TPopupMenu
    Left = 608
    Top = 176
    object Eliminaparaescolar1: TMenuItem
      Caption = 'Elimina paraescolar'
      OnClick = Eliminaparaescolar1Click
    end
    object Eliminacapacitacion1: TMenuItem
      Caption = 'Elimina capacitacion'
      OnClick = Eliminacapacitacion1Click
    end
    object Eliminaarea1: TMenuItem
      Caption = 'Elimina area'
      OnClick = Eliminaarea1Click
    end
  end
end
