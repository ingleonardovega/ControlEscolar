unit frm_fotoAlumno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebCam, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid;

type
  Tfotoalumno = class(TForm)
    foto1: TPanel;
    Button2: TButton;
    foto2: TImage;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    camera: TWebCam;
    { Public declarations }
  end;

var
  fotoalumno: Tfotoalumno;

implementation

{$R *.dfm}

uses frm_DM;

procedure Tfotoalumno.Button2Click(Sender: TObject);
var
  PanelDC: HDC;
begin
  if not Assigned(foto2.Picture.Bitmap) then
    foto2.Picture.Bitmap := TBitmap.Create
  else
  begin
    foto2.Picture.Bitmap.Free;
    foto2.picture.Bitmap := TBitmap.Create;
  end;
  foto2.Picture.Bitmap.Height := foto1.Height;
  foto2.Picture.Bitmap.Width  := foto1.Width;
  foto2.Stretch := True;
  PanelDC := GetDC(foto1.Handle);
  try
    BitBlt(foto2.Picture.Bitmap.Canvas.Handle,
      0,0,foto1.Width, foto1.Height, PanelDC, 0,0, SRCCOPY);
  finally
    ReleaseDC(Handle, PanelDC);
  end;
   foto1.Visible := false;
end;

procedure Tfotoalumno.ComboBox2Select(Sender: TObject);
begin
  DM.QFoto.SQL.Clear;
  DM.Qfoto.SQL.Add('SELECT CONCAT(paterno_alumno,'+chr(39)+' '+chr(39)+',materno_alumno,'+chr(39)+' '+chr(39)+',nombre_alumno) AS nombre, semestre, grupo, foto_alumno, matricula FROM ficha_tecnica where semestre = '+ComboBox1.Text+' and grupo = '+chr(39)+ComboBox2.Text+chr(39)+' and status_alumno = 1 order by nombre asc');
  DM.QFoto.Open;
  Label3.Caption := IntToStr(DM.QFoto.RecordCount);
end;

procedure Tfotoalumno.DBGrid1DblClick(Sender: TObject);
begin
  camera.Disconnect;
  FormShow(Sender);
end;

procedure Tfotoalumno.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bmp: TBitmap;
  L, T: Integer;

begin
  // Si es la columna donde deseas poner la imagen...
  if DataCol = 4 then
  begin
    // Seleccionas la imagen a usar según el valor del campo
    if DM.QFoto.FieldByName('foto_alumno').AsBoolean then
    //  Bmp := BitmapSi
    else
    //  Bmp := BitmapNo;

    // Calculas las coordenadas para que la imagen quede centrada en la celda
    L := Rect.Left + (Rect.Right - Rect.Left - Bmp.Width) div 2;
    T := Rect.Top + (Rect.Bottom - Rect.Top - Bmp.Height) div 2;

    // Dibujas la imagen
    DBGrid1.Canvas.Draw(L, T, Bmp);
  end
  else
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfotoalumno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure Tfotoalumno.FormCreate(Sender: TObject);
begin
   camera := TWebcam.Create('WebCaptured', foto1.Handle, 0, 0,
    1000, 1000);
end;

procedure Tfotoalumno.FormShow(Sender: TObject);
begin
  camera.Connect;
  camera.Preview(true);
  Camera.PreviewRate(4);
  foto1.Visible := true;
  Label3.Caption := IntToStr(DM.QFoto.RecordCount);
end;

end.
