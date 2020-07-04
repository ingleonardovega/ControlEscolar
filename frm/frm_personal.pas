unit frm_personal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Mask, Vcl.StdCtrls,
  Vcl.ExtCtrls, StrUtils, Vcl.Grids;

type
  Tpersonal = class(TForm)
    MainMenu1: TMainMenu;
    Guardar1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox3: TComboBox;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    RadioGroup1: TRadioGroup;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Label8: TLabel;
    Edit6: TEdit;
    StringGrid1: TStringGrid;
    RadioGroup2: TRadioGroup;
    ComboBox1: TComboBox;
    Limpiar1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Limpiar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    var
    row :Integer;
    id :String;
    { Public declarations }
  end;

var
  personal: Tpersonal;

implementation

{$R *.dfm}

uses frm_DM;

procedure Tpersonal.Edit5Exit(Sender: TObject);
begin

  if  AnsiMidStr(Edit5.Text,11,1) = 'H' then
  begin
    RadioGroup1.ItemIndex := 0;
  end
  else if AnsiMidStr(Edit5.Text,11,1) = 'M' then
  begin
    RadioGroup1.ItemIndex := 1;
  end
  else
  begin
    ShowMessage('CURP invalido !!!');
    abort;
  end;
  Edit6.Text := AnsiMidStr(Edit5.Text,0,10)
end;

procedure Tpersonal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tpersonal.FormShow(Sender: TObject);
var
  I: Integer;
  I2: Integer;
begin
  id := '0';
  for I := 0 to StringGrid1.RowCount - 1 do
  begin
    for I2 := 0 to StringGrid1.ColCount do
    begin
      StringGrid1.Cells[I2,I] := '';
    end;
  end;
  StringGrid1.RowCount := 2;
  StringGrid1.FixedRows := 1;
  StringGrid1.Cells[0,0] := 'NOMBRE';
  StringGrid1.Cells[1,0] := 'CARGO';
  StringGrid1.Cells[2,0] := 'STATUS';
  StringGrid1.Cells[3,0] := 'ID';

  RadioGroup2Click(Sender);
  ComboBox1.ItemIndex := 1;
  Edit1.Clear;Edit2.Clear;Edit3.Clear;Edit4.Clear;Edit5.Clear;Edit6.Clear;MaskEdit1.Clear;ComboBox3.ItemIndex := -1;
end;

procedure Tpersonal.Guardar1Click(Sender: TObject);
begin
  DM.Qpersonal.SQL.Clear;
  DM.Qpersonal.SQL.Add('Select * from personal where id_personal ='+id);
  DM.Qpersonal.Open;

  if DM.Qpersonal.IsEmpty then
  begin
    DM.Qpersonal.Edit;
    DM.Qpersonal.Append;
  end
  else
  begin
    DM.Qpersonal.Edit;
  end;

  DM.Qpersonal.FieldByName('paterno_personal').AsString := Edit1.Text;
  DM.Qpersonal.FieldByName('materno_personal').AsString := Edit2.Text;
  DM.Qpersonal.FieldByName('nombre_personal').AsString := Edit3.Text;
  DM.Qpersonal.FieldByName('cargo').AsString := ComboBox3.Text;
  if ComboBox3.Text = 'DOCENTE' then
  begin
    DM.Qpersonal.FieldByName('puesto').AsInteger := 1;
  end
  else
  begin
    DM.Qpersonal.FieldByName('puesto').AsInteger := 2;
  end;
  DM.Qpersonal.FieldByName('perfil').AsString := Edit4.Text;
  DM.Qpersonal.FieldByName('curp').AsString := Edit5.Text;
  DM.Qpersonal.FieldByName('rfc').AsString := Edit6.Text;
  if RadioGroup1.ItemIndex = 0 then
  begin
    DM.Qpersonal.FieldByName('sexo').AsInteger := 1;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    DM.Qpersonal.FieldByName('sexo').AsInteger := 0;
  end;
  DM.Qpersonal.FieldByName('fecha_nacimiento').AsVariant := FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit1.Text));
  DM.Qpersonal.FieldByName('status_parsonal').AsInteger := ComboBox1.ItemIndex;
  DM.Qpersonal.Post;
  ShowMessage('Datos guardados con exito !!!');
  FormShow(Sender);

end;

procedure Tpersonal.Limpiar1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure Tpersonal.RadioGroup2Click(Sender: TObject);
var
  qry :String;
  i :Integer;
begin

    if RadioGroup2.ItemIndex = 0 then
    begin
      qry := 'Select * from personal order by paterno_personal, materno_personal, nombre_personal asc';
    end;

     if RadioGroup2.ItemIndex = 1 then
    begin
      qry := 'Select * from personal where extra <= 1 order by paterno_personal, materno_personal, nombre_personal asc';
    end;

    if RadioGroup2.ItemIndex = 2 then
    begin
      qry := 'Select * from personal where puesto = 1 order by paterno_personal, materno_personal, nombre_personal asc';
    end;

    if RadioGroup2.ItemIndex = 3 then
    begin
      qry := 'Select * from personal where cargo = '+chr(39)+'ADMINISTRATIVO'+chr(39)+' order by paterno_personal, materno_personal, nombre_personal asc';
    end;

    if RadioGroup2.ItemIndex = 4 then
    begin
      qry := 'Select * from personal where cargo = '+chr(39)+'PREFECTO'+chr(39)+' order by paterno_personal, materno_personal, nombre_personal asc';
    end;

    if RadioGroup2.ItemIndex = 5 then
    begin
      qry := 'Select * from personal where cargo = '+chr(39)+'INTENDENTE'+chr(39)+' order by paterno_personal, materno_personal, nombre_personal asc';
    end;

    DM.Qpersonal.SQL.Clear;
    DM.Qpersonal.SQL.Add(qry);
    DM.Qpersonal.Open;
    StringGrid1.RowCount := DM.Qpersonal.RecordCount + 1;

    for I := 1 to StringGrid1.RowCount + 1 do
    begin
      StringGrid1.Cells[0,i] := DM.Qpersonal.FieldByName('paterno_personal').AsString+' '+
                                DM.Qpersonal.FieldByName('materno_personal').AsString+' '+
                                DM.Qpersonal.FieldByName('nombre_personal').AsString;
      StringGrid1.Cells[1,i] := DM.Qpersonal.FieldByName('cargo').AsString;
      if DM.Qpersonal.FieldByName('status_parsonal').AsInteger = 1  then
      begin
        StringGrid1.Cells[2,i] := 'Activo';
      end
      else
      begin
        StringGrid1.Cells[2,i] := 'Inactivo';
      end;
      StringGrid1.Cells[3,i] := DM.Qpersonal.FieldByName('id_personal').AsString;
      Dm.Qpersonal.Next;
    end;
end;

procedure Tpersonal.StringGrid1DblClick(Sender: TObject);
begin
  id := StringGrid1.Cells[3,row];

  DM.Qpersonal.SQL.Clear;
  DM.Qpersonal.SQL.Add('Select * from personal where id_personal ='+id);
  DM.Qpersonal.Open;

  Edit1.Text := DM.Qpersonal.FieldByName('paterno_personal').AsString;
  Edit2.Text := DM.Qpersonal.FieldByName('materno_personal').AsString;
  Edit3.Text := DM.Qpersonal.FieldByName('nombre_personal').AsString;
  ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(DM.Qpersonal.FieldByName('cargo').AsString);

  Edit4.Text := DM.Qpersonal.FieldByName('perfil').AsString;
  Edit5.Text := DM.Qpersonal.FieldByName('curp').AsString;
  Edit6.Text := DM.Qpersonal.FieldByName('rfc').AsString;
  if DM.Qpersonal.FieldByName('sexo').AsInteger = 1 then
  begin
    RadioGroup1.ItemIndex := 0;
  end
  else
  begin
    RadioGroup1.ItemIndex := 1;
  end;
  MaskEdit1.Text := FormatDateTime('dd/mm/yyyy', DM.Qpersonal.FieldByName('fecha_nacimiento').AsDateTime);
  ComboBox1.ItemIndex := DM.Qpersonal.FieldByName('status_parsonal').AsInteger;
end;

procedure Tpersonal.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  row := ARow;
end;

end.
