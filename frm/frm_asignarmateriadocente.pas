unit frm_asignarmateriadocente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus,
  Vcl.Buttons;

type
  Tasignarmateriadocente = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Edit2: TEdit;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    StringGrid3: TStringGrid;
    PopupMenu1: TPopupMenu;
    Eliminar1: TMenuItem;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid3DblClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    var
      row_docente, row_materia, row_asigna : Integer;
      id_docente, id_materia : String;
      List : TStrings;
      materia, semestre, grupo : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  asignarmateriadocente: Tasignarmateriadocente;

implementation

{$R *.dfm}

uses frm_DM;

procedure Tasignarmateriadocente.BitBtn1Click(Sender: TObject);
var
  I, I2 :Integer;
begin
  //boton de agregar
  DM.Qmateria.SQL.Clear;
  DM.Qmateria.SQL.Add('Select * from materia where id = '+id_materia);
  DM.Qmateria.Open;
  DM.Qmateria.Edit;
  DM.Qmateria.FieldByName('id_docente').AsInteger := StrToInt(id_docente);
  DM.Qmateria.Post;

  for I := 0 to StringGrid2.RowCount do
  begin
    for I2 := 0 to StringGrid2.ColCount do
    begin
      StringGrid2.Cells[I2,I] := '';
    end;
  end;
  StringGrid2.Cells[0,0] := 'id';
  StringGrid2.Cells[1,0] := 'id_doc';
  StringGrid2.Cells[2,0] := 'Materia';
  StringGrid2.Cells[3,0] := 'Sem';
  StringGrid2.Cells[4,0] := 'Grupo';
  StringGrid2.RowCount := 2;
  StringGrid2.FixedRows := 1;

  DM.Qmateria.SQL.Clear;
  DM.Qmateria.SQL.Add('Select * from materia where ID_DOCENTE = '+id_docente+' and not semestre = 0 order by SEMESTRE, grupo, MATERIA asc');
  DM.Qmateria.Open;

  StringGrid2.RowCount := DM.Qmateria.RecordCount + 1;
  for I := 1 to StringGrid2.RowCount + 1 do
  begin
    StringGrid2.Cells[0,I] := DM.Qmateria.FieldByName('id').AsString;
    StringGrid2.Cells[1,I] := DM.Qmateria.FieldByName('id_docente').AsString;
    StringGrid2.Cells[2,I] := DM.Qmateria.FieldByName('materia').AsString;
    StringGrid2.Cells[3,I] := DM.Qmateria.FieldByName('semestre').AsString;
    StringGrid2.Cells[4,I] := DM.Qmateria.FieldByName('grupo').AsString;
    DM.Qmateria.Next;
  end;

end;

procedure Tasignarmateriadocente.Edit1Change(Sender: TObject);
var
  I: Integer;
begin
  if not(Edit1.Text = '') then
  begin
    StringGrid1.Visible := True;
  end
  else
  begin
    StringGrid1.Visible := false;
  end;
  DM.Qpersonal.SQL.Clear;
  DM.Qpersonal.SQL.Add('Select * from personal where CONCAT(nombre_personal,'+chr(39)+' '+chr(39)+',paterno_personal,'+chr(39)+' '+chr(39)+',materno_personal) LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39)+' and cargo = '+chr(39)+'DOCENTE'+chr(39)+' and status_parsonal = 1 order by paterno_personal, materno_personal, nombre_personal asc');
  DM.Qpersonal.Open;
  StringGrid1.RowCount := DM.Qpersonal.RecordCount;
  for I := 0 to StringGrid1.RowCount - 1 do
  begin
    StringGrid1.Cells[0,I] := DM.Qpersonal.FieldByName('id_personal').AsString;
    StringGrid1.Cells[1,I] := DM.Qpersonal.FieldByName('paterno_personal').AsString+' '+
                              DM.Qpersonal.FieldByName('materno_personal').AsString+' '+
                              DM.Qpersonal.FieldByName('nombre_personal').AsString;
    DM.Qpersonal.Next;
  end;
end;

procedure Tasignarmateriadocente.Edit2Change(Sender: TObject);
var
  qry :String;
  i :Integer;
begin
  if not (Edit2.Text = '') then
  begin
    StringGrid3.Visible := True;
  end
  else
  begin
    StringGrid3.Visible := False;
  end;

    qry := 'select distinct (materia.id), materia.MATERIA, materia.SEMESTRE, materia.grupo, if (materia.`area` = 0, '+chr(39)+chr(39)+', areas.`nom_area`) as nom_areas, if (materia.`capacitacion` = 0, '+chr(39)+chr(39)+', capacitaciones.nom_capacitacion) as nom_cap, if (materia.`paraescolar` = 0, '+chr(39)+chr(39)+', paraescolar.nom_paraescolar) as nom_para from materia, areas, capacitaciones, paraescolar where '+
        '(areas.`id_area` = materia.`area` or materia.`area` = 0) and '+
        '(capacitaciones.`id_capacitacion` = materia.`capacitacion` or materia.`capacitacion` = 0) and '+
        '(paraescolar.`id_paraescolar` = materia.`paraescolar` or materia.`paraescolar` = 0) and not '+
        '(semestre = 0) and materia.materia LIKE '+chr(39)+'%'+Edit2.Text+'%'+chr(39)+
        ' order by materia.`SEMESTRE`, materia.`grupo` asc';

    DM.qmuestramateria.SQL.Clear;
    DM.Qmuestramateria.SQL.Add(qry);
    DM.Qmuestramateria.Open;
    StringGrid3.RowCount := DM.Qmuestramateria.RecordCount;

    for I := 0 to StringGrid3.RowCount - 1 do
    begin
      StringGrid3.Cells[0,I] := DM.Qmuestramateria.FieldByName('id').AsString;
      StringGrid3.Cells[1,I] := DM.Qmuestramateria.FieldByName('MATERIA').AsString+' - '+
                                DM.Qmuestramateria.FieldByName('semestre').AsString+' - '+
                                DM.Qmuestramateria.FieldByName('grupo').AsString;
      DM.Qmuestramateria.Next;
    end;
end;

procedure Tasignarmateriadocente.Eliminar1Click(Sender: TObject);
var
  I, I2 :integer;
begin
  DM.Qmateria.SQL.Clear;
  DM.Qmateria.SQL.Add('select * from materia where id = '+StringGrid2.Cells[0,row_asigna]);
  DM.Qmateria.Open;
  DM.Qmateria.Edit;
  DM.Qmateria.FieldByName('id_docente').AsInteger := 0;
  DM.Qmateria.Post;

  for I := 0 to StringGrid2.RowCount do
  begin
    for I2 := 0 to StringGrid2.ColCount do
    begin
      StringGrid2.Cells[I2,I] := '';
    end;
  end;
  StringGrid2.Cells[0,0] := 'id';
  StringGrid2.Cells[1,0] := 'id_doc';
  StringGrid2.Cells[2,0] := 'Materia';
  StringGrid2.Cells[3,0] := 'Sem';
  StringGrid2.Cells[4,0] := 'Grupo';
  StringGrid2.RowCount := 2;
  StringGrid2.FixedRows := 1;

  DM.Qmateria.SQL.Clear;
  DM.Qmateria.SQL.Add('Select * from materia where ID_DOCENTE = '+id_docente+' and not semestre = 0 order by SEMESTRE, grupo, MATERIA asc');
  DM.Qmateria.Open;

  StringGrid2.RowCount := DM.Qmateria.RecordCount + 1;
  for I := 1 to StringGrid2.RowCount + 1 do
  begin
    StringGrid2.Cells[0,I] := DM.Qmateria.FieldByName('id').AsString;
    StringGrid2.Cells[1,I] := DM.Qmateria.FieldByName('id_docente').AsString;
    StringGrid2.Cells[2,I] := DM.Qmateria.FieldByName('materia').AsString;
    StringGrid2.Cells[3,I] := DM.Qmateria.FieldByName('semestre').AsString;
    StringGrid2.Cells[4,I] := DM.Qmateria.FieldByName('grupo').AsString;
    DM.Qmateria.Next;
  end;
end;

procedure Tasignarmateriadocente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tasignarmateriadocente.StringGrid1DblClick(Sender: TObject);
var
  I: Integer;
  I2: Integer;
begin

  id_docente := StringGrid1.Cells[0,row_docente];
  Edit1.Text := StringGrid1.Cells[1,row_docente];

  StringGrid1.Visible := False;

  for I := 0 to StringGrid2.RowCount do
  begin
    for I2 := 0 to StringGrid2.ColCount do
    begin
      StringGrid2.Cells[I2,I] := '';
    end;
  end;
  StringGrid2.Cells[0,0] := 'id';
  StringGrid2.Cells[1,0] := 'id_doc';
  StringGrid2.Cells[2,0] := 'Materia';
  StringGrid2.Cells[3,0] := 'Sem';
  StringGrid2.Cells[4,0] := 'Grupo';
  StringGrid2.RowCount := 2;
  StringGrid2.FixedRows := 1;

  DM.Qmateria.SQL.Clear;
  DM.Qmateria.SQL.Add('Select * from materia where ID_DOCENTE = '+id_docente+' and not semestre = 0 order by SEMESTRE, grupo, MATERIA asc');
  DM.Qmateria.Open;

  StringGrid2.RowCount := DM.Qmateria.RecordCount + 1;
  for I := 1 to StringGrid2.RowCount + 1 do
  begin
    StringGrid2.Cells[0,I] := DM.Qmateria.FieldByName('id').AsString;
    StringGrid2.Cells[1,I] := DM.Qmateria.FieldByName('id_docente').AsString;
    StringGrid2.Cells[2,I] := DM.Qmateria.FieldByName('materia').AsString;
    StringGrid2.Cells[3,I] := DM.Qmateria.FieldByName('semestre').AsString;
    StringGrid2.Cells[4,I] := DM.Qmateria.FieldByName('grupo').AsString;
    DM.Qmateria.Next;
  end;

end;

procedure Tasignarmateriadocente.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row_docente := ARow;
end;

procedure Tasignarmateriadocente.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row_asigna := ARow;
end;

procedure Tasignarmateriadocente.StringGrid3DblClick(Sender: TObject);
begin
  List := TStringList.Create;
  ExtractStrings(['-'], [], PChar(StringGrid3.Cells[1,row_materia]), List);
  materia := list[0];
  semestre := list[1];
  grupo := list[2];
  id_materia := StringGrid3.Cells[0,row_materia];
  Edit2.Text := materia+' '+semestre+''+grupo;
  StringGrid3.Visible := False;
end;

procedure Tasignarmateriadocente.StringGrid3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row_materia := ARow;
end;

end.
