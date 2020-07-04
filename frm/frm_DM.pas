unit frm_DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  MySQLUniProvider;

type
  TDM = class(TDataModule)
    Conexion: TUniConnection;
    Qusuario: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    Qtemp: TUniQuery;
    Qfichatecnica: TUniQuery;
    Cont2: TUniQuery;
    QFoto: TUniQuery;
    DataSource1: TDataSource;
    QRegisitroWeb: TUniQuery;
    Qcheck_doc: TUniQuery;
    update: TUniQuery;
    Qjustificante: TUniQuery;
    Qgrupo: TUniQuery;
    Qareas: TUniQuery;
    Qmuestramateria: TUniQuery;
    Qmateria: TUniQuery;
    Qpersonal: TUniQuery;
    Qreportes: TUniQuery;
    QimpPrefecto_justifica: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
