object consulta_alumno: Tconsulta_alumno
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Consulta Alumno'
  ClientHeight = 238
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 35
    Top = 24
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
  object Edit1: TEdit
    Left = 87
    Top = 23
    Width = 530
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clWhite
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object gridAlumno: TStringGrid
    Left = 8
    Top = 70
    Width = 609
    Height = 160
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    OnDblClick = gridAlumnoDblClick
    OnSelectCell = gridAlumnoSelectCell
    ColWidths = (
      100
      265
      64
      64
      80)
    RowHeights = (
      24
      24)
  end
end
