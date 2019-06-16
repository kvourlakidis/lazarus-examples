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
    Image1: TImage;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
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

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  with Image1 do
  begin
    Top := Top - 220;
    if Top < -Height then
    begin
      Top := 0;
      if Left = -40 then Left := -350
      else Left := -40;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (Timer1.Enabled = false) then Timer1.Enabled:= true
  else Timer1.Enabled:= false;
end;

end.

