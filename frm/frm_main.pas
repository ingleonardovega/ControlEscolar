unit frm_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Menus,
  Vcl.Grids, Data.DB, Vcl.DBGrids, frxClass, frxDCtrl, frm_inscripciones, ShellApi;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Materias: TCategoryPanel;
    Button7: TButton;
    Button8: TButton;
    CategoryPanel3: TCategoryPanel;
    Button10: TButton;
    CategoryPanel4: TCategoryPanel;
    Button11: TButton;
    Button12: TButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    aaaaa1: TMenuItem;
    Timer1: TTimer;
    Button13: TButton;
    print: TfrxReport;
    frxDialogControls1: TfrxDialogControls;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    CategoryPanel5: TCategoryPanel;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button9: TButton;
    Button29: TButton;
    Button30: TButton;
    CategoryPanel6: TCategoryPanel;
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure aaaaa1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure consultagrupos(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Delay(dwMilliseconds: DWORD);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button2Click(Sender: TObject); {Similar al Windows.Sleep}
  private
    { Private declarations }
  public
  const
    version = '4.2';
    var
      primeroA, primeroB, segundoA, segundoB, terceroA, terceroB, cuartoA, cuartoB, quinto, sexto :string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses frm_DM, frm_login, frm_ficha_tecnica, frm_fotoAlumno, frm_registro_web,
  frm_justificante, frm_nss, frm_creamateria, frm_personal,
  frm_asignarmateriadocente, frm_asignamateriaalumno, frm_reporte_indisciplina;

procedure TForm1.Delay(dwMilliseconds: DWORD); {Similar al Windows.Sleep}
var
  ATickCount: DWORD;
begin
  ATickCount := GetTickCount + dwMilliseconds;
  while ATickCount > GetTickCount do
    Application.ProcessMessages;
end;

procedure TForm1.aaaaa1Click(Sender: TObject);
begin
  Application.CreateForm(Tlogin, login);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\alumnoguia.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
// if Self.MDIChildCount >= 1 then
//  begin
//    fotoalumno.Close;
//  end;
//  Application.CreateForm(Tfotoalumno, fotoalumno);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
    inscripciones.Close;
  end;
  Application.CreateForm(Tinscripciones, inscripciones);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
   print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\listas.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
   print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\listasevidencias.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\listasevidenciasparaesc.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\listascalificaciones.fr3');
  //print.PrepareReport(true);
  print.ShowReport();

end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\bitacoralimpieza.fr3');
  print.PrepareReport(True);
  print.PrintOptions.ShowDialog:=true;
  print.Print;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
    justificante.Close;
  end;
  Application.CreateForm(Tjustificante, justificante);
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
   print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\bitacorasalumnos.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
   print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\constanciaalumnos.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\controlacceso.fr3');
  print.PrepareReport(True);
  print.PrintOptions.ShowDialog:=true;
  print.Print;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
   print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\tarejetasadministrativos.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
   print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\tarejetasdocentes.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\reportemaestros.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\kardex.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\bitacorabanos.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
   print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\listaboletas.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
   if Self.MDIChildCount >= 1 then
  begin
    asignamateriaalumno.Close;
  end;
  Application.CreateForm(Tasignamateriaalumno, asignamateriaalumno);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
  reporte_indisciplina.Close;
  end;
  Application.CreateForm(Treporte_indisciplina, reporte_indisciplina);
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(ParamStr(0))+'\reportes\sellocotejo.fr3');
  //print.PrepareReport(true);
  print.ShowReport();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
    ficha_tecnica.Close;
  end;
  Application.CreateForm(Tficha_tecnica, ficha_tecnica);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
    nss.Close;
  end;
  Application.CreateForm(Tnss, nss);

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
    creamateria.Close;
  end;
  Application.CreateForm(Tcreamateria, creamateria);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
    asignarmateriadocente.Close;
  end;
  Application.CreateForm(Tasignarmateriadocente, asignarmateriadocente);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if Self.MDIChildCount >= 1 then
  begin
    personal.Close;
  end;
  Application.CreateForm(Tpersonal, personal);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Image1.Left := ((Form1.Width + CategoryPanelGroup1.Width ) div 2) - (Image1.Width div 2); // asi va al centro horizontal
  Image1.Top := (Form1.Height  div 2) - (Image1.Height div 2);

//  DBGrid1.Left := Form1.Width;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  consultagrupos(Sender);

  Caption := 'Control Escolar v'+version;

  DM.update.Open;
  if not (version = DM.update.FieldByName('ver').AsString) and (DM.update.FieldByName('status').AsInteger = 1) then
  begin
    ShellExecute(Handle, 'open', PWChar(ExtractFilePath(ParamStr(0))+'update.exe'), 0, 0, SW_SHOWNORMAL) ;
  end;

end;
procedure TForm1.consultagrupos(Sender: TObject);
var
  datos :String;
begin

  DM.Conexion.Connected := True;
  DM.Qtemp.Open;
  DM.Cont2.Open;
  datos := 'Primero A: '+DM.Cont2.FieldByName('PrimeroA').AsString+
           '  Primero B: '+DM.Cont2.FieldByName('PrimeroB').AsString+
           '  Segundo A: '+DM.Cont2.FieldByName('SegundoA').AsString+
           '  Segundo B: '+DM.Cont2.FieldByName('SegundoB').AsString+
           '  Tercero A: '+DM.Cont2.FieldByName('TerceroA').AsString+
           '  Tercero B: '+DM.Cont2.FieldByName('TerceroB').AsString+
           '  Cuarto A: '+DM.Cont2.FieldByName('CuartoA').AsString+
           '  Cuarto B: '+DM.Cont2.FieldByName('CuartoB').AsString+
           '  Quinto A: '+DM.Cont2.FieldByName('QuintoA').AsString+
           '  Quinto B: '+DM.Cont2.FieldByName('QuintoB').AsString+
           '  Sexto A: '+DM.Cont2.FieldByName('SextoA').AsString+
           '  Sexto B: '+DM.Cont2.FieldByName('SextoB').AsString;

  StatusBar1.Panels[0].Text := 'Alumnos: '+DM.Qtemp.FieldByName('total').AsString+' Total';
  StatusBar1.Panels[1].Text := FormatDateTime('dddd dd/mmmm/yyyy', now);
  StatusBar1.Panels[3].Text := datos;
  StatusBar1.Refresh;
  DM.Conexion.Connected := False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  consultagrupos(Sender);
end;

end.
