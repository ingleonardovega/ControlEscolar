object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 147
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 24
    Width = 400
    Height = 33
    Caption = 'Se a detectado una version nueva'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 160
    Top = 72
    Width = 134
    Height = 33
    Cursor = crHandPoint
    Caption = 'Actualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = Label2Click
  end
  object Label3: TLabel
    Left = 27
    Top = 121
    Width = 267
    Height = 19
    Caption = '**Al terminar se cerrara la pantalla**'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ActivityIndicator1: TActivityIndicator
    Left = 320
    Top = 63
    Animate = True
    IndicatorColor = aicWhite
    IndicatorSize = aisXLarge
  end
  object FTP: TIdFTP
    IPVersion = Id_IPv4
    Passive = True
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 72
    Top = 80
  end
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Database = 'bachill7_fpt'
    Username = 'bachi_fpt'
    Server = 'www.bachillerato-fpt.com.mx'
    Connected = True
    Left = 376
    Top = 40
    EncryptedPassword = 'B9FFAFFFABFFCEFF8EFFCDFF88FFCCFF9AFFCBFF8DFFDCFF'
  end
  object Reporte: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'Select * from det_update')
    Left = 400
    Top = 80
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 336
    Top = 64
  end
end
