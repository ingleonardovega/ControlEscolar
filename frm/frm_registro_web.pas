unit frm_registro_web;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, StrUtils,
  Vcl.Buttons;

type
  TRegistro_WEB = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure datosCURP(Sender : TObject);
    procedure StringGrid1DblClick(Sender: TObject);
var
  private
    var
    row :Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Registro_WEB: TRegistro_WEB;

implementation

{$R *.dfm}

uses frm_DM, frm_ficha_tecnica;

procedure TRegistro_WEB.datosCURP(Sender : TObject);
var
  estado :String;
begin
  if  AnsiMidStr(ficha_tecnica.Edit5.Text,11,1) = 'H' then
  begin
    ficha_tecnica.RadioGroup1.ItemIndex := 0;
  end
  else
  begin
   ficha_tecnica.RadioGroup1.ItemIndex := 1;
  end;

  ficha_tecnica.MaskEdit1.Text := AnsiMidStr(ficha_tecnica.Edit5.Text,9,2)+'/'+
                                  AnsiMidStr(ficha_tecnica.Edit5.Text,7,2)+'/'+
                                  '20'+AnsiMidStr(ficha_tecnica.Edit5.Text,5,2);

  estado :=  AnsiMidStr(ficha_tecnica.Edit5.Text,12,2);
  if estado = 'AS' then begin ficha_tecnica.Edit4.Text := 'AGUASCALIENTES'; end;
  if estado = 'BC' then begin  ficha_tecnica.Edit4.Text := 'BAJA CALIFORNIA NTE.'; end;
  if estado = 'BS' then begin  ficha_tecnica.Edit4.Text := 'BAJA CALIFORNIA SUR'; end;
  if estado = 'CC' then begin  ficha_tecnica.Edit4.Text := 'CAMPECHE'; end;
  if estado = 'CL' then begin  ficha_tecnica.Edit4.Text := 'COAHUILA'; end;
  if estado = 'CM' then begin  ficha_tecnica.Edit4.Text := 'COLIMA'; end;
  if estado = 'CS' then begin  ficha_tecnica.Edit4.Text := 'CHIAPAS'; end;
  if estado = 'CH' then begin  ficha_tecnica.Edit4.Text := 'CHIHUAHUA'; end;
  if estado = 'DF' then begin  ficha_tecnica.Edit4.Text := 'DISTRITO FEDERAL'; end;
  if estado = 'DG' then begin  ficha_tecnica.Edit4.Text := 'DURANGO'; end;
  if estado = 'GT' then begin  ficha_tecnica.Edit4.Text := 'GUANAJUATO'; end;
  if estado = 'GR' then begin  ficha_tecnica.Edit4.Text := 'GUERRERO'; end;
  if estado = 'HG' then begin  ficha_tecnica.Edit4.Text := 'HIDALGO'; end;
  if estado = 'JC' then begin  ficha_tecnica.Edit4.Text := 'JALISCO'; end;
  if estado = 'MC' then begin  ficha_tecnica.Edit4.Text := 'MEXICO'; end;
  if estado = 'MN' then begin  ficha_tecnica.Edit4.Text := 'MICHOACAN'; end;
  if estado = 'MS' then begin  ficha_tecnica.Edit4.Text := 'MORELOS'; end;
  if estado = 'NT' then begin  ficha_tecnica.Edit4.Text := 'NAYARIT'; end;
  if estado = 'NL' then begin  ficha_tecnica.Edit4.Text := 'NUEVO LEON'; end;
  if estado = 'OC' then begin  ficha_tecnica.Edit4.Text := 'OAXACA'; end;
  if estado = 'PL' then begin  ficha_tecnica.Edit4.Text := 'PUEBLA'; end;
  if estado = 'QT' then begin  ficha_tecnica.Edit4.Text := 'QUERETARO'; end;
  if estado = 'QR' then begin  ficha_tecnica.Edit4.Text := 'QUINTANA ROO'; end;
  if estado = 'SP' then begin  ficha_tecnica.Edit4.Text := 'SAN LUIS POTOSI'; end;
  if estado = 'SL' then begin  ficha_tecnica.Edit4.Text := 'SINALOA'; end;
  if estado = 'SR' then begin  ficha_tecnica.Edit4.Text := 'SONORA'; end;
  if estado = 'TC' then begin  ficha_tecnica.Edit4.Text := 'TABASCO'; end;
  if estado = 'TS' then begin  ficha_tecnica.Edit4.Text := 'TAMAULIPAS'; end;
  if estado = 'TL' then begin  ficha_tecnica.Edit4.Text := 'TLAXCALA'; end;
  if estado = 'VZ' then begin  ficha_tecnica.Edit4.Text := 'VERACRUZ'; end;
  if estado = 'YN' then begin  ficha_tecnica.Edit4.Text := 'YUCATAN'; end;
  if estado = 'ZS' then begin  ficha_tecnica.Edit4.Text := 'ZACATECAS'; end;
  if estado = 'SM' then begin  ficha_tecnica.Edit4.Text := 'SERV. EXTERIOR MEXICANO'; end;
  if estado = 'NE' then begin  ficha_tecnica.Edit4.Text := 'NACIDO EN EL EXTRANJERO'; end;

  ficha_tecnica.Edit7.Text := intToStr(ficha_tecnica.Edad(ficha_tecnica.MaskEdit1.Text));
end;


procedure TRegistro_WEB.Edit1Change(Sender: TObject);
var
  I :Integer;
begin
  DM.QRegisitroWeb.SQL.Clear;
  DM.QRegisitroWeb.SQL.Add('Select * from registro_web where CONCAT(nombre_alumno,'+chr(39)+' '+chr(39)+',paterno_alumno,'+chr(39)+' '+chr(39)+',materno_alumno) LIKE '+chr(39)+'%'+Edit1.Text+'%'+chr(39)+' order by nombre_alumno, paterno_alumno, materno_alumno asc');
  DM.QRegisitroWeb.Open;

  StringGrid1.RowCount := DM.QRegisitroWeb.RecordCount + 1;
  for I := 1 to StringGrid1.RowCount do
  begin
    StringGrid1.Cells[0,I] := DM.QRegisitroWeb.FieldByName('paterno_alumno').AsString;
    StringGrid1.Cells[1,I] := DM.QRegisitroWeb.FieldByName('materno_alumno').AsString;
    StringGrid1.Cells[2,I] := DM.QRegisitroWeb.FieldByName('nombre_alumno').AsString;
    StringGrid1.Cells[3,I] := DM.QRegisitroWeb.FieldByName('curp_alumno').AsString;
    StringGrid1.Cells[4,I] := DM.QRegisitroWeb.FieldByName('folioDGB').AsString;
    DM.QRegisitroWeb.Next;
  end;

end;

procedure TRegistro_WEB.FormShow(Sender: TObject);
var
  I: Integer;
  I2: Integer;
begin
  for I := 0 to StringGrid1.RowCount  do
  begin
    for I2 := 0 to StringGrid1.ColCount do
     begin
       StringGrid1.Cells[I2,I] := '';
     end;
  end;
  StringGrid1.RowCount := 2;
  StringGrid1.Cells[0,0] := 'Paterno';
  StringGrid1.Cells[1,0] := 'Materno';
  StringGrid1.Cells[2,0] := 'Nombre';
  StringGrid1.Cells[3,0] := 'CURP';
  StringGrid1.Cells[4,0] := 'Folio DGB';
  Edit1.Clear;

  DM.QRegisitroWeb.SQL.Clear;
  DM.QRegisitroWeb.SQL.Add('Select * from registro_web order by nombre_alumno, paterno_alumno, materno_alumno asc');
  DM.QRegisitroWeb.Open;

  StringGrid1.RowCount := DM.QRegisitroWeb.RecordCount + 1;
  for I := 1 to StringGrid1.RowCount do
  begin
    StringGrid1.Cells[0,I] := DM.QRegisitroWeb.FieldByName('paterno_alumno').AsString;
    StringGrid1.Cells[1,I] := DM.QRegisitroWeb.FieldByName('materno_alumno').AsString;
    StringGrid1.Cells[2,I] := DM.QRegisitroWeb.FieldByName('nombre_alumno').AsString;
    StringGrid1.Cells[3,I] := DM.QRegisitroWeb.FieldByName('curp_alumno').AsString;
    StringGrid1.Cells[4,I] := DM.QRegisitroWeb.FieldByName('folioDGB').AsString;
    DM.QRegisitroWeb.Next;
  end;
end;

procedure TRegistro_WEB.StringGrid1DblClick(Sender: TObject);
begin
  DM.QRegisitroWeb.SQL.Clear;
  DM.QRegisitroWeb.SQL.Add('Select * from registro_web where folioDGB = '+chr(39)+StringGrid1.Cells[4,row] +chr(39));
  DM.QRegisitroWeb.Open;

  ficha_tecnica.ComboBox4.ItemIndex := ficha_tecnica.ComboBox4.Items.IndexOf('1');
  ficha_tecnica.ComboBox5.ItemIndex := ficha_tecnica.ComboBox5.Items.IndexOf('');
  ficha_tecnica.ComboBox6.ItemIndex := 1;

  ficha_tecnica.Edit1.Text := DM.QRegisitroWeb.FieldByName('paterno_alumno').AsString;
  ficha_tecnica.Edit2.Text := DM.QRegisitroWeb.FieldByName('materno_alumno').AsString;
  ficha_tecnica.Edit3.Text := DM.QRegisitroWeb.FieldByName('nombre_alumno').AsString;
  ficha_tecnica.Edit5.Text := DM.QRegisitroWeb.FieldByName('curp_alumno').AsString;
  datosCURP(Sender);

//  ficha_tecnica.Edit4.Text := DM.Qfichatecnica.FieldByName('lugar_nacimiento').AsString;
//  if DM.Qfichatecnica.FieldByName('sexo_alumno').AsInteger = 1 then
//  begin
//    ficha_tecnica.RadioGroup1.ItemIndex := 0;
//  end
//  else
//  begin
//    ficha_tecnica.RadioGroup1.ItemIndex := 1;
//  end;
//  ficha_tecnica.MaskEdit1.Text := FormatDateTime('dd/mm/yyyy',DM.Qfichatecnica.FieldByName('fecha_alumno').AsDateTime);
//  ficha_tecnica.Edit7.Text := DM.Qfichatecnica.FieldByName('edad').AsString;

  ficha_tecnica.Edit8.Text := DM.QRegisitroWeb.FieldByName('direccion').AsString;
  ficha_tecnica.Edit10.Text := DM.QRegisitroWeb.FieldByName('cp').AsString;
  ficha_tecnica.Edit9.Text := DM.QRegisitroWeb.FieldByName('colonia').AsString;
  ficha_tecnica.Edit17.Text := DM.QRegisitroWeb.FieldByName('correo').AsString;

  ficha_tecnica.Edit12.Text := DM.QRegisitroWeb.FieldByName('tutor').AsString;
  ficha_tecnica.ComboBox1.ItemIndex := ficha_tecnica.ComboBox1.Items.IndexOf(DM.QRegisitroWeb.FieldByName('parentesco').AsString);
 // ficha_tecnica.MaskEdit3.Text := FormatDateTime('dd/mm/yyyy',DM.Qfichatecnica.FieldByName('fecha_tutor').AsDateTime);
  ficha_tecnica.Edit6.Text := DM.QRegisitroWeb.FieldByName('curp_tutor').AsString;
  ficha_tecnica.MaskEdit3.Text := AnsiMidStr(ficha_tecnica.Edit6.Text,9,2)+'/'+
                                  AnsiMidStr(ficha_tecnica.Edit6.Text,7,2)+'/'+
                                  '19'+AnsiMidStr(ficha_tecnica.Edit6.Text,5,2);
  ficha_tecnica.Edit15.Text := DM.QRegisitroWeb.FieldByName('celular').AsString;
  ficha_tecnica.Edit16.Text := DM.QRegisitroWeb.FieldByName('correo').AsString;
  ficha_tecnica.Edit11.Text := DM.QRegisitroWeb.FieldByName('direccion').AsString;
  ficha_tecnica.Edit13.Text := DM.QRegisitroWeb.FieldByName('cp').AsString;
  ficha_tecnica.Edit14.Text := DM.QRegisitroWeb.FieldByName('colonia').AsString;
  ficha_tecnica.Edit18.Text := DM.QRegisitroWeb.FieldByName('tel_casa').AsString;
  ficha_tecnica.Edit19.Text := DM.QRegisitroWeb.FieldByName('ocupacion').AsString;
  ficha_tecnica.Edit20.Text := DM.QRegisitroWeb.FieldByName('lugar_trabajo').AsString;
  ficha_tecnica.Edit21.Text := DM.QRegisitroWeb.FieldByName('tel_trabajo').AsString;

  ficha_tecnica.ComboBox2.ItemIndex := ficha_tecnica.ComboBox2.Items.IndexOf(DM.QRegisitroWeb.FieldByName('tipo_sangre').AsString);
  ficha_tecnica.Edit22.Text := DM.QRegisitroWeb.FieldByName('alergias').AsString;
  ficha_tecnica.Edit23.Text := DM.QRegisitroWeb.FieldByName('medicamento_alergico').AsString;
  ficha_tecnica.Edit24.Text := DM.QRegisitroWeb.FieldByName('padecimientos').AsString;
  ficha_tecnica.ComboBox3.ItemIndex := ficha_tecnica.ComboBox3.Items.IndexOf(DM.QRegisitroWeb.FieldByName('tipo_seguro').AsString);
  Close;
end;

procedure TRegistro_WEB.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row := ARow;
end;

end.
