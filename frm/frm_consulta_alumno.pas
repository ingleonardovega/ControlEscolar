unit frm_consulta_alumno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  Tconsulta_alumno = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    gridAlumno: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridAlumnoDblClick(Sender: TObject);
    procedure gridAlumnoSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
  var
    consulta, row: Integer;

    { Public declarations }
  end;

var
  consulta_alumno: Tconsulta_alumno;

implementation

{$R *.dfm}

uses frm_DM, frm_ficha_tecnica, frm_justificante, frm_reporte_indisciplina;

procedure Tconsulta_alumno.Edit1Change(Sender: TObject);
var
  I: Integer;
begin
  DM.Qfichatecnica.SQL.Clear;
  if consulta = 1 then
  begin
    DM.Qfichatecnica.SQL.Add('Select matricula, paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, status_alumno from ficha_tecnica where CONCAT(nombre_alumno,'+chr(39)+' '+chr(39)+',paterno_alumno,'+chr(39)+' '+chr(39)+',materno_alumno) LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39)+' order by nombre_alumno, paterno_alumno, materno_alumno asc');
  end;
  if consulta = 2 then
  begin
    DM.Qfichatecnica.SQL.Add('Select matricula, paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, status_alumno from ficha_tecnica where CONCAT(nombre_alumno,'+chr(39)+' '+chr(39)+',paterno_alumno,'+chr(39)+' '+chr(39)+',materno_alumno) LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39)+' and status_alumno = 1 order by nombre_alumno, paterno_alumno, materno_alumno asc');
  end;
   if consulta = 3 then
  begin
    DM.Qfichatecnica.SQL.Add('Select matricula, paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, status_alumno from ficha_tecnica where CONCAT(nombre_alumno,'+chr(39)+' '+chr(39)+',paterno_alumno,'+chr(39)+' '+chr(39)+',materno_alumno) LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39)+' and status_alumno = 1 order by nombre_alumno, paterno_alumno, materno_alumno asc');
  end;
  DM.Qfichatecnica.Open;
  gridAlumno.RowCount := DM.Qfichatecnica.RecordCount + 1;
  for I := 1 to gridAlumno.RowCount do
  begin
    gridAlumno.Cells[0,I] := DM.Qfichatecnica.FieldByName('matricula').AsString;
    gridAlumno.Cells[1,I] := DM.Qfichatecnica.FieldByName('paterno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('materno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('nombre_alumno').AsString;
    gridAlumno.Cells[2,I] := DM.Qfichatecnica.FieldByName('semestre').AsString;
    gridAlumno.Cells[3,I] := DM.Qfichatecnica.FieldByName('grupo').AsString;
    if DM.Qfichatecnica.FieldByName('status_alumno').AsInteger = 1 then
    begin
      gridAlumno.Cells[4,I] := 'Activo';
    end
    else
    begin
      gridAlumno.Cells[4,I] := 'Inactivo';
    end;
    DM.Qfichatecnica.Next;
  end;
end;

procedure Tconsulta_alumno.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DOWN then
  begin
    gridAlumno.SetFocus;
  end;
end;

procedure Tconsulta_alumno.FormShow(Sender: TObject);
var
  I: Integer;
  I2: Integer;
begin
  for I := 0 to gridAlumno.RowCount  do
  begin
    for I2 := 0 to gridAlumno.ColCount do
     begin
       gridAlumno.Cells[I2,I] := '';
     end;
  end;
  gridAlumno.RowCount := 2;
  gridAlumno.Cells[0,0] := 'Matricula';
  gridAlumno.Cells[1,0] := 'Nombre';
  gridAlumno.Cells[2,0] := 'Semestre';
  gridAlumno.Cells[3,0] := 'Grupo';
  gridAlumno.Cells[4,0] := 'Status';
  Edit1.Clear;
end;

procedure Tconsulta_alumno.gridAlumnoDblClick(Sender: TObject);
begin

  if consulta = 3 then
  begin
    DM.Qfichatecnica.SQL.Clear;
    DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+gridAlumno.Cells[0,row]+chr(39));
    DM.Qfichatecnica.Open;

    reporte_indisciplina.Edit1.Text := DM.Qfichatecnica.FieldByName('paterno_alumno').AsString+' '+
                               DM.Qfichatecnica.FieldByName('materno_alumno').AsString+' '+
                               DM.Qfichatecnica.FieldByName('nombre_alumno').AsString;

    reporte_indisciplina.Label4.Caption := DM.Qfichatecnica.FieldByName('semestre').AsString;
    reporte_indisciplina.Label5.Caption := DM.Qfichatecnica.FieldByName('grupo').AsString;
    reporte_indisciplina.matricula := DM.Qfichatecnica.FieldByName('matricula').AsString;
  end;

  if consulta = 2 then
  begin
    DM.Qfichatecnica.SQL.Clear;
    DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+gridAlumno.Cells[0,row]+chr(39));
    DM.Qfichatecnica.Open;

    justificante.Edit1.Text := DM.Qfichatecnica.FieldByName('paterno_alumno').AsString+' '+
                               DM.Qfichatecnica.FieldByName('materno_alumno').AsString+' '+
                               DM.Qfichatecnica.FieldByName('nombre_alumno').AsString;

    justificante.Label4.Caption := DM.Qfichatecnica.FieldByName('semestre').AsString;
    justificante.Label5.Caption := DM.Qfichatecnica.FieldByName('grupo').AsString;
    justificante.matricula := DM.Qfichatecnica.FieldByName('matricula').AsString;
  end;


  if consulta = 1 then
  begin
    DM.Qfichatecnica.SQL.Clear;
    DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+gridAlumno.Cells[0,row]+chr(39));
    DM.Qfichatecnica.Open;

    ficha_tecnica.matricula := gridAlumno.Cells[0,row];
    ficha_tecnica.ComboBox4.ItemIndex := ficha_tecnica.ComboBox4.Items.IndexOf(DM.Qfichatecnica.FieldByName('semestre').AsString);
    ficha_tecnica.ComboBox5.ItemIndex := ficha_tecnica.ComboBox5.Items.IndexOf(DM.Qfichatecnica.FieldByName('grupo').AsString);
    ficha_tecnica.ComboBox6.ItemIndex := DM.Qfichatecnica.FieldByName('status_alumno').AsInteger;
    ficha_tecnica.Label32.Caption := 'Matricula: '+DM.Qfichatecnica.FieldByName('matricula').AsString;

    ficha_tecnica.Edit1.Text := DM.Qfichatecnica.FieldByName('paterno_alumno').AsString;
    ficha_tecnica.Edit2.Text := DM.Qfichatecnica.FieldByName('materno_alumno').AsString;
    ficha_tecnica.Edit3.Text := DM.Qfichatecnica.FieldByName('nombre_alumno').AsString;
    ficha_tecnica.Edit5.Text := DM.Qfichatecnica.FieldByName('curp').AsString;
    ficha_tecnica.Edit4.Text := DM.Qfichatecnica.FieldByName('lugar_nacimiento').AsString;
    if DM.Qfichatecnica.FieldByName('sexo_alumno').AsInteger = 1 then
    begin
      ficha_tecnica.RadioGroup1.ItemIndex := 0;
    end
    else
    begin
      ficha_tecnica.RadioGroup1.ItemIndex := 1;
    end;
    ficha_tecnica.MaskEdit1.Text := FormatDateTime('dd/mm/yyyy',DM.Qfichatecnica.FieldByName('fecha_alumno').AsDateTime);
    ficha_tecnica.Edit7.Text := DM.Qfichatecnica.FieldByName('edad').AsString;
    ficha_tecnica.Edit8.Text := DM.Qfichatecnica.FieldByName('domicilio').AsString;
    ficha_tecnica.Edit10.Text := DM.Qfichatecnica.FieldByName('cp').AsString;
    ficha_tecnica.Edit9.Text := DM.Qfichatecnica.FieldByName('colonia').AsString;
    ficha_tecnica.Edit17.Text := DM.Qfichatecnica.FieldByName('correo').AsString;

    ficha_tecnica.Edit12.Text := DM.Qfichatecnica.FieldByName('tutor').AsString;
    ficha_tecnica.ComboBox1.ItemIndex := ficha_tecnica.ComboBox1.Items.IndexOf(DM.Qfichatecnica.FieldByName('parentesco_tutor').AsString);
    ficha_tecnica.MaskEdit3.Text := FormatDateTime('dd/mm/yyyy',DM.Qfichatecnica.FieldByName('fecha_tutor').AsDateTime);
    ficha_tecnica.Edit6.Text := DM.Qfichatecnica.FieldByName('curp_tutor').AsString;
    ficha_tecnica.Edit15.Text := DM.Qfichatecnica.FieldByName('celular_tutor').AsString;
    ficha_tecnica.Edit16.Text := DM.Qfichatecnica.FieldByName('correo_tutor').AsString;
    ficha_tecnica.Edit11.Text := DM.Qfichatecnica.FieldByName('domicilio_tutor').AsString;
    ficha_tecnica.Edit13.Text := DM.Qfichatecnica.FieldByName('cp_tutor').AsString;
    ficha_tecnica.Edit14.Text := DM.Qfichatecnica.FieldByName('colonia_tutor').AsString;
    ficha_tecnica.Edit18.Text := DM.Qfichatecnica.FieldByName('tel_casa').AsString;
    ficha_tecnica.Edit19.Text := DM.Qfichatecnica.FieldByName('ocupacion_tutor').AsString;
    ficha_tecnica.Edit20.Text := DM.Qfichatecnica.FieldByName('trabajo_tutor').AsString;
    ficha_tecnica.Edit21.Text := DM.Qfichatecnica.FieldByName('telefono_trabajo').AsString;

    ficha_tecnica.ComboBox2.ItemIndex := ficha_tecnica.ComboBox2.Items.IndexOf(DM.Qfichatecnica.FieldByName('tipo_sangre').AsString);
    ficha_tecnica.Edit22.Text := DM.Qfichatecnica.FieldByName('alergias').AsString;
    ficha_tecnica.Edit23.Text := DM.Qfichatecnica.FieldByName('medicamentos_alergicos').AsString;
    ficha_tecnica.Edit24.Text := DM.Qfichatecnica.FieldByName('padecimientos').AsString;
    ficha_tecnica.ComboBox3.ItemIndex := ficha_tecnica.ComboBox3.Items.IndexOf(DM.Qfichatecnica.FieldByName('institucion_medica').AsString);

    DM.Qcheck_doc.SQL.Clear;
    DM.Qcheck_doc.SQL.Add('Select * from check_documentos where matricula = '+chr(39)+ficha_tecnica.matricula+chr(39));
    DM.Qcheck_doc.Open;

    ficha_tecnica.CheckBox2.Checked := DM.Qcheck_doc.FieldByName('acta_nac').AsBoolean;
    ficha_tecnica.CheckBox3.Checked := DM.Qcheck_doc.FieldByName('cert_sec').AsBoolean;
    ficha_tecnica.CheckBox4.Checked := DM.Qcheck_doc.FieldByName('fotos').AsBoolean;
    ficha_tecnica.CheckBox5.Checked := DM.Qcheck_doc.FieldByName('curp').AsBoolean;
    ficha_tecnica.CheckBox6.Checked := DM.Qcheck_doc.FieldByName('cart_buena').AsBoolean;
    ficha_tecnica.CheckBox7.Checked := DM.Qcheck_doc.FieldByName('cert_med').AsBoolean;
    ficha_tecnica.CheckBox8.Checked := DM.Qcheck_doc.FieldByName('tipo_sang').AsBoolean;
    ficha_tecnica.CheckBox9.Checked := DM.Qcheck_doc.FieldByName('ficha_dgb').AsBoolean;
    ficha_tecnica.CheckBox10.Checked := DM.Qcheck_doc.FieldByName('ine').AsBoolean;
    ficha_tecnica.CheckBox11.Checked := DM.Qcheck_doc.FieldByName('curp_t').AsBoolean;
    ficha_tecnica.CheckBox12.Checked := DM.Qcheck_doc.FieldByName('comp_dom').AsBoolean;
  end;

  Close;
end;

procedure Tconsulta_alumno.gridAlumnoSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row := ARow;
end;

end.
