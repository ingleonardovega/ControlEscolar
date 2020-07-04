object inscripciones: Tinscripciones
  Left = 0
  Top = 0
  Caption = 'Cambio de Semestre'
  ClientHeight = 521
  ClientWidth = 780
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
  object gridAlumno: TStringGrid
    Left = 0
    Top = 73
    Width = 780
    Height = 448
    Align = alClient
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = gridAlumnoDblClick
    OnSelectCell = gridAlumnoSelectCell
    ColWidths = (
      100
      265
      64
      64
      80
      61
      77)
    RowHeights = (
      24
      24)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 73
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 32
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
    object CheckBox1: TCheckBox
      Left = 212
      Top = 46
      Width = 97
      Height = 17
      Caption = 'ver inactivos'
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 16
    object Avanzarsemestre1: TMenuItem
      Caption = 'Avanzar semestre'
      OnClick = Avanzarsemestre1Click
    end
    object Regresarsemestre1: TMenuItem
      Caption = 'Regresar semestre'
      OnClick = Regresarsemestre1Click
    end
  end
end
