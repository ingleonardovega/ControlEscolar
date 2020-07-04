object creamateria: Tcreamateria
  Left = 0
  Top = 0
  Caption = 'Crear Materias'
  ClientHeight = 460
  ClientWidth = 821
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
    Top = 40
    Width = 80
    Height = 13
    Caption = 'Nombre materia:'
  end
  object Label2: TLabel
    Left = 495
    Top = 40
    Width = 49
    Height = 13
    Caption = 'Semestre:'
  end
  object Label3: TLabel
    Left = 639
    Top = 40
    Width = 33
    Height = 13
    Caption = 'Grupo:'
  end
  object Label4: TLabel
    Left = 80
    Top = 13
    Width = 24
    Height = 13
    Caption = 'Tipo:'
  end
  object Label5: TLabel
    Left = 279
    Top = 13
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Area:'
    Visible = False
  end
  object Edit1: TEdit
    Left = 110
    Top = 37
    Width = 371
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    TextHint = 'Nombre de materia'
  end
  object ComboBox1: TComboBox
    Left = 550
    Top = 37
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = 'Semestre'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
  end
  object ComboBox2: TComboBox
    Left = 673
    Top = 37
    Width = 75
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    TextHint = 'Grupo'
    OnDropDown = ComboBox2DropDown
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 138
    Width = 724
    Height = 273
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      298
      91
      115
      159
      19)
  end
  object ComboBox3: TComboBox
    Left = 110
    Top = 10
    Width = 115
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    TextHint = 'Tipo'
    OnSelect = ComboBox3Select
    Items.Strings = (
      'TRONCO COMUN'
      'AREA'
      'CAPACITACION TRABAJO'
      'PARAESCOLAR')
  end
  object ComboBox4: TComboBox
    Left = 312
    Top = 10
    Width = 313
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    TextHint = 'Area'
    Visible = False
    OnDropDown = ComboBox4DropDown
    Items.Strings = (
      'TRONCO COMUN'
      'AREA'
      'CAPACITACION'
      'PARAESCOLAR')
  end
  object RadioGroup1: TRadioGroup
    Left = 110
    Top = 69
    Width = 638
    Height = 63
    Caption = 'Filtro'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'TODAS'
      'TRONCO COMUN'
      'AREA'
      'CAPACITACION TRABAJO'
      'PARAESCOLAR')
    TabOrder = 6
    OnClick = RadioGroup1Click
  end
  object MainMenu1: TMainMenu
    Left = 768
    Top = 32
    object Guardar1: TMenuItem
      Caption = 'Guardar'
      OnClick = Guardar1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 488
    Top = 216
    object Eliminar1: TMenuItem
      Caption = 'Eliminar'
      OnClick = Eliminar1Click
    end
  end
end
