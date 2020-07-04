unit frm_reporte_indisciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  frxClass, Vcl.Grids, RzGrids, Vcl.ExtCtrls;

type
  Treporte_indisciplina = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    Guardar1: TMenuItem;
    Consultar1: TMenuItem;
    print: TfrxReport;
    PopupMenu1: TPopupMenu;
    Pendiente1: TMenuItem;
    Entregado1: TMenuItem;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    grid_consulta: TRzStringGrid;
    Button1: TButton;
    Edit4: TEdit;
    procedure ComboBox1DropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure grid_consultaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Pendiente1Click(Sender: TObject);
    procedure Entregado1Click(Sender: TObject);
    procedure printGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    var
      id, matricula : String;
      row :  integer;
    { Public declarations }
  end;

var
  reporte_indisciplina: Treporte_indisciplina;

implementation

{$R *.dfm}

uses frm_DM, frm_consulta_alumno;

procedure Treporte_indisciplina.Button1Click(Sender: TObject);
begin
  id := grid_consulta.Cells[5,row];
  print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\reportealumno.fr3');
  print.PrepareReport(True);
  print.PrintOptions.ShowDialog:=true;
  print.ShowReport(true);
  //print.Print;
end;

procedure Treporte_indisciplina.CheckBox1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Treporte_indisciplina.ComboBox1DropDown(Sender: TObject);
var
  I: Integer;
begin
  DM.Qpersonal.SQL.Clear;
  DM.Qpersonal.SQL.Add('select * from personal where cargo = '+Chr(39)+'prefecto'+Chr(39)+' and status_parsonal = 1 order by nombre_personal, paterno_personal asc');
  DM.Qpersonal.Open;

  for I := 0 to DM.Qpersonal.RecordCount - 1 do
  begin
    ComboBox1.Items.Add(DM.Qpersonal.FieldByName('nombre_personal').AsString+' '+
                        DM.Qpersonal.FieldByName('paterno_personal').AsString+' '+
                        DM.Qpersonal.FieldByName('materno_personal').AsString);
    DM.Qpersonal.Next;
  end;
end;

procedure Treporte_indisciplina.Consultar1Click(Sender: TObject);
begin
  consulta_alumno.consulta := 3;
  consulta_alumno.Show;
end;

procedure Treporte_indisciplina.DateTimePicker2Change(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Treporte_indisciplina.Edit4Change(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Treporte_indisciplina.Entregado1Click(Sender: TObject);
begin
  DM.Qreportes.SQL.Clear;
    DM.Qreportes.SQL.Add('select * from reportes where id_reporte = '+grid_consulta.Cells[5,Row]);
    DM.Qreportes.Open;
    DM.Qreportes.Edit;
    DM.Qreportes.FieldByName('status_reporte').AsInteger := 0;
    DM.Qreportes.Post;
    FormShow(Sender);
end;

procedure Treporte_indisciplina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Treporte_indisciplina.FormShow(Sender: TObject);
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
  grid_consulta.Cells[3,0] := 'Fecha';
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
           'reportes.`semestre`, reportes.`grupo`, reportes.fecha, reportes.`motivo`, '+
           'reportes.`status_reporte`, reportes.`id_reporte` '+
           'FROM ficha_tecnica, reportes WHERE ficha_tecnica.`matricula` = reportes.`matricula` '+fecha+nombre;
  end;
  if RadioGroup1.ItemIndex = 1 then
  begin
    sql := 'SELECT CONCAT(ficha_tecnica.`paterno_alumno`,'+chr(39)+' '+chr(39)+',ficha_tecnica.`materno_alumno`,'+chr(39)+' '+chr(39)+',`ficha_tecnica`.`nombre_alumno`) AS nombre, '+
           'reportes.`semestre`, reportes.`grupo`, reportes.fecha, reportes.`motivo`, '+
           'reportes.`status_reporte`, reportes.`id_reporte` '+
           'FROM ficha_tecnica, reportes WHERE ficha_tecnica.`matricula` = reportes.`matricula` and status_reporte = 1'+fecha+nombre;
  end;
   if RadioGroup1.ItemIndex = 2 then
  begin
    sql := 'SELECT CONCAT(ficha_tecnica.`paterno_alumno`,'+chr(39)+' '+chr(39)+',ficha_tecnica.`materno_alumno`,'+chr(39)+' '+chr(39)+',`ficha_tecnica`.`nombre_alumno`) AS nombre, '+
           'reportes.`semestre`, reportes.`grupo`, reportes.fecha, reportes.`motivo`, '+
           'reportes.`status_reporte`, reportes.`id_reporte` '+
           'FROM ficha_tecnica, reportes WHERE ficha_tecnica.`matricula` = reportes.`matricula` and status_reporte = 0'+fecha+nombre;
  end;

  DM.Qreportes.SQL.Clear;
  DM.Qreportes.SQL.Add(sql+' order by reportes.fecha desc');
  DM.Qreportes.Open;
  grid_consulta.RowCount := DM.Qreportes.RecordCount + 1;
  for I := 1 to grid_consulta.RowCount  do
  begin
    grid_consulta.Cells[0,I] := DM.Qreportes.FieldByName('nombre').AsString;
    grid_consulta.Cells[1,I] := DM.Qreportes.FieldByName('semestre').AsString+'/'+ DM.Qreportes.FieldByName('grupo').AsString;
    grid_consulta.Cells[2,I] := DM.Qreportes.FieldByName('motivo').AsString;
    grid_consulta.Cells[3,I] := DM.Qreportes.FieldByName('fecha').AsString;
    if DM.Qreportes.FieldByName('status_reporte').AsInteger = 0 then
    begin
      grid_consulta.Cells[4,I] := 'Atendido';
    end
    else
    begin
      grid_consulta.Cells[4,I] := 'Pendiente';
    end;
    grid_consulta.Cells[5,I] := DM.Qreportes.FieldByName('id_reporte').AsString;
    DM.Qreportes.Next;
  end;
  Memo1.Clear;
  ComboBox1.ItemIndex := -1;
  DateTimePicker1.Date := now;
  id := '0';
end;

procedure Treporte_indisciplina.grid_consultaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row := Arow;
end;

procedure Treporte_indisciplina.Guardar1Click(Sender: TObject);
begin
  DM.Qreportes.SQL.Clear;
  DM.Qreportes.SQL.Add('select * from reportes where id_reporte = '+id);
  DM.Qreportes.Open;
  if DM.Qreportes.IsEmpty then
  begin
    DM.Qreportes.Edit;
    DM.Qreportes.Append;
  end
  else
  begin
    DM.Qreportes.Edit;
  end;

  DM.Qreportes.FieldByName('matricula').AsString := matricula;
  Dm.Qreportes.FieldByName('fecha').AsVariant := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date);
  DM.Qreportes.FieldByName('semestre').AsInteger := StrToInt(Label4.Caption);
  DM.Qreportes.FieldByName('grupo').AsString := Label5.Caption;
  DM.Qreportes.FieldByName('motivo').AsString := Memo1.Text;
  DM.Qreportes.FieldByName('prefecto').AsString := ComboBox1.Text;
  DM.Qreportes.FieldByName('status_reporte').AsInteger := 1;
  DM.Qreportes.Post;

  DM.Qreportes.SQL.Clear;
  DM.Qreportes.SQL.Add('select * from reportes order by id_reporte asc');
  DM.Qreportes.Open;
  DM.Qreportes.Last;
  id := DM.Qreportes.FieldByName('id_reporte').AsString;
  print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\reportealumno.fr3');
  print.PrepareReport(True);
  print.PrintOptions.ShowDialog:=true;
  //print.ShowReport(true);
  print.Print;
  CheckBox1.Checked := False;
  DateTimePicker2.Date := Now;
  FormShow(Sender);
end;

procedure Treporte_indisciplina.Pendiente1Click(Sender: TObject);
begin
  DM.Qreportes.SQL.Clear;
    DM.Qreportes.SQL.Add('select * from reportes where id_reporte = '+grid_consulta.Cells[5,Row]);
    DM.Qreportes.Open;
    DM.Qreportes.Edit;
    DM.Qreportes.FieldByName('status_reporte').AsInteger := 1;
    DM.Qreportes.Post;
    FormShow(Sender);
end;

procedure Treporte_indisciplina.printGetValue(const VarName: string;
  var Value: Variant);
begin
    if CompareText(VarName, 'file') = 0 then
  begin
    Value := id;
  end;
end;

procedure Treporte_indisciplina.RadioGroup1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

end.
