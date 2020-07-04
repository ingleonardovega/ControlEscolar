unit frm_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TLogin = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    var
      user: string;
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

uses frm_main, frm_DM;

procedure TLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DM.Qusuario.SQL.Clear;
    DM.Qusuario.SQL.Add('Select * from usuario where usuario = '+#39+Edit1.Text+#39+' and pass = '+#39+Edit2.Text+#39+' and status_user = 1');
    DM.Qusuario.Open;
    Form1.StatusBar1.Panels[2].Text := 'Usuario: '+DM.Qusuario.FieldByName('usuario').AsString;
    if DM.Qusuario.IsEmpty then
    begin
      ShowMessage('Usuario incorrecto');
      Edit1.SetFocus;
      Edit2.Clear;
      Abort;
    end;
    if DM.Qusuario.FieldByName('puesto').AsInteger = 1 then  //admin
    begin
      Form1.CategoryPanel3.Enabled := True;
      Form1.CategoryPanel1.Enabled := True;
      Form1.CategoryPanel2.Enabled := true;
      Form1.CategoryPanel4.Enabled := True;
      Form1.CategoryPanel5.Enabled := True;
      Form1.Materias.Enabled := True;
    end;
    if DM.Qusuario.FieldByName('puesto').AsInteger = 0 then   //administrativo
    begin
      Form1.CategoryPanel3.Enabled := False;
      Form1.CategoryPanel1.Enabled := True;
      Form1.CategoryPanel2.Enabled := true;
      Form1.CategoryPanel4.Enabled := True;
      Form1.CategoryPanel5.Enabled := True;
      Form1.Materias.Enabled := True;
    end;
    if DM.Qusuario.FieldByName('puesto').AsInteger = 2 then //solo imprimir formatos
    begin
       Form1.CategoryPanel3.Enabled := False;
       Form1.CategoryPanel1.Enabled := False;
       Form1.CategoryPanel2.Enabled := False;
       Form1.CategoryPanel4.Enabled := True;
       Form1.CategoryPanel5.Enabled := False;
       Form1.Materias.Enabled := False;
    end;
    Form1.CategoryPanelGroup1.Enabled := True;
    Login.Close;
    Edit1.Clear; Edit2.Clear;
  end;
end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  form1.CategoryPanelGroup1.Enabled := False;
end;

end.
