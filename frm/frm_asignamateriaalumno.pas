unit frm_asignamateriaalumno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Menus;

type
  Tasignamateriaalumno = class(TForm)
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label1: TLabel;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    gridAlumno: TStringGrid;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    ComboBox3: TComboBox;
    Label5: TLabel;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    Eliminaparaescolar1: TMenuItem;
    Eliminacapacitacion1: TMenuItem;
    Eliminaarea1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox5Select(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridAlumnoSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gridAlumnoDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox3Select(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Eliminaparaescolar1Click(Sender: TObject);
    procedure Eliminacapacitacion1Click(Sender: TObject);
    procedure Eliminaarea1Click(Sender: TObject);
  private
    row :Integer;
    matricula :String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  asignamateriaalumno: Tasignamateriaalumno;

implementation

{$R *.dfm}

uses frm_DM;

procedure Tasignamateriaalumno.BitBtn1Click(Sender: TObject);
begin
  if ComboBox1.Text = '' then
  begin
     ShowMessage('Selecciona una opcion');
     abort;
  end;
  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+matricula+chr(39));
  DM.Qfichatecnica.Open;

  if ComboBox3.Text = 'AREA' then
  begin
    DM.Qfichatecnica.Edit;
    DM.Qfichatecnica.FieldByName('areas').AsInteger := ComboBox1.ItemIndex + 1;
    DM.Qfichatecnica.Post;
    gridAlumno.Cells[5,row] := ComboBox1.Text;
  end;
  if ComboBox3.Text = 'CAPACITACION' then
  begin
    DM.Qfichatecnica.Edit;
    DM.Qfichatecnica.FieldByName('capacitacion').AsInteger := ComboBox1.ItemIndex + 1;
    DM.Qfichatecnica.Post;
    gridAlumno.Cells[4,row] := ComboBox1.Text;
  end;
  if ComboBox3.Text = 'PARAESCOLAR' then
  begin
    DM.Qfichatecnica.Edit;
    DM.Qfichatecnica.FieldByName('paraescolar').AsInteger := ComboBox1.ItemIndex + 1;
    DM.Qfichatecnica.Post;
    gridAlumno.Cells[3,row] := ComboBox1.Text;
  end;

end;

procedure Tasignamateriaalumno.ComboBox1DropDown(Sender: TObject);
var
  I: Integer;
  qry : String;
begin
   if ComboBox3.Text = 'AREA' then
  begin
    qry := 'Select nom_area as nombre from areas order by id_area asc';
  end;
  if ComboBox3.Text = 'CAPACITACION' then
  begin
    qry := 'Select nom_capacitacion as nombre from capacitaciones order by id_capacitacion asc';
  end;
  if ComboBox3.Text = 'PARAESCOLAR' then
  begin
    qry := 'select nom_paraescolar as nombre from paraescolar order by id_paraescolar asc';
  end;

  ComboBox1.Clear;
  DM.Qareas.SQL.Clear;
  DM.Qareas.SQL.Add(qry);
  DM.Qareas.Open;

  for I := 0 to DM.Qareas.RecordCount - 1 do
  begin
    ComboBox1.Items.Add(DM.Qareas.FieldByName('nombre').AsString);
    DM.Qareas.Next;
  end;
end;

procedure Tasignamateriaalumno.ComboBox3Select(Sender: TObject);
begin
  if ComboBox3.Text = 'AREA' then
  begin
    Label5.Caption := 'Area:';
  end;
  if ComboBox3.Text = 'CAPACITACION' then
  begin
    Label5.Caption := 'Capacitacion:';
  end;
  if ComboBox3.Text = 'PARAESCOLAR' then
  begin
    Label5.Caption := 'Paraescolar:';
  end;
  ComboBox1.TextHint := Label5.Caption;
end;

procedure Tasignamateriaalumno.ComboBox5Select(Sender: TObject);
var
  i: integer;
  qry :String;
begin
  qry := 'SELECT 	DISTINCT (matricula), paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, '+
	'IF (areas = 0, '+CHR(39)+CHR(39)+', nom_area) AS nom_areas, '+
	'IF (paraescolar = 0, '+CHR(39)+CHR(39)+', nom_paraescolar) AS nom_paraescolar, '+
	'IF (capacitacion = 0, '+CHR(39)+CHR(39)+', nom_capacitacion) AS nom_capacitacion '+
  'FROM 	ficha_tecnica, paraescolar, areas, capacitaciones '+
  'WHERE 	semestre = '+ComboBox4.Text+' AND grupo = '+chr(39)+ComboBox5.Text+chr(39)+' AND status_alumno = 1 AND '+
	'(id_paraescolar = paraescolar OR paraescolar = 0) AND '+
	'(id_area = areas OR areas = 0) AND '+
  '(id_capacitacion = capacitacion OR capacitacion = 0)'+
  'ORDER BY  paterno_alumno, materno_alumno, nombre_alumno ASC ';

  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add(qry);
  DM.Qfichatecnica.Open;

  gridAlumno.RowCount := DM.Qfichatecnica.RecordCount + 1;

  for I := 1 to gridAlumno.RowCount + 1 do
  begin
    gridAlumno.Cells[0,I] := DM.Qfichatecnica.FieldByName('matricula').AsString;
    gridAlumno.Cells[1,I] := DM.Qfichatecnica.FieldByName('paterno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('materno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('nombre_alumno').AsString;
    gridAlumno.Cells[2,I] := DM.Qfichatecnica.FieldByName('semestre').AsString+'/'+DM.Qfichatecnica.FieldByName('grupo').AsString;
    gridAlumno.Cells[3,I] := DM.Qfichatecnica.FieldByName('nom_paraescolar').AsString;
    gridAlumno.Cells[4,I] := DM.Qfichatecnica.FieldByName('nom_capacitacion').AsString;
    gridAlumno.Cells[5,I] := DM.Qfichatecnica.FieldByName('nom_areas').AsString;
    DM.Qfichatecnica.Next;
  end;
end;

procedure Tasignamateriaalumno.Eliminaarea1Click(Sender: TObject);
begin
   DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+matricula+chr(39));
  DM.Qfichatecnica.Open;
  DM.Qfichatecnica.Edit;
  DM.Qfichatecnica.FieldByName('areas').AsInteger := 0;
  DM.Qfichatecnica.Post;
  gridAlumno.Cells[5,row] := '';
end;

procedure Tasignamateriaalumno.Eliminacapacitacion1Click(Sender: TObject);
begin
  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+matricula+chr(39));
  DM.Qfichatecnica.Open;
  DM.Qfichatecnica.Edit;
  DM.Qfichatecnica.FieldByName('capacitacion').AsInteger := 0;
  DM.Qfichatecnica.Post;
  gridAlumno.Cells[4,row] := '';
end;

procedure Tasignamateriaalumno.Eliminaparaescolar1Click(Sender: TObject);
begin
  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+matricula+chr(39));
  DM.Qfichatecnica.Open;
  DM.Qfichatecnica.Edit;
  DM.Qfichatecnica.FieldByName('paraescolar').AsInteger := 0;
  DM.Qfichatecnica.Post;
  gridAlumno.Cells[3,row] := '';

end;

procedure Tasignamateriaalumno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tasignamateriaalumno.FormShow(Sender: TObject);
var
  I: Integer;
  I2: Integer;
begin
  matricula := '';
  ComboBox3.ItemIndex := 0;
  Label5.Caption := 'Area:';
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
  gridAlumno.Cells[2,0] := 'Sem/Grupo';
  gridAlumno.Cells[3,0] := 'Paraescolar';
  gridAlumno.Cells[4,0] := 'Capacitacion';
  gridAlumno.Cells[5,0] := 'Area';
end;

procedure Tasignamateriaalumno.gridAlumnoDblClick(Sender: TObject);
begin
  matricula := gridAlumno.Cells[0,row];
  Label1.Caption := matricula;
  BitBtn1Click(Sender);
end;

procedure Tasignamateriaalumno.gridAlumnoSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row := ARow;
end;

end.
