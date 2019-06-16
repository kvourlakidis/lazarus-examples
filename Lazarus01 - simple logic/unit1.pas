unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Button1.tag = 0 then
  begin
    Button1.caption := 'Press again';
    Button1.tag := 1;
  end else
  begin
    Button1.caption := 'Press';
    Button1.tag := 0;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Button3.caption := 'Hello!';
  Button3.Top := Button3.Top + 10;
  Beep;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if Button4.Width < 100 then
  Button4.Width := Button4.Width + 10
  else
    Button4.Width := Button4.Width div 2;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if CheckBox1.Checked or Checkbox2.Checked then
  begin
    Label1.Visible := true;
  end else
  begin
    Label1.Visible := false;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if CheckBox1.Checked and Checkbox2.Checked then
  begin
    Label1.Visible := true
  end else
  begin
    Label1.Visible := false;
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Label1.Visible := false;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

