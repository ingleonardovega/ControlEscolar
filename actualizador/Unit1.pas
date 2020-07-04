unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TLHelp32, IdFTP, IdComponent,
  Vcl.ComCtrls, Vcl.WinXCtrls, IdBaseComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, UniProvider, MySQLUniProvider, Data.DB, MemDS,
  DBAccess, Uni, RzPrgres, ShellAPI;

type
  TTerminateStatus = (tsError, tsClose, tsTerminate);

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FTP: TIdFTP;
    UniConnection1: TUniConnection;
    Reporte: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    ActivityIndicator1: TActivityIndicator;
    Label3: TLabel;
    procedure Label2Click(Sender: TObject);
    function KillTask(FileName:String):integer;
    procedure DescargarArchivo(sArchivo: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.KillTask(FileName:String):integer;
var
ContinueLoop:BOOL;
FSnapshotHandle:THandle;
FProcessEntry32:TProcessEntry32;
const
PROCESS_TERMINATE=$0001;
begin
FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
while integer(ContinueLoop)<>0 do
begin
if
((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))=UpperCase(FileName))
or (UpperCase(FProcessEntry32.szExeFile)=UpperCase(FileName)))
then

Result:=Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE,BOOL(0),

FProcessEntry32.th32ProcessID),0));
ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
end;
CloseHandle(FSnapshotHandle);
end;


procedure TForm1.Label2Click(Sender: TObject);
begin
 KillTask('controlescolar.exe');
 DescargarArchivo('setup.exe');
 ShellExecute(0,'open','setup.exe',nil,nil,SW_NORMAL);
 ShellExecute(0,'open','C:\Program Files (x86)\control FPT\ControlEscolar.exe',nil,nil,SW_NORMAL);
 Close;
end;

procedure TForm1.DescargarArchivo( sArchivo: String );
var
  FTP: TIdFTP;
begin
  FTP := TIdFTP.Create( nil );
  FTP.Username := 'controlfpt';
  FTP.Password := '4Nhs@z48';
  FTP.Host := 'ftp.bachillerato-fpt.com.mx';
  try
    FTP.Connect;
  except
    raise Exception.Create( 'No se ha podido conectar con el servidor ' + FTP.Host );
  end;

  if FileExists( sArchivo ) then
    DeleteFile( sArchivo );

  FTP.Get(ExtractFileName( sArchivo ), ExtractFilePath(ParamStr(0))+sArchivo, False, False );
  FTP.Disconnect;
  FTP.Free;

end;

end.
