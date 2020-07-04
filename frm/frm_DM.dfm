object DM: TDM
  OldCreateOrder = False
  Height = 343
  Width = 651
  object Conexion: TUniConnection
    ProviderName = 'MySQL'
    Database = 'bachill7_fpt'
    Username = 'bachi_fpt'
    Server = 'www.bachillerato-fpt.com.mx'
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
    EncryptedPassword = 'B9FFAFFFABFFCEFF8EFFCDFF88FFCCFF9AFFCBFF8DFFDCFF'
  end
  object Qusuario: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'select * from usuario')
    Left = 136
    Top = 32
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 40
    Top = 136
  end
  object Qtemp: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      
        'SELECT COUNT(*) as total FROM ficha_tecnica WHERE status_alumno ' +
        '= 1')
    Left = 320
    Top = 32
  end
  object Qfichatecnica: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      '')
    Left = 192
    Top = 32
  end
  object Cont2: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'SELECT'
      'CASE '#39'A'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'A'#39' AND semestre = 1)'
      'END AS PrimeroA, '
      'CASE '#39'B'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'B'#39' AND semestre = 1)'
      'END AS PrimeroB, '
      'CASE '#39'A'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'A'#39' AND semestre = 3)'
      'END AS TerceroA, '
      'CASE '#39'B'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'B'#39' AND semestre = 3)'
      'END AS TerceroB, '
      'CASE '#39'A'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'A'#39' AND semestre = 5)'
      'END AS QuintoA, '
      'CASE '#39'B'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'B'#39' AND semestre = 5)'
      'END AS QuintoB, '
      'CASE '#39'A'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'A'#39' AND semestre = 2)'
      'END AS SegundoA, '
      'CASE '#39'B'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'B'#39' AND semestre = 2)'
      'END AS SegundoB,'
      'CASE '#39'A'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'A'#39' AND semestre = 4)'
      'END AS CuartoA, '
      'CASE '#39'B'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'B'#39' AND semestre = 4)'
      'END AS CuartoB,'
      'CASE '#39'A'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'A'#39' AND semestre = 6)'
      'END AS SextoA, '
      'CASE '#39'B'#39
      'WHEN grupo AND semestre THEN SUM(grupo = '#39'B'#39' AND semestre = 6)'
      'END AS SextoB  '
      'FROM ficha_tecnica WHERE status_alumno = 1')
    Left = 280
    Top = 32
  end
  object QFoto: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'SELECT CONCAT('
      '    paterno_alumno,'
      '    '#39' '#39','
      '    materno_alumno,'
      '    '#39' '#39','
      '    nombre_alumno'
      '  ) AS nombre, '
      '  semestre,'
      '  grupo,'
      '  foto_alumno'
      'FROM'
      '  ficha_tecnica ')
    Left = 368
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = QFoto
    Left = 48
    Top = 80
  end
  object QRegisitroWeb: TUniQuery
    Connection = Conexion
    Left = 440
    Top = 40
  end
  object Qcheck_doc: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'Select * from check_documentos')
    Left = 240
    Top = 104
  end
  object update: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'select * from updateFPT where status = 1')
    Left = 440
    Top = 128
  end
  object Qjustificante: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'Select * from justificantes')
    Left = 304
    Top = 104
  end
  object Qgrupo: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'select * from grupo')
    Left = 120
    Top = 216
  end
  object Qareas: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'select * from areas')
    Left = 192
    Top = 216
  end
  object Qmuestramateria: TUniQuery
    Connection = Conexion
    Left = 280
    Top = 224
  end
  object Qmateria: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'Select * from materia')
    Left = 360
    Top = 216
  end
  object Qpersonal: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'Select * from personal')
    Left = 416
    Top = 216
  end
  object Qreportes: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'Select * from reportes')
    Left = 384
    Top = 112
  end
  object QimpPrefecto_justifica: TUniQuery
    Connection = Conexion
    SQL.Strings = (
      'Select * from justificantes where mobile = 1')
    Left = 536
    Top = 88
  end
end
