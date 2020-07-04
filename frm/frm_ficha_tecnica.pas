unit frm_ficha_tecnica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Menus, StrUtils, Vcl.Mask, frxClass, frxADOComponents,
  frxChBox;

type
  Tficha_tecnica = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    CategoryPanel4: TCategoryPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    MainMenu1: TMainMenu;
    GuardarImprimir1: TMenuItem;
    Consultar1: TMenuItem;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    RadioGroup1: TRadioGroup;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label13: TLabel;
    Edit12: TEdit;
    ComboBox1: TComboBox;
    Label15: TLabel;
    MaskEdit3: TMaskEdit;
    Label11: TLabel;
    Edit6: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    Label14: TLabel;
    Edit13: TEdit;
    Label16: TLabel;
    Edit14: TEdit;
    Label17: TLabel;
    Edit15: TEdit;
    Label18: TLabel;
    Edit16: TEdit;
    Label19: TLabel;
    Edit17: TEdit;
    CheckBox1: TCheckBox;
    Label20: TLabel;
    Edit18: TEdit;
    Label21: TLabel;
    Edit19: TEdit;
    Label22: TLabel;
    Edit20: TEdit;
    Label23: TLabel;
    Edit21: TEdit;
    CategoryPanel5: TCategoryPanel;
    Label24: TLabel;
    Edit22: TEdit;
    ComboBox2: TComboBox;
    Label25: TLabel;
    Label26: TLabel;
    Edit23: TEdit;
    Label27: TLabel;
    Edit24: TEdit;
    Label28: TLabel;
    ComboBox3: TComboBox;
    Label29: TLabel;
    ComboBox4: TComboBox;
    Label30: TLabel;
    ComboBox5: TComboBox;
    Label31: TLabel;
    ComboBox6: TComboBox;
    Label32: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    Label33: TLabel;
    Label34: TLabel;
    print: TfrxReport;
    Extra1: TMenuItem;
    Hermanos1: TMenuItem;
    Salir1: TMenuItem;
    RegistroWEB1: TMenuItem;
    ImprimirFichaTecnica1: TMenuItem;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit5Exit(Sender: TObject);
    function Edad(FechaNacimiento:string):integer;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure GuardarImprimir1Click(Sender: TObject);
    procedure Hermanos1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure RegistroWEB1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure printGetValue(const VarName: string; var Value: Variant);
    procedure ImprimirFichaTecnica1Click(Sender: TObject);
  private

    { Private declarations }
  public
  var
  matricula :String;
    { Public declarations }
  end;

var
  ficha_tecnica: Tficha_tecnica;

implementation

{$R *.dfm}

uses frm_consulta_alumno, frm_DM, frm_registro_web;
procedure Tficha_tecnica.Button1Click(Sender: TObject);
begin
  ShowMessage(boolTostr(CheckBox2.Checked));
end;

procedure Tficha_tecnica.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then
  begin
    Edit11.Text := Edit8.Text;
    Edit13.Text := Edit10.Text;
    Edit14.Text := Edit9.Text;
  end
  else
  begin
    Edit11.Clear;Edit13.Clear;Edit14.Clear;
  end;
end;

procedure Tficha_tecnica.Consultar1Click(Sender: TObject);
begin
  consulta_alumno.consulta := 1;
  consulta_alumno.Show;
  Salir1.Visible := True;
  RegistroWEB1.Visible := False;
  ImprimirFichaTecnica1.Visible := True;
end;

function Tficha_tecnica.Edad(FechaNacimiento:string):integer;
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

procedure Tficha_tecnica.Edit5Exit(Sender: TObject);
var
  estado :String;
begin
  if  AnsiMidStr(Edit5.Text,11,1) = 'H' then
  begin
    RadioGroup1.ItemIndex := 0;
  end
  else
  begin
    RadioGroup1.ItemIndex := 1;
  end;
  estado :=  AnsiMidStr(Edit5.Text,12,2);
  if estado = 'AS' then begin Edit4.Text := 'AGUASCALIENTES'; end;
  if estado = 'BC' then begin  Edit4.Text := 'BAJA CALIFORNIA NTE.'; end;
  if estado = 'BS' then begin  Edit4.Text := 'BAJA CALIFORNIA SUR'; end;
  if estado = 'CC' then begin  Edit4.Text := 'CAMPECHE'; end;
  if estado = 'CL' then begin  Edit4.Text := 'COAHUILA'; end;
  if estado = 'CM' then begin  Edit4.Text := 'COLIMA'; end;
  if estado = 'CS' then begin  Edit4.Text := 'CHIAPAS'; end;
  if estado = 'CH' then begin  Edit4.Text := 'CHIHUAHUA'; end;
  if estado = 'DF' then begin  Edit4.Text := 'DISTRITO FEDERAL'; end;
  if estado = 'DG' then begin  Edit4.Text := 'DURANGO'; end;
  if estado = 'GT' then begin  Edit4.Text := 'GUANAJUATO'; end;
  if estado = 'GR' then begin  Edit4.Text := 'GUERRERO'; end;
  if estado = 'HG' then begin  Edit4.Text := 'HIDALGO'; end;
  if estado = 'JC' then begin  Edit4.Text := 'JALISCO'; end;
  if estado = 'MC' then begin  Edit4.Text := 'MEXICO'; end;
  if estado = 'MN' then begin  Edit4.Text := 'MICHOACAN'; end;
  if estado = 'MS' then begin  Edit4.Text := 'MORELOS'; end;
  if estado = 'NT' then begin  Edit4.Text := 'NAYARIT'; end;
  if estado = 'NL' then begin  Edit4.Text := 'NUEVO LEON'; end;
  if estado = 'OC' then begin  Edit4.Text := 'OAXACA'; end;
  if estado = 'PL' then begin  Edit4.Text := 'PUEBLA'; end;
  if estado = 'QT' then begin  Edit4.Text := 'QUERETARO'; end;
  if estado = 'QR' then begin  Edit4.Text := 'QUINTANA ROO'; end;
  if estado = 'SP' then begin  Edit4.Text := 'SAN LUIS POTOSI'; end;
  if estado = 'SL' then begin  Edit4.Text := 'SINALOA'; end;
  if estado = 'SR' then begin  Edit4.Text := 'SONORA'; end;
  if estado = 'TC' then begin  Edit4.Text := 'TABASCO'; end;
  if estado = 'TS' then begin  Edit4.Text := 'TAMAULIPAS'; end;
  if estado = 'TL' then begin  Edit4.Text := 'TLAXCALA'; end;
  if estado = 'VZ' then begin  Edit4.Text := 'VERACRUZ'; end;
  if estado = 'YN' then begin  Edit4.Text := 'YUCATAN'; end;
  if estado = 'ZS' then begin  Edit4.Text := 'ZACATECAS'; end;
  if estado = 'SM' then begin  Edit4.Text := 'SERV. EXTERIOR MEXICANO'; end;
  if estado = 'NE' then begin  Edit4.Text := 'NACIDO EN EL EXTRANJERO'; end;
end;

procedure Tficha_tecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  consulta_alumno.Close;
  Action:=cafree;
end;

procedure Tficha_tecnica.FormShow(Sender: TObject);
var
  i :Integer;
begin
  hermanos1.Checked := False;
  Label32.Caption := 'Matricula:';
  MaskEdit1.Clear;
  MaskEdit3.Clear;
  RadioGroup1.ItemIndex := -1;
  CategoryPanel1.Collapsed := True;
  CategoryPanel2.Collapsed := True;
  CategoryPanel3.Collapsed := True;
  CategoryPanel4.Collapsed := True;
  CategoryPanel5.Collapsed := False;
  matricula := '';
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TEdit then
    begin
      TEdit(Components[i]).Clear;
    end;
    if Components[i] is TComboBox then
    begin
      TComboBox(Components[i]).ItemIndex := -1;
    end;
    if Components[i] is TCheckBox then
    begin
      TCheckBox(Components[i]).Checked := false;
    end;
  end;

  Salir1.Visible := false;
  RegistroWEB1.Visible := True;
  ImprimirFichaTecnica1.Visible := False;
end;

procedure Tficha_tecnica.printGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(VarName, 'matricula') = 0 then
  begin
    Value := matricula;
  end;
end;

procedure Tficha_tecnica.GuardarImprimir1Click(Sender: TObject);
begin

  if (ComboBox4.ItemIndex = -1) or (ComboBox5.ItemIndex = -1) or (ComboBox6.ItemIndex = -1) then
  begin
    ShowMessage('Falta Datos de informacion');
    Abort;
  end;

  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') or (Edit5.Text = '') or (MaskEdit1.Text = '__/__/____')then
  begin
    ShowMessage('Faltan datos Alumno');
    Abort;
  end;

  if (Edit12.Text = '') or (ComboBox1.Text = '') or (Edit6.Text = '') then
  begin
    ShowMessage('Faltan Datos del Tutor');
    Abort;
  end;

  DM.Qfichatecnica.SQL.Clear;
  DM.Qfichatecnica.SQL.Add('Select * from ficha_tecnica where matricula = '+chr(39)+matricula+chr(39));
  DM.Qfichatecnica.Open;

  if not (DM.Qfichatecnica.IsEmpty) and (hermanos1.Checked = false) then
  begin
    DM.Qfichatecnica.Edit;
  end
  else
  begin
    DM.Qfichatecnica.SQL.Clear;
    DM.Qfichatecnica.SQL.Add('Select * From ficha_tecnica order by id_alumno asc');
    DM.Qfichatecnica.Open;
    DM.Qfichatecnica.Last;
    matricula := formatdatetime('yyyy', now)+FormatFloat('000000000', DM.Qfichatecnica.FieldByName('id_alumno').AsInteger + 1);
    DM.Qfichatecnica.Edit;
    DM.Qfichatecnica.Append;
    DM.Qfichatecnica.FieldByName('matricula').AsString := matricula;
  end;


  DM.Qfichatecnica.FieldByName('semestre').AsInteger := StrToInt(ComboBox4.Text);
  DM.Qfichatecnica.FieldByName('grupo').AsString := ComboBox5.Text;
  DM.Qfichatecnica.FieldByName('status_alumno').AsInteger := ComboBox6.ItemIndex;
  Label32.Caption := 'Matricula: '+matricula;

  DM.Qfichatecnica.FieldByName('paterno_alumno').AsString := Edit1.Text;
  DM.Qfichatecnica.FieldByName('materno_alumno').AsString := Edit2.Text;
  DM.Qfichatecnica.FieldByName('nombre_alumno').AsString := Edit3.Text;
  DM.Qfichatecnica.FieldByName('curp').AsString := Edit5.Text;
  DM.Qfichatecnica.FieldByName('lugar_nacimiento').AsString := Edit4.Text;
  if RadioGroup1.ItemIndex = 0 then
  begin
    DM.Qfichatecnica.FieldByName('sexo_alumno').AsInteger := 1;
  end
  else
  begin
    DM.Qfichatecnica.FieldByName('sexo_alumno').AsInteger := 2;
  end;

  DM.Qfichatecnica.FieldByName('fecha_alumno').AsVariant := FormatDateTime('yyyy-mm-dd',StrToDate(MaskEdit1.Text));
  DM.Qfichatecnica.FieldByName('edad').AsInteger := StrToInt(Edit7.Text);
  DM.Qfichatecnica.FieldByName('domicilio').AsString := Edit8.Text;
  DM.Qfichatecnica.FieldByName('cp').AsString := Edit10.Text;
  DM.Qfichatecnica.FieldByName('colonia').AsString := Edit9.Text;
  DM.Qfichatecnica.FieldByName('correo').AsString := Edit17.Text;

  DM.Qfichatecnica.FieldByName('tutor').AsString := Edit12.Text;
  DM.Qfichatecnica.FieldByName('parentesco_tutor').AsString := ComboBox1.Text;
  DM.Qfichatecnica.FieldByName('fecha_tutor').AsVariant := FormatDateTime('yyyy-mm-dd',StrToDate(MaskEdit3.Text));
  DM.Qfichatecnica.FieldByName('curp_tutor').AsString := Edit6.Text;
  DM.Qfichatecnica.FieldByName('celular_tutor').AsString := Edit15.Text;
  DM.Qfichatecnica.FieldByName('correo_tutor').AsString := Edit16.Text;
  DM.Qfichatecnica.FieldByName('domicilio_tutor').AsString := Edit11.Text;
  DM.Qfichatecnica.FieldByName('cp_tutor').AsString := Edit13.Text;
  DM.Qfichatecnica.FieldByName('colonia_tutor').AsString := Edit14.Text;
  DM.Qfichatecnica.FieldByName('tel_casa').AsString := Edit18.Text;
  DM.Qfichatecnica.FieldByName('ocupacion_tutor').AsString := Edit19.Text;
  DM.Qfichatecnica.FieldByName('trabajo_tutor').AsString := Edit20.Text;
  DM.Qfichatecnica.FieldByName('telefono_trabajo').AsString := Edit21.Text;

  DM.Qfichatecnica.FieldByName('tipo_sangre').AsString := ComboBox2.Text;
  DM.Qfichatecnica.FieldByName('alergias').AsString := Edit22.Text;
  DM.Qfichatecnica.FieldByName('medicamentos_alergicos').AsString := Edit23.Text;
  DM.Qfichatecnica.FieldByName('padecimientos').AsString := Edit24.Text;
  DM.Qfichatecnica.FieldByName('institucion_medica').AsString := ComboBox3.Text;

  DM.Qcheck_doc.SQL.Clear;
  DM.Qcheck_doc.SQL.Add('Select * from check_documentos where matricula = '+chr(39)+matricula+chr(39));
  DM.Qcheck_doc.Open;

  if DM.Qcheck_doc.IsEmpty then
  begin
    DM.Qcheck_doc.Edit;
    DM.Qcheck_doc.Append;
  end
  else
  begin
    DM.Qcheck_doc.Edit;
  end;

  DM.Qcheck_doc.FieldByName('matricula').AsString := matricula;
  DM.Qcheck_doc.FieldByName('acta_nac').AsBoolean := CheckBox2.Checked;
  DM.Qcheck_doc.FieldByName('cert_sec').AsBoolean := CheckBox3.Checked;
  DM.Qcheck_doc.FieldByName('fotos').AsBoolean := CheckBox4.Checked;
  DM.Qcheck_doc.FieldByName('curp').AsBoolean := CheckBox5.Checked;
  DM.Qcheck_doc.FieldByName('cart_buena').AsBoolean := CheckBox6.Checked;
  DM.Qcheck_doc.FieldByName('cert_med').AsBoolean := CheckBox7.Checked;
  DM.Qcheck_doc.FieldByName('tipo_sang').AsBoolean := CheckBox8.Checked;
  DM.Qcheck_doc.FieldByName('ficha_dgb').AsBoolean := CheckBox9.Checked;
  DM.Qcheck_doc.FieldByName('ine').AsBoolean := CheckBox10.Checked;
  DM.Qcheck_doc.FieldByName('curp_t').AsBoolean := CheckBox11.Checked;
  DM.Qcheck_doc.FieldByName('comp_dom').AsBoolean := CheckBox12.Checked;

  DM.Qfichatecnica.Post;
  DM.Qcheck_doc.Post;
  if MessageDlg('Desea imprimir ficha tecnica', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
      print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\fichatecnica.fr3');
      print.PrepareReport(True);
      print.PrintOptions.ShowDialog:=true;
      print.Print;
  end;

  FormShow(Sender);
  ShowMessage('Datos guardados con exito!!!');
end;

procedure Tficha_tecnica.Hermanos1Click(Sender: TObject);
begin
  if hermanos1.Checked = false then
  begin
    hermanos1.Checked := True;
    matricula := '';
    Label32.Caption := 'Matricula:';
  end
  else
  begin
    hermanos1.Checked := false;
  end;
end;

procedure Tficha_tecnica.ImprimirFichaTecnica1Click(Sender: TObject);
begin
  print.LoadFromFile(ExtractFilePath(Application.ExeName)+'\reportes\fichatecnica.fr3');
  print.PrepareReport(True);
  print.PrintOptions.ShowDialog:=true;
  print.Print;
end;

procedure Tficha_tecnica.MaskEdit1Exit(Sender: TObject);
begin
  Edit7.Text := intToStr(Edad(MaskEdit1.Text));
end;

procedure Tficha_tecnica.RegistroWEB1Click(Sender: TObject);
begin
   Application.CreateForm(TRegistro_WEB, Registro_WEB);
end;

procedure Tficha_tecnica.Salir1Click(Sender: TObject);
begin
  FormShow(Sender);
end;

end.
