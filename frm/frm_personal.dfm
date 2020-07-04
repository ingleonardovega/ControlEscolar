object personal: Tpersonal
  Left = 0
  Top = 0
  Caption = 'Alta de Personal'
  ClientHeight = 489
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 33
    Width = 82
    Height = 13
    Caption = 'Apellido Paterno:'
  end
  object Label2: TLabel
    Left = 24
    Top = 60
    Width = 84
    Height = 13
    Caption = 'Apellido Materno:'
  end
  object Label3: TLabel
    Left = 52
    Top = 87
    Width = 54
    Height = 13
    Caption = 'Nombre(s):'
  end
  object Label4: TLabel
    Left = 73
    Top = 114
    Width = 33
    Height = 13
    Caption = 'Cargo:'
  end
  object Label5: TLabel
    Left = 411
    Top = 33
    Width = 28
    Height = 13
    Caption = 'Perfil:'
  end
  object Label6: TLabel
    Left = 408
    Top = 60
    Width = 31
    Height = 13
    Caption = 'CURP:'
  end
  object Label7: TLabel
    Left = 591
    Top = 115
    Width = 67
    Height = 16
    Caption = 'Fecha nac.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 415
    Top = 87
    Width = 24
    Height = 13
    Caption = 'RFC:'
  end
  object Edit1: TEdit
    Left = 112
    Top = 30
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    TextHint = 'Apellido paterno'
  end
  object Edit2: TEdit
    Left = 112
    Top = 57
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = 'Apellido materno'
  end
  object Edit3: TEdit
    Left = 112
    Top = 84
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    TextHint = 'nombre (s)'
  end
  object ComboBox3: TComboBox
    Left = 112
    Top = 111
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    TextHint = 'CARGO'
    Items.Strings = (
      'ADMINISTRATIVO'
      'DOCENTE'
      'DIRECTIVO'
      'INTENDENTE'
      'PREFECTO'
      '')
  end
  object Edit4: TEdit
    Left = 445
    Top = 30
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    TextHint = 'Perfil'
  end
  object Edit5: TEdit
    Left = 445
    Top = 57
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    TextHint = 'curp'
    OnExit = Edit5Exit
  end
  object RadioGroup1: TRadioGroup
    Left = 445
    Top = 106
    Width = 129
    Height = 30
    Columns = 2
    Enabled = False
    Items.Strings = (
      'Hombre'
      'Mujer')
    TabOrder = 6
  end
  object MaskEdit1: TMaskEdit
    Left = 661
    Top = 111
    Width = 65
    Height = 21
    BorderStyle = bsNone
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 7
    Text = '  /  /    '
    TextHint = 'dia/mes/a'#241'o/'
  end
  object Edit6: TEdit
    Left = 445
    Top = 84
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    TextHint = 'RFC'
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 232
    Width = 702
    Height = 233
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 9
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      358
      236
      99
      47)
  end
  object RadioGroup2: TRadioGroup
    Left = 88
    Top = 150
    Width = 497
    Height = 63
    Caption = 'Filtro'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'TODOS'
      'DIRECTIVOS'
      'DOCENTES'
      'ADMINISTRATIVOS'
      'PREFECTOS'
      'INTENDENTES')
    TabOrder = 10
    OnClick = RadioGroup2Click
  end
  object ComboBox1: TComboBox
    Left = 591
    Top = 159
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 11
    TextHint = 'Status'
    Items.Strings = (
      'INACTIVO'
      'ACTIVO')
  end
  object MainMenu1: TMainMenu
    Left = 16
    object Guardar1: TMenuItem
      Caption = 'Guardar'
      OnClick = Guardar1Click
    end
    object Limpiar1: TMenuItem
      Caption = 'Limpiar'
      OnClick = Limpiar1Click
    end
  end
end
