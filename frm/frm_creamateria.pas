unit frm_creamateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls;

type
  Tcreamateria = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    MainMenu1: TMainMenu;
    Guardar1: TMenuItem;
    StringGrid1: TStringGrid;
    Label4: TLabel;
    ComboBox3: TComboBox;
    Label5: TLabel;
    ComboBox4: TComboBox;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    Eliminar1: TMenuItem;
    procedure ComboBox3Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBox4DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Guardar1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
  var
    row :Integer;
    id :String;
    { Public declarations }
  end;

var
  creamateria: Tcreamateria;

implementation

{$R *.dfm}

uses frm_DM;

procedure Tcreamateria.ComboBox2DropDown(Sender: TObject);
var
  I: Integer;
begin
  ComboBox2.Clear;
  DM.Qgrupo.SQL.Clear;
  DM.Qgrupo.SQL.Add('Select * from grupo order by grupo asc');
  DM.Qgrupo.Open;

  for I := 0 to DM.Qgrupo.RecordCount - 1 do
  begin
    ComboBox2.Items.Add(DM.Qgrupo.FieldByName('grupo').AsString);
    DM.Qgrupo.Next;
  end;
end;

procedure Tcreamateria.ComboBox3Select(Sender: TObject);
begin
  if ComboBox3.Text = 'AREA' then
  begin
    Label5.Visible := True;
    ComboBox4.Visible := True;
    Label5.Caption := 'Area:';
    ComboBox4.TextHint := 'Areas';
  end;
  if ComboBox3.Text = 'CAPACITACION TRABAJO' then
  begin
    Label5.Visible := True;
    ComboBox4.Visible := True;
    Label5.Caption := 'Capacitacion:';
    ComboBox4.TextHint := 'Capacitacion';
  end;
  if ComboBox3.Text = 'PARAESCOLAR' then
  begin
    Label5.Visible := True;
    ComboBox4.Visible := True;
    Label5.Caption := 'Paraescolar:';
    ComboBox4.TextHint := 'Paraescolar';
  end;
  if ComboBox3.Text = 'TRONCO COMUN' then
  begin
    Label5.Visible := False;
    ComboBox4.Visible := False;
  end;
end;

procedure Tcreamateria.ComboBox4DropDown(Sender: TObject);
var
  I: Integer;
begin
  ComboBox4.Clear;
  if ComboBox3.Text = 'AREA' then
  begin
    DM.Qareas.SQL.Clear;
    DM.Qareas.SQL.Add('Select nom_area AS nombre from areas order by id_area asc');
    DM.Qareas.Open;
  end;

  if ComboBox3.Text = 'CAPACITACION TRABAJO' then
  begin
    DM.Qareas.SQL.Clear;
    DM.Qareas.SQL.Add('Select nom_capacitacion AS nombre from capacitaciones order by id_capacitacion asc');
    DM.Qareas.Open;
  end;

  if ComboBox3.Text = 'PARAESCOLAR' then
  begin
    DM.Qareas.SQL.Clear;
    DM.Qareas.SQL.Add('Select nom_paraescolar AS nombre from paraescolar order by id_paraescolar asc');
    DM.Qareas.Open;
  end;

  for I := 0 to DM.Qareas.RecordCount - 1 do
  begin
    ComboBox4.Items.Add(DM.Qareas.FieldByName('nombre').AsString);
    DM.Qareas.Next;
  end;
end;

procedure Tcreamateria.Eliminar1Click(Sender: TObject);
begin
  if MessageDlg('Deseas eliminar la materia '+StringGrid1.Cells[0,row], mtConfirmation, [mbYes, mbNO], 0) = mrYes then
  begin
    DM.Qmuestramateria.SQL.Clear;
    DM.Qmuestramateria.SQL.Add('Delete from materia where id = '+StringGrid1.Cells[4,row]);
    DM.Qmuestramateria.ExecSQL;
    ShowMessage('Materia borrada con exito');
    RadioGroup1Click(Sender);
  end;
end;

procedure Tcreamateria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tcreamateria.FormShow(Sender: TObject);
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
  StringGrid1.Cells[0,0] := 'MATERIA';
  StringGrid1.Cells[1,0] := 'SEM/GRUPO';
  StringGrid1.Cells[2,0] := 'TIPO';
  StringGrid1.Cells[3,0] := 'NOMBRE';
  StringGrid1.Cells[4,0] := 'ID';

end;

procedure Tcreamateria.Guardar1Click(Sender: TObject);
begin

  if (ComboBox3.Text = '') and (Edit1.Text = '') and (ComboBox1.Text = '') and (ComboBox2.Text = '') then
  begin
    ShowMessage('Faltan datos de capturar');
    Abort;
  end;


  DM.Qmateria.SQL.Clear;
  DM.Qmateria.SQL.Add('Select * from materia where id = '+id);
  DM.Qmateria.Open;

  if DM.Qmateria.IsEmpty then
  begin
    DM.Qmateria.Edit;
    DM.Qmateria.Append;
  end
  else
  begin
    DM.Qmateria.Edit;
  end;

  DM.Qmateria.FieldByName('materia').AsString := Edit1.Text;
  DM.Qmateria.FieldByName('semestre').AsString := ComboBox1.Text;
  DM.Qmateria.FieldByName('grupo').AsString := ComboBox2.Text;
  if ComboBox3.Text = 'AREA' then
  begin
    DM.Qmateria.FieldByName('area').AsInteger := ComboBox4.ItemIndex + 1;
  end;
  if ComboBox3.Text = 'CAPACITACION TRABAJO' then
  begin
    DM.Qmateria.FieldByName('capacitacion').AsInteger := ComboBox4.ItemIndex + 1;
  end;
  if ComboBox3.Text = 'PARAESCOLAR' then
  begin
    DM.Qmateria.FieldByName('paraescolar').AsInteger := ComboBox4.ItemIndex + 1;
  end;
  DM.Qmateria.Post;
  ShowMessage('Materia Agregada con exito!!!');
  RadioGroup1Click(Sender);
end;

procedure Tcreamateria.RadioGroup1Click(Sender: TObject);
var
  qry :String;
  i :Integer;
begin

    if RadioGroup1.ItemIndex = 0 then
    begin
      qry := 'select distinct (materia.id), materia.MATERIA, materia.SEMESTRE, materia.grupo, if (materia.`area` = 0, '+chr(39)+chr(39)+', areas.`nom_area`) as nom_areas, if (materia.`capacitacion` = 0, '+chr(39)+chr(39)+', capacitaciones.nom_capacitacion) as nom_cap, if (materia.`paraescolar` = 0, '+chr(39)+chr(39)+', paraescolar.nom_paraescolar) as nom_para from materia, areas, capacitaciones, paraescolar where '+
        '(areas.`id_area` = materia.`area` or materia.`area` = 0) and '+
        '(capacitaciones.`id_capacitacion` = materia.`capacitacion` or materia.`capacitacion` = 0) and '+
        '(paraescolar.`id_paraescolar` = materia.`paraescolar` or materia.`paraescolar` = 0) and not '+
        '(semestre = 0) '+
      'order by materia.`SEMESTRE`, materia.`grupo` asc';
    end;

    if RadioGroup1.ItemIndex = 1 then
    begin
      qry := 'select distinct (materia.id), materia.MATERIA, materia.SEMESTRE, materia.grupo, if (materia.`area` = 0, '+chr(39)+chr(39)+', areas.`nom_area`) as nom_areas, if (materia.`capacitacion` = 0, '+chr(39)+chr(39)+', capacitaciones.nom_capacitacion) as nom_cap, if (materia.`paraescolar` = 0, '+chr(39)+chr(39)+', paraescolar.nom_paraescolar) as nom_para from materia, areas, capacitaciones, paraescolar where '+
        '(materia.`area` = 0) and '+
        '(materia.`capacitacion` = 0) and '+
        '(materia.`paraescolar` = 0) and not '+
        '(semestre = 0) '+
      'order by materia.`SEMESTRE`, materia.`grupo` asc';
    end;

     if RadioGroup1.ItemIndex = 2 then
    begin
      qry := 'select distinct (materia.id), materia.MATERIA, materia.SEMESTRE, materia.grupo, if (materia.`area` = 0, '+chr(39)+chr(39)+', areas.`nom_area`) as nom_areas, if (materia.`capacitacion` = 0, '+chr(39)+chr(39)+', capacitaciones.nom_capacitacion) as nom_cap, if (materia.`paraescolar` = 0, '+chr(39)+chr(39)+', paraescolar.nom_paraescolar) as nom_para from materia, areas, capacitaciones, paraescolar where '+
        '(areas.`id_area` = materia.`area`) and not '+
        '(semestre = 0) '+
      'order by materia.`SEMESTRE`, materia.`grupo` asc';
    end;

    if RadioGroup1.ItemIndex = 3 then
    begin
     qry := 'select distinct (materia.id), materia.MATERIA, materia.SEMESTRE, materia.grupo, if (materia.`area` = 0, '+chr(39)+chr(39)+', areas.`nom_area`) as nom_areas, if (materia.`capacitacion` = 0, '+chr(39)+chr(39)+', capacitaciones.nom_capacitacion) as nom_cap, if (materia.`paraescolar` = 0, '+chr(39)+chr(39)+', paraescolar.nom_paraescolar) as nom_para from materia, areas, capacitaciones, paraescolar where '+
        '(capacitaciones.`id_capacitacion` = materia.`capacitacion`) and not '+
        '(semestre = 0) '+
      'order by materia.`SEMESTRE`, materia.`grupo` asc';
    end;

     if RadioGroup1.ItemIndex = 4 then
    begin
     qry := 'select distinct (materia.id), materia.MATERIA, materia.SEMESTRE, materia.grupo, if (materia.`area` = 0, '+chr(39)+chr(39)+', areas.`nom_area`) as nom_areas, if (materia.`capacitacion` = 0, '+chr(39)+chr(39)+', capacitaciones.nom_capacitacion) as nom_cap, if (materia.`paraescolar` = 0, '+chr(39)+chr(39)+', paraescolar.nom_paraescolar) as nom_para from materia, areas, capacitaciones, paraescolar where '+
        '(paraescolar.`id_paraescolar` = materia.`paraescolar`) and not '+
        '(semestre = 0) '+
      'order by materia.`SEMESTRE`, materia.`grupo` asc';
    end;

    DM.qmuestramateria.SQL.Clear;
      DM.Qmuestramateria.SQL.Add(qry);
      DM.Qmuestramateria.Open;
      StringGrid1.RowCount := DM.Qmuestramateria.RecordCount + 1;

      for I := 1 to StringGrid1.RowCount + 1 do
      begin
        StringGrid1.Cells[0,i] := DM.Qmuestramateria.FieldByName('materia').AsString;
        StringGrid1.Cells[1,i] := DM.Qmuestramateria.FieldByName('semestre').AsString+'/'+DM.Qmuestramateria.FieldByName('grupo').AsString;
        if DM.Qmuestramateria.FieldByName('nom_areas').AsString <> '' then
        begin
          StringGrid1.Cells[2,i] := 'AREA';
          StringGrid1.Cells[3,i] := DM.Qmuestramateria.FieldByName('nom_areas').AsString;
        end
        else if DM.Qmuestramateria.FieldByName('nom_cap').AsString <> '' then
        begin
          StringGrid1.Cells[2,i] := 'CAPACITACION TRABAJO';
          StringGrid1.Cells[3,i] := DM.Qmuestramateria.FieldByName('nom_cap').AsString;
        end
        else if DM.Qmuestramateria.FieldByName('nom_para').AsString <> '' then
        begin
          StringGrid1.Cells[2,i] := 'PARAESCOLAR';
          StringGrid1.Cells[3,i] := DM.Qmuestramateria.FieldByName('nom_para').AsString;
        end
        else
        begin
          StringGrid1.Cells[2,i] := 'TRONCO COMUN';
          StringGrid1.Cells[3,i] := '';
        end;
        StringGrid1.Cells[4,i] := DM.Qmuestramateria.FieldByName('id').AsString;
        DM.Qmuestramateria.Next;
      end;

end;

procedure Tcreamateria.StringGrid1DblClick(Sender: TObject);
begin
  id := StringGrid1.Cells[4,row];
  DM.Qmateria.SQL.Clear;
  DM.Qmateria.SQL.Add('Select * from materia where id = '+id);
  DM.Qmateria.Open;
  Edit1.Text := StringGrid1.Cells[0,row];
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(DM.Qmateria.FieldByName('semestre').AsString);
  ComboBox2DropDown(Sender);
  ComboBox2.ItemIndex := ComboBox2.Items.IndexOf(DM.Qmateria.FieldByName('grupo').AsString);
  ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(StringGrid1.Cells[2,row]);
  ComboBox3Select(Sender);
  if StringGrid1.Cells[2,row] = 'AREA' then
  begin

    ComboBox4DropDown(Sender);
    ComboBox4.ItemIndex := DM.Qmateria.FieldByName('area').AsInteger - 1;
  end;
  if StringGrid1.Cells[2,row] = 'PARAESCOLAR' then
  begin
    ComboBox4DropDown(Sender);
    ComboBox4.ItemIndex := DM.Qmateria.FieldByName('paraescolar').AsInteger - 1;
  end;
   if StringGrid1.Cells[2,row] = 'CAPACITACION TRABAJO' then
  begin
    ComboBox4DropDown(Sender);
    ComboBox4.ItemIndex := DM.Qmateria.FieldByName('capacitacion').AsInteger - 1;
  end;
end;

procedure Tcreamateria.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  row := ARow;
end;

end.
