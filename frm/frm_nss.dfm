object nss: Tnss
  Left = 0
  Top = 0
  Caption = 'Numero Seguro Social Alumnos'
  ClientHeight = 478
  ClientWidth = 763
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
    Left = 356
    Top = 13
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
  object Label2: TLabel
    Left = 210
    Top = 43
    Width = 48
    Height = 16
    Caption = 'Alumno:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 419
    Top = 13
    Width = 7
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 238
    Top = 72
    Width = 29
    Height = 16
    Caption = 'NSS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 41
    Top = 447
    Width = 13
    Height = 16
    Caption = '# '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox5: TComboBox
    Left = 92
    Top = 42
    Width = 61
    Height = 21
    TabOrder = 0
    OnSelect = ComboBox5Select
    Items.Strings = (
      'A'
      'B')
  end
  object ComboBox4: TComboBox
    Left = 92
    Top = 15
    Width = 61
    Height = 21
    TabOrder = 1
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
  end
  object Edit1: TEdit
    Left = 273
    Top = 42
    Width = 232
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    TabOrder = 2
    OnChange = Edit1Change
  end
  object gridAlumno: TStringGrid
    Left = 26
    Top = 104
    Width = 719
    Height = 337
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 3
    OnDblClick = gridAlumnoDblClick
    OnSelectCell = gridAlumnoSelectCell
    ColWidths = (
      100
      265
      88
      138
      80)
    RowHeights = (
      24
      24)
  end
  object Edit2: TEdit
    Left = 273
    Top = 71
    Width = 232
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 92
    Top = 73
    Width = 127
    Height = 17
    Caption = 'Ver  activos/inactivos'
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object BitBtn1: TBitBtn
    Left = 600
    Top = 21
    Width = 105
    Height = 64
    Caption = 'Actualizar'
    Kind = bkRetry
    NumGlyphs = 2
    Style = bsNew
    TabOrder = 6
    OnClick = BitBtn1Click
  end
end
