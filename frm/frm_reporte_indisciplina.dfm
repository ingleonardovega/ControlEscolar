object reporte_indisciplina: Treporte_indisciplina
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Reporte de indisciplina '
  ClientHeight = 573
  ClientWidth = 910
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 23
    Width = 157
    Height = 25
    Caption = 'Nombre alumno:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 787
    Top = 29
    Width = 94
    Height = 25
    Caption = 'Semestre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 817
    Top = 60
    Width = 64
    Height = 25
    Caption = 'Grupo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 897
    Top = 31
    Width = 11
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 897
    Top = 60
    Width = 11
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 114
    Top = 60
    Width = 67
    Height = 25
    Caption = 'Motivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 53
    Top = 154
    Width = 128
    Height = 25
    Caption = 'Fecha / Hora:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 335
    Top = 156
    Width = 84
    Height = 25
    Caption = 'Prefecto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 187
    Top = 22
    Width = 574
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 187
    Top = 153
    Width = 142
    Height = 33
    Date = 43871.387909976850000000
    Time = 43871.387909976850000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 187
    Top = 59
    Width = 574
    Height = 88
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 425
    Top = 153
    Width = 336
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnDropDown = ComboBox1DropDown
  end
  object Panel1: TPanel
    Left = 28
    Top = 209
    Width = 874
    Height = 353
    TabOrder = 4
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 19
      Width = 297
      Height = 46
      Caption = 'Consultas'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Pendientes'
        'justificados')
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object DateTimePicker2: TDateTimePicker
      Left = 332
      Top = 33
      Width = 123
      Height = 24
      Date = 43392.467460960640000000
      Time = 43392.467460960640000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = DateTimePicker2Change
    end
    object CheckBox1: TCheckBox
      Left = 488
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Mes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object grid_consulta: TRzStringGrid
      Left = 8
      Top = 89
      Width = 849
      Height = 209
      ColCount = 6
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 3
      OnSelectCell = grid_consultaSelectCell
      ColWidths = (
        256
        68
        336
        102
        100
        31)
    end
    object Button1: TButton
      Left = 408
      Top = 304
      Width = 91
      Height = 33
      Caption = 'Re Imprimir'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Edit4: TEdit
      Left = 544
      Top = 36
      Width = 273
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TextHint = 'NOMBRE ALUMNO'
      OnChange = Edit4Change
    end
  end
  object MainMenu1: TMainMenu
    Left = 835
    Top = 145
    object Guardar1: TMenuItem
      Caption = 'Guardar/imprimir'
      OnClick = Guardar1Click
    end
    object Consultar1: TMenuItem
      Caption = 'Consultar'
      OnClick = Consultar1Click
    end
  end
  object print: TfrxReport
    Version = '5.6.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43725.362121875000000000
    ReportOptions.LastChange = 43725.362121875000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = printGetValue
    Left = 864
    Top = 104
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object PopupMenu1: TPopupMenu
    Left = 856
    Top = 200
    object Pendiente1: TMenuItem
      Caption = 'Pendiente'
      OnClick = Pendiente1Click
    end
    object Entregado1: TMenuItem
      Caption = 'Entregado'
      OnClick = Entregado1Click
    end
  end
end
