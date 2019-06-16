unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var
  myFlag: boolean = false;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  s: string;
  mas: array[0..8] of string =
    (
    'Hello!',
    'Hows it going',
    'Howdy',
    'Whats up?',
    'Tssup',
    'Guten Tag',
    'Bon Jour',
    'Bon Giorno',
    'Bueno Dias'
    );
begin
  s := Edit1.Text;
  Shape2.Height := 15;
  Shape3.Height := 15;
  Timer1.Enabled := true;
  Label1.Caption := '';
  if s = 'hello'
  then // Label1.Caption := 'Hello!'
  begin
    Label1.Caption := mas[random(9)]
  end
  else if (length(s) > 0) and (s[length(s)] = '!')
  then Label1.Caption := 'OK, cool...'
  else if pos('i ', s) > 0
  then Label1.Caption := 'I can blind my eyes';
  Edit1.Text := '';
  Edit1.SetFocus;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Shape2.Height := 25;
  Shape3.Height := 25;
  Timer1.Enabled := false;
end;

end.

