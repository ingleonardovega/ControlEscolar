object fotoalumno: Tfotoalumno
  Left = 0
  Top = 0
  Caption = 'Foto Alumno'
  ClientHeight = 533
  ClientWidth = 583
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object foto2: TImage
    Left = 11
    Top = 8
    Width = 199
    Height = 233
  end
  object Label1: TLabel
    Left = 216
    Top = 24
    Width = 49
    Height = 13
    Caption = 'Semestre:'
  end
  object Label2: TLabel
    Left = 336
    Top = 24
    Width = 33
    Height = 13
    Caption = 'Grupo:'
  end
  object Label3: TLabel
    Left = 256
    Top = 504
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 464
    Top = 24
    Width = 48
    Height = 13
    Caption = '............'
  end
  object foto1: TPanel
    Left = 11
    Top = 8
    Width = 199
    Height = 233
    Caption = 'foto1'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 38
    Top = 247
    Width = 139
    Height = 74
    Caption = 'Tomar Foto'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 221
    Top = 48
    Width = 337
    Height = 449
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nombre'
        Title.Caption = 'Nombre Alumno'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'foto_alumno'
        Title.Caption = 'Foto'
        Visible = True
      end>
  end
  object ComboBox1: TComboBox
    Left = 267
    Top = 21
    Width = 54
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
  end
  object ComboBox2: TComboBox
    Left = 375
    Top = 21
    Width = 58
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    OnSelect = ComboBox2Select
    Items.Strings = (
      'A'
      'B')
  end
end
