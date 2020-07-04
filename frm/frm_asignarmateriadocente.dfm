object asignarmateriadocente: Tasignarmateriadocente
  Left = 0
  Top = 0
  Caption = 'Asignar Materias Docentes'
  ClientHeight = 472
  ClientWidth = 822
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 33
    Width = 44
    Height = 13
    Caption = 'Docente:'
  end
  object Label2: TLabel
    Left = 28
    Top = 73
    Width = 40
    Height = 13
    Caption = 'Materia:'
  end
  object Edit1: TEdit
    Left = 74
    Top = 30
    Width = 535
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    TextHint = 'Consultar docente'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 74
    Top = 70
    Width = 535
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    TextHint = 'Consultar materia'
    OnChange = Edit2Change
  end
  object StringGrid2: TStringGrid
    Left = 56
    Top = 136
    Width = 705
    Height = 241
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnSelectCell = StringGrid2SelectCell
    ColWidths = (
      57
      48
      428
      62
      64)
  end
  object BitBtn1: TBitBtn
    Left = 74
    Top = 97
    Width = 75
    Height = 25
    Caption = 'Agregar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object StringGrid3: TStringGrid
    Left = 74
    Top = 91
    Width = 535
    Height = 157
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 5
    Visible = False
    OnDblClick = StringGrid3DblClick
    OnSelectCell = StringGrid3SelectCell
    ColWidths = (
      64
      449)
  end
  object StringGrid1: TStringGrid
    Left = 74
    Top = 45
    Width = 439
    Height = 85
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    Visible = False
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      53
      341)
  end
  object PopupMenu1: TPopupMenu
    Left = 688
    Top = 272
    object Eliminar1: TMenuItem
      Caption = 'Eliminar'
      OnClick = Eliminar1Click
    end
  end
end
