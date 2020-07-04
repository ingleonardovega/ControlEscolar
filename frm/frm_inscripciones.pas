unit frm_inscripciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, frm_DM,
  Vcl.ExtCtrls, Vcl.Menus;

type
  Tinscripciones = class(TForm)
    gridAlumno: TStringGrid;
    Panel1: TPanel;
    ComboBox4: TComboBox;
    Label29: TLabel;
    Label30: TLabel;
    ComboBox5: TComboBox;
    CheckBox1: TCheckBox;
    Label32: TLabel;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Regresarsemestre1: TMenuItem;
    Avanzarsemestre1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBox5Select(Sender: TObject);
    function Edad(FechaNacimiento:string):integer;
    procedure gridAlumnoDblClick(Sender: TObject);
    procedure gridAlumnoSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure Avanzarsemestre1Click(Sender: TObject);
    procedure Regresarsemestre1Click(Sender: TObject);
  private
    var
      row : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  inscripciones: Tinscripciones;

implementation

{$R *.dfm}

function Tinscripciones.Edad(FechaNacimiento:string):integer;
var
      iTemp,iTemp2,Nada:word;
      Fecha:TDate;
begin
     Fecha:=StrToDate(FechaNacimiento);
     DecodeDate(Date,itemp,Nada,Nada);
     DecodeDate(Fecha,itemp2,Nada,Nada);
      if FormatDateTime('mmdd',Date) <
         FormatDateTime('mmdd',Fecha) then Result:=iTemp-iTemp2-1
                                      else Result:=iTemp-iTemp2;
end;

procedure Tinscripciones.Avanzarsemestre1Click(Sender: TObject);
begin
  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+gridAlumno.Cells[0,row]+chr(39));
  DM.Qfichatecnica.Open;
  DM.Qfichatecnica.Edit;
  gridAlumno.Cells[5,row] := intToStr(Edad(gridAlumno.Cells[4,row]));
  gridAlumno.Cells[6,row] := 'Activo';
  gridAlumno.Cells[2,row] := IntToStr((StrToInt(gridAlumno.Cells[2,row]) + 1));
  DM.Qfichatecnica.FieldByName('status_alumno').AsInteger := 1;
  DM.Qfichatecnica.FieldByName('edad').AsInteger := StrToInt(gridAlumno.Cells[5,row]);
  DM.Qfichatecnica.FieldByName('semestre').AsInteger := StrToInt(gridAlumno.Cells[2,row]);
  DM.Qfichatecnica.Post;

end;

procedure Tinscripciones.CheckBox1Click(Sender: TObject);
begin
  ComboBox5Select(Sender);
end;

procedure Tinscripciones.ComboBox5Select(Sender: TObject);
var
  i: integer;
begin
  DM.Qfichatecnica.SQL.Clear;
  if CheckBox1.Checked = true then
  begin
    DM.Qfichatecnica.SQL.Add('Select matricula, paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, status_alumno, fecha_alumno, edad from ficha_tecnica where semestre = '+ComboBox4.Text+' and grupo = '+chr(39)+ComboBox5.Text+chr(39)+' order by  paterno_alumno, materno_alumno, nombre_alumno asc');
  end
  else
  begin
    DM.Qfichatecnica.SQL.Add('Select matricula, paterno_alumno, materno_alumno, nombre_alumno, semestre, grupo, status_alumno, fecha_alumno, edad from ficha_tecnica where semestre = '+ComboBox4.Text+' and grupo = '+chr(39)+ComboBox5.Text+chr(39)+' and status_alumno = 1 order by  paterno_alumno, materno_alumno, nombre_alumno asc');
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
    gridAlumno.Cells[4,I] := DM.Qfichatecnica.FieldByName('fecha_alumno').AsString;
    gridAlumno.Cells[5,I] := DM.Qfichatecnica.FieldByName('edad').AsString;
    if DM.Qfichatecnica.FieldByName('status_alumno').AsInteger = 1 then
    begin
      gridAlumno.Cells[6,I] := 'Activo';
    end
    else
    begin
      gridAlumno.Cells[6,I] := 'Inactivo';
    end;
    DM.Qfichatecnica.Next;
  end;
end;

procedure Tinscripciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tinscripciones.FormShow(Sender: TObject);
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
  gridAlumno.Cells[4,0] := 'Fecha Nac.';
  gridAlumno.Cells[5,0] := 'Edad';
  gridAlumno.Cells[6,0] := 'Status';
  //Edit1.Clear;
end;

procedure Tinscripciones.gridAlumnoDblClick(Sender: TObject);
begin
//  DM.Qfichatecnica.SQL.Clear;
//  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+gridAlumno.Cells[0,row]+chr(39));
//  DM.Qfichatecnica.Open;
//  if not (DM.Qfichatecnica.IsEmpty) then
//  begin
//    DM.Qfichatecnica.Edit;
//    gridAlumno.Cells[5,row] := intToStr(Edad(gridAlumno.Cells[4,row]));
//    if gridAlumno.Cells[6,row] = 'Inactivo' then
//    begin
//      gridAlumno.Cells[6,row] := 'Activo';
//      gridAlumno.Cells[2,row] := IntToStr((StrToInt(gridAlumno.Cells[2,row]) + 1));
//      DM.Qfichatecnica.FieldByName('status_alumno').AsInteger := 1;
//      DM.Qfichatecnica.FieldByName('edad').AsInteger := StrToInt(gridAlumno.Cells[5,row]);
//      DM.Qfichatecnica.FieldByName('semestre').AsInteger := StrToInt(gridAlumno.Cells[2,row]);
//      DM.Qfichatecnica.Post;
//    end
//    else
//    begin
////      gridAlumno.Cells[6,row] := 'Inactivo';
////      gridAlumno.Cells[2,row] := IntToStr((StrToInt(gridAlumno.Cells[2,row]) - 1));
////      DM.Qfichatecnica.FieldByName('status_alumno').AsInteger := 0;
////      DM.Qfichatecnica.FieldByName('semestre').AsInteger := StrToInt(gridAlumno.Cells[2,row]);
//      gridAlumno.Cells[6,row] := 'Activo';
//      gridAlumno.Cells[2,row] := IntToStr((StrToInt(gridAlumno.Cells[2,row]) + 1));
//      DM.Qfichatecnica.FieldByName('status_alumno').AsInteger := 1;
//      DM.Qfichatecnica.FieldByName('edad').AsInteger := StrToInt(gridAlumno.Cells[5,row]);
//      DM.Qfichatecnica.FieldByName('semestre').AsInteger := StrToInt(gridAlumno.Cells[2,row]);
//      DM.Qfichatecnica.Post;
//    end;
//  end;

end;

procedure Tinscripciones.gridAlumnoSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row := ARow;
end;

procedure Tinscripciones.Regresarsemestre1Click(Sender: TObject);
begin

  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+gridAlumno.Cells[0,row]+chr(39));
  DM.Qfichatecnica.Open;
  DM.Qfichatecnica.Edit;

  gridAlumno.Cells[6,row] := 'Inactivo';
  gridAlumno.Cells[2,row] := IntToStr((StrToInt(gridAlumno.Cells[2,row]) - 1));
  DM.Qfichatecnica.FieldByName('semestre').AsInteger := StrToInt(gridAlumno.Cells[2,row]);
  DM.Qfichatecnica.Post;
end;

end.
