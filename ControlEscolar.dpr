program ControlEscolar;

uses
  Vcl.Forms,
  frm_main in 'frm\frm_main.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  frm_DM in 'frm\frm_DM.pas' {DM: TDataModule},
  frm_login in 'frm\frm_login.pas' {Login},
  frm_ficha_tecnica in 'frm\frm_ficha_tecnica.pas' {ficha_tecnica},
  frm_consulta_alumno in 'frm\frm_consulta_alumno.pas' {consulta_alumno},
  WebCam in 'WebCam.pas',
  frm_fotoAlumno in 'frm\frm_fotoAlumno.pas' {fotoalumno},
  frm_nss in 'frm\frm_nss.pas' {nss},
  frm_inscripciones in 'frm\frm_inscripciones.pas' {inscripciones},
  frm_registro_web in 'frm\frm_registro_web.pas' {Registro_WEB},
  frm_justificante in 'frm\frm_justificante.pas' {justificante},
  frm_creamateria in 'frm\frm_creamateria.pas' {creamateria},
  frm_personal in 'frm\frm_personal.pas' {personal},
  frm_asignarmateriadocente in 'frm\frm_asignarmateriadocente.pas' {asignarmateriadocente},
  frm_asignamateriaalumno in 'frm\frm_asignamateriaalumno.pas' {asignamateriaalumno},
  frm_reporte_indisciplina in 'frm\frm_reporte_indisciplina.pas' {reporte_indisciplina};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Control Escolar';
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TLogin, Login);
  Application.CreateForm(Tconsulta_alumno, consulta_alumno);
  Application.Run;
end.
