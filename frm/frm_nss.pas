unit frm_nss;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, NxGridView6, NxColumns6, NxControls6,
  NxCustomGrid6, NxVirtualGrid6, NxGrid6, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons, System.StrUtils;

type
  Tnss = class(TForm)
    Label29: TLabel;
    Label30: TLabel;
    ComboBox5: TComboBox;
    ComboBox4: TComboBox;
    Label32: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    gridAlumno: TStringGrid;
    Label1: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    procedure ComboBox5Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridAlumnoDblClick(Sender: TObject);
    procedure gridAlumnoSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    var
      row : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  nss: Tnss;

implementation

{$R *.dfm}

uses frm_DM;

procedure Tnss.BitBtn1Click(Sender: TObject);
begin
  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('select * from ficha_tecnica where matricula = '+chr(39)+Label1.Caption+chr(39)) ;
  DM.Qfichatecnica.Open;
  DM.Qfichatecnica.Edit;

  DM.Qfichatecnica.FieldByName('nss').AsString := Edit2.Text;
  DM.Qfichatecnica.Post;
  ShowMessage('Numero de seguro social capturado con exito!!!');
  Edit1.Clear;
  Edit2.Clear;
  Label1.Caption := '';

end;

procedure Tnss.CheckBox1Click(Sender: TObject);
begin
  ComboBox5Select(Sender);
end;

procedure Tnss.ComboBox5Select(Sender: TObject);
var
  i: integer;
begin
  DM.Qfichatecnica.SQL.Clear;
  if CheckBox1.Checked = True then
  begin
    DM.Qfichatecnica.SQL.Add('Select matricula, paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, status_alumno, nss from ficha_tecnica where semestre = '+ComboBox4.Text+' and grupo = '+chr(39)+ComboBox5.Text+chr(39)+' order by  paterno_alumno, materno_alumno, nombre_alumno asc');
  end
  else
  begin
    DM.Qfichatecnica.SQL.Add('Select matricula, paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, status_alumno, nss from ficha_tecnica where semestre = '+ComboBox4.Text+' and grupo = '+chr(39)+ComboBox5.Text+chr(39)+' and status_alumno = 1 order by  paterno_alumno, materno_alumno, nombre_alumno asc');
  end;
  DM.Qfichatecnica.Open;
  gridAlumno.RowCount := DM.Qfichatecnica.RecordCount + 1;
  Label4.Caption := '# '+IntToStr(gridAlumno.RowCount);
  for I := 1 to gridAlumno.RowCount do
  begin
    gridAlumno.Cells[0,I] := DM.Qfichatecnica.FieldByName('matricula').AsString;
    gridAlumno.Cells[1,I] := DM.Qfichatecnica.FieldByName('paterno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('materno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('nombre_alumno').AsString;
    gridAlumno.Cells[2,I] := DM.Qfichatecnica.FieldByName('semestre').AsString+' '+
                             DM.Qfichatecnica.FieldByName('grupo').AsString;
    gridAlumno.Cells[3,I] := DM.Qfichatecnica.FieldByName('nss').AsString;
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

procedure Tnss.Edit1Change(Sender: TObject);
var
  I :Integer;
begin
  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where CONCAT(nombre_alumno,'+chr(39)+' '+chr(39)+',paterno_alumno,'+chr(39)+' '+chr(39)+',materno_alumno) LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39)+' order by paterno_alumno, materno_alumno, nombre_alumno asc');
  DM.Qfichatecnica.Open;

  gridAlumno.RowCount := DM.Qfichatecnica.RecordCount + 1;
  Label4.Caption := 'Resultados '+IntToStr(gridAlumno.RowCount);
  for I := 1 to gridAlumno.RowCount do
  begin
    gridAlumno.Cells[0,I] := DM.Qfichatecnica.FieldByName('matricula').AsString;
    gridAlumno.Cells[1,I] := DM.Qfichatecnica.FieldByName('paterno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('materno_alumno').AsString+' '+
                             DM.Qfichatecnica.FieldByName('nombre_alumno').AsString;
    gridAlumno.Cells[2,I] := DM.Qfichatecnica.FieldByName('semestre').AsString+' '+
                             DM.Qfichatecnica.FieldByName('grupo').AsString;
    gridAlumno.Cells[3,I] := DM.Qfichatecnica.FieldByName('nss').AsString;
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

procedure Tnss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tnss.FormShow(Sender: TObject);
var
  I: Integer;
  I2: Integer;
begin
  for I := 0 to gridAlumno.RowCount do
  begin
    for I2 := 0 to gridAlumno.ColCount do
      begin
        gridAlumno.Cells[I2,I] := '';
      end;
  end;

  gridAlumno.Cells[0,0] := 'Matricula';
  gridAlumno.Cells[1,0] := 'Nombre';
  gridAlumno.Cells[2,0] := 'Grado/Grupo';
  gridAlumno.Cells[3,0] := 'NSS';
  gridAlumno.Cells[4,0] := 'Status';
  gridAlumno.FixedRows := 1;
  gridAlumno.RowCount := 2;

end;

procedure Tnss.gridAlumnoDblClick(Sender: TObject);
begin
  Label1.Caption := gridAlumno.Cells[0, row];
  //Edit1.Text := gridAlumno.Cells[1, row];
  //Edit2.Text := gridAlumno.Cells[3, row];

end;

procedure Tnss.gridAlumnoSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  row := ARow;
end;

end.
