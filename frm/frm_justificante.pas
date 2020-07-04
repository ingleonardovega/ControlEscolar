unit frm_justificante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.Menus, Vcl.Grids, RzGrids, frxClass;

type
  Tjustificante = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    Guardar1: TMenuItem;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    grid_consulta: TRzStringGrid;
    Button1: TButton;
    Edit3: TEdit;
    Consultar1: TMenuItem;
    print: TfrxReport;
    PopupMenu1: TPopupMenu;
    Pendiente1: TMenuItem;
    Entregado1: TMenuItem;
    Edit4: TEdit;
    procedure Consultar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure grid_consultaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure printGetValue(const VarName: string; var Value: Variant);
    procedure Nuevo1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Pendiente1Click(Sender: TObject);
    procedure Entregado1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    id, matricula :String;
    Row :Integer;
    { Public declarations }
  end;

var
  justificante: Tjustificante;

implementation

{$R *.dfm}

uses frm_DM, frm_consulta_alumno;

procedure Tjustificante.Button1Click(Sender: TObject);
begin
  id := grid_consulta.Cells[5,row];
  print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\justificantealumno.fr3');
  print.PrepareReport(True);
  print.PrintOptions.ShowDialog:=true;
  //print.ShowReport(true);
  print.Print;
end;

procedure Tjustificante.CheckBox1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Tjustificante.Consultar1Click(Sender: TObject);
begin
  consulta_alumno.consulta := 2;
  consulta_alumno.Show;
end;

procedure Tjustificante.DateTimePicker2Change(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Tjustificante.Edit4Change(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Tjustificante.Entregado1Click(Sender: TObject);
begin
  DM.Qjustificante.SQL.Clear;
  DM.Qjustificante.SQL.Add('select * from justificantes where id_justificante = '+grid_consulta.Cells[5,Row]);
  DM.Qjustificante.Open;
  DM.Qjustificante.Edit;
  DM.Qjustificante.FieldByName('status_justifica').AsInteger := 0;
  DM.Qjustificante.Post;
  FormShow(Sender);

end;

procedure Tjustificante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  consulta_alumno.Close;
  Action:=cafree;
end;

procedure Tjustificante.FormCreate(Sender: TObject);
begin
  DateTimePicker2.Date := Now;
end;

procedure Tjustificante.FormShow(Sender: TObject);
var
  I: Integer;
  I2: Integer;
  sql :String;
  fecha, nombre :string;
begin
  for I := 1 to grid_consulta.RowCount do
  begin
    for I2 := 0 to grid_consulta.ColCount do
    begin
      grid_consulta.Cells[I2,I] := '';
    end;
  end;
  grid_consulta.RowCount := 2;

  grid_consulta.Cells[0,0] := 'Nombre';
  grid_consulta.Cells[1,0] := 'Sem/Grupo';
  grid_consulta.Cells[2,0] := 'Motivo';
  grid_consulta.Cells[3,0] := 'Fecha/hora';
  grid_consulta.Cells[4,0] := 'Status';

  if CheckBox1.Checked = true then
  begin
    fecha := ' AND MONTH(fecha) = MONTH(NOW()) AND YEAR(fecha) = YEAR(NOW())';
    DateTimePicker2.Enabled := False;
  end
  else
  begin
    fecha := ' AND DAY(fecha) = '+chr(39)+FormatDateTime('dd', DateTimePicker2.Date)+chr(39)+
             ' AND MONTH(fecha) = '+chr(39)+FormatDateTime('mm', DateTimePicker2.Date)+chr(39)+
             ' AND YEAR(fecha) = '+chr(39)+FormatDateTime('yyyy', DateTimePicker2.Date)+chr(39);
    DateTimePicker2.Enabled := True;
  end;
  if NOT (Edit4.Text = '') then
  begin
    nombre := ' AND CONCAT(ficha_tecnica.`paterno_alumno`,'+chr(39)+' '+chr(39)+',ficha_tecnica.`materno_alumno`,'+chr(39)+' '+chr(39)+',`ficha_tecnica`.`nombre_alumno`) LIKE '+chr(39)+'%'+Edit4.Text+'%'+chr(39);
  end
  else
  begin
    nombre := ' ';
  end;

  if RadioGroup1.ItemIndex = 0 then
  begin
    sql := 'SELECT CONCAT(ficha_tecnica.`paterno_alumno`,'+chr(39)+' '+chr(39)+',ficha_tecnica.`materno_alumno`,'+chr(39)+' '+chr(39)+',`ficha_tecnica`.`nombre_alumno`) AS nombre, '+
           'justificantes.`semestre`, justificantes.`grupo`, justificantes.fecha, justificantes.`motivo`, '+
           'justificantes.`fecha_justifica`, justificantes.`status_justifica`, justificantes.`id_justificante` '+
           'FROM ficha_tecnica, justificantes WHERE ficha_tecnica.`matricula` = justificantes.`matricula` '+fecha+nombre;
  end;
  if RadioGroup1.ItemIndex = 1 then
  begin
    sql := 'SELECT CONCAT(ficha_tecnica.`paterno_alumno`,'+chr(39)+' '+chr(39)+',ficha_tecnica.`materno_alumno`,'+chr(39)+' '+chr(39)+',`ficha_tecnica`.`nombre_alumno`) AS nombre, '+
           'justificantes.`semestre`, justificantes.`grupo`, justificantes.fecha, justificantes.`motivo`, '+
           'justificantes.`fecha_justifica`, justificantes.`status_justifica`, justificantes.`id_justificante` '+
           'FROM ficha_tecnica, justificantes WHERE ficha_tecnica.`matricula` = justificantes.`matricula` and status_justifica = 1'+fecha+nombre;
  end;
   if RadioGroup1.ItemIndex = 2 then
  begin
    sql := 'SELECT CONCAT(ficha_tecnica.`paterno_alumno`,'+chr(39)+' '+chr(39)+',ficha_tecnica.`materno_alumno`,'+chr(39)+' '+chr(39)+',`ficha_tecnica`.`nombre_alumno`) AS nombre, '+
           'justificantes.`semestre`, justificantes.`grupo`, justificantes.fecha, justificantes.`motivo`, '+
           'justificantes.`fecha_justifica`, justificantes.`status_justifica`, justificantes.`id_justificante` '+
           'FROM ficha_tecnica, justificantes WHERE ficha_tecnica.`matricula` = justificantes.`matricula` and status_justifica = 0'+fecha+nombre;
  end;

  DM.Qjustificante.SQL.Clear;
  DM.Qjustificante.SQL.Add(sql+' order by justificantes.fecha desc');
  DM.Qjustificante.Open;
  grid_consulta.RowCount := DM.Qjustificante.RecordCount + 1;
  for I := 1 to grid_consulta.RowCount  do
  begin
    grid_consulta.Cells[0,I] := DM.Qjustificante.FieldByName('nombre').AsString;
    grid_consulta.Cells[1,I] := DM.Qjustificante.FieldByName('semestre').AsString+'/'+ DM.Qjustificante.FieldByName('grupo').AsString;
    grid_consulta.Cells[2,I] := DM.Qjustificante.FieldByName('motivo').AsString;
    grid_consulta.Cells[3,I] := DM.Qjustificante.FieldByName('fecha_justifica').AsString;
    if DM.Qjustificante.FieldByName('status_justifica').AsInteger = 0 then
    begin
      grid_consulta.Cells[4,I] := 'Atendido';
    end
    else
    begin
      grid_consulta.Cells[4,I] := 'Pendiente';
    end;
    grid_consulta.Cells[5,I] := DM.Qjustificante.FieldByName('id_justificante').AsString;
    DM.Qjustificante.Next;
  end;

  //DateTimePicker2.Date := Now;
  id := '0';
  Edit1.Clear; Edit2.Clear; Edit3.Clear;
  Label4.Caption := '0'; Label5.Caption := '0';
end;

procedure Tjustificante.grid_consultaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  Row := ARow;
end;

procedure Tjustificante.Guardar1Click(Sender: TObject);
begin
  DM.Qjustificante.SQL.Clear;
  DM.Qjustificante.SQL.Add('select * from justificantes where id_justificante = '+id);
  DM.Qjustificante.Open;
  if DM.Qjustificante.IsEmpty then
  begin
    DM.Qjustificante.Edit;
    DM.Qjustificante.Append;
  end
  else
  begin
    DM.Qjustificante.Edit;
  end;

  DM.Qjustificante.FieldByName('matricula').AsString := matricula;
  Dm.Qjustificante.FieldByName('fecha').AsVariant := FormatDateTime('yyyy-mm-dd', now);
  DM.Qjustificante.FieldByName('semestre').AsInteger := StrToInt(Label4.Caption);
  DM.Qjustificante.FieldByName('grupo').AsString := Label5.Caption;
  DM.Qjustificante.FieldByName('motivo').AsString := Edit2.Text;
  DM.Qjustificante.FieldByName('fecha_justifica').AsString := Edit3.Text;
  DM.Qjustificante.FieldByName('status_justifica').AsInteger := 1;
  DM.Qjustificante.Post;

  DM.Qjustificante.SQL.Clear;
  DM.Qjustificante.SQL.Add('select * from justificantes order by id_justificante asc');
  DM.Qjustificante.Open;
  DM.Qjustificante.Last;
  id := DM.Qjustificante.FieldByName('id_justificante').AsString;
  print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\justificantealumno.fr3');
  print.PrepareReport(True);
  print.PrintOptions.ShowDialog:=true;
  //print.ShowReport(true);
  print.Print;
  CheckBox1.Checked := False;
  DateTimePicker2.Date := Now;
  FormShow(Sender);

end;

procedure Tjustificante.Nuevo1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Tjustificante.Pendiente1Click(Sender: TObject);
begin
    DM.Qjustificante.SQL.Clear;
    DM.Qjustificante.SQL.Add('select * from justificantes where id_justificante = '+grid_consulta.Cells[5,Row]);
    DM.Qjustificante.Open;
    DM.Qjustificante.Edit;
    DM.Qjustificante.FieldByName('status_justifica').AsInteger := 1;
    DM.Qjustificante.Post;
    FormShow(Sender);
end;

procedure Tjustificante.printGetValue(const VarName: string;
  var Value: Variant);
begin
   if CompareText(VarName, 'file') = 0 then
  begin
    Value := id;
  end;
end;

procedure Tjustificante.RadioGroup1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

end.
