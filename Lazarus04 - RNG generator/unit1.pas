unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var CR: string = #13;
var LF: string = #10;
var CRLF: string = #13#10;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  c: TColor;
begin
  c := random($1000000);
  // Label1.Caption := IntToStr(random(100));
  Label1.Caption := IntToStr(c);
  Form1.Color := c;
  Label2.Caption := Label2.Caption + CRLF + Label1.Caption;
end;

initialization
  randomize;

end.

